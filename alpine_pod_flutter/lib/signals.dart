import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_database/serverpod_database.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'repositories/event_repository.dart';
import 'repositories/member_repository.dart';
import 'repositories/notification_repository.dart';
import 'repositories/section_repository.dart';

export 'services/connectivity_service.dart';

///
late Client client;
late FlutterAuthSessionManager sessionManager;
late DatabaseSession dbSession;

final log = Logger('signals');

final userSignal = signal<AuthUser?>(null);
final authInfoStreamSignal = client.auth.authInfoListenable.toSignal();

final userProfileInfoSignal = futureSignal(
  () async {
    return await client.modules.serverpod_auth_core.userProfileInfo.get();
  },
  options: AsyncSignalOptions(
    dependencies: [authInfoStreamSignal],
    name: 'userProfileInfoSignal',
  ),
);

final authUserSignal = computed<AuthSuccess?>(() {
  final authInfo = authInfoStreamSignal.value;
  if (authInfo == null) return null;
  return client.auth.authInfo;
}, options: ComputedOptions(name: 'authUserSignal'));

/// Global flag to switch between pure server-side data fetching and client-side SQLite caching.
/// Set to false (or pass --dart-define=USE_CLIENT_CACHE=false) to debug cache issues by bypassing the client cache.
final useClientCacheSignal = signal<bool>(
  const bool.fromEnvironment('USE_CLIENT_CACHE', defaultValue: true),
  options: SignalOptions(name: 'useClientCacheSignal'),
);

/// Global option to only fetch records that have been updated since the last sync when syncing cache.
/// Can be configured via --dart-define=SYNC_ONLY_UPDATED_DATA=true or toggled at runtime.
final syncOnlyUpdatedDataSignal = signal<bool>(
  const bool.fromEnvironment('SYNC_ONLY_UPDATED_DATA', defaultValue: false),
  options: SignalOptions(name: 'syncOnlyUpdatedData'),
);

// Get a list of all sections in the database from SectionRepository (cache-first or pure server fetch)
final allSectionsSignal = futureSignal(
  () async {
    return await sectionRepository.listSections();
  },
  options: AsyncSignalOptions(
    dependencies: [useClientCacheSignal],
    name: 'allSectionsSignal',
  ),
);

final currentMemberSignal = signal<Member?>(
  null,
  options: SignalOptions(name: 'currentMemberSignal'),
);

// List of All sections that the current user is a member of (cache-first or pure server fetch via MemberRepository)
final allMySectionMembershipsSignal = futureSignal<List<SectionMembership>>(
  () async {
    final member = currentMemberSignal.value;
    if (member == null) {
      print(
        'allMySectionMembershipsSignal: member is null, returning empty list',
      );
      return <SectionMembership>[];
    }
    return await memberRepository.getAllMySectionMemberships();
  },
  options: AsyncSignalOptions(
    dependencies: [currentMemberSignal, useClientCacheSignal],
    name: 'allMySectionMembershipsSignal',
    lazy: false,
  ),
);

// The currently selected section when the user logged in.
final sectionSignal = signal<Section?>(null);

// Get the SectionMemberShip for the current Section via SectionRepository
final mySectionMembershipSignal = futureSignal(
  () async {
    final s = sectionSignal.value;
    if (s == null) return null;
    return await sectionRepository.getMySectionMembership(s.id!);
  },
  options: AsyncSignalOptions(
    dependencies: [sectionSignal, useClientCacheSignal],
    name: 'mySectionMembershipSignal',
  ),
);

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
  return membership?.scopes.contains('sectionManager') == true ||
      membership?.scopes.contains('eventManager') == true;
});

/// selected date in the calendar view
final selectedDateSignal = signal<DateTime>(
  DateTime.now().copyWith(
    hour: 0,
    minute: 0,
    second: 0,
    millisecond: 0,
    microsecond: 0,
  ),
);

final showMyEventsOnlySignal = signal<bool>(false);

// Currently visible events in calendar view via EventRepository (cache-first or pure server fetch)
final currentEventsSignal = futureSignal<List<Event>>(
  () async {
    final s = sectionSignal.value;
    final date = selectedDateSignal.value;
    final onlyMyEvents = showMyEventsOnlySignal.value;

    // Calculate start of month and end of month
    final start = DateTime(date.year, date.month, 1);
    final nextMonth = date.month == 12 ? 1 : date.month + 1;
    final nextMonthYear = date.month == 12 ? date.year + 1 : date.year;
    final end = DateTime(nextMonthYear, nextMonth, 1);

    return await eventRepository.listEvents(
      sectionId: s?.id,
      startTime: start,
      endTime: end,
      onlyMyEvents: onlyMyEvents,
    );
  },
  options: AsyncSignalOptions(
    dependencies: [
      sectionSignal,
      selectedDateSignal,
      showMyEventsOnlySignal,
      useClientCacheSignal,
      syncOnlyUpdatedDataSignal,
    ],
    name: 'currentEventsSignal',
  ),
);

final notificationsSignal = futureSignal<List<UserNotification>>(
  () async {
    final i = authUserSignal.value;
    if (i == null) return <UserNotification>[];
    return await notificationRepository.getMyFeed(limit: 30, offset: 0);
  },
  options: AsyncSignalOptions(
    dependencies: [],
    name: 'notificationsSignal',
    lazy: false,
  ),
);

final unreadNotificationsCountSignal = computed(() {
  final state = notificationsSignal.value;
  if (state is AsyncData<List<UserNotification>>) {
    return state.value.where((n) => !n.isRead).length;
  }
  return 0;
});

final notificationPreferencesSignal = futureSignal<UserNotificationPreference?>(
  () async {
    return await notificationRepository.getMyPreferences();
  },
  options: AsyncSignalOptions(name: 'notificationPreferencesSignal'),
);
