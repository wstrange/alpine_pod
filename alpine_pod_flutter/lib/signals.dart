import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:signals/signals.dart';

late Client client;
late FlutterAuthSessionManager sessionManager;

final log = Logger('signals');

final userSignal = signal<AuthUser?>(null);

final userSectionsSignal = futureSignal(() async {
  return await client.section.getSectionsForCurrentUser();
});

final currentMemberSignal = futureSignal(() async {
  return await client.member.getCurrentMember();
});

final sectionSignal = signal<Section?>(null);

// todo: Should the signals below be moved into the calendar view widget?

final selectedDateSignal = signal<DateTime>(DateTime.now().copyWith(
  hour: 0,
  minute: 0,
  second: 0,
  millisecond: 0,
  microsecond: 0,
));

// The currently events that are visible in the calendar view
// todo: when should this be reloaded? What if the events change on the server,
// or the user updates the event. Should we use a stream instead? Or a timer?
// or pull to refresh?
final currentEventsSignal = futureSignal(
  () async {
    final s = sectionSignal.value;
    final date = selectedDateSignal.value;

    // Calculate start of week (Monday) and ensure it's neutralized to 00:00:00
    final startOfWeek = date.subtract(Duration(days: date.weekday - 1));
    final start =
        DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day, 0, 0, 0);
    final end = start.add(const Duration(days: 7));

    return await client.event.listEvents(s?.id, start, end);
  },
  dependencies: [sectionSignal, selectedDateSignal],
);
