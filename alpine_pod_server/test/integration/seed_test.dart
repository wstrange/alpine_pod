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

    test('Clean up database', () async {
      await session.db.unsafeSimpleExecute(
          r'TRUNCATE public.serverpod_auth_core_user CASCADE');
      await session.db.unsafeSimpleExecute(
          r'TRUNCATE public.serverpod_auth_idp_email_account CASCADE');
      await session.db
          .unsafeSimpleExecute(r'TRUNCATE public.section_memberships CASCADE');
      await session.db.unsafeSimpleExecute(r'TRUNCATE public.members CASCADE');
      await session.db.unsafeSimpleExecute(r'TRUNCATE public.events CASCADE');
      await session.db.unsafeSimpleExecute(r'TRUNCATE public.sections CASCADE');
    });

    test('Clean up test users', () async {
      await session.db.unsafeSimpleExecute(
          r'TRUNCATE public.serverpod_auth_core_user CASCADE');
      await session.db.unsafeSimpleExecute(
          r'TRUNCATE public.serverpod_auth_idp_email_account CASCADE');
      await session.db
          .unsafeSimpleExecute(r'TRUNCATE public.section_memberships CASCADE');
      await session.db.unsafeSimpleExecute(r'TRUNCATE public.members CASCADE');
    }, skip: true); // we only run this as needed

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
        scopes: {
          Scope.admin,
        },
      );

      final emailAccountId = await admin.createEmailAuthentication(
        session,
        authUserId: auModel.id,
        email: 'admin@acc.ca',
        password: 'Passw0rd',
      );

      print('Created Admin: $emailAccountId');
    });

    test('Create Some test users', () async {
      // get the sections..
      final sections = await endpoints.admin.listSections(authSession);

      final s1 = sections[0];
      final s2 = sections[1];

      for (var i = 1; i <= 5; i++) {
        var email = 'test$i@acc.ca';

        var au = await AuthServices.instance.authUsers.create(
          session,
          scopes: {},
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

        var scopes = <String>{
          CustomScope.sectionManager.name!,
          CustomScope.member.name!,
        };

        // assign to first and second sections
        var sm = await endpoints.member.addMemberToSection(
            authSession,
            SectionMembership(
                memberId: m.id!, sectionId: s1.id!, scopes: scopes));

        print(sm);
        sm = await endpoints.member.addMemberToSection(
            authSession,
            SectionMembership(
              memberId: m.id!,
              sectionId: s2.id!,
              scopes: scopes,
            ));
        print(sm);
      }
    });

    test('Create 100 sample events', () async {
      final sections = await endpoints.admin.listSections(authSession);
      final calgary = sections.firstWhere((s) => s.name == 'Calgary');
      final edmonton = sections.firstWhere((s) => s.name == 'Edmonton');

      // Get the test users we just created
      final members = await endpoints.member.getMembers(authSession);
      final testMembers =
          members.where((m) => m.email.startsWith('test')).toList();

      for (var i = 0; i < 100; i++) {
        final section = i % 2 == 0 ? calgary : edmonton;
        final directRegistration = i % 4 == 0; // 25%

        // Cycle through test1-test5 as "authors" (authenticating as them)
        final memberIndex = i % testMembers.length;
        final member = testMembers[memberIndex];

        final userAuthSession = sessionBuilder.copyWith(
          authentication: AuthenticationOverride.authenticationInfo(
            member.userId.toString(),
            {CustomScope.member},
          ),
        );

        final s = DateTime.now().add(Duration(days: i + 1));
        final startTime = s.copyWith(hour: 8, minute: 0, second: 0);
        final endTime = startTime.add(const Duration(hours: 8));

        await endpoints.event.createEvent(
          userAuthSession,
          Event(
            title: 'Sample Event #${i + 1} (${section.name})',
            description:
                'This is a sample event generated for testing purposes.',
            type: EventType.hike,
            startTime: startTime,
            endTime: endTime,
            location: 'Various Locations',
            sectionId: section.id!,
            requiresApproval: !directRegistration,
            published: true,
            minimumParticipants: 1,
            maxParticipants: 10,
          ),
        );
      }
      print('Created 100 sample events.');
    });

    // We want to keep the data after tests run
  },
      rollbackDatabase: RollbackDatabase.disabled,
      applyMigrations: true,
      runMode: 'development',
      enableSessionLogging: true);
}
