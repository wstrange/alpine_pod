import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../rbac.dart';

class EventEndpoint extends Endpoint {
  Future<Event> createEvent(Session session, Event event) async {
    final allowed = await isEventEditor(session, null, event.sectionId);
    if (!allowed) throw Exception('Permission denied');
    return await Event.db.insertRow(session, event);
  }

  Future<Event?> getEvent(Session session, int id) async {
    return await Event.db.findById(session, id);
  }

  Future<Event> updateEvent(Session session, Event event) async {
    final existing = await Event.db.findById(session, event.id!);
    if (existing == null) throw Exception('Event not found');
    final allowed = await isEventEditor(session, event.id, existing.sectionId);
    if (!allowed) throw Exception('Permission denied');
    return await Event.db.updateRow(session, event);
  }

  Future<void> deleteEvent(Session session, int id) async {
    final existing = await Event.db.findById(session, id);
    if (existing == null) return;
    final allowed = await isEventEditor(session, id, existing.sectionId);
    if (!allowed) throw Exception('Permission denied');
    await Event.db.deleteRow(session, existing);
  }

  Future<List<Event>> listEvents(Session session, int? sectionId) async {
    if (sectionId != null) {
      return await Event.db.find(session, where: (t) => t.sectionId.equals(sectionId));
    }
    return await Event.db.find(session);
  }
}
