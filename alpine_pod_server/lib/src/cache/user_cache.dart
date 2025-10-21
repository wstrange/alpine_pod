import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Cache for storing user role and section membership information
/// to optimize RBAC checks. Data is ephemeral and only lives in memory.
class UserCache {
  static final UserCache _instance = UserCache._internal();
  factory UserCache() => _instance;
  UserCache._internal();

  final _cache = <int, _UserCacheEntry>{};

  /// Maximum age of cache entries before they need to be refreshed
  static const _maxAgeMinutes = 10;

  /// Updates the cache for a user
  Future<void> updateCache(Session session, User user) async {
    final memberships = await SectionMembership.db.find(
      session,
      where: (t) => t.userId.equals(user.id),
    );

    final sectionIds = memberships.map((m) => m.sectionId!).toSet();

    _cache[user.id!] = _UserCacheEntry(
      role: user.role,
      sectionIds: sectionIds,
      timestamp: DateTime.now(),
    );
  }

  /// Invalidates the cache for a specific user
  void invalidateUser(int userId) {
    _cache.remove(userId);
  }

  /// Checks if a user has a specific role with fast cache lookup
  Future<bool> hasRole(Session session, int userId, UserRole role) async {
    final entry = await _getCacheEntry(session, userId);
    return entry?.role == role;
  }

  /// Checks if a user is a member of a specific section with fast cache lookup
  Future<bool> isSectionMember(Session session, int userId, int sectionId) async {
    final entry = await _getCacheEntry(session, userId);
    return entry?.sectionIds.contains(sectionId) ?? false;
  }

  /// Gets or refreshes a cache entry for a user
  Future<_UserCacheEntry?> _getCacheEntry(Session session, int userId) async {
    var entry = _cache[userId];

    // Check if entry exists and is fresh
    if (entry != null && !entry.isStale) {
      return entry;
    }

    // Entry doesn't exist or is stale, refresh it
    final user = await User.db.findById(session, userId);
    if (user == null) {
      _cache.remove(userId);
      return null;
    }

    await updateCache(session, user);
    return _cache[userId];
  }

  /// Clears all cached data
  void clearAll() {
    _cache.clear();
  }
}

/// Internal class to store cached user data with timestamp
class _UserCacheEntry {
  final UserRole role;
  final Set<int> sectionIds;
  final DateTime timestamp;

  const _UserCacheEntry({
    required this.role,
    required this.sectionIds,
    required this.timestamp,
  });

  bool get isStale => DateTime.now().difference(timestamp).inMinutes > UserCache._maxAgeMinutes;
}
