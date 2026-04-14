import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import '../generated/protocol.dart';

class NotificationEndpoint extends Endpoint {
  /// Fetches all notifications for the authenticated user.
  Future<List<Notification>> listNotifications(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) throw Exception('Not authenticated');

    final member = await Member.db.findFirstRow(
      session,
      where: (t) => t.user.id.equals(authInfo.authUserId),
    );
    if (member == null) throw Exception('Member profile not found');

    return await Notification.db.find(
      session,
      where: (t) => t.memberId.equals(member.id),
      orderBy: (t) => t.timestamp,
      orderDescending: true,
    );
  }

  /// Marks a specific notification as read.
  Future<bool> markAsRead(Session session, int id) async {
    final authInfo = session.authenticated;
    if (authInfo == null) throw Exception('Not authenticated');

    final member = await Member.db.findFirstRow(
      session,
      where: (t) => t.user.id.equals(authInfo.authUserId),
    );
    if (member == null) throw Exception('Member profile not found');

    final notification = await Notification.db.findById(session, id);
    if (notification == null) return false;

    // Ensure the notification belongs to the user
    if (notification.memberId != member.id) {
      throw Exception('Unauthorized');
    }

    notification.read = true;
    await Notification.db.updateRow(session, notification);
    return true;
  }

  /// Deletes a specific notification.
  Future<bool> deleteNotification(Session session, int id) async {
    final authInfo = session.authenticated;
    if (authInfo == null) throw Exception('Not authenticated');

    final member = await Member.db.findFirstRow(
      session,
      where: (t) => t.user.id.equals(authInfo.authUserId),
    );
    if (member == null) throw Exception('Member profile not found');

    final notification = await Notification.db.findById(session, id);
    if (notification == null) return false;

    // Ensure the notification belongs to the user
    if (notification.memberId != member.id) {
      throw Exception('Unauthorized');
    }

    await Notification.db.deleteRow(session, notification);
    return true;
  }

  /// Temporary method to create a test notification for the authenticated user.
  Future<void> createTestNotification(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) throw Exception('Not authenticated');

    final member = await Member.db.findFirstRow(
      session,
      where: (t) => t.user.id.equals(authInfo.authUserId),
    );
    if (member == null) throw Exception('Member profile not found');

    // Find a random event if any exists to test navigation
    final event = await Event.db.findFirstRow(session);

    await Notification.db.insertRow(
      session,
      Notification(
        title: 'Test Notification',
        message: 'This is a test notification generated at ${DateTime.now()}.',
        timestamp: DateTime.now(),
        read: false,
        memberId: member.id!,
        eventId: event?.id,
      ),
    );
  }
}
