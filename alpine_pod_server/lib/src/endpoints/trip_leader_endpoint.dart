import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../rbac.dart';
import '../cache/user_cache.dart';

class TripLeaderEndpoint extends Endpoint {
  final _cache = UserCache();
  Future<EventTripLeader> assignTripLeader(
    Session session,
    EventTripLeader tripLeader,
  ) async {
    if (tripLeader.eventId == null || tripLeader.userId == null) {
      throw Exception('Event ID and User ID are required');
    }

    // Get the event to check section
    final event = await Event.db.findById(session, tripLeader.eventId!);
    if (event == null) throw Exception('Event not found');

    // Check if user has permission (admin or section manager)
    final allowed = await isSectionManager(session, event.sectionId);
    if (!allowed) throw Exception('Permission denied');

    // Check if the user being assigned is a trip leader
    final assignedUser = await User.db.findById(session, tripLeader.userId!);
    if (assignedUser == null) throw Exception('User not found');
    if (!await _cache.hasRole(session, assignedUser.id!, UserRole.tripLeader)) {
      throw Exception('User must have trip leader role to be assigned');
    }

    // Check if event has already ended
    if (event.endTime.isBefore(DateTime.now())) {
      throw Exception('Cannot assign trip leaders to past events');
    }

    // Check if user is already a member of the section
    if (!await _cache.isSectionMember(session, tripLeader.userId!, event.sectionId!)) {
      throw Exception('Trip leader must be a member of the section');
    }

    // Check if assignment already exists
    final existing = await EventTripLeader.db.findFirstRow(
      session,
      where: (t) => t.eventId.equals(tripLeader.eventId!) & t.userId.equals(tripLeader.userId!),
    );
    if (existing != null) {
      throw Exception('User is already a trip leader for this event');
    }

    // Create new assignment with timestamp
    final assignment = tripLeader.copyWith(
      assignedAt: DateTime.now(),
    );

    return await EventTripLeader.db.insertRow(session, assignment);
  }

  /// Check if an event has any trip leaders assigned
  Future<bool> _hasOtherTripLeaders(Session session, int eventId, int excludeUserId) async {
    final otherLeader = await EventTripLeader.db.findFirstRow(
      session,
      where: (t) => t.eventId.equals(eventId) & t.userId.notEquals(excludeUserId),
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

  Future<void> removeTripLeader(
    Session session,
    EventTripLeader tripLeader,
  ) async {
    if (tripLeader.eventId == null || tripLeader.userId == null) {
      throw Exception('Event ID and User ID are required');
    }

    // Get the event to check section
    final event = await Event.db.findById(session, tripLeader.eventId!);
    if (event == null) throw Exception('Event not found');

    // Check if user has permission (admin or section manager)
    final allowed = await isSectionManager(session, event.sectionId);
    if (!allowed) throw Exception('Permission denied');

    // Find the assignment
    final existing = await EventTripLeader.db.findFirstRow(
      session,
      where: (t) => t.eventId.equals(tripLeader.eventId!) & t.userId.equals(tripLeader.userId!),
    );
    if (existing == null) return;

    // Check if this is the last trip leader and there are active registrations
    if (!await _hasOtherTripLeaders(session, tripLeader.eventId!, tripLeader.userId!) &&
        await _hasActiveRegistrations(session, tripLeader.eventId!)) {
      throw Exception('Cannot remove the last trip leader while the event has active registrations');
    }

    await EventTripLeader.db.deleteRow(session, existing);
  }

  Future<List<EventTripLeader>> listEventTripLeaders(
    Session session,
    int eventId,
  ) async {
    return await EventTripLeader.db.find(
      session,
      where: (t) => t.eventId.equals(eventId),
    );
  }

  Future<List<Event>> listTripLeaderEvents(
    Session session,
    int userId,
  ) async {
    // Get all events where this user is a trip leader
    final tripLeaderAssignments = await EventTripLeader.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (tripLeaderAssignments.isEmpty) return [];

    // Get the corresponding events
    final eventIds = tripLeaderAssignments.map((t) => t.eventId!).toList();
    // Build a condition for multiple event IDs using OR
    final eventConditions = eventIds.map((id) => Event.t.id.equals(id));
    final whereClause = eventConditions.reduce((acc, e) => acc | e);

    return await Event.db.find(
      session,
      where: (_) => whereClause,
    );
  }

  /// List events in a section that have no trip leaders assigned
  Future<List<Event>> listEventsWithoutTripLeader(
    Session session,
    int sectionId,
  ) async {
    // Check if user has permission to view section events
    final allowed = await isSectionManager(session, sectionId);
    if (!allowed) throw Exception('Permission denied');

    // First get all events in the section
    final sectionEvents = await Event.db.find(
      session,
      where: (e) => e.sectionId.equals(sectionId),
    );

    // For each event, check if it has any trip leaders
    final result = <Event>[];
    for (final event in sectionEvents) {
      final hasLeader = await EventTripLeader.db.findFirstRow(
        session,
        where: (t) => t.eventId.equals(event.id!),
      );
      if (hasLeader == null) {
        result.add(event);
      }
    }

    return result;
  }

  /// List all trip leaders for events in a section
  Future<List<EventTripLeader>> listSectionTripLeaders(
    Session session,
    int sectionId,
  ) async {
    // Check if user can view section details
    if (!await isSectionManager(session, sectionId)) {
      throw Exception('Permission denied');
    }

    // First get all events in the section
    final sectionEvents = await Event.db.find(
      session,
      where: (e) => e.sectionId.equals(sectionId),
    );

    if (sectionEvents.isEmpty) return [];

    // Get event IDs
    final eventIds = sectionEvents.map((e) => e.id!).toList();

    // Build query for all trip leaders of these events
    final eventConditions = eventIds.map((id) => EventTripLeader.t.eventId.equals(id));
    final whereClause = eventConditions.reduce((acc, e) => acc | e);

    return await EventTripLeader.db.find(
      session,
      where: (_) => whereClause,
    );
  }
}
