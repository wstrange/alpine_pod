import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import '../generated/protocol.dart';

// These methods are admin only for managing the application state.
//
class AdminEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
  @override
  Set<Scope> get requiredScopes => {Scope.admin};

  /// Section Management

  Future<Section> createSection(Session session, Section section) async {
    var s = await Section.db.insertRow(session, section);
    return s;
  }

  Future<Section?> getSection(Session session, int id) async {
    return await Section.db.findById(session, id);
  }

  Future<Section> updateSection(Session session, Section section) async {
    await Section.db.updateRow(session, section);
    return section;
  }

  Future<void> deleteSection(Session session, int id) async {
    await Section.db.deleteWhere(session, where: (t) => t.id.equals(id));
  }

  Future<List<Section>> listSections(Session session) async {
    return await Section.db.find(session);
  }

  Future<void> deleteUser(Session session, int memberId) async {
    final member = await Member.db.findById(session, memberId);
    if (member == null) {
      throw Exception('Member not found');
    }

    await session.db.transaction((transaction) async {
      // 1. Delete records that do not cascade automatically
      await EventRegistration.db.deleteWhere(
        session,
        where: (t) => t.memberId.equals(memberId),
        transaction: transaction,
      );

      await SectionMembership.db.deleteWhere(
        session,
        where: (t) => t.memberId.equals(memberId),
        transaction: transaction,
      );

      // Delete notifications for this user
      await Notification.db.deleteWhere(
        session,
        where: (t) => t.recipientId.equals(member.userId.toString()),
        transaction: transaction,
      );

      // 2. Delete the auth user record.
      // This will cascade to delete the Member record and EventManager records
      // because of the onDelete: Cascade defined in member.spy.yaml and event_manager.spy.yaml
      await AuthServices.instance.authUsers.delete(
        session,
        authUserId: member.userId,
      );
    });
  }
}
