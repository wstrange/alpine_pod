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
import 'notification.dart' as _i3;
import 'package:alpine_pod_client/src/protocol/protocol.dart' as _i4;

abstract class UserNotification
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UserNotification._({
    _i1.UuidValue? id,
    required this.userId,
    this.user,
    required this.notificationId,
    this.notification,
    bool? isRead,
    bool? isSeen,
    this.readAt,
    required this.createdAt,
    DateTime? updatedAt,
  }) : id = id ?? const _i1.Uuid().v7obj(),
       isRead = isRead ?? false,
       isSeen = isSeen ?? false,
       updatedAt = updatedAt ?? DateTime.now();

  factory UserNotification({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    required _i1.UuidValue notificationId,
    _i3.Notification? notification,
    bool? isRead,
    bool? isSeen,
    DateTime? readAt,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _UserNotificationImpl;

  factory UserNotification.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserNotification(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.AuthUser>(jsonSerialization['user']),
      notificationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['notificationId'],
      ),
      notification: jsonSerialization['notification'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Notification>(
              jsonSerialization['notification'],
            ),
      isRead: jsonSerialization['isRead'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['isRead']),
      isSeen: jsonSerialization['isSeen'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['isSeen']),
      readAt: jsonSerialization['readAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['readAt']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The id of the object.
  _i1.UuidValue id;

  _i1.UuidValue userId;

  _i2.AuthUser? user;

  _i1.UuidValue notificationId;

  _i3.Notification? notification;

  bool isRead;

  bool isSeen;

  DateTime? readAt;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [UserNotification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserNotification copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.AuthUser? user,
    _i1.UuidValue? notificationId,
    _i3.Notification? notification,
    bool? isRead,
    bool? isSeen,
    DateTime? readAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserNotification',
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'notificationId': notificationId.toJson(),
      if (notification != null) 'notification': notification?.toJson(),
      'isRead': isRead,
      'isSeen': isSeen,
      if (readAt != null) 'readAt': readAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserNotification',
      'id': id.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'notificationId': notificationId.toJson(),
      if (notification != null)
        'notification': notification?.toJsonForProtocol(),
      'isRead': isRead,
      'isSeen': isSeen,
      if (readAt != null) 'readAt': readAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserNotificationImpl extends UserNotification {
  _UserNotificationImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    required _i1.UuidValue notificationId,
    _i3.Notification? notification,
    bool? isRead,
    bool? isSeen,
    DateTime? readAt,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         notificationId: notificationId,
         notification: notification,
         isRead: isRead,
         isSeen: isSeen,
         readAt: readAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [UserNotification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserNotification copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    _i1.UuidValue? notificationId,
    Object? notification = _Undefined,
    bool? isRead,
    bool? isSeen,
    Object? readAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserNotification(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      user: user is _i2.AuthUser? ? user : this.user?.copyWith(),
      notificationId: notificationId ?? this.notificationId,
      notification: notification is _i3.Notification?
          ? notification
          : this.notification?.copyWith(),
      isRead: isRead ?? this.isRead,
      isSeen: isSeen ?? this.isSeen,
      readAt: readAt is DateTime? ? readAt : this.readAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
