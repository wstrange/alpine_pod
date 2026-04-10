import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'signals.dart';
import 'screens/event_details_screen.dart';
import 'screens/event_edit_screen.dart';
import 'screens/home_screen.dart';
import 'screens/member_directory_screen.dart';
import 'screens/member_edit_screen.dart';
import 'screens/section_selection_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/admin_home_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// This future tracks an in-progress or completed bootstrapping task.
/// It ensures that we only fetch the member profile and sections once per login.
Future<String?>? _bootstrapTask;

void resetRouterBootstrap() {
  _bootstrapTask = null;
}

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
      path: '/event-view/:id',
      builder: (context, state) {
        final idStr = state.pathParameters['id'];
        final id = idStr != null ? int.tryParse(idStr) : null;
        if (id == null) return const HomeScreen();
        return EventDetailsScreen(eventId: id);
      },
    ),
    GoRoute(
      path: '/event-edit/:id',
      builder: (context, state) {
        final idStr = state.pathParameters['id'];
        final id = idStr != null ? int.tryParse(idStr) : null;
        if (id == null) return const HomeScreen();
        return EventEditScreen(eventId: id);
      },
    ),
    GoRoute(
      path: '/create-event',
      builder: (context, state) {
        final extra = state.extra;
        if (extra is Event) {
          return EventEditScreen(event: extra);
        }
        return const EventEditScreen();
      },
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) => const AdminHomeScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const MemberEditScreen(),
    ),
    GoRoute(
      path: '/directory',
      builder: (context, state) => const MemberDirectoryScreen(),
    ),
    GoRoute(
      path: '/registration',
      builder: (context, state) => const RegistrationScreen(),
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) async {
    final bool loggedIn = sessionManager.isAuthenticated;
    final bool loggingIn = state.matchedLocation == '/login';

    if (!loggedIn) {
      resetRouterBootstrap();
      return loggingIn ? null : '/login';
    }

    // Admin users bypass the normal member bootstrap flow if they have the scope.
    // This allows immediate redirection to /admin.
    final scopes = sessionManager.authInfo?.scopeNames ?? {};
    final isAdmin = scopes.contains('serverpod.admin') || scopes.contains('admin');
    
    if (isAdmin) {
      resetRouterBootstrap(); // Admins don't need the member bootstrap path
      if (loggingIn) return '/admin';
      return null;
    }

    // This logic only triggers if we are on the login page (after auth) 
    // or if we somehow lack a section assignment while being logged in.
    if (loggingIn || (sectionSignal.value == null && state.matchedLocation == '/')) {
      _bootstrapTask ??= _performBootstrap();
      return await _bootstrapTask;
    }

    return null;
  },
  refreshListenable: sessionManager.authInfoListenable,
);

/// Logic to determine where a normal user should land.
/// This runs exactly once per login session due to _bootstrapTask guarding.
Future<String?> _performBootstrap() async {
  try {
    debugPrint('Router: Starting post-login bootstrap...');
    final member = await client.member.getCurrentMember();
    final sections = await client.section.getSectionsForCurrentUser();

    if (member == null || sections.isEmpty) {
      debugPrint('Router: Profile missing or no sections. Routing to registration.');
      return '/registration';
    }

    if (sections.length > 1) {
      debugPrint('Router: Multiple sections found. Routing to selection.');
      return '/section-selection';
    } else {
      debugPrint('Router: Single section found. Assigning signal and routing to /');
      sectionSignal.value = sections[0];
      return '/';
    }
  } catch (e) {
    debugPrint('Router: Bootstrap error: $e');
    // On error, let the user stay on login or fallback to home
    return '/';
  }
}
