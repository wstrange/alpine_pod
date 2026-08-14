import 'dart:math';

import 'package:alpine_pod_server/src/custom_scopes.dart';
import 'package:alpine_pod_server/src/generated/protocol.dart';
import 'package:faker/faker.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

class SampleDataOptions {
  final int sampleUsers;
  final int sampleEvents;

  SampleDataOptions({this.sampleUsers = 20, this.sampleEvents = 50});
}

class SampleDataResult {
  int usersInserted = 0;
  int eventsInserted = 0;
}

class GenerateSampleData(this.session, {Faker? faker, Random? random}) {
  this : faker = faker ?? Faker(), _rnd = random ?? Random();

  final Session session;
  final Faker faker;
  final Random _rnd;

  Future<SampleDataResult> generate(SampleDataOptions options) async {
    final result = SampleDataResult();

    // Ensure AuthServices is initialized if needed
    try {
      AuthServices.instance;
    } catch (_) {
      Serverpod.instance.initializeAuthServices(
        identityProviderBuilders: [
          EmailIdpConfig(secretHashPepper: Serverpod.instance.getPassword('emailSecretHashPepper') ?? 'pepper'),
        ],
        tokenManagerBuilders: [
          JwtConfig(
            refreshTokenHashPepper: Serverpod.instance.getPassword('jwtRefreshTokenHashPepper') ?? 'pepper',
            algorithm: JwtAlgorithm.hmacSha512(
              SecretKey(
                Serverpod.instance.getPassword('jwtHmacSha512PrivateKey') ??
                    'secret_key_12345678901234567890123456789012',
              ),
            ),
          ),
        ],
      );
    }

    // 1. Create or ensure Admin user exists
    await _createAdminUser();

    // 2. Fetch sections
    final sections = await Section.db.find(session);
    if (sections.isEmpty) {
      throw Exception('No sections found. Load static data first before generating sample data.');
    }

    final nationalSection = sections.firstWhere((s) => s.name == 'National', orElse: () => sections.first);
    final nonNationalSections = sections.where((s) => s.name != 'National').toList();
    final targetSections = nonNationalSections.isNotEmpty ? nonNationalSections : sections;

    // 3. Create Sample Users
    final createdUserIds = <UuidValue>[];
    final createdMembers = <Member>[];

    for (var i = 1; i <= options.sampleUsers; i++) {
      final email = 'test$i@acc.ca';

      // Check if user already exists
      final existingMember = await Member.db.findFirstRow(session, where: (t) => t.email.equals(email));
      if (existingMember != null) {
        createdUserIds.add(existingMember.id);
        createdMembers.add(existingMember);
        continue;
      }

      final au = await AuthServices.instance.authUsers.create(session, scopes: {});
      createdUserIds.add(au.id);

      final emailIdp = AuthServices.instance.emailIdp;
      await emailIdp.admin.createEmailAuthentication(session, authUserId: au.id, email: email, password: 'Passw0rd');

      final fn = faker.person.firstName();
      final ln = faker.person.lastName();
      final member = await Member.db.insertRow(
        session,
        Member(
          id: au.id,
          firstName: fn,
          lastName: ln,
          displayName: '$fn $ln',
          email: email,
          phoneNumber: faker.phoneNumber.us(),
          emergencyContactName: faker.person.name(),
          emergencyContactPhone: faker.phoneNumber.us(),
          membershipStatus: 'active',
          bio: faker.lorem.sentence(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
      createdMembers.add(member);
      result.usersInserted++;

      // Assign to National section + random regular section
      final assignedSection = targetSections[_rnd.nextInt(targetSections.length)];
      for (final sec in [nationalSection, assignedSection]) {
        final secId = sec.id;
        if (secId == null) continue;

        final existingSm = await SectionMembership.db.findFirstRow(
          session,
          where: (t) => t.memberId.equals(member.id) & t.sectionId.equals(secId),
        );
        if (existingSm == null) {
          await SectionMembership.db.insertRow(
            session,
            SectionMembership(
              memberId: member.id,
              sectionId: secId,
              scopes: {CustomScope.sectionManager.name!, CustomScope.member.name!},
              syncedAt: DateTime.now(),
            ),
          );
        }
      }
    }

    // Enable notification preferences for created test users
    for (final userId in createdUserIds) {
      await _enableAllNotificationsForUser(session, userId);
    }

    // 4. Create Sample Events
    final eventTypes = ['Ski', 'Hike', 'Climb', 'Social'];
    final sampleAuthors = createdMembers.isNotEmpty ? createdMembers : await Member.db.find(session);

    for (var i = 0; i < options.sampleEvents; i++) {
      final section = targetSections[_rnd.nextInt(targetSections.length)];
      final sectionId = section.id;
      if (sectionId == null) continue;

      final directRegistration = _rnd.nextBool();
      final author = sampleAuthors.isNotEmpty ? sampleAuthors[_rnd.nextInt(sampleAuthors.length)] : null;

      final start = DateTime.now().add(Duration(days: i + 1));
      final startTime = start.copyWith(hour: 8, minute: 0, second: 0);
      final endTime = startTime.add(Duration(hours: 4 + _rnd.nextInt(8)));
      final eventType = eventTypes[_rnd.nextInt(eventTypes.length)];

      final event = Event(
        title: 'Sample Event #${i + 1} (${section.name})',
        description: 'Sample $eventType event generated for testing and demonstration.',
        type: eventType,
        startTime: startTime,
        endTime: endTime,
        eventLocation: 'Location ${_rnd.nextInt(100) + 1}',
        sectionId: sectionId,
        requiresApproval: !directRegistration,
        published: true,
        minimumParticipants: 1,
        maxParticipants: 4 + _rnd.nextInt(12),
        updatedAt: DateTime.now(),
      );

      final createdEvent = await Event.db.insertRow(session, event);
      result.eventsInserted++;

      // Assign event manager if author exists
      if (author != null) {
        await EventManager.db.insertRow(
          session,
          EventManager(eventId: createdEvent.id, memberId: author.id, assignedAt: DateTime.now()),
        );
      }
    }

    return result;
  }

  Future<void> _createAdminUser() async {
    const adminEmail = 'admin@acc.ca';
    final existingMember = await Member.db.findFirstRow(session, where: (t) => t.email.equals(adminEmail));
    if (existingMember != null) return;

    final emailIdp = AuthServices.instance.emailIdp;
    final admin = emailIdp.admin;

    final auModel = await AuthServices.instance.authUsers.create(session, scopes: {Scope.admin, CustomScope.admin});

    await admin.createEmailAuthentication(session, authUserId: auModel.id, email: adminEmail, password: 'Passw0rd');

    final adminMember = await Member.db.insertRow(
      session,
      Member(
        id: auModel.id,
        firstName: 'Admin',
        lastName: 'User',
        displayName: 'Admin User',
        email: adminEmail,
        phoneNumber: '555-0000',
        emergencyContactName: 'Emergency Contact',
        emergencyContactPhone: '555-0001',
        membershipStatus: 'active',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    final sections = await Section.db.find(session);
    final national = sections.firstWhere((s) => s.name == 'National', orElse: () => sections.first);

    if (national.id != null) {
      await SectionMembership.db.insertRow(
        session,
        SectionMembership(
          memberId: adminMember.id,
          sectionId: national.id!,
          scopes: {CustomScope.sectionManager.name!, CustomScope.member.name!},
          syncedAt: DateTime.now(),
        ),
      );
    }

    await _enableAllNotificationsForUser(session, auModel.id);
  }

  Future<void> _enableAllNotificationsForUser(Session session, UuidValue userId) async {
    final existing = await UserNotificationPreference.db.findFirstRow(session, where: (t) => t.id.equals(userId));
    final preference = UserNotificationPreference(
      id: userId,
      newEvents: true,
      allowInApp: true,
      allowEmail: true,
      allowPush: true,
    );

    if (existing == null) {
      await UserNotificationPreference.db.insertRow(session, preference);
    } else {
      await UserNotificationPreference.db.updateRow(session, preference);
    }
  }
}
