import 'dart:async';

import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:logging/logging.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_auth_idp_flutter_facebook/serverpod_auth_idp_flutter_facebook.dart';
// import 'package:serverpod_auth_idp_flutter_facebook/serverpod_auth_idp_flutter_facebook.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'signals.dart';
import 'router.dart';

// final host = 'Warrens-MacBook-Air.local';
// final host = 'localhost';
final host = 'warren.home';

void main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  WidgetsFlutterBinding.ensureInitialized();

  // For AG.
  // SemanticsBinding.instance.ensureSemantics();
  // enableFlutterDriverExtension();

  const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  final serverUrl = serverUrlFromEnv.isEmpty ? 'http://$host:8080/' : serverUrlFromEnv;

  client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor()
    ..authSessionManager = FlutterAuthSessionManager();

  sessionManager = client.auth;
  await sessionManager.initialize();

  await sessionManager.initializeGoogleSignIn(
    // Acording to docs, this is not needed. web/index.html should be enough.
    clientId: '465372895035-35rlrpfdibu9r1435kg9vsoua640e50o.apps.googleusercontent.com',
    // serverClientId:
    //     '465372895035-35rlrpfdibu9r1435kg9vsoua640e50o.apps.googleusercontent.com',
  );

  await sessionManager.initializeFacebookSignIn(appId: '954559893876564');

  // todo: add any things that need to be refreshed in the background
  Timer.periodic(const Duration(seconds: 120), (timer) {
    notificationsSignal.refresh(); // get updated notifications
  });

  // try client side db
  // does not currently work in Flutter Web
  // Resolve the database path.
  final path = await resolveDatabasePath('app.db');
  final session = await client.createSession(path, isDebugMode: true);

  print(session);

  var r = await MemberInfo.db.insert(session, [MemberInfo(firstName: 'test', lastName: 'test')]);
  print('1. db r = $r');
  r = await MemberInfo.db.find(session);
  print('2. db r = $r');
  r = await MemberInfo.db.find(session, where: (t) => t.firstName.equals('test'));
  print('3. db r = $r');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Alpine Pod',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: router,
    );
  }
}

Future<String> resolveDatabasePath(String fileName) async {
  if (kIsWeb) return fileName;
  final dir = await getApplicationSupportDirectory();
  return p.join(dir.path, fileName);
}
