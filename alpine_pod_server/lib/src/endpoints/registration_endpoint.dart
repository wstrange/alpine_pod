import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../rbac.dart';
import '../cache/user_cache.dart';

class RegistrationEndpoint extends Endpoint {
  final _cache = UserCache();

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

  Future<bool> _canRegisterForEvent(Session session, User user, Event event) async {
    // Validate required fields
    if (user.id == null) throw Exception('Invalid user');
    if (event.id == null) throw Exception('Invalid event');

    // Check if user has privileged access (admin, section manager, trip leader)
    final bool privileged = await isAdmin(session);
    if (!privileged && event.sectionId != null) {
      final isSectionMgr = await isSectionManager(session, event.sectionId);
      if (isSectionMgr) return true;
    }
    if (!privileged) {
      final isTripLeader = await isTripLeaderForEvent(session, event.id);
      if (isTripLeader) return true;
    }

    // Non-privileged users must pass all checks
    // Check section membership if required
    if (!event.public && event.sectionId != null && user.id != null) {
      try {
        // We can use the null assertion operator here since we've checked above
        final userId = user.id!;
        final sectionId = event.sectionId!;
        final isMember = await _cache.isSectionMember(
          session,
          userId,
          sectionId,
        );
        if (!isMember) {
          throw Exception('Section membership required for this event');
        }
      } catch (e) {
        // If there's an error with membership check,
        // deny access by default
        throw Exception('Unable to verify section membership');
      }
    }

    // Check registration window
    final now = DateTime.now();
    if (event.registrationStartDate != null && now.isBefore(event.registrationStartDate!)) {
      throw Exception('Registration has not started yet');
    }
    if (event.registrationDeadline != null && now.isAfter(event.registrationDeadline!)) {
      throw Exception('Registration deadline has passed');
    }

    // Check if event has started
    if (now.isAfter(event.startTime)) {
      throw Exception('Cannot register for an event that has already started');
    }

    // Check if event is cancelled (add this field to Event model if needed)
    // if (event.isCancelled) {
    //   throw Exception('Cannot register for a cancelled event');
    // }

    return true;
  }

  Future<EventRegistration> registerForEvent(Session session, EventRegistration registration) async {
    // Validate session and get user
    final user = await getCurrentUser(session);
    if (user == null) throw Exception('Not authenticated');

    // Validate event exists
    final event = await Event.db.findById(session, registration.eventId);
    if (event == null) throw Exception('Event not found');

    // Check if user can register
    await _canRegisterForEvent(session, user, event);

    // Check if user is already registered
    final existingReg = await EventRegistration.db.findFirstRow(
      session,
      where: (t) => t.eventId.equals(event.id) & t.userId.equals(user.id),
    );
    if (existingReg != null) {
      throw Exception('Already registered for this event');
    }

    // Validate registration fields
    if (!registration.waiverAccepted) {
      throw Exception('Waiver must be accepted');
    }

    final validatedReg = registration.copyWith(
      userId: user.id,
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
      where: (t) => t.eventId.equals(registration.eventId) & t.registrationStatus.equals(RegistrationStatus.confirmed),
    );

    // Check if event is at capacity
    final isFull = event.maxParticipants != null && currentConfirmed >= event.maxParticipants!;

    // Determine initial registration status
    final status = _determineRegistrationStatus(
      requiresApproval: event.requiresApproval,
      waitlistEnabled: event.waitlistEnabled,
      isFull: isFull,
    );

    // Get waitlist position if needed
    int? waitlistPosition;
    if (status == RegistrationStatus.waitlisted) {
      waitlistPosition = await _getNextWaitlistPosition(session, event.id ?? registration.eventId);
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
    final user = await getCurrentUser(session);
    if (user == null) throw Exception('Not authenticated');

    final isOwner = reg.userId == user.id;
    final isEditor = await isEventEditor(session, reg.eventId, null);
    if (!isOwner && !isEditor) throw Exception('Permission denied');

    await EventRegistration.db.deleteRow(session, reg);
  }
}
