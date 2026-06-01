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

  /// Retrieves the current user's notification preferences.
  Future<NotificationPreference> getPreferences(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) throw Exception('Not authenticated');

    final userId = authInfo.authUserId;
    var preference = await NotificationPreference.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (preference == null) {
      preference = NotificationPreference(
        userId: userId,
        enableEmail: true,
        enablePush: true,
        enableInApp: true,
      );
      preference = await NotificationPreference.db.insertRow(session, preference);
    }
    return preference;
  }

  /// Updates the user's channel preferences.
  Future<NotificationPreference> updatePreferences(
    Session session,
    NotificationPreference preferences,
  ) async {
    final authInfo = session.authenticated;
    if (authInfo == null) throw Exception('Not authenticated');

    final userId = authInfo.authUserId;
    if (preferences.userId != userId) {
      throw Exception('Unauthorized');
    }

    final existing = await NotificationPreference.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (existing == null) {
      return await NotificationPreference.db.insertRow(session, preferences);
    } else {
      final toUpdate = preferences.copyWith(id: existing.id);
      return await NotificationPreference.db.updateRow(session, toUpdate);
    }
  }

  /// Registers or updates an FCM token for push notifications (linked to the authenticated userId).
  Future<void> registerFcmToken(
    Session session,
    String token, {
    String? deviceId,
  }) async {
    final authInfo = session.authenticated;
    if (authInfo == null) throw Exception('Not authenticated');

    final userId = authInfo.authUserId;

    final existingToken = await FcmToken.db.findFirstRow(
      session,
      where: (t) => t.token.equals(token),
    );

    if (existingToken != null) {
      if (existingToken.userId != userId || existingToken.deviceId != deviceId) {
        final updated = existingToken.copyWith(
          userId: userId,
          deviceId: deviceId,
          updatedAt: DateTime.now(),
        );
        await FcmToken.db.updateRow(session, updated);
      }
    } else {
      if (deviceId != null) {
        await FcmToken.db.deleteWhere(
          session,
          where: (t) => t.userId.equals(userId) & t.deviceId.equals(deviceId),
        );
      }
      
      await FcmToken.db.insertRow(
        session,
        FcmToken(
          userId: userId,
          token: token,
          deviceId: deviceId,
          updatedAt: DateTime.now(),
        ),
      );
    }
  }

  /// Unregisters/removes an FCM token.
  Future<void> unregisterFcmToken(Session session, String token) async {
    final authInfo = session.authenticated;
    if (authInfo == null) throw Exception('Not authenticated');

    await FcmToken.db.deleteWhere(
      session,
      where: (t) => t.token.equals(token) & t.userId.equals(authInfo.authUserId),
    );
  }

  /// Subscribes/unsubscribes to/from specific event types globally.
  Future<void> subscribeToEventType(
    Session session,
    String eventType, {
    required bool subscribe,
  }) async {
    final authInfo = session.authenticated;
    if (authInfo == null) throw Exception('Not authenticated');

    final userId = authInfo.authUserId;

    if (subscribe) {
      final existing = await EventTypeSubscription.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(userId) & t.eventType.equals(eventType),
      );
      if (existing == null) {
        await EventTypeSubscription.db.insertRow(
          session,
          EventTypeSubscription(
            userId: userId,
            eventType: eventType,
          ),
        );
      }
    } else {
      await EventTypeSubscription.db.deleteWhere(
        session,
        where: (t) => t.userId.equals(userId) & t.eventType.equals(eventType),
      );
    }
  }

  /// Gets all subscribed event types for the current user.
  Future<List<String>> getSubscribedEventTypes(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) throw Exception('Not authenticated');

    final subscriptions = await EventTypeSubscription.db.find(
      session,
      where: (t) => t.userId.equals(authInfo.authUserId),
    );
    return subscriptions.map((s) => s.eventType).toList();
  }
}
