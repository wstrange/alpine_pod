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

  Future<UserNotificationPreference> getMyPreferences(Session session) async {
    final authInfo = session.authenticated;
    final currentUserId = authInfo!.authUserId;

    final existing = await UserNotificationPreference.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(currentUserId),
    );

    if (existing != null) return existing;

    final u = await UserNotificationPreference.db.insertRow(
      session,
      UserNotificationPreference(
        userId: currentUserId,
        allowEmail: true,
        allowInApp: true,
        allowPush: true,
        allowSms: false,
      ),
    );
    return u;
  }

  Future<UserNotificationPreference> savePreference(Session session, UserNotificationPreference preference) async {
    final authInfo = session.authenticated;
    final currentUserId = authInfo!.authUserId;

    preference.userId = currentUserId;

    // upsert

    if (preference.id == null) {
      await UserNotificationPreference.db.insertRow(session, preference);
    } else {
      await UserNotificationPreference.db.updateRow(session, preference);
    }

    return preference;
  }

  Future<void> registerFcmToken(Session session, String token, {String? deviceId}) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw Exception('Not authenticated');
    }
    final userId = authInfo.authUserId;

    final existing = await FcmToken.db.findFirstRow(session, where: (t) => t.token.equals(token));

    if (existing != null) {
      final updated = existing.copyWith(
        userId: userId,
        deviceId: deviceId ?? existing.deviceId,
        updatedAt: DateTime.now(),
      );
      await FcmToken.db.updateRow(session, updated);
    } else {
      await FcmToken.db.insertRow(
        session,
        FcmToken(userId: userId, token: token, deviceId: deviceId, updatedAt: DateTime.now()),
      );
    }
  }
}
