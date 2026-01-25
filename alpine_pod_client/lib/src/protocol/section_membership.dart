/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'member.dart' as _i2;
import 'package:alpine_pod_client/src/protocol/protocol.dart' as _i3;

abstract class SectionMembership implements _i1.SerializableModel {
  SectionMembership._({
    this.id,
    required this.memberId,
    this.member,
    required this.sectionId,
    this.externalUserId,
    DateTime? syncedAt,
    this.sourceSystem,
    required this.scopes,
  }) : syncedAt = syncedAt ?? DateTime.now();

  factory SectionMembership({
    int? id,
    required int memberId,
    _i2.Member? member,
    required int sectionId,
    String? externalUserId,
    DateTime? syncedAt,
    String? sourceSystem,
    required Set<String> scopes,
  }) = _SectionMembershipImpl;

  factory SectionMembership.fromJson(Map<String, dynamic> jsonSerialization) {
    return SectionMembership(
      id: jsonSerialization['id'] as int?,
      memberId: jsonSerialization['memberId'] as int,
      member: jsonSerialization['member'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Member>(jsonSerialization['member']),
      sectionId: jsonSerialization['sectionId'] as int,
      externalUserId: jsonSerialization['externalUserId'] as String?,
      syncedAt: jsonSerialization['syncedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['syncedAt']),
      sourceSystem: jsonSerialization['sourceSystem'] as String?,
      scopes: _i3.Protocol().deserialize<Set<String>>(
        jsonSerialization['scopes'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int memberId;

  _i2.Member? member;

  int sectionId;

  String? externalUserId;

  DateTime syncedAt;

  String? sourceSystem;

  Set<String> scopes;

  /// Returns a shallow copy of this [SectionMembership]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SectionMembership copyWith({
    int? id,
    int? memberId,
    _i2.Member? member,
    int? sectionId,
    String? externalUserId,
    DateTime? syncedAt,
    String? sourceSystem,
    Set<String>? scopes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SectionMembership',
      if (id != null) 'id': id,
      'memberId': memberId,
      if (member != null) 'member': member?.toJson(),
      'sectionId': sectionId,
      if (externalUserId != null) 'externalUserId': externalUserId,
      'syncedAt': syncedAt.toJson(),
      if (sourceSystem != null) 'sourceSystem': sourceSystem,
      'scopes': scopes.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SectionMembershipImpl extends SectionMembership {
  _SectionMembershipImpl({
    int? id,
    required int memberId,
    _i2.Member? member,
    required int sectionId,
    String? externalUserId,
    DateTime? syncedAt,
    String? sourceSystem,
    required Set<String> scopes,
  }) : super._(
         id: id,
         memberId: memberId,
         member: member,
         sectionId: sectionId,
         externalUserId: externalUserId,
         syncedAt: syncedAt,
         sourceSystem: sourceSystem,
         scopes: scopes,
       );

  /// Returns a shallow copy of this [SectionMembership]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SectionMembership copyWith({
    Object? id = _Undefined,
    int? memberId,
    Object? member = _Undefined,
    int? sectionId,
    Object? externalUserId = _Undefined,
    DateTime? syncedAt,
    Object? sourceSystem = _Undefined,
    Set<String>? scopes,
  }) {
    return SectionMembership(
      id: id is int? ? id : this.id,
      memberId: memberId ?? this.memberId,
      member: member is _i2.Member? ? member : this.member?.copyWith(),
      sectionId: sectionId ?? this.sectionId,
      externalUserId: externalUserId is String?
          ? externalUserId
          : this.externalUserId,
      syncedAt: syncedAt ?? this.syncedAt,
      sourceSystem: sourceSystem is String? ? sourceSystem : this.sourceSystem,
      scopes: scopes ?? this.scopes.map((e0) => e0).toSet(),
    );
  }
}
