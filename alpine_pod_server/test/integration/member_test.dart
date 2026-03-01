// @Timeout(Duration(seconds: 60))
// @Tags(['integration'])

import 'package:alpine_pod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'test_tools/serverpod_test_tools.dart';
import 'utils/gen_data.dart';

final genData = GenData();

void main() {
  final id = Uuid().v4();

  withServerpod('Given TestDataGenerator', (sessionBuilder, endpoints) {
    Serverpod.instance.initializeAuthServices(
      identityProviderBuilders: [
        EmailIdpConfig(
          secretHashPepper: 'emailSecretHashPepper',
        ),
      ],
      tokenManagerBuilders: [
        JwtConfig(
          refreshTokenHashPepper: 'jwtRefreshTokenHashPepper',
          algorithm: JwtAlgorithm.hmacSha512(
            SecretKey(
                'jwtHmacSha512PrivateKey-MustBeLongEnoughFor-HMAC-SHA512-Tests'),
          ),
        ),
      ],
    );

    group('auth member endpoint tests', () {
      var authenticatedSessionBuilder = sessionBuilder.copyWith(
        authentication:
            AuthenticationOverride.authenticationInfo(id, {Scope('admin')}),
      );

      test('getMembers returns list of members for admin', () async {
        // Empty db expected.
        final session = sessionBuilder.build();
        await SectionMembership.db
            .deleteWhere(session, where: (t) => Constant.bool(true));
        await Member.db.deleteWhere(session, where: (t) => Constant.bool(true));

        final members =
            await endpoints.member.getMembers(authenticatedSessionBuilder);
        expect(members, isA<List<Member>>());
        expect(members.length, equals(0));
      });

      test('insert a new member and verify it exists', () async {
        final session = sessionBuilder.build();
        final authUser = await AuthServices.instance.authUsers.create(session);

        var m = genData.member(userId: authUser.id);
        print(m);

        final member =
            await endpoints.member.createMember(authenticatedSessionBuilder, m);

        print('Created $member');

        expect(member.id, isNotNull);
        // try to insert again with same email / id should fail

        try {
          await endpoints.member
              .createMember(authenticatedSessionBuilder, member);
          fail('Expected exception for duplicate member creation');
        } catch (e) {
          expect(e, isA<Exception>());
        }

        //expect(duplicateMember, throwsA(isA<Exception>()));
      });

      //
    });
  });
}
// These are recently edited files. Do not suggest code that has been deleted.
