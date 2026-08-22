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
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class FcmToken
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  FcmToken._({
    _isc.UuidValue? id,
    required this.token,
    this.deviceId,
    DateTime? updatedAt,
  }) : id = id ?? const _isc.Uuid().v7obj(),
       updatedAt = updatedAt ?? DateTime.now();

  factory FcmToken({
    _isc.UuidValue? id,
    required String token,
    String? deviceId,
    DateTime? updatedAt,
  }) = _FcmTokenImpl;

  factory FcmToken.fromJson(Map<String, dynamic> jsonSerialization) {
    return FcmToken(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      token: jsonSerialization['token'] as String,
      deviceId: jsonSerialization['deviceId'] as String?,
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The id of the object.
  _isc.UuidValue id;

  String token;

  String? deviceId;

  DateTime updatedAt;

  /// Returns a shallow copy of this [FcmToken]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  FcmToken copyWith({
    _isc.UuidValue? id,
    String? token,
    String? deviceId,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'FcmToken',
      'id': id.toJson(),
      'token': token,
      if (deviceId != null) 'deviceId': deviceId,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'FcmToken',
      'id': id.toJson(),
      'token': token,
      if (deviceId != null) 'deviceId': deviceId,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FcmTokenImpl extends FcmToken {
  _FcmTokenImpl({
    _isc.UuidValue? id,
    required String token,
    String? deviceId,
    DateTime? updatedAt,
  }) : super._(id: id, token: token, deviceId: deviceId, updatedAt: updatedAt);

  /// Returns a shallow copy of this [FcmToken]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  FcmToken copyWith({
    _isc.UuidValue? id,
    String? token,
    Object? deviceId = _Undefined,
    DateTime? updatedAt,
  }) {
    return FcmToken(
      id: id ?? this.id,
      token: token ?? this.token,
      deviceId: deviceId is String? ? deviceId : this.deviceId,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
