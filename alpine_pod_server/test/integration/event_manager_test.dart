import 'package:alpine_pod_server/src/custom_scopes.dart';
import 'package:alpine_pod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';
import 'test_tools/serverpod_test_tools.dart';
import 'utils/gen_data.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

void main() {
  final genData = GenData();

  withServerpod('EventManager Tests', (sessionBuilder, endpoints) {
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

    late Section section;
    late Event event;
    late Member member;
    late TestSessionBuilder adminAuth;

    setUp(() async {
      // Create an AuthUser first to get a real ID
      final session = sessionBuilder.build();
      final authUser = await AuthServices.instance.authUsers.create(
        session,
      );

      adminAuth = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          authUser.id.toString(),
          {Scope.admin, CustomScope.eventManager, CustomScope.member},
        ),
      );

      // Create a section
      section = await endpoints.admin.createSection(
        adminAuth,
        Section(name: 'Test Section', description: 'Test Description'),
      );

      member = await endpoints.member.createMember(
        adminAuth,
        genData.member(
            userId: authUser.id, email: 'test-${Uuid().v4()}@example.com'),
      );

      // Assign member to section
      await endpoints.member.addMemberToSection(
        adminAuth,
        SectionMembership(
          sectionId: section.id!,
          memberId: member.id!,
          scopes: {CustomScope.member.name!},
        ),
      );

      // Create an event
      event = await endpoints.event.createEvent(
        adminAuth,
        Event(
          title: 'Test Event',
          description: 'Description',
          startTime: DateTime.now().add(Duration(days: 1)),
          endTime: DateTime.now().add(Duration(days: 1, hours: 2)),
          sectionId: section.id!,
          type: EventType.hike,
          published: true,
          waitlistEnabled: false,
          requiresApproval: false,
          waiverRequired: false,
        ),
      );
    });

    test('Assign and list event managers', () async {
      final manager = EventManager(
        eventId: event.id!,
        memberId: member.id!,
      );

      final assigned = await endpoints.eventManager.assignEventManager(
        adminAuth,
        manager,
      );

      expect(assigned.id, isNotNull);
      expect(assigned.eventId, equals(event.id));
      expect(assigned.memberId, equals(member.id));

      final managers = await endpoints.eventManager.listEventManagers(
        adminAuth,
        event.id!,
      );

      expect(managers.length, equals(1));
      expect(managers.first.memberId, equals(member.id));
    });

    test('Remove event manager', () async {
      final manager = EventManager(
        eventId: event.id!,
        memberId: member.id!,
      );

      await endpoints.eventManager.assignEventManager(adminAuth, manager);

      // Note: We can't remove the last manager if there are active registrations,
      // but here there are none.
      await endpoints.eventManager.removeEventManager(adminAuth, manager);

      final managers = await endpoints.eventManager.listEventManagers(
        adminAuth,
        event.id!,
      );
      expect(managers.isEmpty, isTrue);
    });
  });
}
