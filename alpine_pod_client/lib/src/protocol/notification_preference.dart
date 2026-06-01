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

abstract class NotificationPreference implements _i1.SerializableModel {
  NotificationPreference._({
    this.id,
    required this.userId,
    this.user,
    bool? enableEmail,
    bool? enablePush,
    bool? enableInApp,
  }) : enableEmail = enableEmail ?? true,
       enablePush = enablePush ?? true,
       enableInApp = enableInApp ?? true;

  factory NotificationPreference({
    int? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    bool? enableEmail,
    bool? enablePush,
    bool? enableInApp,
  }) = _NotificationPreferenceImpl;

  factory NotificationPreference.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return NotificationPreference(
      id: jsonSerialization['id'] as int?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.AuthUser>(jsonSerialization['user']),
      enableEmail: jsonSerialization['enableEmail'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['enableEmail']),
      enablePush: jsonSerialization['enablePush'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['enablePush']),
      enableInApp: jsonSerialization['enableInApp'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['enableInApp']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i1.UuidValue userId;

  _i2.AuthUser? user;

  bool enableEmail;

  bool enablePush;

  bool enableInApp;

  /// Returns a shallow copy of this [NotificationPreference]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  NotificationPreference copyWith({
    int? id,
    _i1.UuidValue? userId,
    _i2.AuthUser? user,
    bool? enableEmail,
    bool? enablePush,
    bool? enableInApp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'NotificationPreference',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'enableEmail': enableEmail,
      'enablePush': enablePush,
      'enableInApp': enableInApp,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NotificationPreferenceImpl extends NotificationPreference {
  _NotificationPreferenceImpl({
    int? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    bool? enableEmail,
    bool? enablePush,
    bool? enableInApp,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         enableEmail: enableEmail,
         enablePush: enablePush,
         enableInApp: enableInApp,
       );

  /// Returns a shallow copy of this [NotificationPreference]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  NotificationPreference copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    bool? enableEmail,
    bool? enablePush,
    bool? enableInApp,
  }) {
    return NotificationPreference(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.AuthUser? ? user : this.user?.copyWith(),
      enableEmail: enableEmail ?? this.enableEmail,
      enablePush: enablePush ?? this.enablePush,
      enableInApp: enableInApp ?? this.enableInApp,
    );
  }
}
