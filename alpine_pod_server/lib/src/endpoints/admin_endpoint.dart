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

  Future<Section?> getSection(Session session, UuidValue id) async {
    return await Section.db.findById(session, id);
  }

  Future<Section> updateSection(Session session, Section section) async {
    await Section.db.updateRow(session, section);
    return section;
  }

  Future<void> deleteSection(Session session, UuidValue id) async {
    await Section.db.deleteWhere(session, where: (t) => t.id.equals(id));
  }

  Future<List<Section>> listSections(Session session) async {
    return await Section.db.find(session);
  }

  // Future<List<Member>> getMembers(Session session, String sectionId) async {
  //   return await Member.db.find(session);
  // }

  Future<Member?> getMember(Session session, UuidValue id) async {
    return await Member.db.findById(session, id);
  }

  Future<void> deleteUser(Session session, UuidValue memberId) async {
    session.log('Deleting user with memberId: $memberId', level: LogLevel.info);

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

      // 2. Delete the auth user record.
      // This will cascade to delete the Member record and EventManager records
      // because of the onDelete: Cascade defined in member.spy.yaml and event_manager.spy.yaml
      await AuthServices.instance.authUsers.delete(
        session,
        authUserId: member.userId,
        transaction: transaction,
      );
    });
  }

  Future<List<NotificationDelivery>> getNotificationDeliveries(
    Session session, {
    int limit = 50,
    int offset = 0,
    String? statusFilter,
  }) async {
    Expression? where;
    if (statusFilter != null && statusFilter.isNotEmpty) {
      where = NotificationDelivery.t.status.equals(statusFilter);
    }
    return await NotificationDelivery.db.find(
      session,
      where: where != null ? (_) => where! : null,
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: limit,
      offset: offset,
      include: NotificationDelivery.include(notification: Notification.include()),
    );
  }

  Future<void> clearNotificationDeliveries(Session session) async {
    await NotificationDelivery.db.deleteWhere(
      session,
      where: (t) => Constant.bool(true),
    );
  }

  Future<void> retryFailedNotifications(Session session) async {
    final failed = await NotificationDelivery.db.find(
      session,
      where: (t) => t.status.equals('failed'),
    );
    for (var delivery in failed) {
      delivery.status = 'pending';
      delivery.attempts = 0;
      delivery.errorMessage = null;
      await NotificationDelivery.db.updateRow(session, delivery);
    }
  }
}

