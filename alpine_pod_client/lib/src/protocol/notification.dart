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
import 'notification_template.dart' as _i2;
import 'package:alpine_pod_client/src/protocol/protocol.dart' as _i3;

abstract class Notification implements _i1.SerializableModel {
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
  });

  factory Notification({
    int? id,
    required int templateId,
    _i2.NotificationTemplate? template,
    required Map<String, String> data,
    String? actionUrl,
    required String renderedTitle,
    required String renderedBody,
    String? renderedHtml,
    required DateTime createdAt,
  }) = _NotificationImpl;

  factory Notification.fromJson(Map<String, dynamic> jsonSerialization) {
    return Notification(
      id: jsonSerialization['id'] as int?,
      templateId: jsonSerialization['templateId'] as int,
      template: jsonSerialization['template'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.NotificationTemplate>(
              jsonSerialization['template'],
            ),
      data: _i3.Protocol().deserialize<Map<String, String>>(
        jsonSerialization['data'],
      ),
      actionUrl: jsonSerialization['actionUrl'] as String?,
      renderedTitle: jsonSerialization['renderedTitle'] as String,
      renderedBody: jsonSerialization['renderedBody'] as String,
      renderedHtml: jsonSerialization['renderedHtml'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int templateId;

  _i2.NotificationTemplate? template;

  Map<String, String> data;

  String? actionUrl;

  String renderedTitle;

  String renderedBody;

  String? renderedHtml;

  DateTime createdAt;

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Notification copyWith({
    int? id,
    int? templateId,
    _i2.NotificationTemplate? template,
    Map<String, String>? data,
    String? actionUrl,
    String? renderedTitle,
    String? renderedBody,
    String? renderedHtml,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Notification',
      if (id != null) 'id': id,
      'templateId': templateId,
      if (template != null) 'template': template?.toJson(),
      'data': data.toJson(),
      if (actionUrl != null) 'actionUrl': actionUrl,
      'renderedTitle': renderedTitle,
      'renderedBody': renderedBody,
      if (renderedHtml != null) 'renderedHtml': renderedHtml,
      'createdAt': createdAt.toJson(),
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
    required int templateId,
    _i2.NotificationTemplate? template,
    required Map<String, String> data,
    String? actionUrl,
    required String renderedTitle,
    required String renderedBody,
    String? renderedHtml,
    required DateTime createdAt,
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
       );

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Notification copyWith({
    Object? id = _Undefined,
    int? templateId,
    Object? template = _Undefined,
    Map<String, String>? data,
    Object? actionUrl = _Undefined,
    String? renderedTitle,
    String? renderedBody,
    Object? renderedHtml = _Undefined,
    DateTime? createdAt,
  }) {
    return Notification(
      id: id is int? ? id : this.id,
      templateId: templateId ?? this.templateId,
      template: template is _i2.NotificationTemplate?
          ? template
          : this.template?.copyWith(),
      data:
          data ??
          this.data.map(
            (
              key0,
              value0,
            ) => MapEntry(
              key0,
              value0,
            ),
          ),
      actionUrl: actionUrl is String? ? actionUrl : this.actionUrl,
      renderedTitle: renderedTitle ?? this.renderedTitle,
      renderedBody: renderedBody ?? this.renderedBody,
      renderedHtml: renderedHtml is String? ? renderedHtml : this.renderedHtml,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
