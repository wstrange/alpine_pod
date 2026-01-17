// @Timeout(Duration(seconds: 60))
// @Tags(['integration'])

import 'package:alpine_pod_server/src/custom_scopes.dart';
import 'package:alpine_pod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'test_tools/serverpod_test_tools.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:serverpod_auth_idp_server/core.dart';

import 'utils/gen_data.dart';

final genData = GenData();

final uuid = Uuid();

void main() {
  final adminId = uuid.v4obj();

  withServerpod('Seed Data', (sessionBuilder, endpoints) {
    Serverpod.instance.initializeAuthServices(
      identityProviderBuilders: [
        EmailIdpConfig(
            secretHashPepper:
                Serverpod.instance.getPassword('emailSecretHashPepper')!),
      ],
      tokenManagerBuilders: [
        JwtConfig(
            refreshTokenHashPepper:
                Serverpod.instance.getPassword('jwtRefreshTokenHashPepper')!,
            algorithm: JwtAlgorithm.hmacSha512(
              SecretKey(
                  Serverpod.instance.getPassword('jwtHmacSha512PrivateKey')!),
            )),
      ],
    );

    final emailIdp = AuthServices.instance.emailIdp;
    final admin = emailIdp.admin;

    var authSession = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
            adminId.uuid, {Scope.admin}),
        enableLogging: true);

    var session = authSession.build();

    test('Delete sections ', () async {
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
      var auModel = await AuthServices.instance.authUsers.create(
        session,
        scopes: {Scope.admin},
      );

      final emailAccountId = await admin.createEmailAuthentication(
        session,
        authUserId: auModel.id,
        email: 'admin@acc.ca',
        password: 'Passw0rd',
      );

      print('Created Admin: $emailAccountId');
    });

    test('Clean up test users', () async {
      await session.db
          .unsafeSimpleExecute(r'TRUNCATE serverpod_user_info CASCADE');
      await session.db
          .unsafeSimpleExecute(r'TRUNCATE serverpod_email_auth CASCADE');
      await session.db
          .unsafeSimpleExecute(r'TRUNCATE public.section_memberships CASCADE');
      await session.db.unsafeSimpleExecute(r'TRUNCATE public.members CASCADE');
    });

    test('Create Some test users', () async {
      // get the sections..
      final sections = await endpoints.admin.listSections(authSession);

      final s1 = sections[0];
      final s2 = sections[1];

      for (var i = 0; i < 5; i++) {
        var email = 'test$i@acc.ca';

        var au = await AuthServices.instance.authUsers.create(
          session,
          scopes: {CustomScope.member},
        );

        final emailId = await admin.createEmailAuthentication(
          session,
          authUserId: au.id,
          email: email,
          password: 'Passw0rd',
        );

        print('Created user: $emailId');
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
              emergencyContactName: 'Santa',
              emergencyContactPhone: '5555555',
              userId: au.id,
            ));
        print('Created member profile: $m');

        var scopes = {
          CustomScope.sectionManager.toString(),
          CustomScope.member.toString()
        };

        // assign to first and second sections
        var sm = await endpoints.member.addMemberToSection(
            authSession,
            SectionMembership(
                memberId: m.id, sectionId: s1.id!, scopes: scopes));

        print(sm);
        sm = await endpoints.member.addMemberToSection(
            authSession,
            SectionMembership(
              memberId: m.id,
              sectionId: s2.id!,
              scopes: scopes,
            ));
        print(sm);
      }
    });

    // We want to keep the data after tests run
  },
      rollbackDatabase: RollbackDatabase.disabled,
      applyMigrations: true,
      runMode: 'development',
      enableSessionLogging: true);
}
