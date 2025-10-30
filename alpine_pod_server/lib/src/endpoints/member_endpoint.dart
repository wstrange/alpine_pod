import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// TODO: Use RBAC to restrict access to these methods
///
///
class MemberEndpoint extends Endpoint {
  Future<List<Member>> getMembers(Session session) async {
    // TODO: Fix
    // final admin = await isAdmin(session);
    // if (!admin) throw Exception('Only administrators can view member list');

    return await Member.db.find(session);
  }

  /// Create a new member.
  ///
  /// - Validates that the email is not already in use.
  /// - Sets `createdAt` to now.
  /// - Inserts the member row and invalidates the member cache.
  Future<Member> createMember(Session session, Member member) async {
    // Basic validation
    if (member.email.isEmpty) throw Exception('Email is required');
    if (member.firstName.isEmpty) throw Exception('First Name is required');
    if (member.lastName.isEmpty) throw Exception('Last Name is required');
    if (member.id == null) throw Exception('Set member id to the UserInfo.id!');

    // Ensure the email is unique
    final existing = await Member.db.findFirstRow(
      session,
      where: (t) => t.email.equals(member.email),
    );
    if (existing != null) throw Exception('A member with that email already exists');

    // Ensure createdAt is set to now
    final toInsert = member.copyWith(createdAt: DateTime.now());

    final created = await Member.db.insertRow(session, toInsert);

    return created;
  }

  Future<SectionMembership> addMemberToSection(
    Session session,
    SectionMembership membership,
  ) async {
    // Set syncedAt to current time
    final validatedMembership = membership.copyWith(
      syncedAt: DateTime.now(),
    );

    final result = await SectionMembership.db.insertRow(session, validatedMembership);

    return result;
  }

  Future<void> removeMemberFromSection(
    Session session,
    SectionMembership membership,
  ) async {
    await SectionMembership.db.deleteWhere(
      session,
      where: (t) => t.memberId.equals(membership.memberId) & t.sectionId.equals(membership.sectionId),
    );
  }
}
