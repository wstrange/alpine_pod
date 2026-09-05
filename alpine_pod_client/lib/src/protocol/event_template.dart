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

abstract class EventTemplate
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  EventTemplate._({
    this.id,
    required this.name,
    required this.description,
    required this.content,
    String? language,
    DateTime? updatedAt,
  }) : language = language ?? 'en',
       updatedAt = updatedAt ?? DateTime.now();

  factory EventTemplate({
    _isc.UuidValue? id,
    required String name,
    required String description,
    required String content,
    String? language,
    DateTime? updatedAt,
  }) = _EventTemplateImpl;

  factory EventTemplate.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventTemplate(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      content: jsonSerialization['content'] as String,
      language: jsonSerialization['language'] as String?,
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _isc.UuidValue? id;

  String name;

  String description;

  String content;

  String language;

  DateTime updatedAt;

  /// Returns a shallow copy of this [EventTemplate]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  EventTemplate copyWith({
    _isc.UuidValue? id,
    String? name,
    String? description,
    String? content,
    String? language,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventTemplate',
      if (id != null) 'id': id?.toJson(),
      'name': name,
      'description': description,
      'content': content,
      'language': language,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EventTemplate',
      if (id != null) 'id': id?.toJson(),
      'name': name,
      'description': description,
      'content': content,
      'language': language,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventTemplateImpl extends EventTemplate {
  _EventTemplateImpl({
    _isc.UuidValue? id,
    required String name,
    required String description,
    required String content,
    String? language,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         name: name,
         description: description,
         content: content,
         language: language,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [EventTemplate]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  EventTemplate copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    String? content,
    String? language,
    DateTime? updatedAt,
  }) {
    return EventTemplate(
      id: id is _isc.UuidValue? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      content: content ?? this.content,
      language: language ?? this.language,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
