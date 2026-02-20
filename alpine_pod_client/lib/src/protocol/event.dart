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
import 'event_type.dart' as _i2;
import 'event_registration.dart' as _i3;
import 'event_manager.dart' as _i4;
import 'package:alpine_pod_client/src/protocol/protocol.dart' as _i5;

abstract class Event implements _i1.SerializableModel {
  Event._({
    this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.startTime,
    required this.endTime,
    this.location,
    this.gpsLatitude,
    this.gpsLongitude,
    this.mapLink,
    this.carPoolingTime,
    this.carPoolingPlace,
    this.carPoolingDriveOrRide,
    this.difficulty,
    this.requiredEquipment,
    this.prerequisites,
    this.recurring,
    this.registrationDeadline,
    this.registrationStartDate,
    this.registrationFee,
    bool? requiresApproval,
    int? minimumParticipants,
    int? maxParticipants,
    this.cancellationDeadline,
    this.registrationNotes,
    required this.sectionId,
    this.documentsJson,
    bool? published,
    this.eventRegistrations,
    this.eventManagers,
  }) : requiresApproval = requiresApproval ?? true,
       minimumParticipants = minimumParticipants ?? 0,
       maxParticipants = maxParticipants ?? 8,
       published = published ?? false;

  factory Event({
    int? id,
    required String title,
    required String description,
    required _i2.EventType type,
    required DateTime startTime,
    required DateTime endTime,
    String? location,
    double? gpsLatitude,
    double? gpsLongitude,
    String? mapLink,
    DateTime? carPoolingTime,
    String? carPoolingPlace,
    String? carPoolingDriveOrRide,
    String? difficulty,
    String? requiredEquipment,
    String? prerequisites,
    String? recurring,
    DateTime? registrationDeadline,
    DateTime? registrationStartDate,
    double? registrationFee,
    bool? requiresApproval,
    int? minimumParticipants,
    int? maxParticipants,
    DateTime? cancellationDeadline,
    String? registrationNotes,
    required int sectionId,
    String? documentsJson,
    bool? published,
    List<_i3.EventRegistration>? eventRegistrations,
    List<_i4.EventManager>? eventManagers,
  }) = _EventImpl;

  factory Event.fromJson(Map<String, dynamic> jsonSerialization) {
    return Event(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      type: _i2.EventType.fromJson((jsonSerialization['type'] as String)),
      startTime: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['startTime'],
      ),
      endTime: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endTime']),
      location: jsonSerialization['location'] as String?,
      gpsLatitude: (jsonSerialization['gpsLatitude'] as num?)?.toDouble(),
      gpsLongitude: (jsonSerialization['gpsLongitude'] as num?)?.toDouble(),
      mapLink: jsonSerialization['mapLink'] as String?,
      carPoolingTime: jsonSerialization['carPoolingTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['carPoolingTime'],
            ),
      carPoolingPlace: jsonSerialization['carPoolingPlace'] as String?,
      carPoolingDriveOrRide:
          jsonSerialization['carPoolingDriveOrRide'] as String?,
      difficulty: jsonSerialization['difficulty'] as String?,
      requiredEquipment: jsonSerialization['requiredEquipment'] as String?,
      prerequisites: jsonSerialization['prerequisites'] as String?,
      recurring: jsonSerialization['recurring'] as String?,
      registrationDeadline: jsonSerialization['registrationDeadline'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['registrationDeadline'],
            ),
      registrationStartDate: jsonSerialization['registrationStartDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['registrationStartDate'],
            ),
      registrationFee: (jsonSerialization['registrationFee'] as num?)
          ?.toDouble(),
      requiresApproval: jsonSerialization['requiresApproval'] as bool?,
      minimumParticipants: jsonSerialization['minimumParticipants'] as int?,
      maxParticipants: jsonSerialization['maxParticipants'] as int?,
      cancellationDeadline: jsonSerialization['cancellationDeadline'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['cancellationDeadline'],
            ),
      registrationNotes: jsonSerialization['registrationNotes'] as String?,
      sectionId: jsonSerialization['sectionId'] as int,
      documentsJson: jsonSerialization['documentsJson'] as String?,
      published: jsonSerialization['published'] as bool?,
      eventRegistrations: jsonSerialization['eventRegistrations'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i3.EventRegistration>>(
              jsonSerialization['eventRegistrations'],
            ),
      eventManagers: jsonSerialization['eventManagers'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i4.EventManager>>(
              jsonSerialization['eventManagers'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String description;

  _i2.EventType type;

  DateTime startTime;

  DateTime endTime;

  String? location;

  double? gpsLatitude;

  double? gpsLongitude;

  String? mapLink;

  DateTime? carPoolingTime;

  String? carPoolingPlace;

  String? carPoolingDriveOrRide;

  String? difficulty;

  String? requiredEquipment;

  String? prerequisites;

  String? recurring;

  DateTime? registrationDeadline;

  DateTime? registrationStartDate;

  double? registrationFee;

  bool requiresApproval;

  int minimumParticipants;

  int maxParticipants;

  DateTime? cancellationDeadline;

  String? registrationNotes;

  int sectionId;

  String? documentsJson;

  bool published;

  List<_i3.EventRegistration>? eventRegistrations;

  List<_i4.EventManager>? eventManagers;

  /// Returns a shallow copy of this [Event]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Event copyWith({
    int? id,
    String? title,
    String? description,
    _i2.EventType? type,
    DateTime? startTime,
    DateTime? endTime,
    String? location,
    double? gpsLatitude,
    double? gpsLongitude,
    String? mapLink,
    DateTime? carPoolingTime,
    String? carPoolingPlace,
    String? carPoolingDriveOrRide,
    String? difficulty,
    String? requiredEquipment,
    String? prerequisites,
    String? recurring,
    DateTime? registrationDeadline,
    DateTime? registrationStartDate,
    double? registrationFee,
    bool? requiresApproval,
    int? minimumParticipants,
    int? maxParticipants,
    DateTime? cancellationDeadline,
    String? registrationNotes,
    int? sectionId,
    String? documentsJson,
    bool? published,
    List<_i3.EventRegistration>? eventRegistrations,
    List<_i4.EventManager>? eventManagers,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Event',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'type': type.toJson(),
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
      if (difficulty != null) 'difficulty': difficulty,
      if (requiredEquipment != null) 'requiredEquipment': requiredEquipment,
      if (prerequisites != null) 'prerequisites': prerequisites,
      if (recurring != null) 'recurring': recurring,
      if (registrationDeadline != null)
        'registrationDeadline': registrationDeadline?.toJson(),
      if (registrationStartDate != null)
        'registrationStartDate': registrationStartDate?.toJson(),
      if (registrationFee != null) 'registrationFee': registrationFee,
      'requiresApproval': requiresApproval,
      'minimumParticipants': minimumParticipants,
      'maxParticipants': maxParticipants,
      if (cancellationDeadline != null)
        'cancellationDeadline': cancellationDeadline?.toJson(),
      if (registrationNotes != null) 'registrationNotes': registrationNotes,
      'sectionId': sectionId,
      if (documentsJson != null) 'documentsJson': documentsJson,
      'published': published,
      if (eventRegistrations != null)
        'eventRegistrations': eventRegistrations?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (eventManagers != null)
        'eventManagers': eventManagers?.toJson(valueToJson: (v) => v.toJson()),
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
    required _i2.EventType type,
    required DateTime startTime,
    required DateTime endTime,
    String? location,
    double? gpsLatitude,
    double? gpsLongitude,
    String? mapLink,
    DateTime? carPoolingTime,
    String? carPoolingPlace,
    String? carPoolingDriveOrRide,
    String? difficulty,
    String? requiredEquipment,
    String? prerequisites,
    String? recurring,
    DateTime? registrationDeadline,
    DateTime? registrationStartDate,
    double? registrationFee,
    bool? requiresApproval,
    int? minimumParticipants,
    int? maxParticipants,
    DateTime? cancellationDeadline,
    String? registrationNotes,
    required int sectionId,
    String? documentsJson,
    bool? published,
    List<_i3.EventRegistration>? eventRegistrations,
    List<_i4.EventManager>? eventManagers,
  }) : super._(
         id: id,
         title: title,
         description: description,
         type: type,
         startTime: startTime,
         endTime: endTime,
         location: location,
         gpsLatitude: gpsLatitude,
         gpsLongitude: gpsLongitude,
         mapLink: mapLink,
         carPoolingTime: carPoolingTime,
         carPoolingPlace: carPoolingPlace,
         carPoolingDriveOrRide: carPoolingDriveOrRide,
         difficulty: difficulty,
         requiredEquipment: requiredEquipment,
         prerequisites: prerequisites,
         recurring: recurring,
         registrationDeadline: registrationDeadline,
         registrationStartDate: registrationStartDate,
         registrationFee: registrationFee,
         requiresApproval: requiresApproval,
         minimumParticipants: minimumParticipants,
         maxParticipants: maxParticipants,
         cancellationDeadline: cancellationDeadline,
         registrationNotes: registrationNotes,
         sectionId: sectionId,
         documentsJson: documentsJson,
         published: published,
         eventRegistrations: eventRegistrations,
         eventManagers: eventManagers,
       );

  /// Returns a shallow copy of this [Event]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Event copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    _i2.EventType? type,
    DateTime? startTime,
    DateTime? endTime,
    Object? location = _Undefined,
    Object? gpsLatitude = _Undefined,
    Object? gpsLongitude = _Undefined,
    Object? mapLink = _Undefined,
    Object? carPoolingTime = _Undefined,
    Object? carPoolingPlace = _Undefined,
    Object? carPoolingDriveOrRide = _Undefined,
    Object? difficulty = _Undefined,
    Object? requiredEquipment = _Undefined,
    Object? prerequisites = _Undefined,
    Object? recurring = _Undefined,
    Object? registrationDeadline = _Undefined,
    Object? registrationStartDate = _Undefined,
    Object? registrationFee = _Undefined,
    bool? requiresApproval,
    int? minimumParticipants,
    int? maxParticipants,
    Object? cancellationDeadline = _Undefined,
    Object? registrationNotes = _Undefined,
    int? sectionId,
    Object? documentsJson = _Undefined,
    bool? published,
    Object? eventRegistrations = _Undefined,
    Object? eventManagers = _Undefined,
  }) {
    return Event(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      location: location is String? ? location : this.location,
      gpsLatitude: gpsLatitude is double? ? gpsLatitude : this.gpsLatitude,
      gpsLongitude: gpsLongitude is double? ? gpsLongitude : this.gpsLongitude,
      mapLink: mapLink is String? ? mapLink : this.mapLink,
      carPoolingTime: carPoolingTime is DateTime?
          ? carPoolingTime
          : this.carPoolingTime,
      carPoolingPlace: carPoolingPlace is String?
          ? carPoolingPlace
          : this.carPoolingPlace,
      carPoolingDriveOrRide: carPoolingDriveOrRide is String?
          ? carPoolingDriveOrRide
          : this.carPoolingDriveOrRide,
      difficulty: difficulty is String? ? difficulty : this.difficulty,
      requiredEquipment: requiredEquipment is String?
          ? requiredEquipment
          : this.requiredEquipment,
      prerequisites: prerequisites is String?
          ? prerequisites
          : this.prerequisites,
      recurring: recurring is String? ? recurring : this.recurring,
      registrationDeadline: registrationDeadline is DateTime?
          ? registrationDeadline
          : this.registrationDeadline,
      registrationStartDate: registrationStartDate is DateTime?
          ? registrationStartDate
          : this.registrationStartDate,
      registrationFee: registrationFee is double?
          ? registrationFee
          : this.registrationFee,
      requiresApproval: requiresApproval ?? this.requiresApproval,
      minimumParticipants: minimumParticipants ?? this.minimumParticipants,
      maxParticipants: maxParticipants ?? this.maxParticipants,
      cancellationDeadline: cancellationDeadline is DateTime?
          ? cancellationDeadline
          : this.cancellationDeadline,
      registrationNotes: registrationNotes is String?
          ? registrationNotes
          : this.registrationNotes,
      sectionId: sectionId ?? this.sectionId,
      documentsJson: documentsJson is String?
          ? documentsJson
          : this.documentsJson,
      published: published ?? this.published,
      eventRegistrations: eventRegistrations is List<_i3.EventRegistration>?
          ? eventRegistrations
          : this.eventRegistrations?.map((e0) => e0.copyWith()).toList(),
      eventManagers: eventManagers is List<_i4.EventManager>?
          ? eventManagers
          : this.eventManagers?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
