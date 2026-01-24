// ignore_for_file: dead_null_aware_expression, unnecessary_null_comparison, unnecessary_non_null_assertion

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import '../generated/protocol.dart';

class EventEndpoint extends Endpoint {
  void _validateEvent(Event event) {
    // Validate required fields
    if (event.title.isEmpty) throw Exception('Event title is required');
    if (event.description.isEmpty) {
      throw Exception('Event description is required');
    }

    // Validate dates
    if (event.endTime.isBefore(event.startTime)) {
      throw Exception('End time must be after start time');
    }

    // Validate registration settings
    if (event.registrationDeadline != null &&
        event.registrationDeadline!.isAfter(event.startTime)) {
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
      throw Exception(
          'Minimum participants cannot be greater than maximum participants');
    }

    // Validate GPS coordinates if provided
    if ((event.gpsLatitude != null && event.gpsLongitude == null) ||
        (event.gpsLatitude == null && event.gpsLongitude != null)) {
      throw Exception('Both latitude and longitude must be provided together');
    }
    if (event.gpsLatitude != null &&
        (event.gpsLatitude! < -90 || event.gpsLatitude! > 90)) {
      throw Exception('Invalid latitude value');
    }
    if (event.gpsLongitude != null &&
        (event.gpsLongitude! < -180 || event.gpsLongitude! > 180)) {
      throw Exception('Invalid longitude value');
    }
  }

  Future<Event> createEvent(Session session, Event event) async {
    session.log('Creating Event $event ', level: LogLevel.info);

    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw Exception('User must be authenticated to create an event');
    }

    // Validate event fields
    _validateEvent(event);

    return await session.db.transaction((transaction) async {
      final createdEvent =
          await Event.db.insertRow(session, event, transaction: transaction);

      // Find the member for this user
      final member = await Member.db.findFirstRow(
        session,
        where: (t) => t.user.id.equals(authInfo.authUserId),
        transaction: transaction,
      );

      if (member == null) {
        throw Exception('No member profile found for authenticated user');
      }

      // Assign as default manager
      await EventManager.db.insertRow(
        session,
        EventManager(
          eventId: createdEvent.id!,
          memberId: member.id!,
        ),
        transaction: transaction,
      );

      return createdEvent;
    });
  }

  Future<Event?> getEvent(Session session, int id) async {
    return await Event.db.findById(session, id);
  }

  Future<Event> updateEvent(Session session, Event event) async {
    session.log('Update Event $event');
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
        throw Exception(
            'Cannot change section for an event with registrations');
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

  Future<List<Event>> listEvents(
    Session session,
    int? sectionId,
    DateTime? startTime,
    DateTime? endTime,
  ) async {
    // Return all events for the section or all events for admin
    return await Event.db.find(
      session,
      where: (t) {
        Expression where = Constant.bool(true);
        if (sectionId != null) {
          where = where & t.sectionId.equals(sectionId);
        }
        if (startTime != null) {
          where = where & (t.startTime >= startTime);
        }
        if (endTime != null) {
          where = where & (t.startTime <= endTime);
        }
        return where;
      },
      orderBy: (t) => t.startTime,
    );
  }

  Future<EventDetails> getEventDetails(Session session, int eventId) async {
    final event = await Event.db.findById(session, eventId);
    if (event == null) {
      throw Exception('Event not found');
    }

    final registrations = await EventRegistration.db.find(
      session,
      where: (t) => t.eventId.equals(eventId),
      include: EventRegistration.include(member: Member.include()),
      orderBy: (t) => t.registrationDate,
    );

    final registrants = registrations
        .where((r) => r.registrationStatus != RegistrationStatus.waitlisted)
        .toList();

    final waitlist = registrations
        .where((r) => r.registrationStatus == RegistrationStatus.waitlisted)
        .toList();

    final managers = await EventManager.db.find(
      session,
      where: (t) => t.eventId.equals(eventId),
      include: EventManager.include(member: Member.include()),
    );

    return EventDetails(
      event: event,
      registrants: registrants,
      waitlist: waitlist,
      managers: managers,
    );
  }

  Future<EventRegistration> registerForEvent(
      Session session, int eventId) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw Exception('User must be authenticated to register');
    }

    return await session.db.transaction((transaction) async {
      // Find the member
      final member = await Member.db.findFirstRow(
        session,
        where: (t) => t.user.id.equals(authInfo.authUserId),
        transaction: transaction,
      );

      if (member == null) {
        throw Exception('Member profile not found');
      }

      // Check if already registered
      final existing = await EventRegistration.db.findFirstRow(
        session,
        where: (t) => t.eventId.equals(eventId) & t.memberId.equals(member.id!),
        transaction: transaction,
      );

      if (existing != null) {
        throw Exception('Already registered for this event');
      }

      // Get event
      final event =
          await Event.db.findById(session, eventId, transaction: transaction);
      if (event == null) {
        throw Exception('Event not found');
      }

      // Check registration dates
      final now = DateTime.now();
      if (event.registrationStartDate != null &&
          now.isBefore(event.registrationStartDate!)) {
        throw Exception('Registration has not started yet');
      }
      if (event.registrationDeadline != null &&
          now.isAfter(event.registrationDeadline!)) {
        throw Exception('Registration deadline has passed');
      }

      // Determine status
      var status = RegistrationStatus.confirmed;
      int? waitlistPosition;

      if (event.requiresApproval) {
        status = RegistrationStatus.pending;
      } else if (event.currentRegistrationCount >= event.maxParticipants) {
        if (event.requiresApproval) {
          status = RegistrationStatus.waitlisted;
          // Calculate waitlist position
          final waitlistCount = await EventRegistration.db.count(
            session,
            where: (t) =>
                t.eventId.equals(eventId) &
                t.registrationStatus.equals(RegistrationStatus.waitlisted),
            transaction: transaction,
          );
          waitlistPosition = waitlistCount + 1;
        } else {
          throw Exception('Event is full and waitlist is disabled');
        }
      }

      // Create registration
      final registration = EventRegistration(
        memberId: member.id!,
        eventId: eventId,
        registrationStatus: status,
        registrationDate: now,
        modifiedAt: now,
        waitlistPosition: waitlistPosition,
        waitlistedAt: status == RegistrationStatus.waitlisted ? now : null,
        waiverAccepted: false, // Default
      );

      final created = await EventRegistration.db
          .insertRow(session, registration, transaction: transaction);

      // Increment count if confirmed
      if (status == RegistrationStatus.confirmed) {
        event.currentRegistrationCount =
            (event.currentRegistrationCount ?? 0) + 1;
        await Event.db.updateRow(session, event, transaction: transaction);
      }

      return created;
    });
  }
}
