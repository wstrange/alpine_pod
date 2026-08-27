import 'dart:async';

import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';
import 'package:serverpod_database/serverpod_database.dart';

import '../signals.dart';

final _log = Logger('SyncService');
final syncService = SyncService();

class SyncService {
  bool _isSyncing = false;
  bool get isSyncing => _isSyncing;
  Timer? _periodicSyncTimer;

  /// Initializes periodic syncing every 5 minutes when online.
  void initializePeriodicSync({
    Duration interval = const Duration(minutes: 1),
  }) {
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
    if (!useClientCacheSignal.value) {
      _log.info(
        'Client cache disabled (useClientCacheSignal is false): skipping syncAll',
      );
      return;
    }

    if (!isOnlineSignal.value) {
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
      if (sessionManager.isAuthenticated) {
        await syncCurrentMember();

        // 2. Sections & Memberships
        await syncSectionsAndMemberships();
      }

      // 3. Events for the current section if selected
      if (currentSectionId != null) {
        final now = DateTime.now();
        final start = DateTime(now.year, now.month - 1, 1);
        final end = DateTime(now.year, now.month + 2, 0);
        await syncEvents(currentSectionId, start, end);
      }

      // 4. Notifications and notification preferences
      if (sessionManager.isAuthenticated) {
        await syncNotifications();
        await syncNotificationPreferences();
      }

      final syncTime = DateTime.now();
      connectivityService.updateLastSynced(syncTime);
      _log.info('syncAll completed successfully at $syncTime');
    } catch (e, stack) {
      _log.severe('Error during syncAll', e, stack);
    } finally {
      _isSyncing = false;
    }
  }

  Future<void> _deleteMemberCascade(Member member) async {
    await EventRegistration.db.deleteWhere(
      dbSession,
      where: (t) => t.memberId.equals(member.id),
    );
    await EventManager.db.deleteWhere(
      dbSession,
      where: (t) => t.memberId.equals(member.id),
    );
    await SectionMembership.db.deleteWhere(
      dbSession,
      where: (t) => t.memberId.equals(member.id),
    );
    await Member.db.deleteRow(dbSession, member);
  }

  Future<void> _deleteSectionCascade(Section section) async {
    final id = section.id;
    if (id == null) return;
    final events = await Event.db.find(
      dbSession,
      where: (t) => t.sectionId.equals(id),
    );
    for (final e in events) {
      await EventRegistration.db.deleteWhere(
        dbSession,
        where: (t) => t.eventId.equals(e.id),
      );
      await EventManager.db.deleteWhere(
        dbSession,
        where: (t) => t.eventId.equals(e.id),
      );
    }
    await Event.db.deleteWhere(dbSession, where: (t) => t.sectionId.equals(id));
    await SectionMembership.db.deleteWhere(
      dbSession,
      where: (t) => t.sectionId.equals(id),
    );
    await Section.db.deleteRow(dbSession, section);
  }

  Future<void> _upsertMember(Member member) async {
    final existing = await Member.db.findById(dbSession, member.id);
    if (existing != null) {
      await Member.db.updateRow(dbSession, member);
    } else {
      final existingByEmail = await Member.db.findFirstRow(
        dbSession,
        where: (t) => t.email.equals(member.email),
      );
      if (existingByEmail != null) {
        await _deleteMemberCascade(existingByEmail);
      }
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
      final existingByName = await Section.db.findFirstRow(
        dbSession,
        where: (t) => t.name.equals(section.name),
      );
      if (existingByName != null) {
        await _deleteSectionCascade(existingByName);
      }
      await Section.db.insertRow(dbSession, section);
    }
  }

  Future<void> _upsertEvent(Event event) async {
    final existing = await Event.db.findById(dbSession, event.id);
    if (existing != null) {
      await Event.db.updateRow(dbSession, event);
    } else {
      await Event.db.insertRow(dbSession, event);
    }
  }

  Future<void> _cleanEventChildRecords(UuidValue eventId) async {
    await EventManager.db.deleteWhere(
      dbSession,
      where: (t) => t.eventId.equals(eventId),
    );
    await EventRegistration.db.deleteWhere(
      dbSession,
      where: (t) => t.eventId.equals(eventId),
    );
  }

  Future<void> _ensureSectionExists(Event e) async {
    if (e.section != null) {
      await _upsertSection(e.section!);
    } else {
      // Ensure section FK is satisfied in local DB before inserting event
      final existingSection = await Section.db.findById(dbSession, e.sectionId);
      if (existingSection == null) {
        try {
          final sec = await client.section.getSection(e.sectionId);
          if (sec != null) {
            await _upsertSection(sec);
          }
        } catch (err) {
          _log.warning(
            'Failed to fetch missing section ${e.sectionId} for event ${e.title}: $err',
          );
        }
      }
    }
  }

  Future<void> _saveEventChildren(Event e) async {
    // Extract and cache embedded event managers
    final managers = e.eventManagers;
    if (managers != null && managers.isNotEmpty) {
      for (final m in managers) {
        if (m.member != null) {
          await _upsertMember(m.member!);
        }
        final memberExists =
            await Member.db.findById(dbSession, m.memberId) != null;
        if (memberExists) {
          await EventManager.db.insertRow(dbSession, m);
        } else {
          _log.warning(
            'Skipping EventManager insert: member ${m.memberId} not found in local DB',
          );
        }
      }
    }

    // Extract and cache embedded event registrations
    final registrations = e.eventRegistrations;
    if (registrations != null && registrations.isNotEmpty) {
      for (final r in registrations) {
        if (r.member != null) {
          await _upsertMember(r.member!);
        }
        final memberExists =
            await Member.db.findById(dbSession, r.memberId) != null;
        if (memberExists) {
          await EventRegistration.db.insertRow(dbSession, r);
        } else {
          _log.warning(
            'Skipping EventRegistration insert: member ${r.memberId} not found in local DB',
          );
        }
      }
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
    final existingByKey = await SectionMembership.db.findFirstRow(
      dbSession,
      where: (t) =>
          t.memberId.equals(membership.memberId) &
          t.sectionId.equals(membership.sectionId),
    );
    if (existingByKey != null) {
      await SectionMembership.db.deleteRow(dbSession, existingByKey);
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
      await SectionMembership.db.deleteWhere(
        dbSession,
        where: (t) => Constant.bool(true),
      );
      for (final m in memberships) {
        await _upsertSectionMembership(m);
      }
    } catch (e) {
      _log.warning('Failed to sync sections/memberships: $e');
    }
  }

  Future<void> syncMemberProfiles(UuidValue sectionId) async {
    final dt = syncOnlyUpdatedDataSignal.value
        ? lastSyncedAtSignal.value
        : null;

    final members = await client.member.getSectionMembers(
      limit: 1000,
      offset: 0,
      sectionId: sectionId,
      sinceLastUpdate: dt,
    );
    for (final member in members) {
      await _upsertMember(member);
    }
  }

  /// Syncs events, event managers, and registrations for a section and date window.
  /// If [sinceLastUpdateTime] is specified or [syncOnlyUpdatedDataSignal] is true (and a previous sync timestamp exists),
  /// only data updated on the server after that timestamp are fetched and incrementally updated in the local cache.
  Future<List<Event>> syncEvents(
    UuidValue? sectionId,
    DateTime startTime,
    DateTime endTime, {
    DateTime? sinceLastUpdateTime,
  }) async {
    if (!isOnlineSignal.value) return [];
    try {
      final effectiveSince =
          sinceLastUpdateTime ??
          (syncOnlyUpdatedDataSignal.value
              ? lastSyncedAtSignal.value?.toUtc()
              : null);

      final events = await client.event.listEvents(
        sectionId: sectionId,
        startTime: startTime,
        endTime: endTime,
        onlyMyEvents: false,
        sinceLastUpdateTime: effectiveSince,
      );

      _log.info(
        'Got ${events.length} events from server (since: ${effectiveSince?.toIso8601String() ?? "all"})',
      );

      if (effectiveSince == null) {
        // Full sync: Clean child records (event_managers & event_registrations) for existing events in scope first
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
          await _cleanEventChildRecords(e.id);
        }

        // Now safe to delete old cached events
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
        _log.info(
          'Cleaned existing cached events and child records for section $sectionId',
        );

        // Insert new events and their referenced members & child records
        if (events.isNotEmpty) {
          for (var e in events) {
            if (sectionId != null && e.sectionId != sectionId) {
              _log.warning(
                'Event ${e.title} is not in current section $sectionId, skipping',
              );
              continue;
            }

            await _ensureSectionExists(e);
            await Event.db.insertRow(dbSession, e);
            await _saveEventChildren(e);
          }
        }
      } else {
        // Incremental sync: upsert modified/new events and update their child records
        if (events.isNotEmpty) {
          for (var e in events) {
            if (sectionId != null && e.sectionId != sectionId) {
              _log.warning(
                'Event ${e.title} is not in current section $sectionId, skipping',
              );
              continue;
            }

            await _ensureSectionExists(e);
            await _cleanEventChildRecords(e.id);
            await _upsertEvent(e);
            await _saveEventChildren(e);
          }
        }
        _log.info(
          'Incrementally updated ${events.length} events in local cache',
        );
      }

      final syncTime = DateTime.now();
      connectivityService.updateLastSynced(syncTime);

      return events;
    } catch (e) {
      _log.warning('Failed to sync events: $e ');
      return [];
    }
  }

  /// Syncs notifications feed to local cache.
  Future<void> syncNotifications() async {
    if (!isOnlineSignal.value) return;
    try {
      final notifications = await client.notification.getMyFeed(
        limit: 50,
        offset: 0,
      );
      for (final un in notifications) {
        if (un.notification != null) {
          final notifId = un.notification!.id;
          final existingNotif = notifId != null
              ? await Notification.db.findById(dbSession, notifId)
              : null;
          if (existingNotif != null) {
            await Notification.db.updateRow(dbSession, un.notification!);
          } else {
            await Notification.db.insertRow(dbSession, un.notification!);
          }
        }
        final existing = await UserNotification.db.findById(dbSession, un.id);
        if (existing != null) {
          await UserNotification.db.updateRow(dbSession, un);
        } else {
          await UserNotification.db.insertRow(dbSession, un);
        }
      }
    } catch (e) {
      _log.warning('Failed to sync notifications: $e');
    }
  }

  /// Syncs notification preferences to local cache.
  Future<void> syncNotificationPreferences() async {
    if (!isOnlineSignal.value) return;
    try {
      final prefs = await client.notification.getMyPreferences();
      await UserNotificationPreference.db.deleteWhere(
        dbSession,
        where: (t) => Constant.bool(true),
      );
      await UserNotificationPreference.db.insert(dbSession, [prefs]);
    } catch (e) {
      _log.warning('Failed to sync notification preferences: $e');
    }
  }
}
