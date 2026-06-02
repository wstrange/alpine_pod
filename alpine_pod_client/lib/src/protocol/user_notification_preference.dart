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

abstract class UserNotificationPreference implements _i1.SerializableModel {
  UserNotificationPreference._({
    this.id,
    required this.userId,
    this.user,
    required this.notificationType,
    bool? allowInApp,
    bool? allowEmail,
    bool? allowPush,
  }) : allowInApp = allowInApp ?? true,
       allowEmail = allowEmail ?? true,
       allowPush = allowPush ?? true;

  factory UserNotificationPreference({
    int? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    required String notificationType,
    bool? allowInApp,
    bool? allowEmail,
    bool? allowPush,
  }) = _UserNotificationPreferenceImpl;

  factory UserNotificationPreference.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UserNotificationPreference(
      id: jsonSerialization['id'] as int?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.AuthUser>(jsonSerialization['user']),
      notificationType: jsonSerialization['notificationType'] as String,
      allowInApp: jsonSerialization['allowInApp'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['allowInApp']),
      allowEmail: jsonSerialization['allowEmail'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['allowEmail']),
      allowPush: jsonSerialization['allowPush'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['allowPush']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i1.UuidValue userId;

  _i2.AuthUser? user;

  String notificationType;

  bool allowInApp;

  bool allowEmail;

  bool allowPush;

  /// Returns a shallow copy of this [UserNotificationPreference]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserNotificationPreference copyWith({
    int? id,
    _i1.UuidValue? userId,
    _i2.AuthUser? user,
    String? notificationType,
    bool? allowInApp,
    bool? allowEmail,
    bool? allowPush,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserNotificationPreference',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'notificationType': notificationType,
      'allowInApp': allowInApp,
      'allowEmail': allowEmail,
      'allowPush': allowPush,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserNotificationPreferenceImpl extends UserNotificationPreference {
  _UserNotificationPreferenceImpl({
    int? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    required String notificationType,
    bool? allowInApp,
    bool? allowEmail,
    bool? allowPush,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         notificationType: notificationType,
         allowInApp: allowInApp,
         allowEmail: allowEmail,
         allowPush: allowPush,
       );

  /// Returns a shallow copy of this [UserNotificationPreference]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserNotificationPreference copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    String? notificationType,
    bool? allowInApp,
    bool? allowEmail,
    bool? allowPush,
  }) {
    return UserNotificationPreference(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.AuthUser? ? user : this.user?.copyWith(),
      notificationType: notificationType ?? this.notificationType,
      allowInApp: allowInApp ?? this.allowInApp,
      allowEmail: allowEmail ?? this.allowEmail,
      allowPush: allowPush ?? this.allowPush,
    );
  }
}
