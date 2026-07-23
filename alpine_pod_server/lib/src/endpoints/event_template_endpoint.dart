import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../member_cache.dart';

class EventTemplateEndpoint extends Endpoint {
  /// Fetches all event templates from the database.
  Future<List<EventTemplate>> listTemplates(Session session) async {
    return await EventTemplate.db.find(
      session,
      orderBy: (t) => t.name,
    );
  }

  /// Creates a new event template. Requires Admin scope.
  Future<EventTemplate> createTemplate(Session session, EventTemplate template) async {
    if (!session.isGlobalAdmin()) {
      throw Exception('Only admins can create templates');
    }
    return await EventTemplate.db.insertRow(session, template);
  }

  /// Updates an existing event template. Requires Admin scope.
  Future<EventTemplate> updateTemplate(Session session, EventTemplate template) async {
    if (!session.isGlobalAdmin()) {
      throw Exception('Only admins can update templates');
    }
    return await EventTemplate.db.updateRow(session, template);
  }

  /// Deletes an event template. Requires Admin scope.
  Future<void> deleteTemplate(Session session, UuidValue id) async {
    if (!session.isGlobalAdmin()) {
      throw Exception('Only admins can delete templates');
    }
    final template = await EventTemplate.db.findById(session, id);
    if (template != null) {
      await EventTemplate.db.deleteRow(session, template);
    }
  }
}
