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

abstract class NotificationTemplate implements _i1.SerializableModel {
  NotificationTemplate._({
    this.id,
    required this.name,
    required this.titleTemplate,
    required this.bodyTemplate,
    this.htmlTemplate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationTemplate({
    _i1.UuidValue? id,
    required String name,
    required String titleTemplate,
    required String bodyTemplate,
    String? htmlTemplate,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _NotificationTemplateImpl;

  factory NotificationTemplate.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return NotificationTemplate(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      titleTemplate: jsonSerialization['titleTemplate'] as String,
      bodyTemplate: jsonSerialization['bodyTemplate'] as String,
      htmlTemplate: jsonSerialization['htmlTemplate'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  String name;

  String titleTemplate;

  String bodyTemplate;

  String? htmlTemplate;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [NotificationTemplate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  NotificationTemplate copyWith({
    _i1.UuidValue? id,
    String? name,
    String? titleTemplate,
    String? bodyTemplate,
    String? htmlTemplate,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'NotificationTemplate',
      if (id != null) 'id': id?.toJson(),
      'name': name,
      'titleTemplate': titleTemplate,
      'bodyTemplate': bodyTemplate,
      if (htmlTemplate != null) 'htmlTemplate': htmlTemplate,
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

class _NotificationTemplateImpl extends NotificationTemplate {
  _NotificationTemplateImpl({
    _i1.UuidValue? id,
    required String name,
    required String titleTemplate,
    required String bodyTemplate,
    String? htmlTemplate,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
         id: id,
         name: name,
         titleTemplate: titleTemplate,
         bodyTemplate: bodyTemplate,
         htmlTemplate: htmlTemplate,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [NotificationTemplate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  NotificationTemplate copyWith({
    Object? id = _Undefined,
    String? name,
    String? titleTemplate,
    String? bodyTemplate,
    Object? htmlTemplate = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return NotificationTemplate(
      id: id is _i1.UuidValue? ? id : this.id,
      name: name ?? this.name,
      titleTemplate: titleTemplate ?? this.titleTemplate,
      bodyTemplate: bodyTemplate ?? this.bodyTemplate,
      htmlTemplate: htmlTemplate is String? ? htmlTemplate : this.htmlTemplate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
