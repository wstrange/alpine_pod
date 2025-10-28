import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../rbac.dart';

/// TODO: Use RBAC to restrict access to these methods
///
///
class MemberEndpoint extends Endpoint {
  Future<Member> updateMemberRole(Session session, Member member) async {
    final admin = await isAdmin(session);
    if (!admin) throw Exception('Only administrators can change member roles');

    final existing = await Member.db.findById(session, member.id!);
    if (existing == null) throw Exception('Member not found');

    // Validate that only the role is being changed
    final updated = existing.copyWith(role: member.role);
    await Member.db.updateRow(session, updated);

    // Invalidate the cache for this member
    invalidateMemberCache(member.id!);

    return updated;
  }

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

    // Ensure the email is unique
    final existing = await Member.db.findFirstRow(
      session,
      where: (t) => t.email.equals(member.email),
    );
    if (existing != null) throw Exception('A member with that email already exists');

    // Ensure createdAt is set to now
    final toInsert = member.copyWith(createdAt: DateTime.now());

    final created = await Member.db.insertRow(session, toInsert);

    // Invalidate any cache entries for this member id
    if (created.id != null) invalidateMemberCache(created.id!);

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

    // Invalidate the cache for this member
    invalidateMemberCache(membership.memberId);

    return result;
  }

  Future<void> removeMemberFromSection(
    Session session,
    SectionMembership membership,
  ) async {
    // Check if member is admin or section manager for this section
    final allowed = await isSectionManager(session, membership.sectionId);
    if (!allowed) throw Exception('Permission denied');

    await SectionMembership.db.deleteWhere(
      session,
      where: (t) => t.memberId.equals(membership.memberId) & t.sectionId.equals(membership.sectionId),
    );

    // Invalidate the cache for this member
    invalidateMemberCache(membership.memberId);
  }
}
