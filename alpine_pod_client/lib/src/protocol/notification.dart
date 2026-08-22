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
import 'package:alpine_pod_client/src/protocol/protocol.dart' as _iib3gdw5;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'notification_template.dart' as _ikosvoxr;

abstract class Notification
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Notification._({
    this.id,
    required this.templateId,
    this.template,
    required this.data,
    this.actionUrl,
    required this.renderedTitle,
    required this.renderedBody,
    this.renderedHtml,
    required this.createdAt,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  factory Notification({
    _isc.UuidValue? id,
    required _isc.UuidValue templateId,
    _ikosvoxr.NotificationTemplate? template,
    required Map<String, String> data,
    String? actionUrl,
    required String renderedTitle,
    required String renderedBody,
    String? renderedHtml,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _NotificationImpl;

  factory Notification.fromJson(Map<String, dynamic> jsonSerialization) {
    return Notification(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      templateId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['templateId'],
      ),
      template: jsonSerialization['template'] == null
          ? null
          : _iib3gdw5.Protocol().deserialize<_ikosvoxr.NotificationTemplate>(
              jsonSerialization['template'],
            ),
      data: _iib3gdw5.Protocol().deserialize<Map<String, String>>(
        jsonSerialization['data'],
      ),
      actionUrl: jsonSerialization['actionUrl'] as String?,
      renderedTitle: jsonSerialization['renderedTitle'] as String,
      renderedBody: jsonSerialization['renderedBody'] as String,
      renderedHtml: jsonSerialization['renderedHtml'] as String?,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  _isc.UuidValue templateId;

  _ikosvoxr.NotificationTemplate? template;

  Map<String, String> data;

  String? actionUrl;

  String renderedTitle;

  String renderedBody;

  String? renderedHtml;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Notification copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? templateId,
    _ikosvoxr.NotificationTemplate? template,
    Map<String, String>? data,
    String? actionUrl,
    String? renderedTitle,
    String? renderedBody,
    String? renderedHtml,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Notification',
      if (id != null) 'id': id?.toJson(),
      'templateId': templateId.toJson(),
      if (template != null) 'template': template?.toJson(),
      'data': data.toJson(),
      if (actionUrl != null) 'actionUrl': actionUrl,
      'renderedTitle': renderedTitle,
      'renderedBody': renderedBody,
      if (renderedHtml != null) 'renderedHtml': renderedHtml,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Notification',
      if (id != null) 'id': id?.toJson(),
      'templateId': templateId.toJson(),
      if (template != null) 'template': template?.toJsonForProtocol(),
      'data': data.toJson(),
      if (actionUrl != null) 'actionUrl': actionUrl,
      'renderedTitle': renderedTitle,
      'renderedBody': renderedBody,
      if (renderedHtml != null) 'renderedHtml': renderedHtml,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NotificationImpl extends Notification {
  _NotificationImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue templateId,
    _ikosvoxr.NotificationTemplate? template,
    required Map<String, String> data,
    String? actionUrl,
    required String renderedTitle,
    required String renderedBody,
    String? renderedHtml,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         templateId: templateId,
         template: template,
         data: data,
         actionUrl: actionUrl,
         renderedTitle: renderedTitle,
         renderedBody: renderedBody,
         renderedHtml: renderedHtml,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Notification copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? templateId,
    Object? template = _Undefined,
    Map<String, String>? data,
    Object? actionUrl = _Undefined,
    String? renderedTitle,
    String? renderedBody,
    Object? renderedHtml = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Notification(
      id: id is _isc.UuidValue? ? id : this.id,
      templateId: templateId ?? this.templateId,
      template: template is _ikosvoxr.NotificationTemplate?
          ? template
          : this.template?.copyWith(),
      data: data ?? this.data.map((key0, value0) => MapEntry(key0, value0)),
      actionUrl: actionUrl is String? ? actionUrl : this.actionUrl,
      renderedTitle: renderedTitle ?? this.renderedTitle,
      renderedBody: renderedBody ?? this.renderedBody,
      renderedHtml: renderedHtml is String? ? renderedHtml : this.renderedHtml,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
