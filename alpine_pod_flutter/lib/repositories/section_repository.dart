import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';
import '../services/connectivity_service.dart';
import '../services/sync_service.dart';
import '../signals.dart';

final _log = Logger('SectionRepository');
final sectionRepository = SectionRepository();

class SectionRepository {
  /// Gets all sections from local SQLite cache, or syncs from server if online.
  Future<List<Section>> listSections() async {
    try {
      final cachedSections = await Section.db.find(dbSession, orderBy: (t) => t.name);
      if (cachedSections.isNotEmpty || !isOnlineSignal.value) {
        return cachedSections;
      }
    } catch (e) {
      _log.warning('Failed to load sections from local cache: $e');
    }

    if (isOnlineSignal.value) {
      await syncService.syncSectionsAndMemberships();
      return await Section.db.find(dbSession, orderBy: (t) => t.name);
    }
    return [];
  }

  /// Gets section membership for a specific section ID from local cache or server.
  Future<SectionMembership?> getMySectionMembership(UuidValue sectionId) async {
    try {
      final member = currentMemberSignal.value;
      if (member != null) {
        final membership = await SectionMembership.db.findFirstRow(
          dbSession,
          where: (t) => t.memberId.equals(member.id) & t.sectionId.equals(sectionId),
        );
        if (membership != null || !isOnlineSignal.value) {
          return membership;
        }
      }
    } catch (e) {
      _log.warning('Failed to load my section membership from cache: $e');
    }

    if (isOnlineSignal.value) {
      return await client.member.getMySectionMembership(sectionId);
    }
    return null;
  }
}
