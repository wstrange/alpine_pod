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

abstract class EventTripLeader implements _i1.SerializableModel {
  EventTripLeader._({
    this.id,
    this.eventId,
    this.userId,
    this.assignedAt,
  });

  factory EventTripLeader({
    int? id,
    int? eventId,
    int? userId,
    DateTime? assignedAt,
  }) = _EventTripLeaderImpl;

  factory EventTripLeader.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventTripLeader(
      id: jsonSerialization['id'] as int?,
      eventId: jsonSerialization['eventId'] as int?,
      userId: jsonSerialization['userId'] as int?,
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

  int? userId;

  DateTime? assignedAt;

  /// Returns a shallow copy of this [EventTripLeader]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EventTripLeader copyWith({
    int? id,
    int? eventId,
    int? userId,
    DateTime? assignedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (eventId != null) 'eventId': eventId,
      if (userId != null) 'userId': userId,
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
    int? userId,
    DateTime? assignedAt,
  }) : super._(
          id: id,
          eventId: eventId,
          userId: userId,
          assignedAt: assignedAt,
        );

  /// Returns a shallow copy of this [EventTripLeader]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventTripLeader copyWith({
    Object? id = _Undefined,
    Object? eventId = _Undefined,
    Object? userId = _Undefined,
    Object? assignedAt = _Undefined,
  }) {
    return EventTripLeader(
      id: id is int? ? id : this.id,
      eventId: eventId is int? ? eventId : this.eventId,
      userId: userId is int? ? userId : this.userId,
      assignedAt: assignedAt is DateTime? ? assignedAt : this.assignedAt,
    );
  }
}
