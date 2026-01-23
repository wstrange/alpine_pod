import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:state_beacon/state_beacon.dart';

late Client client;
late FlutterAuthSessionManager sessionManager;

final log = Logger('beacon');

// late SessionManager sessionManager;

// Beacons
final userBeacon = Beacon.writable<AuthUser?>(null);

// void initializeBeacons() {
//   userBeacon.value = sessionManager.signedInUser;
//   sessionManager.addListener(() {
//     userBeacon.value = sessionManager.signedInUser;
//   });
// }

final userSectionsBeacon = Beacon.future(() async {
  return await client.section.getSectionsForCurrentUser();
});

final currentMemberBeacon = Beacon.future(() async {
  return await client.member.getCurrentMember();
});

final sectionBeacon = Beacon.writable<Section?>(null);

final selectedDateBeacon = Beacon.writable<DateTime>(DateTime.now().copyWith(
  hour: 0,
  minute: 0,
  second: 0,
  millisecond: 0,
  microsecond: 0,
));

final currentEventsBeacon = Beacon.derivedFuture(() async {
  final s = sectionBeacon.value;
  final date = selectedDateBeacon.value;

  // Calculate start of week (Monday) and ensure it's neutralized to 00:00:00
  final startOfWeek = date.subtract(Duration(days: date.weekday - 1));
  final start =
      DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day, 0, 0, 0);
  final end = start.add(const Duration(days: 7)); // Up to start of next week

  return await client.event.listEvents(
    s?.id,
    start,
    end,
  );
});
