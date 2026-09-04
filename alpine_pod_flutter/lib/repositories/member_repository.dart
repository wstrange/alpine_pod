import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';
import 'package:serverpod_database/serverpod_database.dart';

import '../services/sync_service.dart';
import '../signals.dart';

final _log = Logger('MemberRepository');
final memberRepository = MemberRepository();

class MemberRepository {
  /// Gets the member profile for the current user from local cache (or server if cache is bypassed or forced).
  Future<Member?> getCurrentMember({bool forceRefresh = false}) async {
    final currentUserId = sessionManager.authInfo?.authUserId;
    if (useClientCacheSignal.value && !forceRefresh) {
      if (currentUserId != null) {
        try {
          final cached = await Member.db.findById(dbSession, currentUserId);
          if (cached != null) {
            currentMemberSignal.value = cached;
            return cached;
          }
        } catch (e) {
          _log.warning('Failed to load member from local cache: $e');
        }
      }

      if (isOnlineSignal.value) {
        try {
          final member = await syncService.syncCurrentMember();
          if (member != null) {
            connectivityService.markServerReachable();
            currentMemberSignal.value = member;
          }
          return member;
        } catch (e) {
          _log.warning('Failed to sync current member: $e');
          connectivityService.markServerUnreachable(error: e);
        }
      }
    } else {
      if (isOnlineSignal.value) {
        try {
          final member = useClientCacheSignal.value
              ? await syncService.syncCurrentMember()
              : await client.member.getCurrentMember();
          if (member != null) {
            connectivityService.markServerReachable();
            currentMemberSignal.value = member;
            return member;
          }
        } catch (e) {
          _log.warning(
            'Failed to fetch current member directly from server: $e',
          );
          connectivityService.markServerUnreachable(error: e);
        }
      }
      if (currentUserId != null) {
        try {
          final cached = await Member.db.findById(dbSession, currentUserId);
          if (cached != null) {
            currentMemberSignal.value = cached;
            return cached;
          }
        } catch (_) {}
      }
    }
    return null;
  }

  /// Gets all section memberships for the current user from local cache (or server if cache is bypassed or forced).
  Future<List<SectionMembership>> getAllMySectionMemberships({
    bool forceRefresh = false,
  }) async {
    final member = currentMemberSignal.value ?? await getCurrentMember();
    final memberId = member?.id ?? sessionManager.authInfo?.authUserId;

    if (useClientCacheSignal.value && !forceRefresh && memberId != null) {
      try {
        final memberships = await SectionMembership.db.find(
          dbSession,
          where: (t) => t.memberId.equals(memberId),
          include: SectionMembership.include(section: Section.include()),
        );
        if (memberships.isNotEmpty || !isOnlineSignal.value) {
          return memberships;
        }
      } catch (e) {
        _log.warning('Failed to load section memberships from local cache: $e');
      }

      if (isOnlineSignal.value) {
        try {
          await syncService.syncSectionsAndMemberships();
          connectivityService.markServerReachable();
          return await SectionMembership.db.find(
            dbSession,
            where: (t) => t.memberId.equals(memberId),
            include: SectionMembership.include(section: Section.include()),
          );
        } catch (e) {
          _log.warning('Failed to sync section memberships: $e');
          connectivityService.markServerUnreachable(error: e);
          try {
            return await SectionMembership.db.find(
              dbSession,
              where: (t) => t.memberId.equals(memberId),
              include: SectionMembership.include(section: Section.include()),
            );
          } catch (_) {}
        }
      }
    } else {
      if (isOnlineSignal.value) {
        try {
          if (useClientCacheSignal.value) {
            await syncService.syncSectionsAndMemberships();
            connectivityService.markServerReachable();
            if (memberId != null) {
              return await SectionMembership.db.find(
                dbSession,
                where: (t) => t.memberId.equals(memberId),
                include: SectionMembership.include(section: Section.include()),
              );
            }
          } else {
            final memberships = await client.member
                .getAllMySectionMemberships();
            connectivityService.markServerReachable();
            return memberships;
          }
        } catch (e) {
          _log.warning(
            'Failed to fetch section memberships directly from server: $e',
          );
          connectivityService.markServerUnreachable(error: e);
        }
      }
      if (memberId != null) {
        try {
          return await SectionMembership.db.find(
            dbSession,
            where: (t) => t.memberId.equals(memberId),
            include: SectionMembership.include(section: Section.include()),
          );
        } catch (_) {}
      }
    }
    return [];
  }

  /// Updates member profile via server and syncs local cache.
  Future<Member> updateMember(Member member) async {
    if (!isOnlineSignal.value) {
      if (isNetworkConnectedSignal.value) {
        await connectivityService.checkServerReachability();
      }
      if (!isOnlineSignal.value) {
        throw Exception(
          'You are currently offline. Profile updates require an internet connection.',
        );
      }
    }

    final updated = await client.member.updateMember(member);
    if (useClientCacheSignal.value) {
      await syncService.syncCurrentMember();
    }
    currentMemberSignal.value = updated;
    return updated;
  }

  /// Signs waiver via server and syncs member profile cache.
  Future<Member> signWaiver() async {
    if (!isOnlineSignal.value) {
      if (isNetworkConnectedSignal.value) {
        await connectivityService.checkServerReachability();
      }
      if (!isOnlineSignal.value) {
        throw Exception(
          'You are currently offline. Signing waiver requires an internet connection.',
        );
      }
    }

    final member = await client.member.acceptWaiver();
    if (useClientCacheSignal.value) {
      await syncService.syncCurrentMember();
    }
    currentMemberSignal.value = member;
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
      try {
        final members = await client.member.getSectionMembers(
          sectionId: sectionId,
          filter: filter,
          limit: limit,
          offset: offset,
        );
        connectivityService.markServerReachable();
        return members;
      } catch (e) {
        _log.warning('Failed to fetch section members from server: $e');
        connectivityService.markServerUnreachable(error: e);
      }
    }
    return [];
  }

  /// Gets a single member by ID from cache or server.
  Future<Member?> getMember(UuidValue memberId) async {
    if (useClientCacheSignal.value) {
      try {
        final cached = await Member.db.findById(dbSession, memberId);
        if (cached != null || !isOnlineSignal.value) return cached;
      } catch (e) {
        _log.warning('Failed to load member from local cache: $e');
      }
    }

    if (isOnlineSignal.value) {
      try {
        final member = await client.member.getMember(memberId);
        if (member != null) {
          connectivityService.markServerReachable();
          if (useClientCacheSignal.value) {
            final existing = await Member.db.findById(dbSession, member.id);
            if (existing != null) {
              await Member.db.updateRow(dbSession, member);
            } else {
              await Member.db.insertRow(dbSession, member);
            }
          }
        }
        return member;
      } catch (e) {
        _log.warning('Failed to fetch member from server: $e');
        connectivityService.markServerUnreachable(error: e);
        try {
          return await Member.db.findById(dbSession, memberId);
        } catch (_) {}
      }
    } else {
      try {
        return await Member.db.findById(dbSession, memberId);
      } catch (_) {}
    }
    return null;
  }

  /// Gets section memberships (with member details) for a specific section from local cache or server.
  Future<List<SectionMembership>> getSectionMemberships({
    required UuidValue sectionId,
    String? filter,
    int limit = 50,
    int offset = 0,
    bool forceRefresh = false,
  }) async {
    if (!isOnlineSignal.value) {
      try {
        return await SectionMembership.db.find(
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
          limit: limit,
          offset: offset,
        );
      } catch (e) {
        _log.warning('Failed to load section memberships from local cache: $e');
        return [];
      }
    }

    if (isOnlineSignal.value) {
      try {
        final memberships = await client.member.getSectionMemberships(
          sectionId,
          filter: filter,
          limit: limit,
          offset: offset,
        );
        connectivityService.markServerReachable();

        if (useClientCacheSignal.value) {
          for (final m in memberships) {
            if (m.member != null) {
              final existingMember = await Member.db.findById(
                dbSession,
                m.member!.id,
              );
              if (existingMember != null) {
                await Member.db.updateRow(dbSession, m.member!);
              } else {
                final existingByEmail = await Member.db.findFirstRow(
                  dbSession,
                  where: (t) => t.email.equals(m.member!.email),
                );
                if (existingByEmail != null) {
                  await Member.db.deleteRow(dbSession, existingByEmail);
                }
                await Member.db.insertRow(dbSession, m.member!);
              }
            }
            final id = m.id;
            if (id != null) {
              final existing = await SectionMembership.db.findById(
                dbSession,
                id,
              );
              if (existing != null) {
                await SectionMembership.db.updateRow(dbSession, m);
                continue;
              }
            }
            final existingByKey = await SectionMembership.db.findFirstRow(
              dbSession,
              where: (t) =>
                  t.memberId.equals(m.memberId) &
                  t.sectionId.equals(m.sectionId),
            );
            if (existingByKey != null) {
              await SectionMembership.db.deleteRow(dbSession, existingByKey);
            }
            await SectionMembership.db.insertRow(dbSession, m);
          }
        }
        return memberships;
      } catch (e) {
        _log.warning('Failed to fetch section memberships from server: $e');
        connectivityService.markServerUnreachable(error: e);
        try {
          return await SectionMembership.db.find(
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
            limit: limit,
            offset: offset,
          );
        } catch (_) {}
      }
    }
    return [];
  }
}
