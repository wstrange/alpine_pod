import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:signals_flutter/signals_flutter.dart';

///
late Client client;
late FlutterAuthSessionManager sessionManager;

final log = Logger('signals');

final userSignal = signal<AuthUser?>(null);
final authInfoStreamSignal = client.auth.authInfoListenable.toSignal();

final userProfileInfoSignal = futureSignal(() async {
  return await client.modules.serverpod_auth_core.userProfileInfo.get();
}, dependencies: [authInfoStreamSignal], debugLabel: 'userProfileInfoSignal');

final authUserSignal = computed(() {
  final authInfo = authInfoStreamSignal.value;
  if (authInfo == null) return null;
  return client.auth.authInfo;
}, debugLabel: 'authUserSignal');

// Get a list of all sections in the database
final allSectionsSignal = futureSignal(() async {
  return await client.section.listSections();
});

// Get the member record for the current user
final currentMemberSignal = futureSignal(() async {
  return await client.member.getCurrentMember();
}, dependencies: [authUserSignal], debugLabel: 'currentMemberSignal');

// List of all sections that the current user is a member of
final allMySectionMembershipsSignal = futureSignal(() async {
  return await client.member.getAllMySectionMemberships();
}, dependencies: [authUserSignal]);

// The currently selected section when the user logged in.
final sectionSignal = signal<Section?>(null);

final mySectionMembershipSignal = futureSignal(
  () async {
    final s = sectionSignal.value;
    if (s == null) return null;
    return await client.member.getMySectionMembership(s.id!);
  },
  dependencies: [sectionSignal, authUserSignal],
);

/// This is not computed. Should be a signal instead. Is there something in the flutter auth
/// session manager that gives us this? TODO, investigate.
final isGlobalAdminSignal = computed(
  () {
    final x = authUserSignal.value;
    print('updated isGlobalAdminSignal');
    if (x == null) return false;

    final scopes = x.scopeNames;
    return scopes.contains('serverpod.admin') || scopes.contains('admin');
  },
);

final isSectionManagerSignal = computed(() {
  final membership = mySectionMembershipSignal.value.value;
  return membership?.scopes.contains('sectionManager') == true;
});

final canCreateEventsSignal = computed(() {
  if (isGlobalAdminSignal.value) return true;
  final membership = mySectionMembershipSignal.value.value;
  return membership?.scopes.contains('sectionManager') == true ||
      membership?.scopes.contains('eventManager') == true;
});

/// selected date in the calendar view
// todo: Should the signals below be moved into the calendar view widget?

final selectedDateSignal = signal<DateTime>(DateTime.now().copyWith(
  hour: 0,
  minute: 0,
  second: 0,
  millisecond: 0,
  microsecond: 0,
));

final showMyEventsOnlySignal = signal<bool>(false);

// The currently events that are visible in the calendar view
// todo: when should this be reloaded? What if the events change on the server,
// or the user updates the event. Should we use a stream instead? Or a timer?
// or pull to refresh?

// needs to be a stream that refreshes every 30 seconds.
final currentEventsSignal = futureSignal(
  () async {
    final s = sectionSignal.value;
    final date = selectedDateSignal.value;
    final onlyMyEvents = showMyEventsOnlySignal.value;

    // Calculate start of month and ensure it's neutralized to 00:00:00
    final start = DateTime(date.year, date.month, 1);
    final nextMonth = date.month == 12 ? 1 : date.month + 1;
    final nextMonthYear = date.month == 12 ? date.year + 1 : date.year;
    final end = DateTime(nextMonthYear, nextMonth, 1);

    final events =
        await client.event.listEvents(s?.id, start, end, onlyMyEvents);
    return events;
  },
  dependencies: [sectionSignal, selectedDateSignal, showMyEventsOnlySignal],
  debugLabel: 'currentEventsSignal',
);

final notificationsSignal = futureSignal(() async {
  final i = authUserSignal.value;
  if (i == null) return <Notification>[];
  return await client.notification.listNotifications();
}, debugLabel: 'notificationsSignal');

final notificationStreamSignal = streamSignal<List<Notification>>(() async* {
  while (true) {
    if (!sessionManager.isAuthenticated) yield <Notification>[];
    final n = await client.notification.listNotifications();
    yield n;
    await Future.delayed(const Duration(seconds: 30));
  }
});

final unreadNotificationsCountSignal = computed(() {
  final notifications = notificationsSignal.value.value ?? [];
  return notifications.where((n) => !n.read).length;
});
