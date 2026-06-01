import 'package:alpine_pod_server/src/custom_scopes.dart';
import 'package:alpine_pod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'test_tools/serverpod_test_tools.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

void main() {
  withServerpod('Notification Endpoint Tests', (sessionBuilder, endpoints) {
    Serverpod.instance.initializeAuthServices(
      identityProviderBuilders: [EmailIdpConfig(secretHashPepper: 'emailSecretHashPepper')],
      tokenManagerBuilders: [
        JwtConfig(
          refreshTokenHashPepper: 'jwtRefreshTokenHashPepper',
          algorithm: JwtAlgorithm.hmacSha512(
            SecretKey('jwtHmacSha512PrivateKey-MustBeLongEnoughFor-HMAC-SHA512-Tests'),
          ),
        ),
      ],
    );

    late TestSessionBuilder userAuth;
    late AuthUserModel authUser;

    setUp(() async {
      final session = sessionBuilder.build();
      authUser = await AuthServices.instance.authUsers.create(session);

      userAuth = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(authUser.id.toString(), {CustomScope.member}),
      );
    });

    test('Get default preferences and then update them', () async {
      // 1. Get default preferences (should auto-create)
      var prefs = await endpoints.notification.getPreferences(userAuth);
      expect(prefs.id, isNotNull);
      expect(prefs.userId, equals(authUser.id));
      expect(prefs.enableEmail, isTrue);
      expect(prefs.enablePush, isTrue);
      expect(prefs.enableInApp, isTrue);

      // 2. Update preferences
      final updatedPrefs = prefs.copyWith(enableEmail: false, enablePush: true, enableInApp: false);

      var saved = await endpoints.notification.updatePreferences(userAuth, updatedPrefs);
      expect(saved.id, equals(prefs.id));
      expect(saved.enableEmail, isFalse);
      expect(saved.enablePush, isTrue);
      expect(saved.enableInApp, isFalse);

      // Verify persistence
      var fetched = await endpoints.notification.getPreferences(userAuth);
      expect(fetched.enableEmail, isFalse);
      expect(fetched.enableInApp, isFalse);
    });

    test('Register, update, and unregister FCM tokens', () async {
      final token1 = 'token-1-abc';
      final device1 = 'device-1';

      // Register new token
      await endpoints.notification.registerFcmToken(userAuth, token1, deviceId: device1);

      // Verify token exists in DB using server session
      final session = sessionBuilder.build();
      var stored = await FcmToken.db.findFirstRow(session, where: (t) => t.token.equals(token1));
      expect(stored, isNotNull);
      expect(stored!.userId, equals(authUser.id));
      expect(stored.deviceId, equals(device1));

      // Register second token for same device should delete/replace
      final token2 = 'token-2-def';
      await endpoints.notification.registerFcmToken(userAuth, token2, deviceId: device1);

      var oldStored = await FcmToken.db.findFirstRow(session, where: (t) => t.token.equals(token1));
      expect(oldStored, isNull);

      var newStored = await FcmToken.db.findFirstRow(session, where: (t) => t.token.equals(token2));
      expect(newStored, isNotNull);
      expect(newStored!.deviceId, equals(device1));

      // Unregister token
      await endpoints.notification.unregisterFcmToken(userAuth, token2);
      var deletedStored = await FcmToken.db.findFirstRow(session, where: (t) => t.token.equals(token2));
      expect(deletedStored, isNull);
    });

    test('Subscribe, list, and unsubscribe event types', () async {
      // 1. Initially empty
      var list = await endpoints.notification.getSubscribedEventTypes(userAuth);
      expect(list, isEmpty);

      // 2. Subscribe to Hike
      await endpoints.notification.subscribeToEventType(userAuth, 'Hike', subscribe: true);

      // 3. Subscribe to Ski
      await endpoints.notification.subscribeToEventType(userAuth, 'Ski', subscribe: true);

      // 4. Verify subscribed list
      list = await endpoints.notification.getSubscribedEventTypes(userAuth);
      expect(list, containsAll(['Hike', 'Ski']));
      expect(list.length, equals(2));

      // 5. Unsubscribe from Hike
      await endpoints.notification.subscribeToEventType(userAuth, 'Hike', subscribe: false);

      list = await endpoints.notification.getSubscribedEventTypes(userAuth);
      expect(list, contains('Ski'));
      expect(list, isNot(contains('Hike')));
      expect(list.length, equals(1));
    });
  });
}
