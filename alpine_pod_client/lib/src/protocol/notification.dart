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

abstract class Notification implements _i1.SerializableModel {
  Notification._({
    this.id,
    required this.title,
    required this.message,
    required this.timestamp,
    required this.read,
    required this.memberId,
    this.attachments,
    this.eventId,
  });

  factory Notification({
    int? id,
    required String title,
    required String message,
    required DateTime timestamp,
    required bool read,
    required int memberId,
    String? attachments,
    int? eventId,
  }) = _NotificationImpl;

  factory Notification.fromJson(Map<String, dynamic> jsonSerialization) {
    return Notification(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      message: jsonSerialization['message'] as String,
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      read: _i1.BoolJsonExtension.fromJson(jsonSerialization['read']),
      memberId: jsonSerialization['memberId'] as int,
      attachments: jsonSerialization['attachments'] as String?,
      eventId: jsonSerialization['eventId'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String message;

  DateTime timestamp;

  bool read;

  int memberId;

  String? attachments;

  int? eventId;

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Notification copyWith({
    int? id,
    String? title,
    String? message,
    DateTime? timestamp,
    bool? read,
    int? memberId,
    String? attachments,
    int? eventId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Notification',
      if (id != null) 'id': id,
      'title': title,
      'message': message,
      'timestamp': timestamp.toJson(),
      'read': read,
      'memberId': memberId,
      if (attachments != null) 'attachments': attachments,
      if (eventId != null) 'eventId': eventId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NotificationImpl extends Notification {
  _NotificationImpl({
    int? id,
    required String title,
    required String message,
    required DateTime timestamp,
    required bool read,
    required int memberId,
    String? attachments,
    int? eventId,
  }) : super._(
         id: id,
         title: title,
         message: message,
         timestamp: timestamp,
         read: read,
         memberId: memberId,
         attachments: attachments,
         eventId: eventId,
       );

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Notification copyWith({
    Object? id = _Undefined,
    String? title,
    String? message,
    DateTime? timestamp,
    bool? read,
    int? memberId,
    Object? attachments = _Undefined,
    Object? eventId = _Undefined,
  }) {
    return Notification(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      read: read ?? this.read,
      memberId: memberId ?? this.memberId,
      attachments: attachments is String? ? attachments : this.attachments,
      eventId: eventId is int? ? eventId : this.eventId,
    );
  }
}
