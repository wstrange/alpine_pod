import 'dart:async';

import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

part 'provider.g.dart';

late final Client client;
late SessionManager sessionManager;

Section? currentSection;

// @riverpod
// Section mySection(Ref ref) => Section(name: 'foo', description: 'foo');

/// todo: Not clear why we need this since sessionManager lives throughout
/// the app lifetime. Same for client
final sessionManagerProvider = Provider<SessionManager>((ref) {
  throw UnimplementedError('sessionManagerProvider must be overridden');
});

final userProvider = StreamProvider<UserInfo?>((ref) {
  final sessionManager = ref.watch(sessionManagerProvider);
  final controller = StreamController<UserInfo?>();

  controller.add(sessionManager.signedInUser);

  sessionManager.addListener(() {
    controller.add(sessionManager.signedInUser);
  });

  ref.onDispose(() {
    controller.close();
  });

  return controller.stream;
});

final clientProvider = Provider<Client>((ref) {
  throw UnimplementedError('clientProvider must be overridden');
});

final userSectionsProvider = FutureProvider<List<Section>>((ref) async {
  final client = ref.watch(clientProvider);
  return await client.section.getSectionsForCurrentUser();
});

final currentMemberProvider = FutureProvider<Member?>((ref) async {
  final client = ref.watch(clientProvider);
  return await client.member.getCurrentMember();
});

// todo: This is not working. Section is not getting reflected in the app
//
@riverpod
class SectionNotifier extends _$SectionNotifier {
  @override
  Section? build() {
    state = null;
    return state;
  }

  void setValue(Section? section) {
    state = section;
    ref.invalidateSelf(); // todo:????
  }
}

// A basic logger, which logs any state changes.
final class LoggerProvider extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    print('''
{
  "provider": "${context.provider}",
  "prevValue": "$previousValue",
  "newValue": "$newValue",
  "mutation": "${context.mutation}"
}''');
  }
}