import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../rbac.dart';

class RegistrationEndpoint extends Endpoint {
  Future<EventRegistration> registerForEvent(Session session, int eventId, bool waiverAccepted, int? additionalGuests) async {
    final user = await getCurrentUser(session);
  if (user == null) throw Exception('Not authenticated');

    final event = await Event.db.findById(session, eventId);
    if (event == null) throw Exception('Event not found');

    // Enforce registration window
    if (event.registrationDeadline != null && DateTime.now().isAfter(event.registrationDeadline!)) {
      throw Exception('Registration deadline passed');
    }

    final registration = EventRegistration(
      userId: user.id,
      eventId: eventId,
  registrationStatus: RegistrationStatus.pending,
      registrationDate: DateTime.now(),
      carPoolPreference: null,
      numberOfPassengers: null,
      additionalGuests: additionalGuests,
      equipmentNotes: null,
      waiverAccepted: waiverAccepted,
      waiverSignedDate: waiverAccepted ? DateTime.now() : null,
      participantNotes: null,
      waitlistPosition: null,
      waitlistedAt: null,
      checkedIn: false,
      checkedInTime: null,
      paymentStatus: null,
      paymentAmount: null,
      paymentDate: null,
      modifiedAt: DateTime.now(),
    );

    return await EventRegistration.db.insertRow(session, registration);
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

  Future<EventRegistration> markAttendance(Session session, int registrationId, bool attended) async {
    final reg = await EventRegistration.db.findById(session, registrationId);
    if (reg == null) throw Exception('Registration not found');
    final allowed = await isEventEditor(session, reg.eventId, null);
    if (!allowed) throw Exception('Permission denied');
    final updated = reg.copyWith(attended: attended, attendedAt: attended ? DateTime.now() : null);
  return await EventRegistration.db.updateRow(session, updated);
  }
}
