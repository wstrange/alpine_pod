/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class SectionMembership implements _i1.SerializableModel {
  SectionMembership._({
    this.id,
    this.userId,
    this.sectionId,
    this.externalUserId,
    this.syncedAt,
    this.sourceSystem,
  });

  factory SectionMembership({
    int? id,
    int? userId,
    int? sectionId,
    String? externalUserId,
    DateTime? syncedAt,
    String? sourceSystem,
  }) = _SectionMembershipImpl;

  factory SectionMembership.fromJson(Map<String, dynamic> jsonSerialization) {
    return SectionMembership(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int?,
      sectionId: jsonSerialization['sectionId'] as int?,
      externalUserId: jsonSerialization['externalUserId'] as String?,
      syncedAt: jsonSerialization['syncedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['syncedAt']),
      sourceSystem: jsonSerialization['sourceSystem'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? userId;

  int? sectionId;

  String? externalUserId;

  DateTime? syncedAt;

  String? sourceSystem;

  /// Returns a shallow copy of this [SectionMembership]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SectionMembership copyWith({
    int? id,
    int? userId,
    int? sectionId,
    String? externalUserId,
    DateTime? syncedAt,
    String? sourceSystem,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      if (sectionId != null) 'sectionId': sectionId,
      if (externalUserId != null) 'externalUserId': externalUserId,
      if (syncedAt != null) 'syncedAt': syncedAt?.toJson(),
      if (sourceSystem != null) 'sourceSystem': sourceSystem,
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
    int? userId,
    int? sectionId,
    String? externalUserId,
    DateTime? syncedAt,
    String? sourceSystem,
  }) : super._(
          id: id,
          userId: userId,
          sectionId: sectionId,
          externalUserId: externalUserId,
          syncedAt: syncedAt,
          sourceSystem: sourceSystem,
        );

  /// Returns a shallow copy of this [SectionMembership]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SectionMembership copyWith({
    Object? id = _Undefined,
    Object? userId = _Undefined,
    Object? sectionId = _Undefined,
    Object? externalUserId = _Undefined,
    Object? syncedAt = _Undefined,
    Object? sourceSystem = _Undefined,
  }) {
    return SectionMembership(
      id: id is int? ? id : this.id,
      userId: userId is int? ? userId : this.userId,
      sectionId: sectionId is int? ? sectionId : this.sectionId,
      externalUserId:
          externalUserId is String? ? externalUserId : this.externalUserId,
      syncedAt: syncedAt is DateTime? ? syncedAt : this.syncedAt,
      sourceSystem: sourceSystem is String? ? sourceSystem : this.sourceSystem,
    );
  }
}
