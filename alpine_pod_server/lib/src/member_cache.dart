import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'generated/protocol.dart';

final cache = MemberCache();

/// Cache for storing member role and section membership information
/// to optimize RBAC checks. Data is ephemeral and only lives in memory.
class MemberCache {
  static final _instance = MemberCache._internal();
  factory MemberCache() => _instance;
  MemberCache._internal();

  final _cache = <UuidValue, MemberInfo>{};

  /// Maximum age of cache entries before they need to be refreshed
  static const _maxAgeMinutes = 10;

  /// Updates the cache for a member
  Future<void> updateCache(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      return;
    }

    var id = authInfo.authUserId;

    final member = await Member.db.findFirstRow(session,
        where: (t) => t.user.id.equals(authInfo.authUserId));

    if (member == null) {
      session.log('No member found for userInfoId $id');
      return;
    }

    final memberships = await SectionMembership.db.find(
      session,
      where: (t) => t.memberId.equals(member.id),
    );

    final sectionScopes = {for (var m in memberships) m.sectionId: m.scopes};
    final sectionIds = sectionScopes.keys.toSet();

    _cache[id] = MemberInfo(
      member: member,
      sectionIds: sectionIds,
      sectionScopes: sectionScopes,
      timestamp: DateTime.now(),
    );
  }

  void invalidateCache(Session session) {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      return;
    }
    final userId = authInfo.authUserId;
    invalidateUserCache(userId);
  }

  /// Removes a specific user's info from the cache
  void invalidateUserCache(UuidValue userId) {
    _cache.remove(userId);
  }

  /// Gets or refreshes a cache entry for a member
  Future<MemberInfo?> _getCacheEntry(
      Session session, UuidValue userInfoId) async {
    // Check if entry exists and is fresh
    var entry = _cache[userInfoId];
    if (entry != null && !entry.isStale) {
      return entry;
    }

    // Entry doesn't exist or is stale, refresh it
    await updateCache(session);
    return _cache[userInfoId];
  }

  Future<MemberInfo?> getMemberInfo(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      return null;
    }
    final userId = authInfo.authUserId;
    final entry = await _getCacheEntry(session, userId);
    return entry;
  }

  /// Clears all cached data
  void clearAll() {
    _cache.clear();
  }

  Future<bool> isSectionMember(Session session, int sectionId) async {
    final info = await getMemberInfo(session);
    if (info == null) return false;
    return info.sectionIds.contains(sectionId);
  }
}

/// Internal class to store cached member data with timestamp
class MemberInfo {
  final Member member;
  final Set<int> sectionIds;
  final Map<int, Set<String>> sectionScopes;
  final DateTime timestamp;

  const MemberInfo({
    required this.member,
    required this.sectionIds,
    required this.sectionScopes,
    required this.timestamp,
  });

  bool get isStale =>
      DateTime.now().difference(timestamp).inMinutes >
      MemberCache._maxAgeMinutes;

  /// Returns the scopes for a specific section, or an empty set if not a member.
  Set<String> scopesFor(int sectionId) => sectionScopes[sectionId] ?? {};
}
