import 'package:alpine_pod_server/src/services/email_service.dart';
import 'package:mustache_template/mustache.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import '../generated/protocol.dart';

class NotificationService {
  static Future<void> dispatchNotification({
    required Session session,
    required String templateName,
    required List<UuidValue> recipientUserIds,
    AuthUser? actorId,
    required Map<String, String> templateData,
    String? actionUrl,
  }) async {
    final template = await NotificationTemplate.db.findFirstRow(session, where: (t) => t.name.equals(templateName));
    if (template == null) throw Exception('Template "$templateName" not found.');

    final parsedTitle = Template(template.titleTemplate).renderString(templateData);
    final parsedBody = Template(template.bodyTemplate).renderString(templateData);
    final parsedHtml = template.htmlTemplate != null
        ? Template(template.htmlTemplate!).renderString(templateData)
        : null;

    final fullyRenderedData = {...templateData, 'rendered_title': parsedTitle, 'rendered_body': parsedBody};

    final coreNotification = await Notification.db.insertRow(
      session,
      Notification(
        templateId: template.id!,
        // actorId: actorId,
        data: fullyRenderedData,
        actionUrl: actionUrl,
        createdAt: DateTime.now(),
      ),
    );

    final now = DateTime.now();
    await session.db.transaction((transaction) async {
      for (final targetId in recipientUserIds) {
        final preferred = await UserNotificationPreference.db.findFirstRow(
          session,
          where: (p) => p.userId.equals(targetId) & p.notificationType.equals(templateName),
        );

        if (preferred == null || preferred.allowInApp) {
          await UserNotification.db.insertRow(
            session,
            UserNotification(userId: targetId, notificationId: coreNotification.id!, createdAt: now),
            transaction: transaction,
          );
        }

        if ((preferred == null || preferred.allowEmail) && parsedHtml != null) {
          final member = await Member.db.findFirstRow(
            session,
            where: (m) => m.userId.equals(targetId),
            transaction: transaction,
          );

          if (member != null && member.email.isNotEmpty) {
            await EmailService.sendHtmlEmail(
              session: session,
              recipientEmail: member.email,
              subject: parsedTitle,
              htmlBody: parsedHtml,
            );
          }
        }
      }
    });
  }
}

//   static final NotificationService _instance = NotificationService._internal();
//   factory NotificationService() => _instance;
//   NotificationService._internal();

//   /// Sends a notification to a specific member.
//   /// Currently stubs out email and mobile delivery by logging to the console.
//   Future<void> sendNotification(
//     Session session, {
//     required int memberId,
//     required String title,
//     required String message,
//     int? eventId,
//   }) async {
//     // 1. Log the notification (Stub for Email/Mobile)
//     // This causes an error as session is no longer valid.
//     session.log('NOTIFICATION [Member: $memberId, Event: $eventId]: $title - $message', level: LogLevel.info);

//     // print(
//     //   'NOTIFICATION [Member: $memberId, Event: $eventId]: $title - $message',
//     // );

//     // 2. Persist the notification in the database
//     final notification = Notification(
//       memberId: memberId,
//       eventId: eventId,
//       title: title,
//       message: message,
//       timestamp: DateTime.now(),
//       read: false,
//     );

//     await Notification.db.insertRow(session, notification);

//     // todo: Send email...

//   }

//   /// Notify member they have been approved for an event.
//   Future<void> notifyRegistrationApproved(Session session, EventRegistration registration) async {
//     final event = await Event.db.findById(session, registration.eventId);
//     if (event == null) return;

//     await sendNotification(
//       session,
//       memberId: registration.memberId,
//       title: 'Registration Approved',
//       message: 'Your registration for "${event.title}" has been approved.',
//       eventId: event.id,
//     );
//   }

//   /// Notify member they have been removed from an event.
//   Future<void> notifyRegistrationRemoved(Session session, EventRegistration registration) async {
//     final event = await Event.db.findById(session, registration.eventId);
//     if (event == null) return;

//     await sendNotification(
//       session,
//       memberId: registration.memberId,
//       title: 'Registration Cancelled',
//       message: 'Your registration for "${event.title}" has been cancelled or you have been removed.',
//       eventId: event.id,
//     );
//   }

//   /// Notify event managers of a new registration.
//   Future<void> notifyNewRegistration(Session session, EventRegistration registration) async {
//     final event = await Event.db.findById(session, registration.eventId);
//     if (event == null) return;

//     final member = await Member.db.findById(session, registration.memberId);
//     if (member == null) return;

//     final managers = await EventManager.db.find(session, where: (t) => t.eventId.equals(event.id!));

//     final memberName = member.displayName ?? '${member.firstName} ${member.lastName}';

//     for (final manager in managers) {
//       await sendNotification(
//         session,
//         memberId: manager.memberId,
//         title: 'New Registration',
//         message: '$memberName has registered for "${event.title}".',
//         eventId: event.id,
//       );
//     }
//   }

//   Future<void> notifyEventCreated(Session session, Event event) async {
//     await sendGroupNotification(session, event.sectionId, 'New event posted', 'Event ${event.title} has been posted');
//   }

//   Future<void> sendGroupNotification(Session session, int sectionId, String title, String message) async {
//     // get all the members
//     final memberships = await SectionMembership.db.find(session, where: (t) => t.sectionId.equals(sectionId));

//     for (final membership in memberships) {
//       await sendNotification(session, memberId: membership.memberId, title: title, message: message);
//     }
//   }
// }

// final notificationService = NotificationService();
