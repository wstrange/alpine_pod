// ignore_for_file: unnecessary_non_null_assertion, unnecessary_null_comparison

import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../member_cache.dart';

class RegistrationEndpoint extends Endpoint {
  /// Determines the initial registration status based on event settings and capacity
  RegistrationStatus _determineRegistrationStatus({
    required bool requiresApproval,
    required bool isFull,
  }) {
    if (isFull) {
      return RegistrationStatus.waitlisted;
    }
    return requiresApproval
        ? RegistrationStatus.pending
        : RegistrationStatus.confirmed;
  }

  /// Gets the next available waitlist position for an event
  Future<int> _getNextWaitlistPosition(Session session, int eventId) async {
    final lastWaitlisted = await EventRegistration.db.findFirstRow(
      session,
      where: (t) => t.eventId.equals(eventId),
      orderBy: (t) => t.waitlistPosition,
      orderDescending: true,
    );
    return (lastWaitlisted?.waitlistPosition ?? 0) + 1;
  }

  /// Approve or reject a registration
  Future<EventRegistration> updateRegistrationStatus(
    Session session,
    int registrationId,
    RegistrationStatus newStatus, {
    String? notes,
  }) async {
    final reg = await EventRegistration.db.findById(session, registrationId);
    if (reg == null) throw Exception('Registration not found');

    // If approving, check if event is full
    if (newStatus == RegistrationStatus.confirmed) {
      final event = await Event.db.findById(session, reg.eventId);
      if (event == null) throw Exception('Event not found');

      final currentConfirmed = await EventRegistration.db.count(
        session,
        where: (t) =>
            t.eventId.equals(reg.eventId) &
            t.registrationStatus.equals(RegistrationStatus.confirmed),
      );

      if (event.maxParticipants != null &&
          currentConfirmed >= event.maxParticipants!) {
        throw Exception('Event is full');
      }
    }

    final updated = reg.copyWith(
      registrationStatus: newStatus,
      participantNotes: notes ?? reg.participantNotes,
      modifiedAt: DateTime.now(),
    );

    return await EventRegistration.db.updateRow(session, updated);
  }

  Future<EventRegistration> registerForEvent(
      Session session, EventRegistration registration) async {
    // Validate session and get member

    final memberInfo = await cache.getMemberInfo(session);

    if (memberInfo == null) throw Exception('Not authenticated');

    // Validate event exists
    final event = await Event.db.findById(session, registration.eventId);
    if (event == null) throw Exception('Event not found');

    // Check if member is already registered
    final existingReg = await EventRegistration.db.findFirstRow(
      session,
      where: (t) =>
          t.eventId.equals(event.id) & t.memberId.equals(memberInfo.member.id!),
    );
    if (existingReg != null) {
      throw Exception('Already registered for this event');
    }

    final validatedReg = registration.copyWith(
      memberId: memberInfo.member.id,
      eventId: event.id,
      registrationDate: DateTime.now(),
      modifiedAt: DateTime.now(),
    );

    return await _createRegistration(session, validatedReg, event);
  }

  Future<EventRegistration> _createRegistration(
    Session session,
    EventRegistration registration,
    Event event,
  ) async {
    // Get current registration count
    final currentConfirmed = await EventRegistration.db.count(
      session,
      where: (t) =>
          t.eventId.equals(registration.eventId) &
          t.registrationStatus.equals(RegistrationStatus.confirmed),
    );

    // Check if event is at capacity
    final isFull = currentConfirmed >= event.maxParticipants!;

    // Determine initial registration status
    final status = _determineRegistrationStatus(
      requiresApproval: event.requiresApproval,
      isFull: isFull,
    );

    // Get waitlist position if needed
    int? waitlistPosition;
    if (status == RegistrationStatus.waitlisted) {
      waitlistPosition = await _getNextWaitlistPosition(
          session, event.id ?? registration.eventId);
    }

    // Create validated registration with computed fields
    final validatedRegistration = registration.copyWith(
      registrationStatus: status,
      waitlistPosition: waitlistPosition,
      waitlistedAt: waitlistPosition != null ? DateTime.now() : null,
    );

    return await EventRegistration.db.insertRow(session, validatedRegistration);
  }

  Future<void> cancelRegistration(Session session, int registrationId) async {
    final reg = await EventRegistration.db.findById(session, registrationId);
    if (reg == null) return;
    final member = await cache.getMemberInfo(session);
    if (member == null) throw Exception('Not authenticated');

    await EventRegistration.db.deleteRow(session, reg);
    session.log('Deleted Registration $reg');
  }

  Future<List<EventRegistration>> getRegistrationsForEvent(
    Session session,
    int eventId,
  ) async {
    return await EventRegistration.db.find(
      session,
      where: (t) => t.eventId.equals(eventId),
      include: EventRegistration.include(
        member: Member.include(),
      ),
      orderBy: (t) => t.registrationDate,
    );
  }
}
