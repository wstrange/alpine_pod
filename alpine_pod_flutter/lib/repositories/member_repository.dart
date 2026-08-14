import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';
import 'package:serverpod_database/serverpod_database.dart';
import '../services/connectivity_service.dart';
import '../services/sync_service.dart';
import '../signals.dart';

final _log = Logger('MemberRepository');
final memberRepository = MemberRepository();

class MemberRepository {
  /// Gets the member profile for the current user from local cache (or server if cache is bypassed).
  Future<Member?> getCurrentMember() async {
    if (useClientCacheSignal.value) {
      try {
        final members = await Member.db.find(dbSession, limit: 1);
        if (members.isNotEmpty) return members.first;
      } catch (e) {
        _log.warning('Failed to load member from local cache: $e');
      }

      if (isOnlineSignal.value) {
        return await syncService.syncCurrentMember();
      }
    } else {
      if (isOnlineSignal.value) {
        try {
          return await client.member.getCurrentMember();
        } catch (e) {
          _log.warning('Failed to fetch current member directly from server: $e');
        }
      }
    }
    return null;
  }

  /// Gets all section memberships for the current user from local cache (or server if cache is bypassed).
  Future<List<SectionMembership>> getAllMySectionMemberships() async {
    if (useClientCacheSignal.value) {
      try {
        final memberships = await SectionMembership.db.find(
          dbSession,
          where: (t) => Constant.bool(true),
          include: SectionMembership.include(section: Section.include()),
        );
        if (memberships.isNotEmpty || !isOnlineSignal.value) {
          return memberships;
        }
      } catch (e) {
        _log.warning('Failed to load section memberships from local cache: $e');
      }

      if (isOnlineSignal.value) {
        await syncService.syncSectionsAndMemberships();
        return await SectionMembership.db.find(
          dbSession,
          include: SectionMembership.include(section: Section.include()),
        );
      }
    } else {
      if (isOnlineSignal.value) {
        try {
          return await client.member.getAllMySectionMemberships();
        } catch (e) {
          _log.warning(
            'Failed to fetch section memberships directly from server: $e',
          );
        }
      }
    }
    return [];
  }

  /// Updates member profile via server and syncs local cache.
  Future<Member> updateMember(Member member) async {
    if (!isOnlineSignal.value) {
      throw Exception(
        'You are currently offline. Profile updates require an internet connection.',
      );
    }

    final updated = await client.member.updateMember(member);
    if (useClientCacheSignal.value) {
      await syncService.syncCurrentMember();
    }
    return updated;
  }

  /// Signs waiver via server and syncs member profile cache.
  Future<Member> signWaiver() async {
    if (!isOnlineSignal.value) {
      throw Exception(
        'You are currently offline. Signing waiver requires an internet connection.',
      );
    }

    final member = await client.member.acceptWaiver();
    if (useClientCacheSignal.value) {
      await syncService.syncCurrentMember();
    }
    return member;
  }

  /// Gets section members for a specific section ID from local cache or server.
  Future<List<Member>> getSectionMembers({
    UuidValue? sectionId,
    String? filter,
    int limit = 50,
    int offset = 0,
  }) async {
    if (useClientCacheSignal.value) {
      try {
        if (sectionId != null) {
          final memberships = await SectionMembership.db.find(
            dbSession,
            where: (t) {
              Expression expr = t.sectionId.equals(sectionId);
              if (filter != null && filter.isNotEmpty) {
                expr =
                    expr &
                    (t.member.firstName.ilike('%$filter%') |
                        t.member.lastName.ilike('%$filter%') |
                        t.member.email.ilike('%$filter%'));
              }
              return expr;
            },
            include: SectionMembership.include(member: Member.include()),
          );

          final members = memberships
              .map((m) => m.member)
              .whereType<Member>()
              .toList();

          if (members.isNotEmpty || !isOnlineSignal.value) {
            return members;
          }
        } else {
          final members = await Member.db.find(
            dbSession,
            where: (t) {
              if (filter != null && filter.isNotEmpty) {
                return t.firstName.ilike('%$filter%') |
                    t.lastName.ilike('%$filter%') |
                    t.email.ilike('%$filter%');
              }
              return Constant.bool(true);
            },
            limit: limit,
            offset: offset,
          );

          if (members.isNotEmpty || !isOnlineSignal.value) {
            return members;
          }
        }
      } catch (e) {
        _log.warning('Failed to load section members from local cache: $e');
      }
    }

    if (isOnlineSignal.value) {
      return await client.member.getSectionMembers(
        sectionId: sectionId,
        filter: filter,
        limit: limit,
        offset: offset,
      );
    }
    return [];
  }
}
