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

abstract class EventTypeSubscription implements _i1.SerializableModel {
  EventTypeSubscription._({
    this.id,
    required this.userId,
    this.user,
    required this.eventType,
  });

  factory EventTypeSubscription({
    int? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    required String eventType,
  }) = _EventTypeSubscriptionImpl;

  factory EventTypeSubscription.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return EventTypeSubscription(
      id: jsonSerialization['id'] as int?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.AuthUser>(jsonSerialization['user']),
      eventType: jsonSerialization['eventType'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i1.UuidValue userId;

  _i2.AuthUser? user;

  String eventType;

  /// Returns a shallow copy of this [EventTypeSubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EventTypeSubscription copyWith({
    int? id,
    _i1.UuidValue? userId,
    _i2.AuthUser? user,
    String? eventType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventTypeSubscription',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'eventType': eventType,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventTypeSubscriptionImpl extends EventTypeSubscription {
  _EventTypeSubscriptionImpl({
    int? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    required String eventType,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         eventType: eventType,
       );

  /// Returns a shallow copy of this [EventTypeSubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventTypeSubscription copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    String? eventType,
  }) {
    return EventTypeSubscription(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.AuthUser? ? user : this.user?.copyWith(),
      eventType: eventType ?? this.eventType,
    );
  }
}
