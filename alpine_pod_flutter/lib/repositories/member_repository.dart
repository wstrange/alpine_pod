import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';
import 'package:serverpod_database/serverpod_database.dart';
import '../services/connectivity_service.dart';
import '../services/sync_service.dart';
import '../signals.dart';

final _log = Logger('MemberRepository');

class MemberRepository {
  static final MemberRepository _instance = MemberRepository._internal();
  factory MemberRepository() => _instance;
  MemberRepository._internal();

  /// Gets the member profile for the current user from local cache.
  Future<Member?> getCurrentMember() async {
    try {
      final members = await Member.db.find(dbSession, limit: 1);
      if (members.isNotEmpty) return members.first;
    } catch (e) {
      _log.warning('Failed to load member from local cache: $e');
    }

    if (isOnlineSignal.value) {
      return await syncService.syncCurrentMember();
    }
    return null;
  }

  /// Gets all section memberships for the current user from local cache.
  Future<List<SectionMembership>> getAllMySectionMemberships() async {
    try {
      final memberships = await SectionMembership.db.find(
        dbSession,
        where: (t) => Constant.bool(true),
      );
      if (memberships.isNotEmpty || !isOnlineSignal.value) {
        return memberships;
      }
    } catch (e) {
      _log.warning('Failed to load section memberships from local cache: $e');
    }

    if (isOnlineSignal.value) {
      await syncService.syncSectionsAndMemberships();
      return await SectionMembership.db.find(dbSession);
    }
    return [];
  }

  /// Updates member profile via server and syncs local cache.
  Future<Member> updateMember(Member member) async {
    if (!isOnlineSignal.value) {
      throw Exception('You are currently offline. Profile updates require an internet connection.');
    }

    final updated = await client.member.updateMember(member);
    await syncService.syncCurrentMember();
    return updated;
  }

  /// Signs waiver via server and syncs member profile cache.
  Future<Member> signWaiver() async {
    if (!isOnlineSignal.value) {
      throw Exception('You are currently offline. Signing waiver requires an internet connection.');
    }

    final member = await client.member.acceptWaiver();
    await syncService.syncCurrentMember();
    return member;
  }
}

final memberRepository = MemberRepository();
