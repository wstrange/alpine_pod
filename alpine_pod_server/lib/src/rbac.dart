import 'package:serverpod/serverpod.dart';
import 'generated/protocol.dart';
import 'cache/member_cache.dart';

final _cache = MemberCache();

Future<Member?> getCurrentMember(Session session) async {
  final dynamic s = session;
  final int? memberId = s.authenticatedUserId as int?;
  if (memberId == null) return null;
  final member = await Member.db.findById(session, memberId);
  if (member != null) {
    // Update cache when retrieving member
    await _cache.updateCache(session, member);
  }
  return member;
}

Future<bool> isAdmin(Session session) async {
  final dynamic s = session;
  final int? memberId = s.authenticatedUserId as int?;
  if (memberId == null) return false;
  return await _cache.hasRole(session, memberId, MemberRole.admin);
}

Future<bool> isSectionManager(Session session, int? sectionId) async {
  if (sectionId == null) return false;
  final dynamic s = session;
  final int? memberId = s.authenticatedUserId as int?;
  if (memberId == null) return false;

  // Check admin role first (using cache)
  if (await _cache.hasRole(session, memberId, MemberRole.admin)) return true;

  // Check section manager role and membership (using cache)
  if (!await _cache.hasRole(session, memberId, MemberRole.sectionManager)) return false;
  return await _cache.isSectionMember(session, memberId, sectionId);
}

Future<bool> isTripLeaderForEvent(Session session, int? eventId) async {
  if (eventId == null) return false;
  final dynamic s = session;
  final int? memberId = s.authenticatedUserId as int?;
  if (memberId == null) return false;

  // Check admin role first (using cache)
  if (await isAdmin(session)) return true;

  // Trip leader status requires a database check
  final rel = await EventTripLeader.db.findFirstRow(
    session,
    where: (t) => t.eventId.equals(eventId) & t.userId.equals(memberId),
  );
  return rel != null;
}

Future<bool> isTripLeader(Session session) async {
  final dynamic s = session;
  final int? memberId = s.authenticatedUserId as int?;
  if (memberId == null) return false;
  return await _cache.hasRole(session, memberId, MemberRole.tripLeader);
}

// Can the member create an event in this section?
Future<bool> isEventCreator(Session session, int? sectionId) async {
  if (sectionId == null) return false;

  // Check roles in order of privilege and cache efficiency
  if (await isAdmin(session)) return true;
  if (await isSectionManager(session, sectionId)) return true;
  // Check if member has trip leader role
  if (await isTripLeader(session)) return true;
  return false;
}

Future<bool> isEventEditor(Session session, int? eventId, int? sectionId) async {
  if (await isAdmin(session)) return true;
  if (await isSectionManager(session, sectionId)) return true;
  if (await isTripLeaderForEvent(session, eventId)) return true;
  return false;
}

/// Call this when roles or section memberships change to invalidate the cache
void invalidateMemberCache(int memberId) {
  _cache.invalidateMember(memberId);
}
