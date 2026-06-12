import 'package:alpine_pod_server/src/services/email_service.dart';
import 'package:mustache_template/mustache.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import '../generated/protocol.dart';

final notificationService = NotificationService();

class NotificationService {
  Session? _session;

  Future<Session> getSession() async {
    return _session ??= await Serverpod.instance.createSession();
  }

  static const alwaysNotifyTypes = {
    'registration-approved',
    'registration-cancelled',
    'add-to-waitlist',
    'event-cancelled',
  };

  // NOTE: cant be done unawaited as the endpoint will return.
  // Consider using FutureCall or Internal session.
  Future<void> dispatchNotification({
    required Session session,
    required String templateName,
    required List<UuidValue> recipientUserIds,
    AuthUser? actorId,
    required Map<String, String> templateData,
    String? actionUrl,
  }) async {
    final template = await NotificationTemplate.db.findFirstRow(session, where: (t) => t.name.equals(templateName));
    if (template == null) {
      throw Exception('Template "$templateName" not found.');
    }

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
          where: (p) => p.userId.equals(targetId),
        );

        final isAlwaysNotify = alwaysNotifyTypes.contains(templateName);
        final allowInApp = isAlwaysNotify ? true : (preferred?.allowInApp ?? true);
        final allowEmail = isAlwaysNotify ? true : (preferred?.allowEmail ?? true);
        final allowPush = isAlwaysNotify ? true : (preferred?.allowPush ?? true);

        if (allowInApp) {
          await UserNotification.db.insertRow(
            session,
            UserNotification(userId: targetId, notificationId: coreNotification.id!, createdAt: now),
            transaction: transaction,
          );
        }

        if (allowEmail && parsedHtml != null) {
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

        if (allowPush) {
          final fcmTokens = await FcmToken.db.find(
            session,
            where: (t) => t.userId.equals(targetId),
            transaction: transaction,
          );
          for (final fcm in fcmTokens) {
            session.log(
              '[FCM Push] Sent to user=$targetId device=${fcm.deviceId} token=${fcm.token}: '
              'title="$parsedTitle", body="$parsedBody"',
            );
          }
        }
      }
    });
  }

  Future<void> notifyRegistrationApproved(Session session, EventRegistration er) async {
    final member = await Member.db.findById(session, er.memberId);
    if (member == null) {
      session.log('Cant notify user of registration. Member not found ${er.memberId}');
      return;
    }

    final event = er.event ?? await Event.db.findById(session, er.eventId);
    final title = event?.title ?? 'Event';

    await dispatchNotification(
      session: session,
      templateName: 'registration-approved',
      recipientUserIds: [member.userId],
      templateData: {'title': title, 'body': 'Your registration for "$title" has been approved.'},
    );
  }

  Future<void> notifyRegistrationRemoved(Session session, EventRegistration er) async {
    final member = await Member.db.findById(session, er.memberId);
    if (member == null) {
      session.log('Cant notify user of registration. Member not found ${er.memberId}');
      return;
    }

    final event = er.event ?? await Event.db.findById(session, er.eventId);
    final title = event?.title ?? 'Event';

    await dispatchNotification(
      session: session,
      templateName: 'registration-cancelled',
      recipientUserIds: [member.userId],
      templateData: {'title': title, 'body': 'Your registration for $title has been cancelled.'},
    );
  }

  Future<void> notifyRegistrationWaitlisted(Session session, EventRegistration er) async {
    final member = await Member.db.findById(session, er.memberId);
    if (member == null) {
      session.log('Cant notify user of registration. Member not found ${er.memberId}');
      return;
    }

    final event = er.event ?? await Event.db.findById(session, er.eventId);
    final title = event?.title ?? 'Event';

    await dispatchNotification(
      session: session,
      templateName: 'add-to-waitlist',
      recipientUserIds: [member.userId],
      templateData: {'title': title, 'body': 'You have been added to the waitlist for $title.'},
    );
  }

  Future<void> notifyEventCancelled(Session session, Event event) async {
    final registrations = await EventRegistration.db.find(
      session,
      where: (er) => er.eventId.equals(event.id),
      include: EventRegistration.include(member: Member.include()),
    );
    final recipientUserIds = registrations.map((r) => r.member?.userId).nonNulls.toList();
    if (recipientUserIds.isEmpty) return;

    await dispatchNotification(
      session: session,
      templateName: 'event-cancelled',
      recipientUserIds: recipientUserIds,
      templateData: {'title': event.title, 'body': 'The event "${event.title}" has been cancelled.'},
    );
  }

  Future<void> notifyEventCreated(Session session, Event createdEvent) async {
    final memberships = await SectionMembership.db.find(
      session,
      where: (sm) => sm.sectionId.equals(createdEvent.sectionId),
      include: SectionMembership.include(member: Member.include()),
    );

    final memberUserIds = memberships.map((sm) => sm.member?.userId).nonNulls.toList();
    if (memberUserIds.isEmpty) return;

    final preferences = await UserNotificationPreference.db.find(
      session,
      where: (p) => p.userId.inSet(memberUserIds.toSet()),
    );
    final prefMap = {for (final p in preferences) p.userId: p};

    final recipientUserIds = memberUserIds.where((userId) {
      final pref = prefMap[userId];
      if (pref == null) {
        return true;
      }
      return pref.newEvents;
    }).toList();

    if (recipientUserIds.isEmpty) return;

    await dispatchNotification(
      session: session,
      templateName: 'event-created',
      recipientUserIds: recipientUserIds,
      templateData: {
        'title': createdEvent.title,
        'body': 'A new event titled "${createdEvent.title}" has been created.',
      },
    );
  }

  Future<void> notifyNewRegistration(Session session, EventRegistration er) async {
    final member = await Member.db.findById(session, er.memberId);
    if (member == null) {
      session.log(' Member not found ${er.memberId}');
      return;
    }

    final event = er.event ?? await Event.db.findById(session, er.eventId);
    final title = event?.title ?? 'Event';

    // get the event owners to notify
    final managers = await EventManager.db.find(
      session,
      where: (em) => em.eventId.equals(er.eventId),
      include: EventManager.include(member: Member.include()),
    );

    final recipientUserIds = managers.map((manager) => manager.member?.userId).nonNulls.toList();
    if (recipientUserIds.isEmpty) return;

    await dispatchNotification(
      session: session,
      templateName: 'event-new-registration',
      recipientUserIds: recipientUserIds,
      templateData: {'title': title, 'body': '${member.displayName} signed up for "$title".'},
    );
  }

  Future<void> notifyManagersRegistrationCancelled(Session session, EventRegistration er) async {
    final member = await Member.db.findById(session, er.memberId);
    if (member == null) return;
    final event = er.event ?? await Event.db.findById(session, er.eventId);
    final title = event?.title ?? 'Event';
    final managers = await EventManager.db.find(
      session,
      where: (em) => em.eventId.equals(er.eventId),
      include: EventManager.include(member: Member.include()),
    );
    final recipientUserIds = managers.map((m) => m.member?.userId).nonNulls.toList();
    if (recipientUserIds.isEmpty) return;

    await dispatchNotification(
      session: session,
      templateName: 'registration-cancelled-manager',
      recipientUserIds: recipientUserIds,
      templateData: {'title': title, 'body': '${member.displayName} cancelled registration for "$title".'},
    );
  }

  Future<void> notifyManagersRegistrationApproved(Session session, EventRegistration er) async {
    final member = await Member.db.findById(session, er.memberId);
    if (member == null) return;
    final event = er.event ?? await Event.db.findById(session, er.eventId);
    final title = event?.title ?? 'Event';
    final managers = await EventManager.db.find(
      session,
      where: (em) => em.eventId.equals(er.eventId),
      include: EventManager.include(member: Member.include()),
    );
    final recipientUserIds = managers.map((m) => m.member?.userId).nonNulls.toList();
    if (recipientUserIds.isEmpty) return;

    await dispatchNotification(
      session: session,
      templateName: 'registration-approved-manager',
      recipientUserIds: recipientUserIds,
      templateData: {'title': title, 'body': '${member.displayName}\'s registration for "$title" has been approved.'},
    );
  }
}

// Expand the template and return a rendered notification
RenderedNotification renderedNotification(UserNotification un) {
  final data = un.notification?.data ?? {};
  final notification = un.notification!;
  final template = notification.template!;

  return RenderedNotification(
    title: Template(template.titleTemplate).renderString(data),
    body: Template(template.bodyTemplate).renderString(data),
    html: template.htmlTemplate != null ? Template(template.htmlTemplate!).renderString(data) : null,
    userNotification: un,
  );
}
