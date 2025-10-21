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
import 'registration_status.dart' as _i2;

abstract class EventRegistration implements _i1.SerializableModel {
  EventRegistration._({
    this.id,
    this.userId,
    this.eventId,
    required this.registrationStatus,
    required this.registrationDate,
    this.carPoolPreference,
    this.numberOfPassengers,
    this.additionalGuests,
    this.equipmentNotes,
    required this.waiverAccepted,
    this.waiverSignedDate,
    this.participantNotes,
    this.waitlistPosition,
    this.waitlistedAt,
    required this.checkedIn,
    this.checkedInTime,
    this.paymentStatus,
    this.paymentAmount,
    this.paymentDate,
    required this.modifiedAt,
    this.attended,
    this.attendedAt,
  });

  factory EventRegistration({
    int? id,
    int? userId,
    int? eventId,
    required _i2.RegistrationStatus registrationStatus,
    required DateTime registrationDate,
    String? carPoolPreference,
    int? numberOfPassengers,
    int? additionalGuests,
    String? equipmentNotes,
    required bool waiverAccepted,
    DateTime? waiverSignedDate,
    String? participantNotes,
    int? waitlistPosition,
    DateTime? waitlistedAt,
    required bool checkedIn,
    DateTime? checkedInTime,
    String? paymentStatus,
    double? paymentAmount,
    DateTime? paymentDate,
    required DateTime modifiedAt,
    bool? attended,
    DateTime? attendedAt,
  }) = _EventRegistrationImpl;

  factory EventRegistration.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventRegistration(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int?,
      eventId: jsonSerialization['eventId'] as int?,
      registrationStatus: _i2.RegistrationStatus.fromJson(
          (jsonSerialization['registrationStatus'] as int)),
      registrationDate: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['registrationDate']),
      carPoolPreference: jsonSerialization['carPoolPreference'] as String?,
      numberOfPassengers: jsonSerialization['numberOfPassengers'] as int?,
      additionalGuests: jsonSerialization['additionalGuests'] as int?,
      equipmentNotes: jsonSerialization['equipmentNotes'] as String?,
      waiverAccepted: jsonSerialization['waiverAccepted'] as bool,
      waiverSignedDate: jsonSerialization['waiverSignedDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['waiverSignedDate']),
      participantNotes: jsonSerialization['participantNotes'] as String?,
      waitlistPosition: jsonSerialization['waitlistPosition'] as int?,
      waitlistedAt: jsonSerialization['waitlistedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['waitlistedAt']),
      checkedIn: jsonSerialization['checkedIn'] as bool,
      checkedInTime: jsonSerialization['checkedInTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['checkedInTime']),
      paymentStatus: jsonSerialization['paymentStatus'] as String?,
      paymentAmount: (jsonSerialization['paymentAmount'] as num?)?.toDouble(),
      paymentDate: jsonSerialization['paymentDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['paymentDate']),
      modifiedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['modifiedAt']),
      attended: jsonSerialization['attended'] as bool?,
      attendedAt: jsonSerialization['attendedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['attendedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? userId;

  int? eventId;

  _i2.RegistrationStatus registrationStatus;

  DateTime registrationDate;

  String? carPoolPreference;

  int? numberOfPassengers;

  int? additionalGuests;

  String? equipmentNotes;

  bool waiverAccepted;

  DateTime? waiverSignedDate;

  String? participantNotes;

  int? waitlistPosition;

  DateTime? waitlistedAt;

  bool checkedIn;

  DateTime? checkedInTime;

  String? paymentStatus;

  double? paymentAmount;

  DateTime? paymentDate;

  DateTime modifiedAt;

  bool? attended;

  DateTime? attendedAt;

  /// Returns a shallow copy of this [EventRegistration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EventRegistration copyWith({
    int? id,
    int? userId,
    int? eventId,
    _i2.RegistrationStatus? registrationStatus,
    DateTime? registrationDate,
    String? carPoolPreference,
    int? numberOfPassengers,
    int? additionalGuests,
    String? equipmentNotes,
    bool? waiverAccepted,
    DateTime? waiverSignedDate,
    String? participantNotes,
    int? waitlistPosition,
    DateTime? waitlistedAt,
    bool? checkedIn,
    DateTime? checkedInTime,
    String? paymentStatus,
    double? paymentAmount,
    DateTime? paymentDate,
    DateTime? modifiedAt,
    bool? attended,
    DateTime? attendedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      if (eventId != null) 'eventId': eventId,
      'registrationStatus': registrationStatus.toJson(),
      'registrationDate': registrationDate.toJson(),
      if (carPoolPreference != null) 'carPoolPreference': carPoolPreference,
      if (numberOfPassengers != null) 'numberOfPassengers': numberOfPassengers,
      if (additionalGuests != null) 'additionalGuests': additionalGuests,
      if (equipmentNotes != null) 'equipmentNotes': equipmentNotes,
      'waiverAccepted': waiverAccepted,
      if (waiverSignedDate != null)
        'waiverSignedDate': waiverSignedDate?.toJson(),
      if (participantNotes != null) 'participantNotes': participantNotes,
      if (waitlistPosition != null) 'waitlistPosition': waitlistPosition,
      if (waitlistedAt != null) 'waitlistedAt': waitlistedAt?.toJson(),
      'checkedIn': checkedIn,
      if (checkedInTime != null) 'checkedInTime': checkedInTime?.toJson(),
      if (paymentStatus != null) 'paymentStatus': paymentStatus,
      if (paymentAmount != null) 'paymentAmount': paymentAmount,
      if (paymentDate != null) 'paymentDate': paymentDate?.toJson(),
      'modifiedAt': modifiedAt.toJson(),
      if (attended != null) 'attended': attended,
      if (attendedAt != null) 'attendedAt': attendedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventRegistrationImpl extends EventRegistration {
  _EventRegistrationImpl({
    int? id,
    int? userId,
    int? eventId,
    required _i2.RegistrationStatus registrationStatus,
    required DateTime registrationDate,
    String? carPoolPreference,
    int? numberOfPassengers,
    int? additionalGuests,
    String? equipmentNotes,
    required bool waiverAccepted,
    DateTime? waiverSignedDate,
    String? participantNotes,
    int? waitlistPosition,
    DateTime? waitlistedAt,
    required bool checkedIn,
    DateTime? checkedInTime,
    String? paymentStatus,
    double? paymentAmount,
    DateTime? paymentDate,
    required DateTime modifiedAt,
    bool? attended,
    DateTime? attendedAt,
  }) : super._(
          id: id,
          userId: userId,
          eventId: eventId,
          registrationStatus: registrationStatus,
          registrationDate: registrationDate,
          carPoolPreference: carPoolPreference,
          numberOfPassengers: numberOfPassengers,
          additionalGuests: additionalGuests,
          equipmentNotes: equipmentNotes,
          waiverAccepted: waiverAccepted,
          waiverSignedDate: waiverSignedDate,
          participantNotes: participantNotes,
          waitlistPosition: waitlistPosition,
          waitlistedAt: waitlistedAt,
          checkedIn: checkedIn,
          checkedInTime: checkedInTime,
          paymentStatus: paymentStatus,
          paymentAmount: paymentAmount,
          paymentDate: paymentDate,
          modifiedAt: modifiedAt,
          attended: attended,
          attendedAt: attendedAt,
        );

  /// Returns a shallow copy of this [EventRegistration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventRegistration copyWith({
    Object? id = _Undefined,
    Object? userId = _Undefined,
    Object? eventId = _Undefined,
    _i2.RegistrationStatus? registrationStatus,
    DateTime? registrationDate,
    Object? carPoolPreference = _Undefined,
    Object? numberOfPassengers = _Undefined,
    Object? additionalGuests = _Undefined,
    Object? equipmentNotes = _Undefined,
    bool? waiverAccepted,
    Object? waiverSignedDate = _Undefined,
    Object? participantNotes = _Undefined,
    Object? waitlistPosition = _Undefined,
    Object? waitlistedAt = _Undefined,
    bool? checkedIn,
    Object? checkedInTime = _Undefined,
    Object? paymentStatus = _Undefined,
    Object? paymentAmount = _Undefined,
    Object? paymentDate = _Undefined,
    DateTime? modifiedAt,
    Object? attended = _Undefined,
    Object? attendedAt = _Undefined,
  }) {
    return EventRegistration(
      id: id is int? ? id : this.id,
      userId: userId is int? ? userId : this.userId,
      eventId: eventId is int? ? eventId : this.eventId,
      registrationStatus: registrationStatus ?? this.registrationStatus,
      registrationDate: registrationDate ?? this.registrationDate,
      carPoolPreference: carPoolPreference is String?
          ? carPoolPreference
          : this.carPoolPreference,
      numberOfPassengers: numberOfPassengers is int?
          ? numberOfPassengers
          : this.numberOfPassengers,
      additionalGuests:
          additionalGuests is int? ? additionalGuests : this.additionalGuests,
      equipmentNotes:
          equipmentNotes is String? ? equipmentNotes : this.equipmentNotes,
      waiverAccepted: waiverAccepted ?? this.waiverAccepted,
      waiverSignedDate: waiverSignedDate is DateTime?
          ? waiverSignedDate
          : this.waiverSignedDate,
      participantNotes: participantNotes is String?
          ? participantNotes
          : this.participantNotes,
      waitlistPosition:
          waitlistPosition is int? ? waitlistPosition : this.waitlistPosition,
      waitlistedAt:
          waitlistedAt is DateTime? ? waitlistedAt : this.waitlistedAt,
      checkedIn: checkedIn ?? this.checkedIn,
      checkedInTime:
          checkedInTime is DateTime? ? checkedInTime : this.checkedInTime,
      paymentStatus:
          paymentStatus is String? ? paymentStatus : this.paymentStatus,
      paymentAmount:
          paymentAmount is double? ? paymentAmount : this.paymentAmount,
      paymentDate: paymentDate is DateTime? ? paymentDate : this.paymentDate,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      attended: attended is bool? ? attended : this.attended,
      attendedAt: attendedAt is DateTime? ? attendedAt : this.attendedAt,
    );
  }
}
