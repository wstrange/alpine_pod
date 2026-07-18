import 'dart:async';

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

final authUserSignal = computed<AuthSuccess?> (() {
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

// List of All sections that the current user is a member of
// rebuild based on the currentMemberSignal, which gets updated in the router AFTER the
// authUser Signal is updated.  Avoids a race condition.
final allMySectionMembershipsSignal = futureSignal<List<SectionMembership>>(
  () async {
    final member = currentMemberSignal.value;
    if (member == null) {
      print('allMySectionMembershipsSignal: member is null, returning empty list');
      return <SectionMembership>[];
    }
    final x = await client.member.getAllMySectionMemberships();
    return x;
  },
  options: AsyncSignalOptions(dependencies: [currentMemberSignal], name: 'allMySectionMembershipsSignal', lazy: false),
);

// The currently selected section when the user logged in.
final sectionSignal = signal<Section?>(null);

// Get the SectionMemberShip for the current Section
final mySectionMembershipSignal = futureSignal(() async {
  final s = sectionSignal.value;
  if (s == null) return null;
  return await client.member.getMySectionMembership(s.id!);
}, options: AsyncSignalOptions(dependencies: [sectionSignal], name: 'mySectionMembershipSignal'));

final isGlobalAdminSignal = computed(() {
  final x = authUserSignal.value;
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

final notificationsSignal = futureSignal<List<UserNotification>>(() async {
  final i = authUserSignal.value;
  if (i == null) return <UserNotification>[];
  return await client.notification.getMyFeed(limit: 30, offset: 0);
}, options: AsyncSignalOptions(dependencies: [], name: 'notificationsSignal', lazy: false));

// TODO: Do we need this stream? Is there a better way to do this?
final notificationStreamSignal = streamSignal<List<UserNotification>>(() async* {
  while (true) {
    if (!sessionManager.isAuthenticated) yield <UserNotification>[];
    final n = await client.notification.getMyFeed(limit: 30, offset: 0);
    // update notifications.
    notificationsSignal.value = AsyncData(n);
    yield n;
    await Future.delayed(const Duration(seconds: 30));
  }
}, options: AsyncSignalOptions(name: 'notificationStreamSignal'));

final unreadNotificationsCountSignal = computed(() {
  final state = notificationsSignal.value;
  if (state is AsyncData<List<UserNotification>>) {
    return state.value.where((n) => !n.isRead).length;
  }
  return 0;
});

final notificationPreferencesSignal = futureSignal<UserNotificationPreference>(() async {
  return await client.notification.getMyPreferences();
}, options: AsyncSignalOptions(name: 'notificationPreferencesSignal'));
