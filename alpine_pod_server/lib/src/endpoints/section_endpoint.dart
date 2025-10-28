import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../custom_scopes.dart';

class SectionEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
  @override
  Set<Scope> get requiredScopes => {Scope.admin};

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
}
