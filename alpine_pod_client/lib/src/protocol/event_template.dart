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

abstract class EventTemplate implements _i1.SerializableModel {
  EventTemplate._({
    this.id,
    required this.name,
    required this.description,
    required this.content,
    String? language,
  }) : language = language ?? 'en';

  factory EventTemplate({
    int? id,
    required String name,
    required String description,
    required String content,
    String? language,
  }) = _EventTemplateImpl;

  factory EventTemplate.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventTemplate(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      content: jsonSerialization['content'] as String,
      language: jsonSerialization['language'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String description;

  String content;

  String language;

  /// Returns a shallow copy of this [EventTemplate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EventTemplate copyWith({
    int? id,
    String? name,
    String? description,
    String? content,
    String? language,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventTemplate',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'content': content,
      'language': language,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventTemplateImpl extends EventTemplate {
  _EventTemplateImpl({
    int? id,
    required String name,
    required String description,
    required String content,
    String? language,
  }) : super._(
         id: id,
         name: name,
         description: description,
         content: content,
         language: language,
       );

  /// Returns a shallow copy of this [EventTemplate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventTemplate copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    String? content,
    String? language,
  }) {
    return EventTemplate(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      content: content ?? this.content,
      language: language ?? this.language,
    );
  }
}
