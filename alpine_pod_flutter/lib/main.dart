import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:alpine_pod_flutter/src/screens/home_screen.dart';
import 'package:alpine_pod_flutter/src/screens/login_screen.dart';
import 'package:alpine_pod_flutter/src/screens/section_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

late final Client client;
late SessionManager sessionManager;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  final serverUrl = serverUrlFromEnv.isEmpty ? 'http://$localhost:8080/' : serverUrlFromEnv;

  client = Client(serverUrl, authenticationKeyManager: FlutterAuthenticationKeyManager())
    ..connectivityMonitor = FlutterConnectivityMonitor();

  sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  await sessionManager.initialize();

  runApp(const ProviderScope(child: MyApp()));
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/section-selection',
      builder: (context, state) => const SectionSelectionScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  initialLocation: '/login',
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Alpine Pod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
