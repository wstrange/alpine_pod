// ignore_for_file: unnecessary_non_null_assertion, unnecessary_null_comparison

import 'package:alpine_pod_server/src/custom_scopes.dart';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../member_cache.dart';

class EventManagerEndpoint extends Endpoint {
  @override
  Set<Scope> get requiredScopes => {CustomScope.eventManager};

  Future<EventManager> assignEventManager(
    Session session,
    EventManager eventManager,
  ) async {
    if (eventManager.eventId == null) {
      throw Exception('Event ID is required');
    }

    // Get the event to check section
    final event = await Event.db.findById(session, eventManager.eventId!);
    if (event == null) throw Exception('Event not found');

    // Check if event has already ended
    if (event.endTime.isBefore(DateTime.now())) {
      throw Exception('Cannot assign event managers to past events');
    }

    // Check if member is already a member of the section
    if (!await cache.isSectionMember(session, event.sectionId)) {
      throw Exception('Event manager must be a member of the section');
    }

    // Check if assignment already exists
    final existing = await EventManager.db.findFirstRow(
      session,
      where: (t) =>
          t.eventId.equals(eventManager.eventId!) &
          t.memberId.equals(eventManager.memberId!),
    );
    if (existing != null) {
      throw Exception('Member is already an event manager for this event');
    }

    // Create new assignment with timestamp
    final assignment = eventManager.copyWith(
      assignedAt: DateTime.now(),
    );

    return await EventManager.db.insertRow(session, assignment);
  }

  /// Check if an event has any event managers assigned
  Future<bool> _hasOtherEventManagers(
      Session session, int eventId, int excludeMemberId) async {
    final otherLeader = await EventManager.db.findFirstRow(
      session,
      where: (t) =>
          t.eventId.equals(eventId) & t.memberId.notEquals(excludeMemberId),
    );
    return otherLeader != null;
  }

  /// Check if an event has any active registrations
  Future<bool> _hasActiveRegistrations(Session session, int eventId) async {
    final registrationCount = await EventRegistration.db.count(
      session,
      where: (t) =>
          t.eventId.equals(eventId) &
          (t.registrationStatus.equals(RegistrationStatus.confirmed) |
              t.registrationStatus.equals(RegistrationStatus.pending) |
              t.registrationStatus.equals(RegistrationStatus.waitlisted)),
    );
    return registrationCount > 0;
  }

  Future<void> removeEventManager(
    Session session,
    EventManager eventManager,
  ) async {
    if (eventManager.eventId == null) {
      throw Exception('Event ID is required');
    }

    // Get the event to check section
    final event = await Event.db.findById(session, eventManager.eventId!);
    if (event == null) throw Exception('Event not found');

    // Find the assignment
    final existing = await EventManager.db.findFirstRow(
      session,
      where: (t) =>
          t.eventId.equals(eventManager.eventId!) &
          t.memberId.equals(eventManager.memberId!),
    );
    if (existing == null) return;

    // Check if this is the last event manager and there are active registrations
    if (!await _hasOtherEventManagers(
            session, eventManager.eventId!, eventManager.memberId!) &&
        await _hasActiveRegistrations(session, eventManager.eventId!)) {
      throw Exception(
          'Cannot remove the last event manager while the event has active registrations');
    }

    await EventManager.db.deleteRow(session, existing);
  }

  Future<List<EventManager>> listEventManagers(
    Session session,
    int eventId,
  ) async {
    return await EventManager.db.find(
      session,
      where: (t) => t.eventId.equals(eventId),
    );
  }

  Future<List<Event>> listEventManagerEvents(
    Session session,
    int memberId,
  ) async {
    // Get all events where this member is an event manager
    final eventManagerAssignments = await EventManager.db.find(
      session,
      where: (t) => t.memberId.equals(memberId),
    );

    if (eventManagerAssignments.isEmpty) return [];

    // Get the corresponding events
    final eventIds = eventManagerAssignments.map((t) => t.eventId!).toList();
    // Build a condition for multiple event IDs using OR
    final eventConditions = eventIds.map((id) => Event.t.id.equals(id));
    final whereClause = eventConditions.reduce((acc, e) => acc | e);

    return await Event.db.find(
      session,
      where: (_) => whereClause,
    );
  }

  /// List events in a section that have no event managers assigned
  Future<List<Event>> listEventsWithoutEventManager(
    Session session,
    int sectionId,
  ) async {
    // Check if member has permission to view section events

    // First get all events in the section
    final sectionEvents = await Event.db.find(
      session,
      where: (e) => e.sectionId.equals(sectionId),
    );

    // For each event, check if it has any event managers
    final result = <Event>[];
    for (final event in sectionEvents) {
      final hasLeader = await EventManager.db.findFirstRow(
        session,
        where: (t) => t.eventId.equals(event.id!),
      );
      if (hasLeader == null) {
        result.add(event);
      }
    }

    return result;
  }

  /// List all event managers for events in a section
  Future<List<EventManager>> listSectionEventManagers(
    Session session,
    int sectionId,
  ) async {
    // Check if member can view section details

    // First get all events in the section
    final sectionEvents = await Event.db.find(
      session,
      where: (e) => e.sectionId.equals(sectionId),
    );

    if (sectionEvents.isEmpty) return [];

    // Get event IDs
    final eventIds = sectionEvents.map((e) => e.id!).toList();

    // Build query for all event managers of these events
    final eventConditions =
        eventIds.map((id) => EventManager.t.eventId.equals(id));
    final whereClause = eventConditions.reduce((acc, e) => acc | e);

    return await EventManager.db.find(
      session,
      where: (_) => whereClause,
    );
  }
}
