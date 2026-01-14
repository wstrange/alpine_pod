import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import '../generated/protocol.dart';

// Section methods for users. Admins should use AdminEndpoint.
class SectionEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
  // @override
  // Set<Scope> get requiredScopes => {Scope.admin};

  Future<Section?> getSection(Session session, int id) async {
    return await Section.db.findById(session, id);
  }

  Future<List<Section>> listSections(Session session) async {
    return await Section.db.find(session);
  }

  Future<List<Section>> getSectionsForCurrentUser(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      return [];
    }
    final userId = authInfo.authUserId;

    final memberships = await SectionMembership.db.find(
      session,
      where: (t) => t.memberId.equals(userId),
    );

    if (memberships.isEmpty) {
      return [];
    }

    final sectionIds = memberships.map((e) => e.sectionId).toList();

    return await Section.db.find(
      session,
      where: (t) => t.id.inSet(sectionIds.toSet()),
    );
  }
}
