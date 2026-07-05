import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import 'email_service.dart';
import 'notification_service.dart';

/// Processes pending [NotificationDelivery] rows in batches.
///
/// Registered as a recurring [FutureCall] that fires every 60 seconds.
/// Each invocation:
///   1. Fetches up to [deliveryBatchSize] pending deliveries, oldest first.
///   2. Expands bulk-section rows into per-user deliveries.
///   3. Delivers targeted rows via the appropriate channel.
///   4. Marks each delivery as 'sent' or 'failed'.
class NotificationScheduler extends FutureCall {
  Future<void> handleCall(Session session) async {
    final pending = await NotificationDelivery.db.find(
      session,
      where: (t) => t.status.equals('pending'),
      orderBy: (t) => t.createdAt,
      limit: deliveryBatchSize,
      include: NotificationDelivery.include(notification: Notification.include()),
    );

    if (pending.isEmpty) return;

    session.log('NotificationScheduler: processing ${pending.length} deliveries');

    for (final delivery in pending) {
      try {
        if (delivery.sectionId != null && delivery.recipientUserId == null) {
          await _expandBulkSectionDelivery(session, delivery);
        } else {
          await _deliverToRecipient(session, delivery);
        }
      } catch (e, stackTrace) {
        session.log(
          'NotificationScheduler: error processing delivery ${delivery.id}',
          level: LogLevel.error,
          exception: e,
          stackTrace: stackTrace,
        );
        await _markFailed(session, delivery, e.toString());
      }
    }
  }

  /// Expands a bulk-section delivery into per-user deliveries.
  ///
  /// Queries section members, checks each member's notification preference
  /// for the specific channel, and inserts individual delivery rows.
  /// The original bulk row is then marked as 'sent' (expansion complete).
  Future<void> _expandBulkSectionDelivery(Session session, NotificationDelivery bulkDelivery) async {
    final sectionId = bulkDelivery.sectionId!;
    final channel = bulkDelivery.channel;

    final memberships = await SectionMembership.db.find(
      session,
      where: (sm) => sm.sectionId.equals(sectionId),
      include: SectionMembership.include(member: Member.include()),
    );

    final memberUserIds = memberships.map((sm) => sm.member?.userId).nonNulls.toList();
    if (memberUserIds.isEmpty) {
      await _markSent(session, bulkDelivery);
      return;
    }

    // Fetch preferences for all members in one query.
    final preferences = await UserNotificationPreference.db.find(
      session,
      where: (p) => p.userId.inSet(memberUserIds.toSet()),
    );
    final prefMap = {for (final p in preferences) p.userId: p};

    // For event-created notifications, also filter by the newEvents preference.
    final notification = bulkDelivery.notification;
    final isNewEventTemplate =
        notification?.data['rendered_title'] != null && notification?.renderedTitle.contains('new event') == true;

    final now = DateTime.now();
    final childDeliveries = <NotificationDelivery>[];

    for (final userId in memberUserIds) {
      final pref = prefMap[userId];

      // Check if user wants new-event notifications.
      if (isNewEventTemplate && pref != null && !pref.newEvents) {
        continue;
      }

      // Check if user has enabled this specific channel.
      final channelEnabled = switch (channel) {
        NotificationChannel.inApp => pref?.allowInApp ?? true,
        NotificationChannel.email => pref?.allowEmail ?? true,
        NotificationChannel.push => pref?.allowPush ?? true,
        NotificationChannel.sms => pref?.allowSms ?? false,
      };

      if (!channelEnabled) continue;

      // For email, skip if no HTML template.
      if (channel == NotificationChannel.email && notification?.renderedHtml == null) {
        continue;
      }

      // get debug info
      final m = await Member.db.findFirstRow(session, where: (m) => m.userId.equals(userId));
      final info = '${m?.email} ${m?.firstName} ${m?.lastName}';

      childDeliveries.add(
        NotificationDelivery(
          notificationId: bulkDelivery.notificationId,
          recipientUserId: userId,
          channel: channel,
          createdAt: now,
          info: info,
        ),
      );
    }

    if (childDeliveries.isNotEmpty) {
      await NotificationDelivery.db.insert(session, childDeliveries);
    }

    // Mark the bulk row as completed.
    await _markSent(session, bulkDelivery);
  }

  /// Delivers a notification to a single recipient via the specified channel.
  Future<void> _deliverToRecipient(Session session, NotificationDelivery delivery) async {
    final notification = delivery.notification;
    if (notification == null) {
      await _markFailed(session, delivery, 'Notification data missing');
      return;
    }

    switch (delivery.channel) {
      case NotificationChannel.inApp:
        await _deliverInApp(session, delivery, notification);
      case NotificationChannel.email:
        await _deliverEmail(session, delivery, notification);
      case NotificationChannel.push:
        await _deliverPush(session, delivery, notification);
      case NotificationChannel.sms:
        await _deliverSms(session, delivery, notification);
    }
  }

  /// Creates a [UserNotification] row — this is what the Flutter client reads.
  Future<void> _deliverInApp(Session session, NotificationDelivery delivery, Notification notification) async {
    await UserNotification.db.insertRow(
      session,
      UserNotification(userId: delivery.recipientUserId!, notificationId: notification.id!, createdAt: DateTime.now()),
    );
    await _markSent(session, delivery);
  }

  /// Sends an email using the existing [EmailService].
  Future<void> _deliverEmail(Session session, NotificationDelivery delivery, Notification notification) async {
    final html = notification.renderedHtml;
    if (html == null) {
      await _markSent(session, delivery); // Nothing to send.
      return;
    }

    final member = await Member.db.findFirstRow(session, where: (m) => m.userId.equals(delivery.recipientUserId!));

    if (member == null || member.email.isEmpty) {
      await _markFailed(session, delivery, 'Recipient has no email address');
      return;
    }

    try {
      await EmailService.sendHtmlEmail(
        session: session,
        recipientEmail: member.email,
        subject: notification.renderedTitle,
        htmlBody: html,
      );
      await _markSent(session, delivery);
    } catch (e) {
      await _markFailed(session, delivery, e.toString());
    }
  }

  /// Sends a push notification via FCM.
  Future<void> _deliverPush(Session session, NotificationDelivery delivery, Notification notification) async {
    final fcmTokens = await FcmToken.db.find(session, where: (t) => t.userId.equals(delivery.recipientUserId!));

    if (fcmTokens.isEmpty) {
      // No device registered — nothing to send.
      await _markSent(session, delivery);
      return;
    }

    for (final fcm in fcmTokens) {
      // TODO: Replace with actual FCM HTTP v1 API call.
      session.log(
        '[FCM Push] Sent to user=${delivery.recipientUserId} '
        'device=${fcm.deviceId} token=${fcm.token}: '
        'title="${notification.renderedTitle}", '
        'body="${notification.renderedBody}"',
      );
    }

    await _markSent(session, delivery);
  }

  /// SMS delivery — stub for future implementation.
  Future<void> _deliverSms(Session session, NotificationDelivery delivery, Notification notification) async {
    // TODO: Integrate with Twilio / SMS provider.
    session.log(
      '[SMS] Stub — would send to user=${delivery.recipientUserId}: '
      'title="${notification.renderedTitle}", '
      'body="${notification.renderedBody}"',
    );
    await _markSent(session, delivery);
  }

  // ---------------------------------------------------------------------------
  // Status helpers
  // ---------------------------------------------------------------------------

  Future<void> _markSent(Session session, NotificationDelivery delivery) async {
    delivery
      ..status = 'sent'
      ..lastAttemptAt = DateTime.now()
      ..attempts = delivery.attempts + 1;
    await NotificationDelivery.db.updateRow(session, delivery);
    // print("Marked as sent: $delivery");
  }

  Future<void> _markFailed(Session session, NotificationDelivery delivery, String error) async {
    delivery
      ..attempts = delivery.attempts + 1
      ..lastAttemptAt = DateTime.now()
      ..errorMessage = error;

    if (delivery.attempts >= maxDeliveryAttempts) {
      delivery.status = 'failed';
    }
    // Otherwise stays 'pending' for retry on next tick.

    await NotificationDelivery.db.updateRow(session, delivery);
  }
}
