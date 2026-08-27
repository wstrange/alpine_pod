import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';

import '../services/sync_service.dart';
import '../signals.dart';

final _log = Logger('SectionRepository');
final sectionRepository = SectionRepository();

class SectionRepository {
  /// Gets all sections from local SQLite cache, or fetches from server if cache is bypassed.
  Future<List<Section>> listSections() async {
    if (useClientCacheSignal.value) {
      try {
        final cachedSections = await Section.db.find(
          dbSession,
          orderBy: (t) => t.name,
        );
        if (cachedSections.isNotEmpty || !isOnlineSignal.value) {
          return cachedSections;
        }
      } catch (e) {
        _log.warning('Failed to load sections from local cache: $e');
      }

      if (isOnlineSignal.value) {
        try {
          await syncService.syncSectionsAndMemberships();
          connectivityService.markServerReachable();
          return await Section.db.find(dbSession, orderBy: (t) => t.name);
        } catch (e) {
          _log.warning('Failed to sync sections: $e');
          connectivityService.markServerUnreachable(error: e);
          try {
            return await Section.db.find(dbSession, orderBy: (t) => t.name);
          } catch (_) {}
        }
      }
    } else {
      if (isOnlineSignal.value) {
        try {
          final sections = await client.section.listSections();
          connectivityService.markServerReachable();
          return sections;
        } catch (e) {
          _log.warning('Failed to fetch sections directly from server: $e');
          connectivityService.markServerUnreachable(error: e);
          try {
            return await Section.db.find(dbSession, orderBy: (t) => t.name);
          } catch (_) {}
        }
      }
    }
    return [];
  }

  /// Gets section membership for a specific section ID from local cache or server.
  Future<SectionMembership?> getMySectionMembership(UuidValue sectionId) async {
    if (useClientCacheSignal.value) {
      try {
        final member = currentMemberSignal.value;
        if (member != null) {
          final membership = await SectionMembership.db.findFirstRow(
            dbSession,
            where: (t) =>
                t.memberId.equals(member.id) & t.sectionId.equals(sectionId),
            include: SectionMembership.include(section: Section.include()),
          );
          if (membership != null || !isOnlineSignal.value) {
            return membership;
          }
        }
      } catch (e) {
        _log.warning('Failed to load my section membership from cache: $e');
      }
    }

    if (isOnlineSignal.value) {
      try {
        final membership = await client.member.getMySectionMembership(
          sectionId,
        );
        connectivityService.markServerReachable();
        return membership;
      } catch (e) {
        _log.warning('Failed to fetch my section membership from server: $e');
        connectivityService.markServerUnreachable(error: e);
        try {
          final member = currentMemberSignal.value;
          if (member != null) {
            return await SectionMembership.db.findFirstRow(
              dbSession,
              where: (t) =>
                  t.memberId.equals(member.id) & t.sectionId.equals(sectionId),
              include: SectionMembership.include(section: Section.include()),
            );
          }
        } catch (_) {}
      }
    }
    return null;
  }
}
