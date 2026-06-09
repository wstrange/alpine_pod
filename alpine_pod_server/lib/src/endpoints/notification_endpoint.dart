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

  Future<List<UserNotificationPreference>> getMyPreferences(Session session) async {
    final authInfo = session.authenticated;
    final currentUserId = authInfo!.authUserId;

    final existing = await UserNotificationPreference.db.find(
      session,
      where: (t) => t.userId.equals(currentUserId),
    );

    final types = [
      'event-created',
      'event-cancelled',
      'add-to-waitlist',
      'registration-cancelled',
      'registration-approved',
      'event-registered'
    ];

    final Map<String, UserNotificationPreference> prefsMap = {
      for (var p in existing) p.notificationType: p
    };

    final List<UserNotificationPreference> result = [];
    for (final type in types) {
      if (prefsMap.containsKey(type)) {
        result.add(prefsMap[type]!);
      } else {
        result.add(UserNotificationPreference(
          userId: currentUserId,
          notificationType: type,
          allowInApp: true,
          allowEmail: true,
          allowPush: true,
          allowSms: true,
        ));
      }
    }
    return result;
  }

  Future<UserNotificationPreference> savePreference(
    Session session,
    UserNotificationPreference preference,
  ) async {
    final authInfo = session.authenticated;
    final currentUserId = authInfo!.authUserId;

    preference.userId = currentUserId;

    if (preference.id == null) {
      final existing = await UserNotificationPreference.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(currentUserId) & t.notificationType.equals(preference.notificationType),
      );
      if (existing != null) {
        preference.id = existing.id;
        return await UserNotificationPreference.db.updateRow(session, preference);
      }
      return await UserNotificationPreference.db.insertRow(session, preference);
    } else {
      return await UserNotificationPreference.db.updateRow(session, preference);
    }
  }
}
