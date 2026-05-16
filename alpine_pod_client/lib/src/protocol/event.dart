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
import 'section.dart' as _i2;
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
    this.eventLocation,
    this.carpoolLocation,
    this.carpoolTime,
    this.recurring,
    this.registrationDeadline,
    this.registrationStartDate,
    this.registrationFee,
    bool? requiresApproval,
    int? minimumParticipants,
    int? maxParticipants,
    this.cancellationDeadline,
    required this.sectionId,
    this.section,
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
    required String type,
    required DateTime startTime,
    required DateTime endTime,
    String? eventLocation,
    String? carpoolLocation,
    DateTime? carpoolTime,
    String? recurring,
    DateTime? registrationDeadline,
    DateTime? registrationStartDate,
    double? registrationFee,
    bool? requiresApproval,
    int? minimumParticipants,
    int? maxParticipants,
    DateTime? cancellationDeadline,
    required int sectionId,
    _i2.Section? section,
    bool? published,
    List<_i3.EventRegistration>? eventRegistrations,
    List<_i4.EventManager>? eventManagers,
  }) = _EventImpl;

  factory Event.fromJson(Map<String, dynamic> jsonSerialization) {
    return Event(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      type: jsonSerialization['type'] as String,
      startTime: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['startTime'],
      ),
      endTime: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endTime']),
      eventLocation: jsonSerialization['eventLocation'] as String?,
      carpoolLocation: jsonSerialization['carpoolLocation'] as String?,
      carpoolTime: jsonSerialization['carpoolTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['carpoolTime'],
            ),
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
      requiresApproval: jsonSerialization['requiresApproval'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(
              jsonSerialization['requiresApproval'],
            ),
      minimumParticipants: jsonSerialization['minimumParticipants'] as int?,
      maxParticipants: jsonSerialization['maxParticipants'] as int?,
      cancellationDeadline: jsonSerialization['cancellationDeadline'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['cancellationDeadline'],
            ),
      sectionId: jsonSerialization['sectionId'] as int,
      section: jsonSerialization['section'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.Section>(
              jsonSerialization['section'],
            ),
      published: jsonSerialization['published'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['published']),
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

  String type;

  DateTime startTime;

  DateTime endTime;

  String? eventLocation;

  String? carpoolLocation;

  DateTime? carpoolTime;

  String? recurring;

  DateTime? registrationDeadline;

  DateTime? registrationStartDate;

  double? registrationFee;

  bool requiresApproval;

  int minimumParticipants;

  int maxParticipants;

  DateTime? cancellationDeadline;

  int sectionId;

  _i2.Section? section;

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
    String? type,
    DateTime? startTime,
    DateTime? endTime,
    String? eventLocation,
    String? carpoolLocation,
    DateTime? carpoolTime,
    String? recurring,
    DateTime? registrationDeadline,
    DateTime? registrationStartDate,
    double? registrationFee,
    bool? requiresApproval,
    int? minimumParticipants,
    int? maxParticipants,
    DateTime? cancellationDeadline,
    int? sectionId,
    _i2.Section? section,
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
      'type': type,
      'startTime': startTime.toJson(),
      'endTime': endTime.toJson(),
      if (eventLocation != null) 'eventLocation': eventLocation,
      if (carpoolLocation != null) 'carpoolLocation': carpoolLocation,
      if (carpoolTime != null) 'carpoolTime': carpoolTime?.toJson(),
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
      'sectionId': sectionId,
      if (section != null) 'section': section?.toJson(),
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
    required String type,
    required DateTime startTime,
    required DateTime endTime,
    String? eventLocation,
    String? carpoolLocation,
    DateTime? carpoolTime,
    String? recurring,
    DateTime? registrationDeadline,
    DateTime? registrationStartDate,
    double? registrationFee,
    bool? requiresApproval,
    int? minimumParticipants,
    int? maxParticipants,
    DateTime? cancellationDeadline,
    required int sectionId,
    _i2.Section? section,
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
         eventLocation: eventLocation,
         carpoolLocation: carpoolLocation,
         carpoolTime: carpoolTime,
         recurring: recurring,
         registrationDeadline: registrationDeadline,
         registrationStartDate: registrationStartDate,
         registrationFee: registrationFee,
         requiresApproval: requiresApproval,
         minimumParticipants: minimumParticipants,
         maxParticipants: maxParticipants,
         cancellationDeadline: cancellationDeadline,
         sectionId: sectionId,
         section: section,
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
    String? type,
    DateTime? startTime,
    DateTime? endTime,
    Object? eventLocation = _Undefined,
    Object? carpoolLocation = _Undefined,
    Object? carpoolTime = _Undefined,
    Object? recurring = _Undefined,
    Object? registrationDeadline = _Undefined,
    Object? registrationStartDate = _Undefined,
    Object? registrationFee = _Undefined,
    bool? requiresApproval,
    int? minimumParticipants,
    int? maxParticipants,
    Object? cancellationDeadline = _Undefined,
    int? sectionId,
    Object? section = _Undefined,
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
      eventLocation: eventLocation is String?
          ? eventLocation
          : this.eventLocation,
      carpoolLocation: carpoolLocation is String?
          ? carpoolLocation
          : this.carpoolLocation,
      carpoolTime: carpoolTime is DateTime? ? carpoolTime : this.carpoolTime,
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
      sectionId: sectionId ?? this.sectionId,
      section: section is _i2.Section? ? section : this.section?.copyWith(),
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
