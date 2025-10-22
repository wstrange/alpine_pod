import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../rbac.dart';

class RegistrationEndpoint extends Endpoint {
  /// Determines the initial registration status based on event settings and capacity
  RegistrationStatus _determineRegistrationStatus({
    required bool requiresApproval,
    required bool waitlistEnabled,
    required bool isFull,
  }) {
    if (isFull) {
      return waitlistEnabled ? RegistrationStatus.waitlisted : RegistrationStatus.cancelled;
    }
    return requiresApproval ? RegistrationStatus.pending : RegistrationStatus.confirmed;
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

    final allowed = await isEventEditor(session, reg.eventId, null);
    if (!allowed) throw Exception('Permission denied');

    // If approving, check if event is full
    if (newStatus == RegistrationStatus.confirmed) {
      final event = await Event.db.findById(session, reg.eventId!);
      if (event == null) throw Exception('Event not found');

      final currentConfirmed = await EventRegistration.db.count(
        session,
        where: (t) => t.eventId.equals(reg.eventId!) & t.registrationStatus.equals(RegistrationStatus.confirmed),
      );

      if (event.maxParticipants != null && currentConfirmed >= event.maxParticipants!) {
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

  Future<EventRegistration> registerForEvent(Session session, EventRegistration registration) async {
    final user = await getCurrentUser(session);
    if (user == null) throw Exception('Not authenticated');

    final event = await Event.db.findById(session, registration.eventId);
    if (event == null) throw Exception('Event not found');

    // Validate registration fields
    if (!registration.waiverAccepted) {
      throw Exception('Waiver must be accepted');
    }

    // Enforce registration window
    if (event.registrationDeadline != null && DateTime.now().isAfter(event.registrationDeadline!)) {
      throw Exception('Registration deadline passed');
    }

    // Get current registration count
    final currentCount = await EventRegistration.db.count(
      session,
      where: (t) =>
          t.eventId.equals(registration.eventId) & (t.registrationStatus.equals(RegistrationStatus.confirmed)),
    );

    // Determine if event is full
    final isFull = event.maxParticipants != null && currentCount >= event.maxParticipants!;

    // Determine initial registration status
    final status = _determineRegistrationStatus(
      requiresApproval: event.requiresApproval,
      waitlistEnabled: event.waitlistEnabled,
      isFull: isFull,
    );

    // Get waitlist position if needed
    int? waitlistPosition;
    if (status == RegistrationStatus.waitlisted) {
      waitlistPosition = await _getNextWaitlistPosition(session, registration.eventId);
    }

    // Create validated registration with computed fields
    final validatedRegistration = registration.copyWith(
      userId: user.id!, // Ensure user ID from session
      registrationStatus: status,
      registrationDate: DateTime.now(),
      waitlistPosition: waitlistPosition,
      waitlistedAt: waitlistPosition != null ? DateTime.now() : null,
      modifiedAt: DateTime.now(),
    );

    return await EventRegistration.db.insertRow(session, validatedRegistration);
  }

  Future<void> cancelRegistration(Session session, int registrationId) async {
    final reg = await EventRegistration.db.findById(session, registrationId);
    if (reg == null) return;
    final user = await getCurrentUser(session);
    if (user == null) throw Exception('Not authenticated');

    final isOwner = reg.userId == user.id;
    final isEditor = await isEventEditor(session, reg.eventId, null);
    if (!isOwner && !isEditor) throw Exception('Permission denied');

    await EventRegistration.db.deleteRow(session, reg);
  }
}
