import 'package:serverpod/serverpod.dart';
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
}
