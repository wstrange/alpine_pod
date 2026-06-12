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
}, options: AsyncSignalOptions(dependencies: [authInfoStreamSignal], name: 'userProfileInfoSignal'));

final authUserSignal = computed(() {
  final authInfo = authInfoStreamSignal.value;
  if (authInfo == null) return null;
  return client.auth.authInfo;
}, options: ComputedOptions(name: 'authUserSignal'));

// Get a list of all sections in the database
final allSectionsSignal = futureSignal(() async {
  return await client.section.listSections();
});

final currentMemberSignal = signal<Member?>(null, options: SignalOptions(name: 'currentMemberSignal'));

// Get the member record for the current user
// final currentMemberAsyncSignal = futureSignal<Member?>(() async {
//   final m = await client.member.getCurrentMember();
//   print('Fetched current member $m');
//   return m;
// }, options: AsyncSignalOptions(dependencies: [authUserSignal], name: 'currentMemberSignal', lazy: false));

// List of all sections that the current user is a member of
final allMySectionMembershipsSignal = futureSignal(() async {
  return await client.member.getAllMySectionMemberships();
}, options: AsyncSignalOptions(dependencies: [authUserSignal]));

// The currently selected section when the user logged in.
final sectionSignal = signal<Section?>(null);

final mySectionMembershipSignal = futureSignal(() async {
  final s = sectionSignal.value;
  if (s == null) return null;
  return await client.member.getMySectionMembership(s.id!);
}, options: AsyncSignalOptions(dependencies: [sectionSignal, authUserSignal]));

final isGlobalAdminSignal = computed(() {
  final x = authUserSignal.value;
  print('updated isGlobalAdminSignal');
  if (x == null) return false;

  final scopes = x.scopeNames;
  return scopes.contains('serverpod.admin') || scopes.contains('admin');
});

final isSectionManagerSignal = computed(() {
  final membership = mySectionMembershipSignal.value.value;
  return membership?.scopes.contains('sectionManager') == true;
});

final canCreateEventsSignal = computed(() {
  if (isGlobalAdminSignal.value) return true;
  final membership = mySectionMembershipSignal.value.value;
  return membership?.scopes.contains('sectionManager') == true || membership?.scopes.contains('eventManager') == true;
});

/// selected date in the calendar view
// todo: Should the signals below be moved into the calendar view widget?

final selectedDateSignal = signal<DateTime>(
  DateTime.now().copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0),
);

final showMyEventsOnlySignal = signal<bool>(false);

// The currently events that are visible in the calendar view
// todo: when should this be reloaded? What if the events change on the server,
// or the user updates the event. Should we use a stream instead? Or a timer?
// or pull to refresh?

// needs to be a stream that refreshes every 30 seconds.
final currentEventsSignal = futureSignal<List<Event>>(
  () async {
    final s = sectionSignal.value;
    final date = selectedDateSignal.value;
    final onlyMyEvents = showMyEventsOnlySignal.value;

    // Calculate start of month and ensure it's neutralized to 00:00:00
    final start = DateTime(date.year, date.month, 1);
    final nextMonth = date.month == 12 ? 1 : date.month + 1;
    final nextMonthYear = date.month == 12 ? date.year + 1 : date.year;
    final end = DateTime(nextMonthYear, nextMonth, 1);

    final events = await client.event.listEvents(s?.id, start, end, onlyMyEvents);
    return events;
  },
  options: AsyncSignalOptions(
    dependencies: [sectionSignal, selectedDateSignal, showMyEventsOnlySignal],
    name: 'currentEventsSignal',
  ),
);

final notificationsSignal = futureSignal<List<RenderedNotification>>(() async {
  final i = authUserSignal.value;
  if (i == null) return <RenderedNotification>[];
  return await client.notification.getMyFeed(limit: 10, offset: 0);
}, options: AsyncSignalOptions(name: 'notificationsSignal'));

final notificationStreamSignal = streamSignal<List<RenderedNotification>>(() async* {
  while (true) {
    if (!sessionManager.isAuthenticated) yield <RenderedNotification>[];
    final n = await client.notification.getMyFeed(limit: 10, offset: 0);
    yield n;
    await Future.delayed(const Duration(seconds: 30));
  }
}, options: AsyncSignalOptions(name: 'notificationStreamSignal'));

final unreadNotificationsCountSignal = computed(() {
  final state = notificationsSignal.value;
  if (state is AsyncData<List<RenderedNotification>>) {
    return state.value.where((n) => !n.userNotification.isRead).length;
  }
  return 0;
});

final notificationPreferencesSignal = futureSignal<UserNotificationPreference>(() async {
  return await client.notification.getMyPreferences();
}, options: AsyncSignalOptions(name: 'notificationPreferencesSignal'));
