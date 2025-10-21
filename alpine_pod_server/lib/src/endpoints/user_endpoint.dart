import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../rbac.dart';

class UserEndpoint extends Endpoint {
  Future<User> updateUserRole(Session session, int userId, UserRole newRole) async {
    final admin = await isAdmin(session);
    if (!admin) throw Exception('Only administrators can change user roles');

    final user = await User.db.findById(session, userId);
    if (user == null) throw Exception('User not found');

    final updated = user.copyWith(role: newRole);
    await User.db.updateRow(session, updated);

    // Invalidate the cache for this user
    invalidateUserCache(userId);

    return updated;
  }

  Future<SectionMembership> addUserToSection(
    Session session,
    int userId,
    int sectionId, {
    String? externalUserId,
    String? sourceSystem,
  }) async {
    // Check if user is admin or section manager for this section
    final allowed = await isSectionManager(session, sectionId);
    if (!allowed) throw Exception('Permission denied');

    final membership = SectionMembership(
      userId: userId,
      sectionId: sectionId,
      externalUserId: externalUserId,
      sourceSystem: sourceSystem,
      syncedAt: DateTime.now(),
    );

    final result = await SectionMembership.db.insertRow(session, membership);

    // Invalidate the cache for this user
    invalidateUserCache(userId);

    return result;
  }

  Future<void> removeUserFromSection(
    Session session,
    int userId,
    int sectionId,
  ) async {
    // Check if user is admin or section manager for this section
    final allowed = await isSectionManager(session, sectionId);
    if (!allowed) throw Exception('Permission denied');

    await SectionMembership.db.deleteWhere(
      session,
      where: (t) => t.userId.equals(userId) & t.sectionId.equals(sectionId),
    );

    // Invalidate the cache for this user
    invalidateUserCache(userId);
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
        if (m.userId != null) invalidateUserCache(m.userId!);
      }

      // Add new memberships
      for (final m in toAdd) {
        await SectionMembership.db.insertRow(session, m);
        if (m.userId != null) invalidateUserCache(m.userId!);
      }

      // Update existing memberships with new sync time
      for (final m in sectionMemberships) {
        if (existingSet.contains('${m.userId}:${m.externalUserId ?? ""}')) {
          await SectionMembership.db.updateRow(
            session,
            m.copyWith(syncedAt: DateTime.now()),
          );
          if (m.userId != null) invalidateUserCache(m.userId!);
        }
      }
    }
  }
}
