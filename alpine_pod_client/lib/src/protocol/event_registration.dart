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
    required this.userId,
    required this.eventId,
    required this.registrationStatus,
    required this.registrationDate,
    this.carPoolPreference,
    int? additionalGuests,
    required this.waiverAccepted,
    this.participantNotes,
    this.waitlistPosition,
    this.waitlistedAt,
    String? paymentStatus,
    double? paymentAmount,
    required this.modifiedAt,
    bool? noShow,
  })  : additionalGuests = additionalGuests ?? 0,
        paymentStatus = paymentStatus ?? 'N/A',
        paymentAmount = paymentAmount ?? 0.0,
        noShow = noShow ?? false;

  factory EventRegistration({
    int? id,
    required int userId,
    required int eventId,
    required _i2.RegistrationStatus registrationStatus,
    required DateTime registrationDate,
    String? carPoolPreference,
    int? additionalGuests,
    required bool waiverAccepted,
    String? participantNotes,
    int? waitlistPosition,
    DateTime? waitlistedAt,
    String? paymentStatus,
    double? paymentAmount,
    required DateTime modifiedAt,
    bool? noShow,
  }) = _EventRegistrationImpl;

  factory EventRegistration.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventRegistration(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      eventId: jsonSerialization['eventId'] as int,
      registrationStatus: _i2.RegistrationStatus.fromJson(
          (jsonSerialization['registrationStatus'] as int)),
      registrationDate: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['registrationDate']),
      carPoolPreference: jsonSerialization['carPoolPreference'] as String?,
      additionalGuests: jsonSerialization['additionalGuests'] as int,
      waiverAccepted: jsonSerialization['waiverAccepted'] as bool,
      participantNotes: jsonSerialization['participantNotes'] as String?,
      waitlistPosition: jsonSerialization['waitlistPosition'] as int?,
      waitlistedAt: jsonSerialization['waitlistedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['waitlistedAt']),
      paymentStatus: jsonSerialization['paymentStatus'] as String,
      paymentAmount: (jsonSerialization['paymentAmount'] as num).toDouble(),
      modifiedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['modifiedAt']),
      noShow: jsonSerialization['noShow'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  int eventId;

  _i2.RegistrationStatus registrationStatus;

  DateTime registrationDate;

  String? carPoolPreference;

  int additionalGuests;

  bool waiverAccepted;

  String? participantNotes;

  int? waitlistPosition;

  DateTime? waitlistedAt;

  String paymentStatus;

  double paymentAmount;

  DateTime modifiedAt;

  bool noShow;

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
    int? additionalGuests,
    bool? waiverAccepted,
    String? participantNotes,
    int? waitlistPosition,
    DateTime? waitlistedAt,
    String? paymentStatus,
    double? paymentAmount,
    DateTime? modifiedAt,
    bool? noShow,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'eventId': eventId,
      'registrationStatus': registrationStatus.toJson(),
      'registrationDate': registrationDate.toJson(),
      if (carPoolPreference != null) 'carPoolPreference': carPoolPreference,
      'additionalGuests': additionalGuests,
      'waiverAccepted': waiverAccepted,
      if (participantNotes != null) 'participantNotes': participantNotes,
      if (waitlistPosition != null) 'waitlistPosition': waitlistPosition,
      if (waitlistedAt != null) 'waitlistedAt': waitlistedAt?.toJson(),
      'paymentStatus': paymentStatus,
      'paymentAmount': paymentAmount,
      'modifiedAt': modifiedAt.toJson(),
      'noShow': noShow,
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
    required int userId,
    required int eventId,
    required _i2.RegistrationStatus registrationStatus,
    required DateTime registrationDate,
    String? carPoolPreference,
    int? additionalGuests,
    required bool waiverAccepted,
    String? participantNotes,
    int? waitlistPosition,
    DateTime? waitlistedAt,
    String? paymentStatus,
    double? paymentAmount,
    required DateTime modifiedAt,
    bool? noShow,
  }) : super._(
          id: id,
          userId: userId,
          eventId: eventId,
          registrationStatus: registrationStatus,
          registrationDate: registrationDate,
          carPoolPreference: carPoolPreference,
          additionalGuests: additionalGuests,
          waiverAccepted: waiverAccepted,
          participantNotes: participantNotes,
          waitlistPosition: waitlistPosition,
          waitlistedAt: waitlistedAt,
          paymentStatus: paymentStatus,
          paymentAmount: paymentAmount,
          modifiedAt: modifiedAt,
          noShow: noShow,
        );

  /// Returns a shallow copy of this [EventRegistration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventRegistration copyWith({
    Object? id = _Undefined,
    int? userId,
    int? eventId,
    _i2.RegistrationStatus? registrationStatus,
    DateTime? registrationDate,
    Object? carPoolPreference = _Undefined,
    int? additionalGuests,
    bool? waiverAccepted,
    Object? participantNotes = _Undefined,
    Object? waitlistPosition = _Undefined,
    Object? waitlistedAt = _Undefined,
    String? paymentStatus,
    double? paymentAmount,
    DateTime? modifiedAt,
    bool? noShow,
  }) {
    return EventRegistration(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      eventId: eventId ?? this.eventId,
      registrationStatus: registrationStatus ?? this.registrationStatus,
      registrationDate: registrationDate ?? this.registrationDate,
      carPoolPreference: carPoolPreference is String?
          ? carPoolPreference
          : this.carPoolPreference,
      additionalGuests: additionalGuests ?? this.additionalGuests,
      waiverAccepted: waiverAccepted ?? this.waiverAccepted,
      participantNotes: participantNotes is String?
          ? participantNotes
          : this.participantNotes,
      waitlistPosition:
          waitlistPosition is int? ? waitlistPosition : this.waitlistPosition,
      waitlistedAt:
          waitlistedAt is DateTime? ? waitlistedAt : this.waitlistedAt,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paymentAmount: paymentAmount ?? this.paymentAmount,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      noShow: noShow ?? this.noShow,
    );
  }
}
