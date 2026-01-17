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

// final currentEventsBeacon = Beacon.derivedFuture(() async {
//   final s = sectionBeacon.watch();
//   var e = await client.event.listEvents(s?.id);
//   return e;
// });

final currentEventsBeacon = Beacon.list<Event>([]);
