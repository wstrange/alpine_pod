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

abstract class EventDocument implements _i1.SerializableModel {
  EventDocument._({
    this.id,
    this.eventId,
    required this.url,
    this.type,
    this.name,
    this.uploadedAt,
  });

  factory EventDocument({
    int? id,
    int? eventId,
    required String url,
    String? type,
    String? name,
    DateTime? uploadedAt,
  }) = _EventDocumentImpl;

  factory EventDocument.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventDocument(
      id: jsonSerialization['id'] as int?,
      eventId: jsonSerialization['eventId'] as int?,
      url: jsonSerialization['url'] as String,
      type: jsonSerialization['type'] as String?,
      name: jsonSerialization['name'] as String?,
      uploadedAt: jsonSerialization['uploadedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['uploadedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? eventId;

  String url;

  String? type;

  String? name;

  DateTime? uploadedAt;

  /// Returns a shallow copy of this [EventDocument]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EventDocument copyWith({
    int? id,
    int? eventId,
    String? url,
    String? type,
    String? name,
    DateTime? uploadedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventDocument',
      if (id != null) 'id': id,
      if (eventId != null) 'eventId': eventId,
      'url': url,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (uploadedAt != null) 'uploadedAt': uploadedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventDocumentImpl extends EventDocument {
  _EventDocumentImpl({
    int? id,
    int? eventId,
    required String url,
    String? type,
    String? name,
    DateTime? uploadedAt,
  }) : super._(
         id: id,
         eventId: eventId,
         url: url,
         type: type,
         name: name,
         uploadedAt: uploadedAt,
       );

  /// Returns a shallow copy of this [EventDocument]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventDocument copyWith({
    Object? id = _Undefined,
    Object? eventId = _Undefined,
    String? url,
    Object? type = _Undefined,
    Object? name = _Undefined,
    Object? uploadedAt = _Undefined,
  }) {
    return EventDocument(
      id: id is int? ? id : this.id,
      eventId: eventId is int? ? eventId : this.eventId,
      url: url ?? this.url,
      type: type is String? ? type : this.type,
      name: name is String? ? name : this.name,
      uploadedAt: uploadedAt is DateTime? ? uploadedAt : this.uploadedAt,
    );
  }
}
