import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../member_cache.dart';

class EventEndpoint extends Endpoint {
  void _validateEvent(Event event) {
    // Validate required fields
    if (event.title.isEmpty) throw Exception('Event title is required');
    if (event.description.isEmpty) throw Exception('Event description is required');

    // Validate dates
    if (event.endTime.isBefore(event.startTime)) {
      throw Exception('End time must be after start time');
    }

    // Validate registration settings
    if (event.registrationDeadline != null && event.registrationDeadline!.isAfter(event.startTime)) {
      throw Exception('Registration deadline must be before event start time');
    }
    if (event.maxParticipants != null && event.maxParticipants! <= 0) {
      throw Exception('Maximum participants must be positive');
    }
    if (event.minimumParticipants != null && event.minimumParticipants! <= 0) {
      throw Exception('Minimum participants must be positive');
    }
    if (event.minimumParticipants != null &&
        event.maxParticipants != null &&
        event.minimumParticipants! > event.maxParticipants!) {
      throw Exception('Minimum participants cannot be greater than maximum participants');
    }

    // Validate GPS coordinates if provided
    if ((event.gpsLatitude != null && event.gpsLongitude == null) ||
        (event.gpsLatitude == null && event.gpsLongitude != null)) {
      throw Exception('Both latitude and longitude must be provided together');
    }
    if (event.gpsLatitude != null && (event.gpsLatitude! < -90 || event.gpsLatitude! > 90)) {
      throw Exception('Invalid latitude value');
    }
    if (event.gpsLongitude != null && (event.gpsLongitude! < -180 || event.gpsLongitude! > 180)) {
      throw Exception('Invalid longitude value');
    }
  }

  Future<Event> createEvent(Session session, Event event) async {
    session.log('Creating Event $event ', level: LogLevel.info);
    // Validate section ID is provided
    // Cant be null, so this check is void.. todo: validate sections exists?
    // if (event.sectionId == null) {
    //   throw Exception('Events must be associated with a section');
    // }

    // Validate event fields
    _validateEvent(event);
    return await Event.db.insertRow(session, event);
  }

  Future<Event?> getEvent(Session session, int id) async {
    return await Event.db.findById(session, id);
  }

  Future<Event> updateEvent(Session session, Event event) async {
    if (event.id == null) throw Exception('Event ID is required for updates');

    final existing = await Event.db.findById(session, event.id!);
    if (existing == null) throw Exception('Event not found');

    // Validate event fields
    _validateEvent(event);

    // Don't allow changing section ID if the event has registrations
    if (existing.sectionId != event.sectionId) {
      final hasRegistrations = await EventRegistration.db.count(
            session,
            where: (t) => t.eventId.equals(event.id!),
          ) >
          0;
      if (hasRegistrations) {
        throw Exception('Cannot change section for an event with registrations');
      }
    }

    return await Event.db.updateRow(session, event);
  }

  Future<void> deleteEvent(Session session, int id) async {
    final existing = await Event.db.findById(session, id);
    if (existing == null) return;

    // Check if event has registrations
    final hasRegistrations = await EventRegistration.db.count(
          session,
          where: (t) => t.eventId.equals(id),
        ) >
        0;

    if (hasRegistrations) {
      throw Exception('Cannot delete an event with existing registrations');
    }

    await Event.db.deleteRow(session, existing);
  }

  Future<List<Event>> listEvents(Session session, int? sectionId) async {
    // If section ID is provided, check membership unless member is admin
    if (sectionId != null) {
      final dynamic s = session;
      final int? memberId = s.authenticatedUserId as int?;
      if (memberId == null) return [];

      final isMember = await cache.isSectionMember(session, sectionId);
      if (!isMember) {
        // Non-members can only see public events
        return await Event.db.find(
          session,
          where: (t) => t.sectionId.equals(sectionId),
        );
      }
    }

    // Return all events for the section or all events for admin
    if (sectionId != null) {
      return await Event.db.find(
        session,
        where: (t) => t.sectionId.equals(sectionId),
      );
    }
    return await Event.db.find(session);
  }
}
