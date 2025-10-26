// @Timeout(Duration(seconds: 60))
// @Tags(['integration'])

import 'package:alpine_pod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'test_tools/serverpod_test_tools.dart';
import '../utils/entity_generator.dart';

final genData = EntityGenerator();

void main() {
  const id = 1;

  withServerpod('Given TestDataGenerator', (sessionBuilder, endpoints) {
    group('auth member endpoint tests', () {
      var authenticatedSessionBuilder = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(id, {Scope('admin')}),
      );

      test('getMembers returns list of members for admin', () async {
        // Assuming member with id=1 is an admin in the test setup
        final members = await endpoints.member.getMembers(authenticatedSessionBuilder);
        expect(members, isA<List<Member>>());
        expect(members.length, equals(0));
      });

      test('insert a new member and verify it exists', () async {
        final m = genData.generateMember();
        print(m);

        final member = await endpoints.member.createMember(authenticatedSessionBuilder, m);

        print('Created $member');

        expect(member.id, isNotNull);
        // try to insert again with same email / id should fail

        try {
          await endpoints.member.createMember(authenticatedSessionBuilder, member);
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
