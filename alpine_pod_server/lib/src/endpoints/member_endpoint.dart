import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import '../generated/protocol.dart';
import '../member_cache.dart';

/// TODO: Use RBAC to restrict access to these methods
class MemberEndpoint extends Endpoint {
  Future<Member?> getCurrentMember(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      return null;
    }

    var m = await Member.db.findFirstRow(session,
        where: (t) => t.user.id.equals(authInfo.authUserId));
    return m;
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

    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw Exception('User not authenticated');
    }

    // Ensure the email is unique
    final existing = await Member.db.findFirstRow(
      session,
      where: (t) => t.email.equals(member.email),
    );
    if (existing != null) {
      throw Exception('A member with that email already exists');
    }

    // Ensure createdAt is set to now
    final toInsert = member.copyWith(
      createdAt: DateTime.now(),
    );

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

    final result =
        await SectionMembership.db.insertRow(session, validatedMembership);

    // Sync global scopes
    await _syncUserScopes(session, membership.memberId);

    return result;
  }

  Future<void> removeMemberFromSection(
    Session session,
    SectionMembership membership,
  ) async {
    await SectionMembership.db.deleteWhere(
      session,
      where: (t) =>
          t.memberId.equals(membership.memberId) &
          t.sectionId.equals(membership.sectionId),
    );

    // Sync global scopes
    await _syncUserScopes(session, membership.memberId);
  }

  Future<Member> updateMember(Session session, Member member) async {
    final updated = await Member.db.updateRow(session, member);
    return updated;
  }

  /// Returns members for a section, or all members the caller has access to
  /// if [sectionId] is null.
  ///
  /// When [sectionId] is null:
  /// - Global admins see all members.
  /// - Regular users see members across all their sections (deduplicated).
  ///
  /// Use [offset] for pagination — pass `offset: page * limit` to load successive pages.
  Future<List<Member>> getSectionMembers(
    Session session, {
    int? sectionId,
    String? filter,
    int limit = 50,
    int offset = 0,
  }) async {
    final authInfo = session.authenticated;
    if (authInfo == null) throw Exception('Not authenticated');

    final bool isGlobalAdmin = authInfo.scopes.contains(Scope.admin);

    // Determine which section IDs to query
    Set<int> targetSectionIds;
    if (sectionId != null) {
      if (!isGlobalAdmin) {
        final callerInfo = await cache.getMemberInfo(session);
        if (callerInfo == null) throw Exception('Member profile not found');
        if (!callerInfo.sectionIds.contains(sectionId)) {
          throw Exception('You do not have access to this section');
        }
      }
      targetSectionIds = {sectionId};
    } else {
      // No section specified
      if (isGlobalAdmin) {
        // Admins see all members directly — DB handles offset natively.
        return await Member.db.find(
          session,
          where: (t) {
            if (filter != null && filter.isNotEmpty) {
              return t.firstName.ilike('%$filter%') |
                  t.lastName.ilike('%$filter%') |
                  t.email.ilike('%$filter%');
            }
            return Constant.bool(true);
          },
          orderBy: (t) => t.lastName,
          limit: limit,
          offset: offset,
        );
      }

      final callerInfo = await cache.getMemberInfo(session);
      if (callerInfo == null) throw Exception('Member profile not found');
      if (callerInfo.sectionIds.isEmpty) {
        return offset == 0 ? [callerInfo.member] : [];
      }
      targetSectionIds = callerInfo.sectionIds;
    }

    // Query memberships across the target section(s)
    final memberships = await SectionMembership.db.find(
      session,
      where: (t) {
        var expr = targetSectionIds.length == 1
            ? t.sectionId.equals(targetSectionIds.first)
            : t.sectionId.inSet(targetSectionIds);
        if (filter != null && filter.isNotEmpty) {
          expr = expr &
              (t.member.firstName.ilike('%$filter%') |
                  t.member.lastName.ilike('%$filter%') |
                  t.member.email.ilike('%$filter%'));
        }
        return expr;
      },
      include: SectionMembership.include(
        member: Member.include(),
      ),
      orderBy: (t) => t.member.lastName,
      // For a single section the DB handles limit + offset directly.
      // For multi-section we must deduplicate first, so fetch everything
      // and slice in Dart.
      limit: targetSectionIds.length == 1 ? limit : null,
      offset: targetSectionIds.length == 1 ? offset : null,
    );

    // Single section — no deduplication needed.
    if (targetSectionIds.length == 1) {
      return memberships.map((m) => m.member!).toList();
    }

    // Multi-section: deduplicate, sort, then apply offset + limit in Dart.
    final memberMap = <int, Member>{};
    for (var m in memberships) {
      if (m.member != null) {
        memberMap[m.member!.id!] = m.member!;
      }
    }

    final result = memberMap.values.toList()
      ..sort((a, b) => a.lastName.compareTo(b.lastName));

    if (offset >= result.length) return [];
    final end = (offset + limit).clamp(0, result.length);
    return result.sublist(offset, end);
  }

  /// Similar to getSectionMembers but returns the actual membership records,
  /// which include the user's scopes for the section.
  ///
  /// Use [offset] for pagination — pass `offset: page * limit` to load successive pages.
  Future<List<SectionMembership>> getSectionMemberships(
    Session session,
    int sectionId, {
    String? filter,
    int limit = 50,
    int offset = 0,
  }) async {
    return await SectionMembership.db.find(
      session,
      where: (t) {
        var expr = t.sectionId.equals(sectionId);
        if (filter != null && filter.isNotEmpty) {
          expr = expr &
              (t.member.firstName.ilike('%$filter%') |
                  t.member.lastName.ilike('%$filter%') |
                  t.member.email.ilike('%$filter%'));
        }
        return expr;
      },
      include: SectionMembership.include(
        member: Member.include(),
      ),
      orderBy: (t) => t.member.lastName,
      limit: limit,
      offset: offset,
    );
  }

  /// Get the active user's membership details (and scopes) for a specific section.
  Future<SectionMembership?> getMySectionMembership(
    Session session,
    int sectionId,
  ) async {
    final callerInfo = await cache.getMemberInfo(session);
    if (callerInfo == null) return null;

    return await SectionMembership.db.findFirstRow(
      session,
      where: (t) =>
          t.memberId.equals(callerInfo.member.id) &
          t.sectionId.equals(sectionId),
    );
  }

  /// Get all the active user's membership details across all sections.
  Future<List<SectionMembership>> getAllMySectionMemberships(
    Session session,
  ) async {
    final callerInfo = await cache.getMemberInfo(session);
    if (callerInfo == null) return [];

    return await SectionMembership.db.find(
      session,
      where: (t) => t.memberId.equals(callerInfo.member.id),
      include: SectionMembership.include(
        section: Section.include(),
      ),
    );
  }

  /// Update a member's scopes for a specific section.
  /// Requires the caller to be a global admin or a section manager for the section.
  Future<SectionMembership> updateMemberScopes(
    Session session,
    int memberId,
    int sectionId,
    Set<String> newScopes,
  ) async {
    final callerInfo = await cache.getMemberInfo(session);
    if (callerInfo == null) throw Exception('Not authenticated');

    // Authentication/authorization check
    bool isGlobalAdmin =
        session.authenticated?.scopes.contains(Scope.admin) ?? false;

    final isManagerForSection =
        callerInfo.scopesFor(sectionId).contains('sectionManager');

    if (!isGlobalAdmin && !isManagerForSection) {
      throw Exception(
          'You do not have permission to manage scopes in this section');
    }

    // Find the membership to update
    final membership = await SectionMembership.db.findFirstRow(
      session,
      where: (t) => t.memberId.equals(memberId) & t.sectionId.equals(sectionId),
    );

    if (membership == null) {
      throw Exception('Target member is not in this section');
    }

    // Find the member to get the userId for auth update
    final targetMember = await Member.db.findById(session, memberId);
    if (targetMember == null) throw Exception('Target member not found');

    // Update the SectionMembership row
    final updatedMembership = membership.copyWith(
      scopes: newScopes.toSet(),
      syncedAt: DateTime.now(),
    );
    await SectionMembership.db.updateRow(session, updatedMembership);

    // Sync global scopes
    await _syncUserScopes(session, memberId);

    return updatedMembership;
  }

  /// Helper to synchronize the global AuthUser scopes with the aggregate of all section memberships.
  Future<void> _syncUserScopes(Session session, int memberId) async {
    final targetMember = await Member.db.findById(session, memberId);
    if (targetMember == null) return;

    final allMemberships = await SectionMembership.db.find(
      session,
      where: (t) => t.memberId.equals(memberId),
    );

    // Merge scopes from all sections, add base 'member' scope
    final mergedScopes = <String>{'member'};
    for (final m in allMemberships) {
      mergedScopes.addAll(m.scopes);
    }

    // Convert strings to Scope objects
    final Set<Scope> authScopes = mergedScopes.map((s) => Scope(s)).toSet();

    // Update the AuthUser scopes
    await AuthServices.instance.authUsers.update(
      session,
      authUserId: targetMember.userId,
      scopes: authScopes,
    );

    // Invalidate the cache for the updated member so their new scopes take effect immediately
    cache.invalidateUserCache(targetMember.userId);
  }

  /// Atomic registration: creates a Member profile and multiple Section memberships.
  Future<Member> registerMember(
    Session session,
    Member member,
    List<int> sectionIds,
  ) async {
    final authInfo = session.authenticated;
    if (authInfo == null) throw Exception('Not authenticated');

    return await session.db.transaction((transaction) async {
      // 1. Create or verify member profile
      var existingMember = await Member.db.findFirstRow(
        session,
        where: (t) => t.user.id.equals(authInfo.authUserId),
        transaction: transaction,
      );

      Member createdMember;
      if (existingMember == null) {
        // Ensure the email matches the authenticated user if not provided
        final memberToInsert = member.copyWith(
          userId: authInfo.authUserId,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        createdMember = await Member.db.insertRow(
          session,
          memberToInsert,
          transaction: transaction,
        );
      } else {
        // Update existing member info if needed?
        // For now, if they already have a profile, we just use it.
        createdMember = existingMember;
      }

      // 2. Create section memberships
      for (final sectionId in sectionIds) {
        final existingMembership = await SectionMembership.db.findFirstRow(
          session,
          where: (t) =>
              t.memberId.equals(createdMember.id!) &
              t.sectionId.equals(sectionId),
          transaction: transaction,
        );

        if (existingMembership == null) {
          await SectionMembership.db.insertRow(
            session,
            SectionMembership(
              memberId: createdMember.id!,
              sectionId: sectionId,
              syncedAt: DateTime.now(),
              scopes: {'member'},
            ),
            transaction: transaction,
          );
        }
      }

      // 3. Sync scopes
      await _syncUserScopes(session, createdMember.id!);

      return createdMember;
    });
  }
}
