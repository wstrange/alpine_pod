import 'package:serverpod/serverpod.dart';
import 'generated/protocol.dart';

final cache = MemberCache();

/// Cache for storing member role and section membership information
/// to optimize RBAC checks. Data is ephemeral and only lives in memory.
class MemberCache {
  static final _instance = MemberCache._internal();
  factory MemberCache() => _instance;
  MemberCache._internal();

  final _cache = <int, MemberInfo>{};

  /// Maximum age of cache entries before they need to be refreshed
  static const _maxAgeMinutes = 10;

  /// Updates the cache for a member
  Future<void> updateCache(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      return;
    }

    var idString = authInfo.authId;
    var id = int.tryParse(idString);
    if (id == null) return;

    final member =
        await Member.db.findFirstRow(session, where: (t) => t.id.equals(id));

    if (member == null) {
      session.log('No member found for userInfoId $idString');
      return;
    }

    final memberships = await SectionMembership.db.find(
      session,
      where: (t) => t.memberId.equals(member.id),
    );

    final sectionIds = memberships.map((m) => m.sectionId).toSet();

    _cache[id] = MemberInfo(
      member: member,
      sectionIds: sectionIds,
      timestamp: DateTime.now(),
    );
  }

  void invalidateCache(Session session) {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      return;
    }
    final userId = int.tryParse(authInfo.authId);
    if (userId != null) {
      _cache.remove(userId);
    }
  }

  /// Gets or refreshes a cache entry for a member
  Future<MemberInfo?> _getCacheEntry(Session session, int userInfoId) async {
    final member = await Member.db
        .findFirstRow(session, where: (t) => t.id.equals(userInfoId));
    if (member == null) {
      return null;
    }
    final memberId = member.id!;

    var entry = _cache[memberId];

    // Check if entry exists and is fresh
    if (entry != null && !entry.isStale) {
      return entry;
    }

    // Entry doesn't exist or is stale, refresh it
    await updateCache(session);
    return _cache[memberId];
  }

  Future<MemberInfo?> getMemberInfo(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      return null;
    }
    final userId = int.tryParse(authInfo.authId);
    if (userId == null) {
      return null;
    }
    final entry = await cache._getCacheEntry(session, userId);
    return entry;
  }

  /// Clears all cached data
  void clearAll() {
    _cache.clear();
  }

  Future<dynamic> isSectionMember(Session session, int sectionId) async {}
}

/// Internal class to store cached member data with timestamp
class MemberInfo {
  final Member member;
  final Set<int> sectionIds;
  final DateTime timestamp;

  const MemberInfo({
    required this.member,
    required this.sectionIds,
    required this.timestamp,
  });

  bool get isStale =>
      DateTime.now().difference(timestamp).inMinutes >
      MemberCache._maxAgeMinutes;
}
