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

abstract class Section implements _i1.SerializableModel {
  Section._({
    this.id,
    required this.name,
    required this.description,
    this.location,
    this.contactInfo,
  });

  factory Section({
    int? id,
    required String name,
    required String description,
    String? location,
    String? contactInfo,
  }) = _SectionImpl;

  factory Section.fromJson(Map<String, dynamic> jsonSerialization) {
    return Section(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      location: jsonSerialization['location'] as String?,
      contactInfo: jsonSerialization['contactInfo'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String description;

  String? location;

  String? contactInfo;

  /// Returns a shallow copy of this [Section]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Section copyWith({
    int? id,
    String? name,
    String? description,
    String? location,
    String? contactInfo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Section',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      if (location != null) 'location': location,
      if (contactInfo != null) 'contactInfo': contactInfo,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SectionImpl extends Section {
  _SectionImpl({
    int? id,
    required String name,
    required String description,
    String? location,
    String? contactInfo,
  }) : super._(
         id: id,
         name: name,
         description: description,
         location: location,
         contactInfo: contactInfo,
       );

  /// Returns a shallow copy of this [Section]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Section copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    Object? location = _Undefined,
    Object? contactInfo = _Undefined,
  }) {
    return Section(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      location: location is String? ? location : this.location,
      contactInfo: contactInfo is String? ? contactInfo : this.contactInfo,
    );
  }
}
