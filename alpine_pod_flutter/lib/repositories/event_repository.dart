import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';
import 'package:serverpod_database/serverpod_database.dart';

import '../services/sync_service.dart';
import '../signals.dart';

final _log = Logger('EventRepository');
final eventRepository = EventRepository();

class EventRepository {
  Future<List<Event>> _queryCachedEvents({
    UuidValue? sectionId,
    DateTime? startTime,
    DateTime? endTime,
    bool onlyMyEvents = false,
  }) async {
    final currentMember = currentMemberSignal.value;
    final memberId = currentMember?.id;

    return await Event.db.find(
      dbSession,
      where: (t) {
        Expression where = Constant.bool(true);
        if (sectionId != null) {
          where = where & t.sectionId.equals(sectionId);
        }
        if (startTime != null) {
          where = where & (t.endTime >= startTime);
        }
        if (endTime != null) {
          where = where & (t.startTime <= endTime);
        }

        if (onlyMyEvents && memberId != null) {
          where =
              where &
              (t.eventManagers.any((m) => m.memberId.equals(memberId)) |
                  (t.eventRegistrations.any(
                        (r) => r.memberId.equals(memberId),
                      ) &
                      t.published.equals(true)));
        } else {
          where = where & t.published.equals(true);
        }

        return where;
      },
      orderBy: (t) => t.startTime,
      include: Event.include(
        eventManagers: EventManager.includeList(
          include: EventManager.include(member: Member.include()),
        ),
        eventRegistrations: EventRegistration.includeList(
          include: EventRegistration.include(member: Member.include()),
        ),
      ),
    );
  }

  /// Reads events from the local SQLite cache (or pure server fetch if cache is bypassed).
  /// If online and cache is empty, triggers a sync first.
  Future<List<Event>> listEvents({
    UuidValue? sectionId,
    DateTime? startTime,
    DateTime? endTime,
    bool onlyMyEvents = false,
  }) async {
    if (useClientCacheSignal.value) {
      try {
        final cachedEvents = await _queryCachedEvents(
          sectionId: sectionId,
          startTime: startTime,
          endTime: endTime,
          onlyMyEvents: onlyMyEvents,
        );

        if (cachedEvents.isNotEmpty || !isOnlineSignal.value) {
          return cachedEvents;
        }
      } catch (e) {
        _log.warning(
          'Failed to query local Event cache, falling back to server: $e',
        );
      }

      // Fallback: sync from server and return from local cache
      if (isOnlineSignal.value) {
        try {
          final now = DateTime.now();
          final start = startTime ?? DateTime(now.year, now.month - 1, 1);
          final end = endTime ?? DateTime(now.year, now.month + 2, 0);
          await syncService.syncEvents(sectionId, start, end);
          connectivityService.markServerReachable();
          return await _queryCachedEvents(
            sectionId: sectionId,
            startTime: startTime,
            endTime: endTime,
            onlyMyEvents: onlyMyEvents,
          );
        } catch (e) {
          _log.warning('Sync events failed, falling back to local cache: $e');
          connectivityService.markServerUnreachable();
          try {
            return await _queryCachedEvents(
              sectionId: sectionId,
              startTime: startTime,
              endTime: endTime,
              onlyMyEvents: onlyMyEvents,
            );
          } catch (_) {
            return [];
          }
        }
      }
    } else {
      if (isOnlineSignal.value) {
        try {
          final events = await client.event.listEvents(
            sectionId: sectionId,
            startTime: startTime,
            endTime: endTime,
            onlyMyEvents: onlyMyEvents,
          );
          connectivityService.markServerReachable();
          return events;
        } catch (e) {
          _log.warning('Failed to fetch events directly from server: $e');
          connectivityService.markServerUnreachable();
          // Fallback to local cache even if cache toggle was off
          try {
            return await _queryCachedEvents(
              sectionId: sectionId,
              startTime: startTime,
              endTime: endTime,
              onlyMyEvents: onlyMyEvents,
            );
          } catch (_) {}
        }
      }
    }

    return [];
  }

  /// Gets a single event by ID from cache or server.
  Future<Event?> getEvent(UuidValue id) async {
    if (useClientCacheSignal.value) {
      if (!isOnlineSignal.value) {
        try {
          return await Event.db.findById(
            dbSession,
            id,
            include: Event.include(
              eventManagers: EventManager.includeList(
                include: EventManager.include(member: Member.include()),
              ),
              eventRegistrations: EventRegistration.includeList(
                include: EventRegistration.include(member: Member.include()),
              ),
            ),
          );
        } catch (e) {
          _log.warning('Local cache lookup failed for event $id: $e');
          return null;
        }
      }

      try {
        final cached = await Event.db.findById(
          dbSession,
          id,
          include: Event.include(
            eventManagers: EventManager.includeList(
              include: EventManager.include(member: Member.include()),
            ),
            eventRegistrations: EventRegistration.includeList(
              include: EventRegistration.include(member: Member.include()),
            ),
          ),
        );
        if (cached != null) return cached;
      } catch (e) {
        _log.warning('Local cache lookup failed for event $id: $e');
      }
    }

    if (isOnlineSignal.value) {
      try {
        final event = await client.event.getEvent(id);
        connectivityService.markServerReachable();
        return event;
      } catch (e) {
        _log.warning('Failed to fetch event $id from server: $e');
        connectivityService.markServerUnreachable(error: e);
        try {
          return await Event.db.findById(
            dbSession,
            id,
            include: Event.include(
              eventManagers: EventManager.includeList(
                include: EventManager.include(member: Member.include()),
              ),
              eventRegistrations: EventRegistration.includeList(
                include: EventRegistration.include(member: Member.include()),
              ),
            ),
          );
        } catch (_) {}
      }
    } else {
      try {
        return await Event.db.findById(
          dbSession,
          id,
          include: Event.include(
            eventManagers: EventManager.includeList(
              include: EventManager.include(member: Member.include()),
            ),
            eventRegistrations: EventRegistration.includeList(
              include: EventRegistration.include(member: Member.include()),
            ),
          ),
        );
      } catch (_) {}
    }
    return null;
  }

  /// Creates a new event via the server API, then syncs to update local cache.
  Future<Event> createEvent(
    Event event, {
    List<UuidValue>? additionalManagerIds,
    bool notifyNewEvent = true,
  }) async {
    if (!isOnlineSignal.value) {
      throw Exception(
        'You are currently offline. Event creation requires an internet connection.',
      );
    }

    final created = await client.event.createEvent(
      event,
      additionalManagerIds: additionalManagerIds,
      notifyNewEvent: notifyNewEvent,
    );

    // Sync section events to update local cache
    final now = created.startTime;
    final start = DateTime(now.year, now.month - 1, 1);
    final end = DateTime(now.year, now.month + 2, 0);
    await syncService.syncEvents(created.sectionId, start, end);

    return created;
  }

  /// Updates an event via server API and syncs local cache.
  Future<Event> updateEvent(Event event) async {
    if (!isOnlineSignal.value) {
      throw Exception(
        'You are currently offline. Updating events requires an internet connection.',
      );
    }

    final updated = await client.event.updateEvent(event);

    final now = updated.startTime;
    final start = DateTime(now.year, now.month - 1, 1);
    final end = DateTime(now.year, now.month + 2, 0);
    await syncService.syncEvents(updated.sectionId, start, end);

    return updated;
  }

  /// Deletes an event via server API and syncs local cache.
  Future<void> deleteEvent(UuidValue id, UuidValue? sectionId) async {
    if (!isOnlineSignal.value) {
      throw Exception(
        'You are currently offline. Deleting events requires an internet connection.',
      );
    }

    await client.event.deleteEvent(id);

    // Remove from local cache
    await Event.db.deleteWhere(dbSession, where: (t) => t.id.equals(id));
  }

  /// Registers for an event via server API and syncs local cache.
  Future<EventRegistration> registerForEvent(
    UuidValue eventId,
    UuidValue? sectionId,
  ) async {
    if (!isOnlineSignal.value) {
      throw Exception(
        'You are currently offline. Registration requires an internet connection.',
      );
    }

    final registration = await client.event.registerForEvent(eventId);

    // Refresh event cache
    // todo: Better to fetch the event and update it directly???
    await syncEvents(sectionId);

    return registration;
  }

  Future<void> syncEvents(UuidValue? sectionId) async {
    if (sectionId != null) {
      final now = DateTime.now();
      final start = DateTime(now.year, now.month - 1, 1);
      final end = DateTime(now.year, now.month + 2, 0);
      await syncService.syncEvents(sectionId, start, end);
    }
  }

  Future<void> cancelRegistration(
    UuidValue registrationId,
    UuidValue memberId,
  ) async {
    await client.registration.cancelRegistration(registrationId);

    await EventRegistration.db.deleteWhere(
      dbSession,
      where: (t) => t.id.equals(registrationId),
    );

    await syncService.syncAll(currentSectionId: sectionSignal.value?.id);
    currentEventsSignal.refresh();
  }

  /// Removes a member registration from an event via server API and refreshes cache.
  Future<void> removeMemberFromEvent(
    UuidValue registrationId, {
    UuidValue? sectionId,
  }) async {
    if (!isOnlineSignal.value) {
      throw Exception(
        'You are currently offline. Participant updates require an internet connection.',
      );
    }

    await client.eventManager.removeMemberFromEvent(registrationId);
    await syncEvents(sectionId ?? sectionSignal.value?.id);
    currentEventsSignal.refresh();
  }

  /// Approves a member registration for an event via server API and refreshes cache.
  Future<void> approveRegistration(
    UuidValue registrationId, {
    UuidValue? sectionId,
  }) async {
    if (!isOnlineSignal.value) {
      throw Exception(
        'You are currently offline. Approving registration requires an internet connection.',
      );
    }

    await client.eventManager.approveRegistration(registrationId);
    await syncEvents(sectionId ?? sectionSignal.value?.id);
    currentEventsSignal.refresh();
  }

  /// Adds a member to an event as a participant via server API and refreshes cache.
  Future<EventRegistration> addMemberToEvent(
    UuidValue eventId,
    UuidValue memberId, {
    UuidValue? sectionId,
  }) async {
    if (!isOnlineSignal.value) {
      throw Exception(
        'You are currently offline. Adding participant requires an internet connection.',
      );
    }

    final registration = await client.eventManager.addMemberToEvent(
      eventId,
      memberId,
    );
    await syncEvents(sectionId ?? sectionSignal.value?.id);
    currentEventsSignal.refresh();
    return registration;
  }
}
