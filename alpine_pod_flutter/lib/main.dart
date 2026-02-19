import 'package:alpine_pod_client/alpine_pod_client.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'signals.dart';
import 'screens/event_details_screen.dart';
import 'screens/event_edit_screen.dart';
import 'screens/home_screen.dart';
import 'screens/member_directory_screen.dart';
import 'screens/member_edit_screen.dart';
import 'screens/section_selection_screen.dart';
import 'screens/sign_in_screen.dart';

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

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => SignInScreen(client: client),
    ),
    GoRoute(
      path: '/section-selection',
      builder: (context, state) => const SectionSelectionScreen(),
    ),
    GoRoute(
      path: '/create-event',
      builder: (context, state) => const EventEditScreen(),
    ),
    GoRoute(
      path: '/event-view',
      builder: (context, state) {
        final event = state.extra as Event;
        return EventDetailsScreen(event: event);
      },
    ),
    GoRoute(
      path: '/event-details',
      builder: (context, state) {
        final event = state.extra as Event;
        return EventEditScreen(event: event);
      },
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const MemberEditScreen(),
    ),
    GoRoute(
      path: '/directory',
      builder: (context, state) => const MemberDirectoryScreen(),
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) async {
    final bool loggedIn = sessionManager.isAuthenticated;
    final bool loggingIn = state.matchedLocation == '/login';

    // print(
    //     'loggedIn: $loggedIn, loggingIn: $loggingIn authInfo=${sessionManager.authInfo}');
    if (!loggedIn) {
      return loggingIn ? null : '/login';
    }

    // This is a fresh login.
    if (loggingIn) {
      try {
        final sections = await client.section.getSectionsForCurrentUser();
        if (sections.length > 1) {
          return '/section-selection';
        } else {
          sectionSignal.value = sections[0];
          return '/';
        }
      } catch (e) {
        // Handle error
        return '/';
      }
    }

    return null;
  },
  refreshListenable: sessionManager.authInfoListenable,
);
