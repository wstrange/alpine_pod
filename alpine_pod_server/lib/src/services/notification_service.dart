import 'package:mustache_template/mustache.dart';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

final notificationService = NotificationService();

/// Maximum number of retries before a delivery is marked as 'failed'.
const maxDeliveryAttempts = 3;

/// Maximum number of delivery rows to process per scheduler tick.
const deliveryBatchSize = 100;

class NotificationService {
  static const alwaysNotifyTypes = {
    'registration-approved',
    'registration-cancelled',
    'add-to-waitlist',
    'event-cancelled',
  };

  /// Dispatches a notification to a targeted list of recipients.
  ///
  /// This method is designed to be **fast**: it renders the template once,
  /// inserts a single [Notification] row, then inserts one
  /// [NotificationDelivery] row per recipient × enabled channel.
  /// Actual delivery (email, push, SMS) happens asynchronously in
  /// [NotificationScheduler].
  Future<void> dispatchNotification({
    required Session session,
    required String templateName,
    required List<UuidValue> recipientUserIds,
    required Map<String, String> templateData,
    String? actionUrl,
  }) async {
    if (recipientUserIds.isEmpty) return;

    final coreNotification = await _insertNotification(
      session: session,
      templateName: templateName,
      templateData: templateData,
      actionUrl: actionUrl,
    );

    final isAlwaysNotify = alwaysNotifyTypes.contains(templateName);

    // Bulk-fetch preferences for all recipients.
    final preferences = await UserNotificationPreference.db.find(
      session,
      where: (p) => p.userId.inSet(recipientUserIds.toSet()),
    );
    final prefMap = {for (final p in preferences) p.userId: p};

    final now = DateTime.now();
    final deliveries = <NotificationDelivery>[];

    for (final userId in recipientUserIds) {
      final pref = prefMap[userId];
      final allowInApp = isAlwaysNotify || (pref?.allowInApp ?? true);
      final allowEmail = isAlwaysNotify || (pref?.allowEmail ?? true);
      final allowPush = isAlwaysNotify || (pref?.allowPush ?? true);
      final allowSms = isAlwaysNotify || (pref?.allowSms ?? false);

      if (allowInApp) {
        deliveries.add(NotificationDelivery(
          notificationId: coreNotification.id!,
          recipientUserId: userId,
          channel: NotificationChannel.inApp,
          createdAt: now,
        ));
      }
      if (allowEmail && coreNotification.renderedHtml != null) {
        deliveries.add(NotificationDelivery(
          notificationId: coreNotification.id!,
          recipientUserId: userId,
          channel: NotificationChannel.email,
          createdAt: now,
        ));
      }
      if (allowPush) {
        deliveries.add(NotificationDelivery(
          notificationId: coreNotification.id!,
          recipientUserId: userId,
          channel: NotificationChannel.push,
          createdAt: now,
        ));
      }
      if (allowSms) {
        deliveries.add(NotificationDelivery(
          notificationId: coreNotification.id!,
          recipientUserId: userId,
          channel: NotificationChannel.sms,
          createdAt: now,
        ));
      }
    }

    if (deliveries.isNotEmpty) {
      await NotificationDelivery.db.insert(session, deliveries);
    }
  }

  /// Dispatches a notification to all members of a section.
  ///
  /// Instead of looking up section members inline, this inserts a single
  /// [NotificationDelivery] row per channel with [sectionId] set.
  /// The [NotificationScheduler] expands these into per-user deliveries,
  /// respecting each member's preferences.
  Future<void> dispatchBulkSectionNotification({
    required Session session,
    required String templateName,
    required int sectionId,
    required Map<String, String> templateData,
    String? actionUrl,
  }) async {
    final coreNotification = await _insertNotification(
      session: session,
      templateName: templateName,
      templateData: templateData,
      actionUrl: actionUrl,
    );

    final now = DateTime.now();
    // Insert one bulk-expansion row per channel. The scheduler will fan out.
    final channels = [
      NotificationChannel.inApp,
      NotificationChannel.email,
      NotificationChannel.push,
      // SMS excluded by default — add when provider is ready.
    ];

    await NotificationDelivery.db.insert(
      session,
      [
        for (final channel in channels)
          NotificationDelivery(
            notificationId: coreNotification.id!,
            channel: channel,
            sectionId: sectionId,
            createdAt: now,
          ),
      ],
    );
  }

  /// Renders the template and inserts a [Notification] row with pre-rendered
  /// title, body, and optional HTML.
  Future<Notification> _insertNotification({
    required Session session,
    required String templateName,
    required Map<String, String> templateData,
    String? actionUrl,
  }) async {
    final template = await NotificationTemplate.db.findFirstRow(
      session,
      where: (t) => t.name.equals(templateName),
    );
    if (template == null) {
      throw Exception('Template "$templateName" not found.');
    }

    final renderedTitle =
        Template(template.titleTemplate).renderString(templateData);
    final renderedBody =
        Template(template.bodyTemplate).renderString(templateData);
    final renderedHtml = template.htmlTemplate != null
        ? Template(template.htmlTemplate!).renderString(templateData)
        : null;

    return Notification.db.insertRow(
      session,
      Notification(
        templateId: template.id!,
        data: {
          ...templateData,
          'rendered_title': renderedTitle,
          'rendered_body': renderedBody,
        },
        actionUrl: actionUrl,
        renderedTitle: renderedTitle,
        renderedBody: renderedBody,
        renderedHtml: renderedHtml,
        createdAt: DateTime.now(),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Convenience methods — unchanged signatures, same callers.
  // ---------------------------------------------------------------------------

  Future<void> notifyRegistrationApproved(
    Session session,
    EventRegistration er,
  ) async {
    final member = await Member.db.findById(session, er.memberId);
    if (member == null) {
      session.log(
          'Cant notify user of registration. Member not found ${er.memberId}');
      return;
    }

    final event = er.event ?? await Event.db.findById(session, er.eventId);
    final title = event?.title ?? 'Event';

    await dispatchNotification(
      session: session,
      templateName: 'registration-approved',
      recipientUserIds: [member.userId],
      templateData: {
        'title': title,
        'body': 'Your registration for "$title" has been approved.',
      },
    );
  }

  Future<void> notifyRegistrationRemoved(
    Session session,
    EventRegistration er,
  ) async {
    final member = await Member.db.findById(session, er.memberId);
    if (member == null) {
      session.log(
          'Cant notify user of registration. Member not found ${er.memberId}');
      return;
    }

    final event = er.event ?? await Event.db.findById(session, er.eventId);
    final title = event?.title ?? 'Event';

    await dispatchNotification(
      session: session,
      templateName: 'registration-cancelled',
      recipientUserIds: [member.userId],
      templateData: {
        'title': title,
        'body': 'Your registration for $title has been cancelled.',
      },
    );
  }

  Future<void> notifyRegistrationWaitlisted(
    Session session,
    EventRegistration er,
  ) async {
    final member = await Member.db.findById(session, er.memberId);
    if (member == null) {
      session.log(
          'Cant notify user of registration. Member not found ${er.memberId}');
      return;
    }

    final event = er.event ?? await Event.db.findById(session, er.eventId);
    final title = event?.title ?? 'Event';

    await dispatchNotification(
      session: session,
      templateName: 'add-to-waitlist',
      recipientUserIds: [member.userId],
      templateData: {
        'title': title,
        'body': 'You have been added to the waitlist for $title.',
      },
    );
  }

  Future<void> notifyEventCancelled(Session session, Event event) async {
    final registrations = await EventRegistration.db.find(
      session,
      where: (er) => er.eventId.equals(event.id),
      include: EventRegistration.include(member: Member.include()),
    );
    final recipientUserIds =
        registrations.map((r) => r.member?.userId).nonNulls.toList();
    if (recipientUserIds.isEmpty) return;

    await dispatchNotification(
      session: session,
      templateName: 'event-cancelled',
      recipientUserIds: recipientUserIds,
      templateData: {
        'title': event.title,
        'body': 'The event "${event.title}" has been cancelled.',
      },
    );
  }

  /// Uses bulk-section dispatch so the scheduler expands to all section members.
  Future<void> notifyEventCreated(Session session, Event createdEvent) async {
    await dispatchBulkSectionNotification(
      session: session,
      templateName: 'event-created',
      sectionId: createdEvent.sectionId,
      templateData: {
        'title': createdEvent.title,
        'body': 'A new event titled "${createdEvent.title}" has been created.',
      },
    );
  }

  Future<void> notifyNewRegistration(
    Session session,
    EventRegistration er,
  ) async {
    final member = await Member.db.findById(session, er.memberId);
    if (member == null) {
      session.log(' Member not found ${er.memberId}');
      return;
    }

    final event = er.event ?? await Event.db.findById(session, er.eventId);
    final title = event?.title ?? 'Event';

    // Get the event managers to notify.
    final managers = await EventManager.db.find(
      session,
      where: (em) => em.eventId.equals(er.eventId),
      include: EventManager.include(member: Member.include()),
    );

    final recipientUserIds =
        managers.map((manager) => manager.member?.userId).nonNulls.toList();
    if (recipientUserIds.isEmpty) return;

    await dispatchNotification(
      session: session,
      templateName: 'event-new-registration',
      recipientUserIds: recipientUserIds,
      templateData: {
        'title': title,
        'body': '${member.displayName} signed up for "$title".',
      },
    );
  }

  Future<void> notifyManagersRegistrationCancelled(
    Session session,
    EventRegistration er,
  ) async {
    final member = await Member.db.findById(session, er.memberId);
    if (member == null) return;
    final event = er.event ?? await Event.db.findById(session, er.eventId);
    final title = event?.title ?? 'Event';
    final managers = await EventManager.db.find(
      session,
      where: (em) => em.eventId.equals(er.eventId),
      include: EventManager.include(member: Member.include()),
    );
    final recipientUserIds =
        managers.map((m) => m.member?.userId).nonNulls.toList();
    if (recipientUserIds.isEmpty) return;

    await dispatchNotification(
      session: session,
      templateName: 'registration-cancelled-manager',
      recipientUserIds: recipientUserIds,
      templateData: {
        'title': title,
        'body':
            '${member.displayName} cancelled registration for "$title".',
      },
    );
  }

  Future<void> notifyManagersRegistrationApproved(
    Session session,
    EventRegistration er,
  ) async {
    final member = await Member.db.findById(session, er.memberId);
    if (member == null) return;
    final event = er.event ?? await Event.db.findById(session, er.eventId);
    final title = event?.title ?? 'Event';
    final managers = await EventManager.db.find(
      session,
      where: (em) => em.eventId.equals(er.eventId),
      include: EventManager.include(member: Member.include()),
    );
    final recipientUserIds =
        managers.map((m) => m.member?.userId).nonNulls.toList();
    if (recipientUserIds.isEmpty) return;

    await dispatchNotification(
      session: session,
      templateName: 'registration-approved-manager',
      recipientUserIds: recipientUserIds,
      templateData: {
        'title': title,
        'body':
            '${member.displayName}\'s registration for "$title" has been approved.',
      },
    );
  }
}


