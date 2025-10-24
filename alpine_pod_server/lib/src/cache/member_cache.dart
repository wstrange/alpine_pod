import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Cache for storing member role and section membership information
/// to optimize RBAC checks. Data is ephemeral and only lives in memory.
class MemberCache {
  static final MemberCache _instance = MemberCache._internal();
  factory MemberCache() => _instance;
  MemberCache._internal();

  final _cache = <int, _MemberCacheEntry>{};

  /// Maximum age of cache entries before they need to be refreshed
  static const _maxAgeMinutes = 10;

  /// Updates the cache for a member
  Future<void> updateCache(Session session, Member member) async {
    final memberships = await SectionMembership.db.find(
      session,
      where: (t) => t.userId.equals(member.id),
    );

    final sectionIds = memberships.map((m) => m.sectionId!).toSet();

    _cache[member.id!] = _MemberCacheEntry(
      role: member.role,
      sectionIds: sectionIds,
      timestamp: DateTime.now(),
    );
  }

  /// Invalidates the cache for a specific member
  void invalidateMember(int memberId) {
    _cache.remove(memberId);
  }

  /// Checks if a member has a specific role with fast cache lookup
  Future<bool> hasRole(Session session, int memberId, MemberRole role) async {
    final entry = await _getCacheEntry(session, memberId);
    return entry?.role == role;
  }

  /// Checks if a member is a member of a specific section with fast cache lookup
  Future<bool> isSectionMember(Session session, int memberId, int sectionId) async {
    final entry = await _getCacheEntry(session, memberId);
    return entry?.sectionIds.contains(sectionId) ?? false;
  }

  /// Gets or refreshes a cache entry for a member
  Future<_MemberCacheEntry?> _getCacheEntry(Session session, int memberId) async {
    var entry = _cache[memberId];

    // Check if entry exists and is fresh
    if (entry != null && !entry.isStale) {
      return entry;
    }

    // Entry doesn't exist or is stale, refresh it
    final member = await Member.db.findById(session, memberId);
    if (member == null) {
      _cache.remove(memberId);
      return null;
    }

    await updateCache(session, member);
    return _cache[memberId];
  }

  /// Clears all cached data
  void clearAll() {
    _cache.clear();
  }
}

/// Internal class to store cached member data with timestamp
class _MemberCacheEntry {
  final MemberRole role;
  final Set<int> sectionIds;
  final DateTime timestamp;

  const _MemberCacheEntry({
    required this.role,
    required this.sectionIds,
    required this.timestamp,
  });

  bool get isStale => DateTime.now().difference(timestamp).inMinutes > MemberCache._maxAgeMinutes;
}
