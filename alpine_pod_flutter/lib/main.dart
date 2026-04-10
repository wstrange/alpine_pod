import 'package:alpine_pod_client/alpine_pod_client.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'signals.dart';
import 'router.dart';

final host = 'Warrens-MacBook-Air.local';
void main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  WidgetsFlutterBinding.ensureInitialized();

  const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  final serverUrl =
      serverUrlFromEnv.isEmpty ? 'http://$host:8080/' : serverUrlFromEnv;

  client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor()
    ..authSessionManager = FlutterAuthSessionManager();

  sessionManager = client.auth;
  await sessionManager.initialize();
  await sessionManager.initializeGoogleSignIn();
  //initializeBeacons();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Alpine Pod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}
