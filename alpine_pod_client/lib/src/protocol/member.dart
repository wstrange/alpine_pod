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
import 'member_role.dart' as _i2;

abstract class Member implements _i1.SerializableModel {
  Member._({
    this.id,
    required this.firstName,
    required this.lastName,
    this.userInfoId,
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
    required this.updatedAt,
  });

  factory Member({
    int? id,
    required String firstName,
    required String lastName,
    int? userInfoId,
    required String email,
    required String password,
    required String phoneNumber,
    required String membershipStatus,
    String? profilePictureUrl,
    required String emergencyContactName,
    required String emergencyContactPhone,
    String? medicalConditions,
    String? certifications,
    required _i2.MemberRole role,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _MemberImpl;

  factory Member.fromJson(Map<String, dynamic> jsonSerialization) {
    return Member(
      id: jsonSerialization['id'] as int?,
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      userInfoId: jsonSerialization['userInfoId'] as int?,
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
      role: _i2.MemberRole.fromJson((jsonSerialization['role'] as int)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String firstName;

  String lastName;

  int? userInfoId;

  String email;

  String password;

  String phoneNumber;

  String membershipStatus;

  String? profilePictureUrl;

  String emergencyContactName;

  String emergencyContactPhone;

  String? medicalConditions;

  String? certifications;

  _i2.MemberRole role;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Member]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Member copyWith({
    int? id,
    String? firstName,
    String? lastName,
    int? userInfoId,
    String? email,
    String? password,
    String? phoneNumber,
    String? membershipStatus,
    String? profilePictureUrl,
    String? emergencyContactName,
    String? emergencyContactPhone,
    String? medicalConditions,
    String? certifications,
    _i2.MemberRole? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'firstName': firstName,
      'lastName': lastName,
      if (userInfoId != null) 'userInfoId': userInfoId,
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
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MemberImpl extends Member {
  _MemberImpl({
    int? id,
    required String firstName,
    required String lastName,
    int? userInfoId,
    required String email,
    required String password,
    required String phoneNumber,
    required String membershipStatus,
    String? profilePictureUrl,
    required String emergencyContactName,
    required String emergencyContactPhone,
    String? medicalConditions,
    String? certifications,
    required _i2.MemberRole role,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          firstName: firstName,
          lastName: lastName,
          userInfoId: userInfoId,
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
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Member]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Member copyWith({
    Object? id = _Undefined,
    String? firstName,
    String? lastName,
    Object? userInfoId = _Undefined,
    String? email,
    String? password,
    String? phoneNumber,
    String? membershipStatus,
    Object? profilePictureUrl = _Undefined,
    String? emergencyContactName,
    String? emergencyContactPhone,
    Object? medicalConditions = _Undefined,
    Object? certifications = _Undefined,
    _i2.MemberRole? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Member(
      id: id is int? ? id : this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userInfoId: userInfoId is int? ? userInfoId : this.userInfoId,
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
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
