import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../rbac.dart';

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

  /// Create a new member.
  ///
  /// - Validates that the email is not already in use.
  /// - Sets `createdAt` to now.
  /// - Inserts the member row and invalidates the member cache.
  Future<Member> createMember(Session session, Member member) async {
    // Basic validation
    if (member.email.isEmpty) throw Exception('Email is required');
    if (member.password.isEmpty) throw Exception('Password is required');
    if (member.name.isEmpty) throw Exception('Name is required');

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
    // Check if member is admin or section manager for this section
    final allowed = await isSectionManager(session, membership.sectionId!);
    if (!allowed) throw Exception('Permission denied');

    // Validate the membership has required fields
    if (membership.userId == null || membership.sectionId == null) {
      throw Exception('Member ID and Section ID are required');
    }

    // Set syncedAt to current time
    final validatedMembership = membership.copyWith(
      syncedAt: DateTime.now(),
    );

    final result = await SectionMembership.db.insertRow(session, validatedMembership);

    // Invalidate the cache for this member
    invalidateMemberCache(membership.userId!);

    return result;
  }

  Future<void> removeMemberFromSection(
    Session session,
    SectionMembership membership,
  ) async {
    // Validate the membership has required fields
    if (membership.userId == null || membership.sectionId == null) {
      throw Exception('Member ID and Section ID are required');
    }

    // Check if member is admin or section manager for this section
    final allowed = await isSectionManager(session, membership.sectionId!);
    if (!allowed) throw Exception('Permission denied');

    await SectionMembership.db.deleteWhere(
      session,
      where: (t) => t.userId.equals(membership.userId!) & t.sectionId.equals(membership.sectionId!),
    );

    // Invalidate the cache for this member
    invalidateMemberCache(membership.userId!);
  }

  Future<void> syncSectionMembership(
    Session session,
    List<SectionMembership> memberships,
  ) async {
    final admin = await isAdmin(session);
    if (!admin) throw Exception('Only administrators can sync memberships');

    // Group memberships by sectionId for easier processing
    final membershipsBySectionId = <int, List<SectionMembership>>{};
    for (final m in memberships) {
      if (m.sectionId == null) continue;
      membershipsBySectionId.putIfAbsent(m.sectionId!, () => []).add(m);
    }

    // Process each section's memberships
    for (final sectionId in membershipsBySectionId.keys) {
      final sectionMemberships = membershipsBySectionId[sectionId]!;

      // Get existing memberships for this section
      final existing = await SectionMembership.db.find(
        session,
        where: (t) => t.sectionId.equals(sectionId),
      );

      // Create sets for efficient comparison
      final existingSet = {for (var e in existing) '${e.userId}:${e.externalUserId ?? ""}'};
      final newSet = {for (var m in sectionMemberships) '${m.userId}:${m.externalUserId ?? ""}'};

      // Find memberships to remove (in existing but not in new)
      final toRemove = existing.where(
        (e) => !newSet.contains('${e.userId}:${e.externalUserId ?? ""}'),
      );

      // Find memberships to add (in new but not in existing)
      final toAdd = sectionMemberships.where(
        (m) => !existingSet.contains('${m.userId}:${m.externalUserId ?? ""}'),
      );

      // Remove old memberships
      for (final m in toRemove) {
        await SectionMembership.db.deleteRow(session, m);
        if (m.userId != null) invalidateMemberCache(m.userId!);
      }

      // Add new memberships
      for (final m in toAdd) {
        await SectionMembership.db.insertRow(session, m);
        if (m.userId != null) invalidateMemberCache(m.userId!);
      }

      // Update existing memberships with new sync time
      for (final m in sectionMemberships) {
        if (existingSet.contains('${m.userId}:${m.externalUserId ?? ""}')) {
          await SectionMembership.db.updateRow(
            session,
            m.copyWith(syncedAt: DateTime.now()),
          );
          if (m.userId != null) invalidateMemberCache(m.userId!);
        }
      }
    }
  }
}
