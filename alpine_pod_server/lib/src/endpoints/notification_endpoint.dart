import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import '../generated/protocol.dart';

class NotificationEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<UserNotification>> getMyFeed(Session session, {int limit = 20, int offset = 0}) async {
    final authInfo = session.authenticated;
    final currentUserId = authInfo!.authUserId;

    return await UserNotification.db.find(
      session,
      where: (t) => t.userId.equals(currentUserId),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: limit,
      offset: offset,
      include: UserNotification.include(notification: Notification.include(template: NotificationTemplate.include())),
    );
  }

  Future<bool> markAsRead(Session session, int userNotificationId) async {
    final authInfo = session.authenticated;
    final currentUserId = authInfo!.authUserId;

    final userNotif = await UserNotification.db.findById(session, userNotificationId);
    if (userNotif == null || userNotif.userId != currentUserId) {
      return false;
    }

    userNotif.isRead = true;
    userNotif.readAt = DateTime.now();

    await UserNotification.db.updateRow(session, userNotif);
    return true;
  }
}
