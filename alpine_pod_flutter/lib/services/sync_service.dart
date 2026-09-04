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
    if (!useClientCacheSignal.value) {
      _log.info('Client cache disabled (useClientCacheSignal is false): skipping syncAll');
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

      // 3. Section Members & Memberships for current section
      if (currentSectionId != null) {
        await syncSectionMemberships(currentSectionId);
      }

      // 4. Events for the current section if selected
      if (currentSectionId != null) {
        final now = DateTime.now();
        final start = DateTime(now.year, now.month - 1, 1);
        final end = DateTime(now.year, now.month + 2, 0);
        await syncEvents(currentSectionId, start, end);
      }

      // 5. Notifications and notification preferences
      if (sessionManager.isAuthenticated) {
        await syncNotifications();
        await syncNotificationPreferences();
      }

      final syncTime = DateTime.now();
      connectivityService.updateLastSynced(syncTime);
      _log.info('syncAll completed successfully at $syncTime');
    } catch (e, stack) {
      _log.severe('Error during syncAll', e, stack);
      connectivityService.markServerUnreachable(error: e);
    } finally {
      _isSyncing = false;
    }
  }

  Future<void> _deleteMemberCascade(Member member) async {
    await EventRegistration.db.deleteWhere(dbSession, where: (t) => t.memberId.equals(member.id));
    await EventManager.db.deleteWhere(dbSession, where: (t) => t.memberId.equals(member.id));
    await SectionMembership.db.deleteWhere(dbSession, where: (t) => t.memberId.equals(member.id));
    await Member.db.deleteRow(dbSession, member);
  }

  Future<void> _deleteSectionCascade(Section section) async {
    final id = section.id;
    if (id == null) return;
    final events = await Event.db.find(dbSession, where: (t) => t.sectionId.equals(id));
    for (final e in events) {
      await EventRegistration.db.deleteWhere(dbSession, where: (t) => t.eventId.equals(e.id));
      await EventManager.db.deleteWhere(dbSession, where: (t) => t.eventId.equals(e.id));
    }
    await Event.db.deleteWhere(dbSession, where: (t) => t.sectionId.equals(id));
    await SectionMembership.db.deleteWhere(dbSession, where: (t) => t.sectionId.equals(id));
    await Section.db.deleteRow(dbSession, section);
  }

  Future<void> _upsertMember(Member member) async {
    final existing = await Member.db.findById(dbSession, member.id);
    if (existing != null) {
      await Member.db.updateRow(dbSession, member);
    } else {
      final existingByEmail = await Member.db.findFirstRow(dbSession, where: (t) => t.email.equals(member.email));
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
      final existingByName = await Section.db.findFirstRow(dbSession, where: (t) => t.name.equals(section.name));
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
    await EventManager.db.deleteWhere(dbSession, where: (t) => t.eventId.equals(eventId));
    await EventRegistration.db.deleteWhere(dbSession, where: (t) => t.eventId.equals(eventId));
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
          _log.warning('Failed to fetch missing section ${e.sectionId} for event ${e.title}: $err');
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
        } else {
          final exists = await Member.db.findById(dbSession, m.memberId);
          if (exists == null) {
            await Member.db.insertRow(
              dbSession,
              Member(
                id: m.memberId,
                firstName: 'Member',
                lastName: '',
                displayName: 'Member',
                email: 'placeholder_${m.memberId}@domain.com',
                phoneNumber: '555-0000',
                emergencyContactName: 'N/A',
                emergencyContactPhone: '555-0000',
                membershipStatus: 'active',
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ),
            );
          }
        }
        final existingEm = await EventManager.db.findFirstRow(
          dbSession,
          where: (t) => t.eventId.equals(m.eventId) & t.memberId.equals(m.memberId),
        );
        if (existingEm != null) {
          await EventManager.db.updateRow(dbSession, m.copyWith(id: existingEm.id));
        } else {
          await EventManager.db.insertRow(dbSession, m);
        }
      }
    }

    // Extract and cache embedded event registrations
    final registrations = e.eventRegistrations;
    if (registrations != null && registrations.isNotEmpty) {
      for (final r in registrations) {
        if (r.member != null) {
          await _upsertMember(r.member!);
        } else {
          final exists = await Member.db.findById(dbSession, r.memberId);
          if (exists == null) {
            await Member.db.insertRow(
              dbSession,
              Member(
                id: r.memberId,
                firstName: 'Member',
                lastName: '',
                displayName: 'Member',
                email: 'placeholder_${r.memberId}@domain.com',
                phoneNumber: '555-0000',
                emergencyContactName: 'N/A',
                emergencyContactPhone: '555-0000',
                membershipStatus: 'active',
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ),
            );
          }
        }
        final existingReg = await EventRegistration.db.findFirstRow(
          dbSession,
          where: (t) => t.eventId.equals(r.eventId) & t.memberId.equals(r.memberId),
        );
        if (existingReg != null) {
          await EventRegistration.db.updateRow(dbSession, r.copyWith(id: existingReg.id));
        } else {
          await EventRegistration.db.insertRow(dbSession, r);
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
      where: (t) => t.memberId.equals(membership.memberId) & t.sectionId.equals(membership.sectionId),
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

      final memberships = await client.member.getAllMySectionMemberships();
      for (final m in memberships) {
        if (m.member != null) await _upsertMember(m.member!);
        if (m.section != null) await _upsertSection(m.section!);
      }
      final currentMember = currentMemberSignal.value;
      if (currentMember != null) {
        await SectionMembership.db.deleteWhere(dbSession, where: (t) => t.memberId.equals(currentMember.id));
      }
      for (final m in memberships) {
        await _upsertSectionMembership(m);
      }
    } catch (e) {
      _log.warning('Failed to sync sections/memberships: $e');
    }
  }

  /// Syncs all section memberships (and associated member profiles) for a specific section to local cache.
  Future<void> syncSectionMemberships(UuidValue sectionId) async {
    if (!isOnlineSignal.value) return;
    try {
      final memberships = await client.member.getSectionMemberships(sectionId, limit: 1000, offset: 0);
      for (final m in memberships) {
        if (m.member != null) await _upsertMember(m.member!);
        if (m.section != null) await _upsertSection(m.section!);
        await _upsertSectionMembership(m);
      }
      _log.info('Synced ${memberships.length} section memberships for section $sectionId');
    } catch (e) {
      _log.warning('Failed to sync section memberships for section $sectionId: $e');
    }
  }

  Future<void> syncMemberProfiles(UuidValue sectionId) async {
    final dt = syncOnlyUpdatedDataSignal.value ? lastSyncedAtSignal.value : null;

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
          sinceLastUpdateTime ?? (syncOnlyUpdatedDataSignal.value ? lastSyncedAtSignal.value?.toUtc() : null);

      final publicEvents = await client.event.listEvents(
        sectionId: sectionId,
        startTime: startTime,
        endTime: endTime,
        onlyMyEvents: false,
        sinceLastUpdateTime: effectiveSince,
      );

      List<Event> myEvents = [];
      if (sessionManager.isAuthenticated) {
        try {
          myEvents = await client.event.listEvents(
            sectionId: sectionId,
            startTime: startTime,
            endTime: endTime,
            onlyMyEvents: true,
            sinceLastUpdateTime: effectiveSince,
          );
        } catch (e) {
          _log.warning('Failed to fetch user events during sync: $e');
        }
      }

      final mergedMap = <UuidValue, Event>{};
      for (final e in publicEvents) {
        mergedMap[e.id] = e;
      }
      for (final e in myEvents) {
        mergedMap[e.id] = e;
      }
      final events = mergedMap.values.toList();

      _log.info(
        'Got ${events.length} total events (${publicEvents.length} public, ${myEvents.length} user-specific) from server (since: ${effectiveSince?.toIso8601String() ?? "all"})',
      );

      if (effectiveSince == null) {
        // Full sync: Clean child records and delete cached events within the date window
        final existingEvents = await Event.db.find(
          dbSession,
          where: (t) {
            Expression where = Constant.bool(true);
            if (sectionId != null) {
              where = where & t.sectionId.equals(sectionId);
            }
            where = where & (t.endTime >= startTime) & (t.startTime <= endTime);
            return where;
          },
        );

        for (final e in existingEvents) {
          await _cleanEventChildRecords(e.id);
        }

        // Safe to delete old cached events in this date window
        await Event.db.deleteWhere(
          dbSession,
          where: (t) {
            Expression where = Constant.bool(true);
            if (sectionId != null) {
              where = where & t.sectionId.equals(sectionId);
            }
            where = where & (t.endTime >= startTime) & (t.startTime <= endTime);
            return where;
          },
        );
        _log.info('Cleaned existing cached events and child records for section $sectionId in date window');

        // Insert new events and their referenced members & child records
        if (events.isNotEmpty) {
          for (var e in events) {
            if (sectionId != null && e.sectionId != sectionId) {
              _log.warning('Event ${e.title} is not in current section $sectionId, skipping');
              continue;
            }

            await _ensureSectionExists(e);
            await _cleanEventChildRecords(e.id);
            await _upsertEvent(e);
            await _saveEventChildren(e);
          }
        }
      } else {
        // Incremental sync: upsert modified/new events and update their child records
        if (events.isNotEmpty) {
          for (var e in events) {
            if (sectionId != null && e.sectionId != sectionId) {
              _log.warning('Event ${e.title} is not in current section $sectionId, skipping');
              continue;
            }

            await _ensureSectionExists(e);
            await _cleanEventChildRecords(e.id);
            await _upsertEvent(e);
            await _saveEventChildren(e);
          }
        }
        _log.info('Incrementally updated ${events.length} events in local cache');
      }

      final syncTime = DateTime.now();
      connectivityService.updateLastSynced(syncTime);

      return events;
    } catch (e) {
      _log.warning('Failed to sync events: $e ');
      connectivityService.markServerUnreachable(error: e);
      return [];
    }
  }

  /// Syncs notifications feed to local cache.
  Future<void> syncNotifications() async {
    if (!isOnlineSignal.value) return;
    try {
      final notifications = await client.notification.getMyFeed(limit: 50, offset: 0);
      for (final un in notifications) {
        // Upsert the parent Notification first so the FK is satisfied.
        // Skip if the embedded notification or its id is null — the row may
        // already exist in the local DB from a prior sync.
        final notif = un.notification;
        if (notif != null && notif.id != null) {
          await Notification.db.upsertRow(dbSession, notif, conflictColumns: (t) => [t.id]);
        }

        // Now upsert the UserNotification (which FK-references notificationId).
        await UserNotification.db.upsertRow(dbSession, un, conflictColumns: (t) => [t.id]);
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
      await UserNotificationPreference.db.deleteWhere(dbSession, where: (t) => Constant.bool(true));
      await UserNotificationPreference.db.insert(dbSession, [prefs]);
    } catch (e) {
      _log.warning('Failed to sync notification preferences: $e');
    }
  }
}
