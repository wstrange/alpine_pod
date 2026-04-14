import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  /// Sends a notification to a specific member.
  /// Currently stubs out email and mobile delivery by logging to the console.
  Future<void> sendNotification(
    Session session, {
    required int memberId,
    required String title,
    required String message,
    int? eventId,
  }) async {
    // 1. Log the notification (Stub for Email/Mobile)
    // This causes an error as session is no longer valid.
    session.log(
      'NOTIFICATION [Member: $memberId, Event: $eventId]: $title - $message',
      level: LogLevel.info,
    );

    // print(
    //   'NOTIFICATION [Member: $memberId, Event: $eventId]: $title - $message',
    // );

    // 2. Persist the notification in the database
    final notification = Notification(
      memberId: memberId,
      eventId: eventId,
      title: title,
      message: message,
      timestamp: DateTime.now(),
      read: false,
    );

    await Notification.db.insertRow(session, notification);
  }

  /// Notify member they have been approved for an event.
  Future<void> notifyRegistrationApproved(
    Session session,
    EventRegistration registration,
  ) async {
    final event = await Event.db.findById(session, registration.eventId);
    if (event == null) return;

    await sendNotification(
      session,
      memberId: registration.memberId,
      title: 'Registration Approved',
      message: 'Your registration for "${event.title}" has been approved.',
      eventId: event.id,
    );
  }

  /// Notify member they have been removed from an event.
  Future<void> notifyRegistrationRemoved(
    Session session,
    EventRegistration registration,
  ) async {
    final event = await Event.db.findById(session, registration.eventId);
    if (event == null) return;

    await sendNotification(
      session,
      memberId: registration.memberId,
      title: 'Registration Cancelled',
      message:
          'Your registration for "${event.title}" has been cancelled or you have been removed.',
      eventId: event.id,
    );
  }

  /// Notify event managers of a new registration.
  Future<void> notifyNewRegistration(
    Session session,
    EventRegistration registration,
  ) async {
    final event = await Event.db.findById(session, registration.eventId);
    if (event == null) return;

    final member = await Member.db.findById(session, registration.memberId);
    if (member == null) return;

    final managers = await EventManager.db.find(
      session,
      where: (t) => t.eventId.equals(event.id!),
    );

    final memberName =
        member.displayName ?? '${member.firstName} ${member.lastName}';

    for (final manager in managers) {
      await sendNotification(
        session,
        memberId: manager.memberId,
        title: 'New Registration',
        message: '$memberName has registered for "${event.title}".',
        eventId: event.id,
      );
    }
  }
}

final notificationService = NotificationService();
