import 'package:serverpod/serverpod.dart';
import 'generated/protocol.dart';
import 'cache/user_cache.dart';

final _cache = UserCache();

Future<User?> getCurrentUser(Session session) async {
  final dynamic s = session;
  final int? userId = s.authenticatedUserId as int?;
  if (userId == null) return null;
  final user = await User.db.findById(session, userId);
  if (user != null) {
    // Update cache when retrieving user
    await _cache.updateCache(session, user);
  }
  return user;
}

Future<bool> isAdmin(Session session) async {
  final dynamic s = session;
  final int? userId = s.authenticatedUserId as int?;
  if (userId == null) return false;
  return await _cache.hasRole(session, userId, UserRole.admin);
}

Future<bool> isSectionManager(Session session, int? sectionId) async {
  if (sectionId == null) return false;
  final dynamic s = session;
  final int? userId = s.authenticatedUserId as int?;
  if (userId == null) return false;

  // Check admin role first (using cache)
  if (await _cache.hasRole(session, userId, UserRole.admin)) return true;

  // Check section manager role and membership (using cache)
  if (!await _cache.hasRole(session, userId, UserRole.sectionManager)) return false;
  return await _cache.isSectionMember(session, userId, sectionId);
}

Future<bool> isTripLeaderForEvent(Session session, int? eventId) async {
  if (eventId == null) return false;
  final dynamic s = session;
  final int? userId = s.authenticatedUserId as int?;
  if (userId == null) return false;

  // Check admin role first (using cache)
  if (await _cache.hasRole(session, userId, UserRole.admin)) return true;

  // Trip leader status requires a database check
  final rel = await EventTripLeader.db.findFirstRow(
    session,
    where: (t) => t.eventId.equals(eventId) & t.userId.equals(userId),
  );
  return rel != null;
}

Future<bool> isEventEditor(Session session, int? eventId, int? sectionId) async {
  if (await isAdmin(session)) return true;
  if (await isSectionManager(session, sectionId)) return true;
  if (await isTripLeaderForEvent(session, eventId)) return true;
  return false;
}

/// Call this when roles or section memberships change to invalidate the cache
void invalidateUserCache(int userId) {
  _cache.invalidateUser(userId);
}
