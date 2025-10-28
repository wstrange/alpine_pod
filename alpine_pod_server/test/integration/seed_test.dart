// @Timeout(Duration(seconds: 60))
// @Tags(['integration'])

import 'package:alpine_pod_server/src/custom_scopes.dart';
import 'package:alpine_pod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:test/test.dart';
import 'test_tools/serverpod_test_tools.dart';

import 'utils/gen_data.dart';

final genData = GenData();

void main() {
  const id = 1;

  withServerpod('Seed Data', (sessionBuilder, endpoints) {
    var authSession = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(id, {Scope.admin}), enableLogging: true);

    var session = authSession.build();

    test('Delete sections ', () async {
      // Assuming member with id=1 is an admin in the test setup
      final m = await endpoints.admin.listSections(authSession);
      for (var section in m) {
        print('deleting section: $section');
        await endpoints.admin.deleteSection(authSession, section.id!);
      }
      final postDeleteMembers = await endpoints.admin.listSections(authSession);
      expect(postDeleteMembers.length, equals(0));
    }, skip: false);

    test('Create Default Sections', () async {
      for (final s in [
        Section(
          name: 'Calgary',
          description: 'Calgary Section',
          location: 'Room 101',
          contactInfo: '555-121-23456',
        ),
        Section(
          name: 'Edmonton',
          description: 'Edmonton Section',
          location: 'Room 202',
          contactInfo: '555-121-23457',
        )
      ]) {
        final section = await endpoints.admin.createSection(authSession, s);
        expect(section.id, isNotNull);
        print('Created Section: $section');
      }
    });

    test('Create Admin User', () async {
      var u = await Emails.createUser(session, 'admin', 'admin@acc.ca', 'Passw0rd');
      expect(u, isNotNull);

      int id = u!.id!;

      u = await Users.updateUserScopes(
        session,
        id,
        {
          Scope.admin,
        },
      );

      print('Created UserInfo: $u');
    });

    test('Clean up test users', () async {
      await session.db.unsafeSimpleExecute(r'TRUNCATE serverpod_user_info CASCADE');
      await session.db.unsafeSimpleExecute(r'TRUNCATE serverpod_email_auth CASCADE');
      await session.db.unsafeSimpleExecute(r'TRUNCATE public.section_memberships CASCADE');
      await session.db.unsafeSimpleExecute(r'TRUNCATE public.members CASCADE');
    });

    test('Create Some test users', () async {
      // get the sections..
      final sections = await endpoints.admin.listSections(authSession);

      final s1 = sections[0];
      final s2 = sections[1];

      for (var i = 0; i < 5; i++) {
        var email = 'test$i@acc.ac';
        UserInfo? u;

        try {
          u = await Emails.createUser(session, 'test$i', email, 'Passw0rd');
        } catch (e) {
          print('User $email already exists, skipping');
          continue;
        }

        var id = u!.id!;

        u = await Users.updateUserScopes(
          session,
          id,
          {CustomScope.sectionManager, CustomScope.tripLeader},
        );
        print('Created user: $u');
        // Now assign them to a section
        // create a member profile
        var m = await endpoints.member.createMember(
            authSession,
            Member(
              firstName: 'test',
              lastName: 'test$i',
              displayName: 'testy tester$i',
              email: email,
              phoneNumber: '555-1212',
              userInfoId: id,
              emergencyContactName: 'Santa',
              emergencyContactPhone: '5555555',
              role: MemberRole.sectionManager,
            ));
        print('Created member profile: $m');

        // assign to first and second sections
        var sm = await endpoints.member.addMemberToSection(
            authSession,
            SectionMembership(
              memberId: m.id!,
              sectionId: s1.id!,
            ));

        print(sm);
        sm = await endpoints.member.addMemberToSection(
            authSession,
            SectionMembership(
              memberId: m.id!,
              sectionId: s2.id!,
            ));
        print(sm);
      }
    });

    // We want to keep the data after tests run
  }, rollbackDatabase: RollbackDatabase.disabled, applyMigrations: true, enableSessionLogging: true);
}
