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
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i2;
import 'package:alpine_pod_client/src/protocol/protocol.dart' as _i3;

abstract class EventTripLeader implements _i1.SerializableModel {
  EventTripLeader._({
    this.id,
    this.eventId,
    required this.userId,
    this.user,
    this.assignedAt,
  });

  factory EventTripLeader({
    int? id,
    int? eventId,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    DateTime? assignedAt,
  }) = _EventTripLeaderImpl;

  factory EventTripLeader.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventTripLeader(
      id: jsonSerialization['id'] as int?,
      eventId: jsonSerialization['eventId'] as int?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.AuthUser>(jsonSerialization['user']),
      assignedAt: jsonSerialization['assignedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['assignedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? eventId;

  _i1.UuidValue userId;

  _i2.AuthUser? user;

  DateTime? assignedAt;

  /// Returns a shallow copy of this [EventTripLeader]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EventTripLeader copyWith({
    int? id,
    int? eventId,
    _i1.UuidValue? userId,
    _i2.AuthUser? user,
    DateTime? assignedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventTripLeader',
      if (id != null) 'id': id,
      if (eventId != null) 'eventId': eventId,
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      if (assignedAt != null) 'assignedAt': assignedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventTripLeaderImpl extends EventTripLeader {
  _EventTripLeaderImpl({
    int? id,
    int? eventId,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    DateTime? assignedAt,
  }) : super._(
         id: id,
         eventId: eventId,
         userId: userId,
         user: user,
         assignedAt: assignedAt,
       );

  /// Returns a shallow copy of this [EventTripLeader]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventTripLeader copyWith({
    Object? id = _Undefined,
    Object? eventId = _Undefined,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    Object? assignedAt = _Undefined,
  }) {
    return EventTripLeader(
      id: id is int? ? id : this.id,
      eventId: eventId is int? ? eventId : this.eventId,
      userId: userId ?? this.userId,
      user: user is _i2.AuthUser? ? user : this.user?.copyWith(),
      assignedAt: assignedAt is DateTime? ? assignedAt : this.assignedAt,
    );
  }
}
