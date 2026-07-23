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
import 'event.dart' as _i2;
import 'member.dart' as _i3;
import 'package:alpine_pod_client/src/protocol/protocol.dart' as _i4;

abstract class EventManager implements _i1.SerializableModel {
  EventManager._({
    this.id,
    required this.eventId,
    this.event,
    required this.memberId,
    this.member,
    this.assignedAt,
  });

  factory EventManager({
    _i1.UuidValue? id,
    required _i1.UuidValue eventId,
    _i2.Event? event,
    required _i1.UuidValue memberId,
    _i3.Member? member,
    DateTime? assignedAt,
  }) = _EventManagerImpl;

  factory EventManager.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventManager(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      eventId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['eventId'],
      ),
      event: jsonSerialization['event'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Event>(jsonSerialization['event']),
      memberId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['memberId'],
      ),
      member: jsonSerialization['member'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Member>(jsonSerialization['member']),
      assignedAt: jsonSerialization['assignedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['assignedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  _i1.UuidValue eventId;

  _i2.Event? event;

  _i1.UuidValue memberId;

  _i3.Member? member;

  DateTime? assignedAt;

  /// Returns a shallow copy of this [EventManager]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EventManager copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? eventId,
    _i2.Event? event,
    _i1.UuidValue? memberId,
    _i3.Member? member,
    DateTime? assignedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventManager',
      if (id != null) 'id': id?.toJson(),
      'eventId': eventId.toJson(),
      if (event != null) 'event': event?.toJson(),
      'memberId': memberId.toJson(),
      if (member != null) 'member': member?.toJson(),
      if (assignedAt != null) 'assignedAt': assignedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventManagerImpl extends EventManager {
  _EventManagerImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue eventId,
    _i2.Event? event,
    required _i1.UuidValue memberId,
    _i3.Member? member,
    DateTime? assignedAt,
  }) : super._(
         id: id,
         eventId: eventId,
         event: event,
         memberId: memberId,
         member: member,
         assignedAt: assignedAt,
       );

  /// Returns a shallow copy of this [EventManager]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventManager copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? eventId,
    Object? event = _Undefined,
    _i1.UuidValue? memberId,
    Object? member = _Undefined,
    Object? assignedAt = _Undefined,
  }) {
    return EventManager(
      id: id is _i1.UuidValue? ? id : this.id,
      eventId: eventId ?? this.eventId,
      event: event is _i2.Event? ? event : this.event?.copyWith(),
      memberId: memberId ?? this.memberId,
      member: member is _i3.Member? ? member : this.member?.copyWith(),
      assignedAt: assignedAt is DateTime? ? assignedAt : this.assignedAt,
    );
  }
}
