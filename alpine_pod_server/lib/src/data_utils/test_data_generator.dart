import 'dart:math';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// A utility class for generating test data.
class TestDataGenerator {
  final _random = Random();

  /// Generate a list of sample members.
  ///
  /// [count] specifies how many members to generate.
  /// The generated members will have random roles (admin, manager, or member).
  Future<List<Member>> generateMembers(Session session, {int count = 10}) async {
    final members = <Member>[];

    // Ensure we generate at least one admin and one section manager
    members.add(await _generateMember(session, role: MemberRole.admin));
    members.add(await _generateMember(session, role: MemberRole.sectionManager));

    // Generate remaining members with random roles
    for (var i = 2; i < count; i++) {
      members.add(await _generateMember(session));
    }

    return members;
  }

  /// Generate a single member with random data.
  Future<Member> _generateMember(Session session, {MemberRole? role}) async {
    final id = _random.nextInt(10000);
    role ??= _randomMemberRole();

    final member = Member(
      id: null, // Let the database assign the ID
      email: 'member$id@example.com',
      password: 'password$id', // In real app, would be hashed
      name: 'Test Member $id',
      phoneNumber: '+1555${id.toString().padLeft(7, '0')}',
      membershipStatus: 'active',
      emergencyContactName: 'Emergency Contact $id',
      emergencyContactPhone: '+1555${_random.nextInt(10000000).toString().padLeft(7, '0')}',
      role: role,
      createdAt: DateTime.now(),
      certifications: null,
      medicalConditions: null,
      profilePictureUrl: null,
    );

    // Insert the member and return the result with assigned ID
    return await Member.db.insertRow(session, member);
  }

  /// Generate a list of sample sections.
  Future<List<Section>> generateSections(Session session, {int count = 3}) async {
    final sections = <Section>[];

    for (var i = 0; i < count; i++) {
      final section = Section(
        id: null,
        name: 'Test Section ${i + 1}',
        description: 'Description for test section ${i + 1}',
        location: 'Location ${i + 1}',
        contactInfo: 'Contact info for section ${i + 1}',
      );

      sections.add(await Section.db.insertRow(session, section));
    }

    return sections;
  }

  /// Generate section memberships for the given members and sections.
  ///
  /// Each member will be assigned to 1-3 random sections.
  Future<List<SectionMembership>> generateSectionMemberships(
    Session session, {
    required List<Member> members,
    required List<Section> sections,
  }) async {
    final memberships = <SectionMembership>[];

    for (final member in members) {
      // Assign each member to 1-3 random sections
      final numSections = _random.nextInt(3) + 1;
      final memberSections = List.of(sections)..shuffle(_random);

      for (var i = 0; i < numSections && i < memberSections.length; i++) {
        final membership = SectionMembership(
          id: null,
          userId: member.id,
          sectionId: memberSections[i].id,
          syncedAt: DateTime.now(),
          sourceSystem: 'test',
          externalUserId: 'test-${member.id}',
        );

        memberships.add(
          await SectionMembership.db.insertRow(session, membership),
        );
      }
    }

    return memberships;
  }

  /// Pick a random member role.
  MemberRole _randomMemberRole() {
    const roles = [MemberRole.member, MemberRole.sectionManager, MemberRole.tripLeader, MemberRole.admin, MemberRole.guest];
    return roles[_random.nextInt(roles.length)];
  }
}
