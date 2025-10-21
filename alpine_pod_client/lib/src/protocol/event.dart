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

abstract class Event implements _i1.SerializableModel {
  Event._({
    this.id,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    this.location,
    this.gpsLatitude,
    this.gpsLongitude,
    this.mapLink,
    this.carPoolingTime,
    this.carPoolingPlace,
    this.carPoolingDriveOrRide,
    this.maxParticipants,
    required this.public,
    this.difficulty,
    this.requiredEquipment,
    this.prerequisites,
    this.recurring,
    this.registrationDeadline,
    this.registrationStartDate,
    required this.waitlistEnabled,
    this.registrationFee,
    this.currentRegistrationCount,
    required this.waiverRequired,
    this.minimumParticipants,
    this.cancellationDeadline,
    this.registrationNotes,
    this.sectionId,
    this.documentsJson,
  });

  factory Event({
    int? id,
    required String title,
    required String description,
    required DateTime startTime,
    required DateTime endTime,
    String? location,
    double? gpsLatitude,
    double? gpsLongitude,
    String? mapLink,
    DateTime? carPoolingTime,
    String? carPoolingPlace,
    String? carPoolingDriveOrRide,
    int? maxParticipants,
    required bool public,
    String? difficulty,
    String? requiredEquipment,
    String? prerequisites,
    String? recurring,
    DateTime? registrationDeadline,
    DateTime? registrationStartDate,
    required bool waitlistEnabled,
    double? registrationFee,
    int? currentRegistrationCount,
    required bool waiverRequired,
    int? minimumParticipants,
    DateTime? cancellationDeadline,
    String? registrationNotes,
    int? sectionId,
    String? documentsJson,
  }) = _EventImpl;

  factory Event.fromJson(Map<String, dynamic> jsonSerialization) {
    return Event(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      startTime:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startTime']),
      endTime: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endTime']),
      location: jsonSerialization['location'] as String?,
      gpsLatitude: (jsonSerialization['gpsLatitude'] as num?)?.toDouble(),
      gpsLongitude: (jsonSerialization['gpsLongitude'] as num?)?.toDouble(),
      mapLink: jsonSerialization['mapLink'] as String?,
      carPoolingTime: jsonSerialization['carPoolingTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['carPoolingTime']),
      carPoolingPlace: jsonSerialization['carPoolingPlace'] as String?,
      carPoolingDriveOrRide:
          jsonSerialization['carPoolingDriveOrRide'] as String?,
      maxParticipants: jsonSerialization['maxParticipants'] as int?,
      public: jsonSerialization['public'] as bool,
      difficulty: jsonSerialization['difficulty'] as String?,
      requiredEquipment: jsonSerialization['requiredEquipment'] as String?,
      prerequisites: jsonSerialization['prerequisites'] as String?,
      recurring: jsonSerialization['recurring'] as String?,
      registrationDeadline: jsonSerialization['registrationDeadline'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['registrationDeadline']),
      registrationStartDate: jsonSerialization['registrationStartDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['registrationStartDate']),
      waitlistEnabled: jsonSerialization['waitlistEnabled'] as bool,
      registrationFee:
          (jsonSerialization['registrationFee'] as num?)?.toDouble(),
      currentRegistrationCount:
          jsonSerialization['currentRegistrationCount'] as int?,
      waiverRequired: jsonSerialization['waiverRequired'] as bool,
      minimumParticipants: jsonSerialization['minimumParticipants'] as int?,
      cancellationDeadline: jsonSerialization['cancellationDeadline'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['cancellationDeadline']),
      registrationNotes: jsonSerialization['registrationNotes'] as String?,
      sectionId: jsonSerialization['sectionId'] as int?,
      documentsJson: jsonSerialization['documentsJson'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String description;

  DateTime startTime;

  DateTime endTime;

  String? location;

  double? gpsLatitude;

  double? gpsLongitude;

  String? mapLink;

  DateTime? carPoolingTime;

  String? carPoolingPlace;

  String? carPoolingDriveOrRide;

  int? maxParticipants;

  bool public;

  String? difficulty;

  String? requiredEquipment;

  String? prerequisites;

  String? recurring;

  DateTime? registrationDeadline;

  DateTime? registrationStartDate;

  bool waitlistEnabled;

  double? registrationFee;

  int? currentRegistrationCount;

  bool waiverRequired;

  int? minimumParticipants;

  DateTime? cancellationDeadline;

  String? registrationNotes;

  int? sectionId;

  String? documentsJson;

  /// Returns a shallow copy of this [Event]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Event copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    String? location,
    double? gpsLatitude,
    double? gpsLongitude,
    String? mapLink,
    DateTime? carPoolingTime,
    String? carPoolingPlace,
    String? carPoolingDriveOrRide,
    int? maxParticipants,
    bool? public,
    String? difficulty,
    String? requiredEquipment,
    String? prerequisites,
    String? recurring,
    DateTime? registrationDeadline,
    DateTime? registrationStartDate,
    bool? waitlistEnabled,
    double? registrationFee,
    int? currentRegistrationCount,
    bool? waiverRequired,
    int? minimumParticipants,
    DateTime? cancellationDeadline,
    String? registrationNotes,
    int? sectionId,
    String? documentsJson,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'startTime': startTime.toJson(),
      'endTime': endTime.toJson(),
      if (location != null) 'location': location,
      if (gpsLatitude != null) 'gpsLatitude': gpsLatitude,
      if (gpsLongitude != null) 'gpsLongitude': gpsLongitude,
      if (mapLink != null) 'mapLink': mapLink,
      if (carPoolingTime != null) 'carPoolingTime': carPoolingTime?.toJson(),
      if (carPoolingPlace != null) 'carPoolingPlace': carPoolingPlace,
      if (carPoolingDriveOrRide != null)
        'carPoolingDriveOrRide': carPoolingDriveOrRide,
      if (maxParticipants != null) 'maxParticipants': maxParticipants,
      'public': public,
      if (difficulty != null) 'difficulty': difficulty,
      if (requiredEquipment != null) 'requiredEquipment': requiredEquipment,
      if (prerequisites != null) 'prerequisites': prerequisites,
      if (recurring != null) 'recurring': recurring,
      if (registrationDeadline != null)
        'registrationDeadline': registrationDeadline?.toJson(),
      if (registrationStartDate != null)
        'registrationStartDate': registrationStartDate?.toJson(),
      'waitlistEnabled': waitlistEnabled,
      if (registrationFee != null) 'registrationFee': registrationFee,
      if (currentRegistrationCount != null)
        'currentRegistrationCount': currentRegistrationCount,
      'waiverRequired': waiverRequired,
      if (minimumParticipants != null)
        'minimumParticipants': minimumParticipants,
      if (cancellationDeadline != null)
        'cancellationDeadline': cancellationDeadline?.toJson(),
      if (registrationNotes != null) 'registrationNotes': registrationNotes,
      if (sectionId != null) 'sectionId': sectionId,
      if (documentsJson != null) 'documentsJson': documentsJson,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventImpl extends Event {
  _EventImpl({
    int? id,
    required String title,
    required String description,
    required DateTime startTime,
    required DateTime endTime,
    String? location,
    double? gpsLatitude,
    double? gpsLongitude,
    String? mapLink,
    DateTime? carPoolingTime,
    String? carPoolingPlace,
    String? carPoolingDriveOrRide,
    int? maxParticipants,
    required bool public,
    String? difficulty,
    String? requiredEquipment,
    String? prerequisites,
    String? recurring,
    DateTime? registrationDeadline,
    DateTime? registrationStartDate,
    required bool waitlistEnabled,
    double? registrationFee,
    int? currentRegistrationCount,
    required bool waiverRequired,
    int? minimumParticipants,
    DateTime? cancellationDeadline,
    String? registrationNotes,
    int? sectionId,
    String? documentsJson,
  }) : super._(
          id: id,
          title: title,
          description: description,
          startTime: startTime,
          endTime: endTime,
          location: location,
          gpsLatitude: gpsLatitude,
          gpsLongitude: gpsLongitude,
          mapLink: mapLink,
          carPoolingTime: carPoolingTime,
          carPoolingPlace: carPoolingPlace,
          carPoolingDriveOrRide: carPoolingDriveOrRide,
          maxParticipants: maxParticipants,
          public: public,
          difficulty: difficulty,
          requiredEquipment: requiredEquipment,
          prerequisites: prerequisites,
          recurring: recurring,
          registrationDeadline: registrationDeadline,
          registrationStartDate: registrationStartDate,
          waitlistEnabled: waitlistEnabled,
          registrationFee: registrationFee,
          currentRegistrationCount: currentRegistrationCount,
          waiverRequired: waiverRequired,
          minimumParticipants: minimumParticipants,
          cancellationDeadline: cancellationDeadline,
          registrationNotes: registrationNotes,
          sectionId: sectionId,
          documentsJson: documentsJson,
        );

  /// Returns a shallow copy of this [Event]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Event copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    Object? location = _Undefined,
    Object? gpsLatitude = _Undefined,
    Object? gpsLongitude = _Undefined,
    Object? mapLink = _Undefined,
    Object? carPoolingTime = _Undefined,
    Object? carPoolingPlace = _Undefined,
    Object? carPoolingDriveOrRide = _Undefined,
    Object? maxParticipants = _Undefined,
    bool? public,
    Object? difficulty = _Undefined,
    Object? requiredEquipment = _Undefined,
    Object? prerequisites = _Undefined,
    Object? recurring = _Undefined,
    Object? registrationDeadline = _Undefined,
    Object? registrationStartDate = _Undefined,
    bool? waitlistEnabled,
    Object? registrationFee = _Undefined,
    Object? currentRegistrationCount = _Undefined,
    bool? waiverRequired,
    Object? minimumParticipants = _Undefined,
    Object? cancellationDeadline = _Undefined,
    Object? registrationNotes = _Undefined,
    Object? sectionId = _Undefined,
    Object? documentsJson = _Undefined,
  }) {
    return Event(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      location: location is String? ? location : this.location,
      gpsLatitude: gpsLatitude is double? ? gpsLatitude : this.gpsLatitude,
      gpsLongitude: gpsLongitude is double? ? gpsLongitude : this.gpsLongitude,
      mapLink: mapLink is String? ? mapLink : this.mapLink,
      carPoolingTime:
          carPoolingTime is DateTime? ? carPoolingTime : this.carPoolingTime,
      carPoolingPlace:
          carPoolingPlace is String? ? carPoolingPlace : this.carPoolingPlace,
      carPoolingDriveOrRide: carPoolingDriveOrRide is String?
          ? carPoolingDriveOrRide
          : this.carPoolingDriveOrRide,
      maxParticipants:
          maxParticipants is int? ? maxParticipants : this.maxParticipants,
      public: public ?? this.public,
      difficulty: difficulty is String? ? difficulty : this.difficulty,
      requiredEquipment: requiredEquipment is String?
          ? requiredEquipment
          : this.requiredEquipment,
      prerequisites:
          prerequisites is String? ? prerequisites : this.prerequisites,
      recurring: recurring is String? ? recurring : this.recurring,
      registrationDeadline: registrationDeadline is DateTime?
          ? registrationDeadline
          : this.registrationDeadline,
      registrationStartDate: registrationStartDate is DateTime?
          ? registrationStartDate
          : this.registrationStartDate,
      waitlistEnabled: waitlistEnabled ?? this.waitlistEnabled,
      registrationFee:
          registrationFee is double? ? registrationFee : this.registrationFee,
      currentRegistrationCount: currentRegistrationCount is int?
          ? currentRegistrationCount
          : this.currentRegistrationCount,
      waiverRequired: waiverRequired ?? this.waiverRequired,
      minimumParticipants: minimumParticipants is int?
          ? minimumParticipants
          : this.minimumParticipants,
      cancellationDeadline: cancellationDeadline is DateTime?
          ? cancellationDeadline
          : this.cancellationDeadline,
      registrationNotes: registrationNotes is String?
          ? registrationNotes
          : this.registrationNotes,
      sectionId: sectionId is int? ? sectionId : this.sectionId,
      documentsJson:
          documentsJson is String? ? documentsJson : this.documentsJson,
    );
  }
}
