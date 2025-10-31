import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:alpine_pod_flutter/src/screens/home_screen.dart';
import 'package:alpine_pod_flutter/src/screens/login_screen.dart';
import 'package:alpine_pod_flutter/src/screens/event_edit_screen.dart';
import 'package:alpine_pod_flutter/src/screens/member_edit_screen.dart';
import 'package:alpine_pod_flutter/src/screens/section_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:alpine_pod_flutter/src/widgets/scaffold_with_nav_bar.dart';

import 'src/provider.dart';

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

  runApp(
    ProviderScope(
      overrides: [
        sessionManagerProvider.overrideWithValue(sessionManager),
        clientProvider.overrideWithValue(client),
      ],
      observers: [LoggerProvider()],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
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

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
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
        path: '/create-event',
        builder: (context, state) => const EventEditScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const MemberEditScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/event',
                builder: (context, state) => const EventEditScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) async {
      final bool loggedIn = sessionManager.isSignedIn;
      final bool loggingIn = state.matchedLocation == '/login';

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
            currentSection = sections[0];
            return '/';
          }
        } catch (e) {
          // Handle error
          return '/';
        }
      }

      return null;
    },
    refreshListenable: sessionManager,
  );
});
