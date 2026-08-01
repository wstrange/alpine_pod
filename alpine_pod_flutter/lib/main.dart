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
import 'services/connectivity_service.dart';
import 'services/sync_service.dart';

final host = 'Warrens-MacBook-Air.local';
// final host = 'localhost';
// final host = 'warren.home';

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

  connectivityService.initialize(client.connectivityMonitor);

  // Initialize client-side SQLite database session before initializing auth/signals
  try {
    final dbPath = await resolveDatabasePath('alpine_pod.db');
    dbSession = await client.createSession(dbPath, isDebugMode: kDebugMode);
    syncService.initializePeriodicSync();
  } catch (e, stack) {
    Logger.root.severe('Failed to initialize client database session', e, stack);
  }

  sessionManager = client.auth;
  await sessionManager.initialize();

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
