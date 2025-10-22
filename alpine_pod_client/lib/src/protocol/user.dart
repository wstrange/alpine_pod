/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'user_role.dart' as _i2;

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.membershipStatus,
    this.profilePictureUrl,
    required this.emergencyContactName,
    required this.emergencyContactPhone,
    this.medicalConditions,
    this.certifications,
    required this.role,
    required this.createdAt,
  });

  factory User({
    int? id,
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String membershipStatus,
    String? profilePictureUrl,
    required String emergencyContactName,
    required String emergencyContactPhone,
    String? medicalConditions,
    String? certifications,
    required _i2.UserRole role,
    required DateTime createdAt,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      email: jsonSerialization['email'] as String,
      password: jsonSerialization['password'] as String,
      phoneNumber: jsonSerialization['phoneNumber'] as String,
      membershipStatus: jsonSerialization['membershipStatus'] as String,
      profilePictureUrl: jsonSerialization['profilePictureUrl'] as String?,
      emergencyContactName: jsonSerialization['emergencyContactName'] as String,
      emergencyContactPhone:
          jsonSerialization['emergencyContactPhone'] as String,
      medicalConditions: jsonSerialization['medicalConditions'] as String?,
      certifications: jsonSerialization['certifications'] as String?,
      role: _i2.UserRole.fromJson((jsonSerialization['role'] as int)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String email;

  String password;

  String phoneNumber;

  String membershipStatus;

  String? profilePictureUrl;

  String emergencyContactName;

  String emergencyContactPhone;

  String? medicalConditions;

  String? certifications;

  _i2.UserRole role;

  DateTime createdAt;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? phoneNumber,
    String? membershipStatus,
    String? profilePictureUrl,
    String? emergencyContactName,
    String? emergencyContactPhone,
    String? medicalConditions,
    String? certifications,
    _i2.UserRole? role,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'membershipStatus': membershipStatus,
      if (profilePictureUrl != null) 'profilePictureUrl': profilePictureUrl,
      'emergencyContactName': emergencyContactName,
      'emergencyContactPhone': emergencyContactPhone,
      if (medicalConditions != null) 'medicalConditions': medicalConditions,
      if (certifications != null) 'certifications': certifications,
      'role': role.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String membershipStatus,
    String? profilePictureUrl,
    required String emergencyContactName,
    required String emergencyContactPhone,
    String? medicalConditions,
    String? certifications,
    required _i2.UserRole role,
    required DateTime createdAt,
  }) : super._(
          id: id,
          name: name,
          email: email,
          password: password,
          phoneNumber: phoneNumber,
          membershipStatus: membershipStatus,
          profilePictureUrl: profilePictureUrl,
          emergencyContactName: emergencyContactName,
          emergencyContactPhone: emergencyContactPhone,
          medicalConditions: medicalConditions,
          certifications: certifications,
          role: role,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    String? name,
    String? email,
    String? password,
    String? phoneNumber,
    String? membershipStatus,
    Object? profilePictureUrl = _Undefined,
    String? emergencyContactName,
    String? emergencyContactPhone,
    Object? medicalConditions = _Undefined,
    Object? certifications = _Undefined,
    _i2.UserRole? role,
    DateTime? createdAt,
  }) {
    return User(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      membershipStatus: membershipStatus ?? this.membershipStatus,
      profilePictureUrl: profilePictureUrl is String?
          ? profilePictureUrl
          : this.profilePictureUrl,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyContactPhone:
          emergencyContactPhone ?? this.emergencyContactPhone,
      medicalConditions: medicalConditions is String?
          ? medicalConditions
          : this.medicalConditions,
      certifications:
          certifications is String? ? certifications : this.certifications,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
