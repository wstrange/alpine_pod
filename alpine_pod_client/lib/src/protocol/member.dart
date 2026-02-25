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
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i2;
import 'event_registration.dart' as _i3;
import 'event_manager.dart' as _i4;
import 'package:alpine_pod_client/src/protocol/protocol.dart' as _i5;

abstract class Member implements _i1.SerializableModel {
  Member._({
    this.id,
    required this.userId,
    this.user,
    required this.firstName,
    required this.lastName,
    this.displayName,
    this.bio,
    required this.email,
    required this.phoneNumber,
    String? membershipStatus,
    this.profilePictureUrl,
    required this.emergencyContactName,
    required this.emergencyContactPhone,
    this.medicalConditions,
    bool? isTripAdmin,
    this.certifications,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.registrations,
    this.managedEvents,
  }) : membershipStatus = membershipStatus ?? 'active',
       isTripAdmin = isTripAdmin ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Member({
    int? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    required String firstName,
    required String lastName,
    String? displayName,
    String? bio,
    required String email,
    required String phoneNumber,
    String? membershipStatus,
    String? profilePictureUrl,
    required String emergencyContactName,
    required String emergencyContactPhone,
    String? medicalConditions,
    bool? isTripAdmin,
    String? certifications,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i3.EventRegistration>? registrations,
    List<_i4.EventManager>? managedEvents,
  }) = _MemberImpl;

  factory Member.fromJson(Map<String, dynamic> jsonSerialization) {
    return Member(
      id: jsonSerialization['id'] as int?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.AuthUser>(jsonSerialization['user']),
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      displayName: jsonSerialization['displayName'] as String?,
      bio: jsonSerialization['bio'] as String?,
      email: jsonSerialization['email'] as String,
      phoneNumber: jsonSerialization['phoneNumber'] as String,
      membershipStatus: jsonSerialization['membershipStatus'] as String?,
      profilePictureUrl: jsonSerialization['profilePictureUrl'] as String?,
      emergencyContactName: jsonSerialization['emergencyContactName'] as String,
      emergencyContactPhone:
          jsonSerialization['emergencyContactPhone'] as String,
      medicalConditions: jsonSerialization['medicalConditions'] as String?,
      isTripAdmin: jsonSerialization['isTripAdmin'] as bool?,
      certifications: jsonSerialization['certifications'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      registrations: jsonSerialization['registrations'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i3.EventRegistration>>(
              jsonSerialization['registrations'],
            ),
      managedEvents: jsonSerialization['managedEvents'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i4.EventManager>>(
              jsonSerialization['managedEvents'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i1.UuidValue userId;

  _i2.AuthUser? user;

  String firstName;

  String lastName;

  String? displayName;

  String? bio;

  String email;

  String phoneNumber;

  String membershipStatus;

  String? profilePictureUrl;

  String emergencyContactName;

  String emergencyContactPhone;

  String? medicalConditions;

  bool isTripAdmin;

  String? certifications;

  DateTime createdAt;

  DateTime updatedAt;

  List<_i3.EventRegistration>? registrations;

  List<_i4.EventManager>? managedEvents;

  /// Returns a shallow copy of this [Member]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Member copyWith({
    int? id,
    _i1.UuidValue? userId,
    _i2.AuthUser? user,
    String? firstName,
    String? lastName,
    String? displayName,
    String? bio,
    String? email,
    String? phoneNumber,
    String? membershipStatus,
    String? profilePictureUrl,
    String? emergencyContactName,
    String? emergencyContactPhone,
    String? medicalConditions,
    bool? isTripAdmin,
    String? certifications,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i3.EventRegistration>? registrations,
    List<_i4.EventManager>? managedEvents,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Member',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'firstName': firstName,
      'lastName': lastName,
      if (displayName != null) 'displayName': displayName,
      if (bio != null) 'bio': bio,
      'email': email,
      'phoneNumber': phoneNumber,
      'membershipStatus': membershipStatus,
      if (profilePictureUrl != null) 'profilePictureUrl': profilePictureUrl,
      'emergencyContactName': emergencyContactName,
      'emergencyContactPhone': emergencyContactPhone,
      if (medicalConditions != null) 'medicalConditions': medicalConditions,
      'isTripAdmin': isTripAdmin,
      if (certifications != null) 'certifications': certifications,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (registrations != null)
        'registrations': registrations?.toJson(valueToJson: (v) => v.toJson()),
      if (managedEvents != null)
        'managedEvents': managedEvents?.toJson(valueToJson: (v) => v.toJson()),
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
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    required String firstName,
    required String lastName,
    String? displayName,
    String? bio,
    required String email,
    required String phoneNumber,
    String? membershipStatus,
    String? profilePictureUrl,
    required String emergencyContactName,
    required String emergencyContactPhone,
    String? medicalConditions,
    bool? isTripAdmin,
    String? certifications,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i3.EventRegistration>? registrations,
    List<_i4.EventManager>? managedEvents,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         firstName: firstName,
         lastName: lastName,
         displayName: displayName,
         bio: bio,
         email: email,
         phoneNumber: phoneNumber,
         membershipStatus: membershipStatus,
         profilePictureUrl: profilePictureUrl,
         emergencyContactName: emergencyContactName,
         emergencyContactPhone: emergencyContactPhone,
         medicalConditions: medicalConditions,
         isTripAdmin: isTripAdmin,
         certifications: certifications,
         createdAt: createdAt,
         updatedAt: updatedAt,
         registrations: registrations,
         managedEvents: managedEvents,
       );

  /// Returns a shallow copy of this [Member]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Member copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    String? firstName,
    String? lastName,
    Object? displayName = _Undefined,
    Object? bio = _Undefined,
    String? email,
    String? phoneNumber,
    String? membershipStatus,
    Object? profilePictureUrl = _Undefined,
    String? emergencyContactName,
    String? emergencyContactPhone,
    Object? medicalConditions = _Undefined,
    bool? isTripAdmin,
    Object? certifications = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? registrations = _Undefined,
    Object? managedEvents = _Undefined,
  }) {
    return Member(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.AuthUser? ? user : this.user?.copyWith(),
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      displayName: displayName is String? ? displayName : this.displayName,
      bio: bio is String? ? bio : this.bio,
      email: email ?? this.email,
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
      isTripAdmin: isTripAdmin ?? this.isTripAdmin,
      certifications: certifications is String?
          ? certifications
          : this.certifications,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      registrations: registrations is List<_i3.EventRegistration>?
          ? registrations
          : this.registrations?.map((e0) => e0.copyWith()).toList(),
      managedEvents: managedEvents is List<_i4.EventManager>?
          ? managedEvents
          : this.managedEvents?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
