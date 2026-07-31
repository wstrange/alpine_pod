import 'dart:async';
import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';
import 'package:serverpod_database/serverpod_database.dart';
import '../signals.dart';
import 'connectivity_service.dart';

final _log = Logger('SyncService');

class SyncService {
  static final SyncService _instance = SyncService._internal();
  factory SyncService() => _instance;
  SyncService._internal();

  bool _isSyncing = false;
  bool get isSyncing => _isSyncing;
  Timer? _periodicSyncTimer;

  /// Initializes periodic syncing every 5 minutes when online.
  void initializePeriodicSync({Duration interval = const Duration(minutes: 5)}) {
    _periodicSyncTimer?.cancel();
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
      await syncCurrentMember();

      // 2. Sections & Memberships
      await syncSectionsAndMemberships();

      // 3. Events for the current section if selected
      if (currentSectionId != null) {
        final now = DateTime.now();
        final start = DateTime(now.year, now.month - 1, 1);
        final end = DateTime(now.year, now.month + 2, 0);
        await syncEvents(currentSectionId, start, end, false);
      }

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

  /// Syncs the current member profile to local cache.
  Future<Member?> syncCurrentMember() async {
    if (!isOnlineSignal.value) return null;
    try {
      final member = await client.member.getCurrentMember();
      if (member != null) {
        await Member.db.deleteWhere(dbSession, where: (t) => Constant.bool(true));
        await Member.db.insert(dbSession, [member]);
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
      await Section.db.deleteWhere(dbSession, where: (t) => Constant.bool(true));
      if (sections.isNotEmpty) {
        await Section.db.insert(dbSession, sections);
      }

      final memberships = await client.member.getAllMySectionMemberships();
      await SectionMembership.db.deleteWhere(dbSession, where: (t) => Constant.bool(true));
      if (memberships.isNotEmpty) {
        await SectionMembership.db.insert(dbSession, memberships);
      }
    } catch (e) {
      _log.warning('Failed to sync sections/memberships: $e');
    }
  }

  /// Syncs events, event managers, and registrations for a section and date window.
  Future<List<Event>> syncEvents(
    UuidValue? sectionId,
    DateTime startTime,
    DateTime endTime,
    bool onlyMyEvents,
  ) async {
    if (!isOnlineSignal.value) return [];
    try {
      final events = await client.event.listEvents(
        sectionId,
        startTime,
        endTime,
        onlyMyEvents,
      );

      // Clean existing cached events in this window/section
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

      if (events.isNotEmpty) {
        await Event.db.insert(dbSession, events);

        // Also extract and cache embedded event managers and registrations
        for (final event in events) {
          final managers = event.eventManagers;
          if (managers != null && managers.isNotEmpty) {
            await EventManager.db.deleteWhere(
              dbSession,
              where: (t) => t.eventId.equals(event.id),
            );
            await EventManager.db.insert(dbSession, managers);
          }

          final registrations = event.eventRegistrations;
          if (registrations != null && registrations.isNotEmpty) {
            await EventRegistration.db.deleteWhere(
              dbSession,
              where: (t) => t.eventId.equals(event.id),
            );
            await EventRegistration.db.insert(dbSession, registrations);
          }
        }
      }

      return events;
    } catch (e) {
      _log.warning('Failed to sync events: $e');
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

final syncService = SyncService();
