import 'package:serverpod/serverpod.dart';
import 'generated/protocol.dart';

Future<User?> getCurrentUser(Session session) async {
  final dynamic s = session;
  final int? userId = s.authenticatedUserId as int?;
  if (userId == null) return null;
  return await User.db.findById(session, userId);
}

Future<bool> isAdmin(Session session) async {
  final user = await getCurrentUser(session);
  return user != null && user.role == UserRole.admin.name;
}

Future<bool> isSectionManager(Session session, int? sectionId) async {
  if (sectionId == null) return false;
  final user = await getCurrentUser(session);
  if (user == null) return false;
  if (user.role == UserRole.admin.name) return true;
  if (user.role != UserRole.sectionManager.name) return false;
  final membership = await SectionMembership.db.findFirstRow(
    session,
    where: (t) => t.userId.equals(user.id) & t.sectionId.equals(sectionId),
  );
  return membership != null;
}

Future<bool> isTripLeaderForEvent(Session session, int? eventId) async {
  if (eventId == null) return false;
  final user = await getCurrentUser(session);
  if (user == null) return false;
  if (user.role == UserRole.admin.name) return true;
  final rel = await EventTripLeader.db.findFirstRow(
    session,
    where: (t) => t.eventId.equals(eventId) & t.userId.equals(user.id),
  );
  return rel != null;
}

Future<bool> isEventEditor(Session session, int? eventId, int? sectionId) async {
  if (await isAdmin(session)) return true;
  if (await isSectionManager(session, sectionId)) return true;
  if (await isTripLeaderForEvent(session, eventId)) return true;
  return false;
}
