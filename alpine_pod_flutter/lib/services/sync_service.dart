import 'dart:async';
import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';
import 'package:serverpod_database/serverpod_database.dart';
import '../signals.dart';
import 'connectivity_service.dart';

final _log = Logger('SyncService');
final syncService = SyncService();

class SyncService {
  bool _isSyncing = false;
  bool get isSyncing => _isSyncing;
  Timer? _periodicSyncTimer;

  /// Initializes periodic syncing every 5 minutes when online.
  void initializePeriodicSync({Duration interval = const Duration(minutes: 1)}) {
    _periodicSyncTimer?.cancel();

    // quick sync to start
    syncAll(currentSectionId: sectionSignal.value?.id);

    _log.info('starting sync timer every $interval');
    _periodicSyncTimer = Timer.periodic(interval, (_) {
      if (isOnlineSignal.value && sessionManager.isAuthenticated) {
        _log.info('Triggering periodic background sync');
        syncAll(currentSectionId: sectionSignal.value?.id);
      }
    });
  }

  /// Performs an eager sync of all user-accessible data from the server
  /// into the local SQLite database cache.
  Future<void> syncAll({UuidValue? currentSectionId}) async {
    if (!isOnlineSignal.value || currentSectionId == null) {
      _log.info('Offline: skipping syncAll');
      return;
    }

    if (_isSyncing) {
      _log.info('Sync already in progress, skipping duplicate call');
      return;
    }

    _isSyncing = true;
    try {
      _log.info('Starting eager syncAll...');

      // 1. Member profile
      await syncCurrentMember();

      // 2. Sections & Memberships
      await syncSectionsAndMemberships();

      // 3. Events for the current section if selected
      final now = DateTime.now();
      final start = DateTime(now.year, now.month - 1, 1);
      final end = DateTime(now.year, now.month + 2, 0);
      await syncEvents(currentSectionId, start, end, false);

      // 4. Notification preferences
      await syncNotificationPreferences();

      final syncTime = DateTime.now();
      connectivityService.updateLastSynced(syncTime);
      _log.info('syncAll completed successfully at $syncTime');
    } catch (e, stack) {
      _log.severe('Error during syncAll', e, stack);
    } finally {
      _isSyncing = false;
    }
  }

  Future<void> _upsertMember(Member member) async {
    final existing = await Member.db.findById(dbSession, member.id);
    if (existing != null) {
      await Member.db.updateRow(dbSession, member);
    } else {
      await Member.db.insertRow(dbSession, member);
    }
  }

  Future<void> _upsertSection(Section section) async {
    final id = section.id;
    if (id == null) return;
    final existing = await Section.db.findById(dbSession, id);
    if (existing != null) {
      await Section.db.updateRow(dbSession, section);
    } else {
      await Section.db.insertRow(dbSession, section);
    }
  }

  Future<void> _upsertSectionMembership(SectionMembership membership) async {
    final id = membership.id;
    if (id != null) {
      final existing = await SectionMembership.db.findById(dbSession, id);
      if (existing != null) {
        await SectionMembership.db.updateRow(dbSession, membership);
        return;
      }
    }
    await SectionMembership.db.insertRow(dbSession, membership);
  }

  /// Syncs the current member profile to local cache.
  Future<Member?> syncCurrentMember() async {
    if (!isOnlineSignal.value) return null;
    try {
      final member = await client.member.getCurrentMember();
      if (member != null) {
        await _upsertMember(member);
      }
      return member;
    } catch (e) {
      _log.warning('Failed to sync current member: $e');
      return null;
    }
  }

  /// Syncs all sections and user memberships to local cache.
  Future<void> syncSectionsAndMemberships() async {
    if (!isOnlineSignal.value) return;
    try {
      final sections = await client.section.listSections();
      for (final section in sections) {
        await _upsertSection(section);
      }
      // _log.info('synced sections: $sections. \nSyncing section memberships');

      final memberships = await client.member.getAllMySectionMemberships();
      for (final m in memberships) {
        if (m.member != null) await _upsertMember(m.member!);
        if (m.section != null) await _upsertSection(m.section!);
      }
      await SectionMembership.db.deleteWhere(dbSession, where: (t) => Constant.bool(true));
      for (final m in memberships) {
        await _upsertSectionMembership(m);
      }
    } catch (e) {
      _log.warning('Failed to sync sections/memberships: $e');
    }
  }

  /// Syncs events, event managers, and registrations for a section and date window.
  Future<List<Event>> syncEvents(UuidValue? sectionId, DateTime startTime, DateTime endTime, bool onlyMyEvents) async {
    if (!isOnlineSignal.value) return [];
    try {
      final events = await client.event.listEvents(sectionId, startTime, endTime, onlyMyEvents);

      _log.info('Got ${events.length} events from server');

      // 1. Clean child records (event_managers & event_registrations) for existing events in scope first
      final existingEvents = await Event.db.find(
        dbSession,
        where: (t) {
          Expression where = Constant.bool(true);
          if (sectionId != null) {
            where = where & t.sectionId.equals(sectionId);
          }
          return where;
        },
      );

      for (final e in existingEvents) {
        await EventManager.db.deleteWhere(dbSession, where: (t) => t.eventId.equals(e.id));
        await EventRegistration.db.deleteWhere(dbSession, where: (t) => t.eventId.equals(e.id));
      }

      // 2. Now safe to delete old cached events
      await Event.db.deleteWhere(
        dbSession,
        where: (t) {
          Expression where = Constant.bool(true);
          if (sectionId != null) {
            where = where & t.sectionId.equals(sectionId);
          }
          return where;
        },
      );
      _log.info('Cleaned existing cached events and child records for section $sectionId');

      // 3. Insert/upsert new events and their referenced members & child records
      if (events.isNotEmpty) {
        for (var e in events) {
          // _log.info('sync event: ${e.title}, section ${e.sectionId}');
          if (sectionId != null && e.sectionId != sectionId) {
            _log.warning('Event ${e.title} is not in current section $sectionId, skipping');
            continue;
          }

          if (e.section != null) {
            await _upsertSection(e.section!);
          }

          await Event.db.insertRow(dbSession, e);

          // Extract and cache embedded event managers
          final managers = e.eventManagers;
          if (managers != null && managers.isNotEmpty) {
            for (final m in managers) {
              if (m.member != null) {
                await _upsertMember(m.member!);
              }
              await EventManager.db.insertRow(dbSession, m);
            }
          }

          // Extract and cache embedded event registrations
          final registrations = e.eventRegistrations;
          if (registrations != null && registrations.isNotEmpty) {
            for (final r in registrations) {
              if (r.member != null) {
                await _upsertMember(r.member!);
              }
              await EventRegistration.db.insertRow(dbSession, r);
            }
          }
        }
      }

      return events;
    } catch (e) {
      _log.warning('Failed to sync events: $e ');
      return [];
    }
  }

  /// Syncs notification preferences to local cache.
  Future<void> syncNotificationPreferences() async {
    if (!isOnlineSignal.value) return;
    try {
      final prefs = await client.notification.getMyPreferences();
      await UserNotificationPreference.db.deleteWhere(dbSession, where: (t) => Constant.bool(true));
      await UserNotificationPreference.db.insert(dbSession, [prefs]);
    } catch (e) {
      _log.warning('Failed to sync notification preferences: $e');
    }
  }
}
