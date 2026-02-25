/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'event_type.dart' as _i2;
import 'event_registration.dart' as _i3;
import 'event_manager.dart' as _i4;
import 'package:alpine_pod_server/src/generated/protocol.dart' as _i5;

abstract class Event implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = EventTable();

  static const db = EventRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (eventManagers != null)
        'eventManagers': eventManagers?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static EventInclude include({
    _i3.EventRegistrationIncludeList? eventRegistrations,
    _i4.EventManagerIncludeList? eventManagers,
  }) {
    return EventInclude._(
      eventRegistrations: eventRegistrations,
      eventManagers: eventManagers,
    );
  }

  static EventIncludeList includeList({
    _i1.WhereExpressionBuilder<EventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTable>? orderByList,
    EventInclude? include,
  }) {
    return EventIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Event.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Event.t),
      include: include,
    );
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

class EventUpdateTable extends _i1.UpdateTable<EventTable> {
  EventUpdateTable(super.table);

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<_i2.EventType, _i2.EventType> type(_i2.EventType value) =>
      _i1.ColumnValue(
        table.type,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> startTime(DateTime value) =>
      _i1.ColumnValue(
        table.startTime,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> endTime(DateTime value) =>
      _i1.ColumnValue(
        table.endTime,
        value,
      );

  _i1.ColumnValue<String, String> location(String? value) => _i1.ColumnValue(
    table.location,
    value,
  );

  _i1.ColumnValue<double, double> gpsLatitude(double? value) => _i1.ColumnValue(
    table.gpsLatitude,
    value,
  );

  _i1.ColumnValue<double, double> gpsLongitude(double? value) =>
      _i1.ColumnValue(
        table.gpsLongitude,
        value,
      );

  _i1.ColumnValue<String, String> mapLink(String? value) => _i1.ColumnValue(
    table.mapLink,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> carPoolingTime(DateTime? value) =>
      _i1.ColumnValue(
        table.carPoolingTime,
        value,
      );

  _i1.ColumnValue<String, String> carPoolingPlace(String? value) =>
      _i1.ColumnValue(
        table.carPoolingPlace,
        value,
      );

  _i1.ColumnValue<String, String> carPoolingDriveOrRide(String? value) =>
      _i1.ColumnValue(
        table.carPoolingDriveOrRide,
        value,
      );

  _i1.ColumnValue<String, String> difficulty(String? value) => _i1.ColumnValue(
    table.difficulty,
    value,
  );

  _i1.ColumnValue<String, String> requiredEquipment(String? value) =>
      _i1.ColumnValue(
        table.requiredEquipment,
        value,
      );

  _i1.ColumnValue<String, String> prerequisites(String? value) =>
      _i1.ColumnValue(
        table.prerequisites,
        value,
      );

  _i1.ColumnValue<String, String> recurring(String? value) => _i1.ColumnValue(
    table.recurring,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> registrationDeadline(DateTime? value) =>
      _i1.ColumnValue(
        table.registrationDeadline,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> registrationStartDate(DateTime? value) =>
      _i1.ColumnValue(
        table.registrationStartDate,
        value,
      );

  _i1.ColumnValue<double, double> registrationFee(double? value) =>
      _i1.ColumnValue(
        table.registrationFee,
        value,
      );

  _i1.ColumnValue<bool, bool> requiresApproval(bool value) => _i1.ColumnValue(
    table.requiresApproval,
    value,
  );

  _i1.ColumnValue<int, int> minimumParticipants(int value) => _i1.ColumnValue(
    table.minimumParticipants,
    value,
  );

  _i1.ColumnValue<int, int> maxParticipants(int value) => _i1.ColumnValue(
    table.maxParticipants,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> cancellationDeadline(DateTime? value) =>
      _i1.ColumnValue(
        table.cancellationDeadline,
        value,
      );

  _i1.ColumnValue<String, String> registrationNotes(String? value) =>
      _i1.ColumnValue(
        table.registrationNotes,
        value,
      );

  _i1.ColumnValue<int, int> sectionId(int value) => _i1.ColumnValue(
    table.sectionId,
    value,
  );

  _i1.ColumnValue<String, String> documentsJson(String? value) =>
      _i1.ColumnValue(
        table.documentsJson,
        value,
      );

  _i1.ColumnValue<bool, bool> published(bool value) => _i1.ColumnValue(
    table.published,
    value,
  );
}

class EventTable extends _i1.Table<int?> {
  EventTable({super.tableRelation}) : super(tableName: 'events') {
    updateTable = EventUpdateTable(this);
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    startTime = _i1.ColumnDateTime(
      'startTime',
      this,
    );
    endTime = _i1.ColumnDateTime(
      'endTime',
      this,
    );
    location = _i1.ColumnString(
      'location',
      this,
    );
    gpsLatitude = _i1.ColumnDouble(
      'gpsLatitude',
      this,
    );
    gpsLongitude = _i1.ColumnDouble(
      'gpsLongitude',
      this,
    );
    mapLink = _i1.ColumnString(
      'mapLink',
      this,
    );
    carPoolingTime = _i1.ColumnDateTime(
      'carPoolingTime',
      this,
    );
    carPoolingPlace = _i1.ColumnString(
      'carPoolingPlace',
      this,
    );
    carPoolingDriveOrRide = _i1.ColumnString(
      'carPoolingDriveOrRide',
      this,
    );
    difficulty = _i1.ColumnString(
      'difficulty',
      this,
    );
    requiredEquipment = _i1.ColumnString(
      'requiredEquipment',
      this,
    );
    prerequisites = _i1.ColumnString(
      'prerequisites',
      this,
    );
    recurring = _i1.ColumnString(
      'recurring',
      this,
    );
    registrationDeadline = _i1.ColumnDateTime(
      'registrationDeadline',
      this,
    );
    registrationStartDate = _i1.ColumnDateTime(
      'registrationStartDate',
      this,
    );
    registrationFee = _i1.ColumnDouble(
      'registrationFee',
      this,
    );
    requiresApproval = _i1.ColumnBool(
      'requiresApproval',
      this,
      hasDefault: true,
    );
    minimumParticipants = _i1.ColumnInt(
      'minimumParticipants',
      this,
      hasDefault: true,
    );
    maxParticipants = _i1.ColumnInt(
      'maxParticipants',
      this,
      hasDefault: true,
    );
    cancellationDeadline = _i1.ColumnDateTime(
      'cancellationDeadline',
      this,
    );
    registrationNotes = _i1.ColumnString(
      'registrationNotes',
      this,
    );
    sectionId = _i1.ColumnInt(
      'sectionId',
      this,
    );
    documentsJson = _i1.ColumnString(
      'documentsJson',
      this,
    );
    published = _i1.ColumnBool(
      'published',
      this,
      hasDefault: true,
    );
  }

  late final EventUpdateTable updateTable;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnEnum<_i2.EventType> type;

  late final _i1.ColumnDateTime startTime;

  late final _i1.ColumnDateTime endTime;

  late final _i1.ColumnString location;

  late final _i1.ColumnDouble gpsLatitude;

  late final _i1.ColumnDouble gpsLongitude;

  late final _i1.ColumnString mapLink;

  late final _i1.ColumnDateTime carPoolingTime;

  late final _i1.ColumnString carPoolingPlace;

  late final _i1.ColumnString carPoolingDriveOrRide;

  late final _i1.ColumnString difficulty;

  late final _i1.ColumnString requiredEquipment;

  late final _i1.ColumnString prerequisites;

  late final _i1.ColumnString recurring;

  late final _i1.ColumnDateTime registrationDeadline;

  late final _i1.ColumnDateTime registrationStartDate;

  late final _i1.ColumnDouble registrationFee;

  late final _i1.ColumnBool requiresApproval;

  late final _i1.ColumnInt minimumParticipants;

  late final _i1.ColumnInt maxParticipants;

  late final _i1.ColumnDateTime cancellationDeadline;

  late final _i1.ColumnString registrationNotes;

  late final _i1.ColumnInt sectionId;

  late final _i1.ColumnString documentsJson;

  late final _i1.ColumnBool published;

  _i3.EventRegistrationTable? ___eventRegistrations;

  _i1.ManyRelation<_i3.EventRegistrationTable>? _eventRegistrations;

  _i4.EventManagerTable? ___eventManagers;

  _i1.ManyRelation<_i4.EventManagerTable>? _eventManagers;

  _i3.EventRegistrationTable get __eventRegistrations {
    if (___eventRegistrations != null) return ___eventRegistrations!;
    ___eventRegistrations = _i1.createRelationTable(
      relationFieldName: '__eventRegistrations',
      field: Event.t.id,
      foreignField: _i3.EventRegistration.t.eventId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.EventRegistrationTable(tableRelation: foreignTableRelation),
    );
    return ___eventRegistrations!;
  }

  _i4.EventManagerTable get __eventManagers {
    if (___eventManagers != null) return ___eventManagers!;
    ___eventManagers = _i1.createRelationTable(
      relationFieldName: '__eventManagers',
      field: Event.t.id,
      foreignField: _i4.EventManager.t.eventId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.EventManagerTable(tableRelation: foreignTableRelation),
    );
    return ___eventManagers!;
  }

  _i1.ManyRelation<_i3.EventRegistrationTable> get eventRegistrations {
    if (_eventRegistrations != null) return _eventRegistrations!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'eventRegistrations',
      field: Event.t.id,
      foreignField: _i3.EventRegistration.t.eventId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.EventRegistrationTable(tableRelation: foreignTableRelation),
    );
    _eventRegistrations = _i1.ManyRelation<_i3.EventRegistrationTable>(
      tableWithRelations: relationTable,
      table: _i3.EventRegistrationTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _eventRegistrations!;
  }

  _i1.ManyRelation<_i4.EventManagerTable> get eventManagers {
    if (_eventManagers != null) return _eventManagers!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'eventManagers',
      field: Event.t.id,
      foreignField: _i4.EventManager.t.eventId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.EventManagerTable(tableRelation: foreignTableRelation),
    );
    _eventManagers = _i1.ManyRelation<_i4.EventManagerTable>(
      tableWithRelations: relationTable,
      table: _i4.EventManagerTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _eventManagers!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    title,
    description,
    type,
    startTime,
    endTime,
    location,
    gpsLatitude,
    gpsLongitude,
    mapLink,
    carPoolingTime,
    carPoolingPlace,
    carPoolingDriveOrRide,
    difficulty,
    requiredEquipment,
    prerequisites,
    recurring,
    registrationDeadline,
    registrationStartDate,
    registrationFee,
    requiresApproval,
    minimumParticipants,
    maxParticipants,
    cancellationDeadline,
    registrationNotes,
    sectionId,
    documentsJson,
    published,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'eventRegistrations') {
      return __eventRegistrations;
    }
    if (relationField == 'eventManagers') {
      return __eventManagers;
    }
    return null;
  }
}

class EventInclude extends _i1.IncludeObject {
  EventInclude._({
    _i3.EventRegistrationIncludeList? eventRegistrations,
    _i4.EventManagerIncludeList? eventManagers,
  }) {
    _eventRegistrations = eventRegistrations;
    _eventManagers = eventManagers;
  }

  _i3.EventRegistrationIncludeList? _eventRegistrations;

  _i4.EventManagerIncludeList? _eventManagers;

  @override
  Map<String, _i1.Include?> get includes => {
    'eventRegistrations': _eventRegistrations,
    'eventManagers': _eventManagers,
  };

  @override
  _i1.Table<int?> get table => Event.t;
}

class EventIncludeList extends _i1.IncludeList {
  EventIncludeList._({
    _i1.WhereExpressionBuilder<EventTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Event.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Event.t;
}

class EventRepository {
  const EventRepository._();

  final attach = const EventAttachRepository._();

  final attachRow = const EventAttachRowRepository._();

  final detach = const EventDetachRepository._();

  final detachRow = const EventDetachRowRepository._();

  /// Returns a list of [Event]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Event>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTable>? orderByList,
    _i1.Transaction? transaction,
    EventInclude? include,
  }) async {
    return session.db.find<Event>(
      where: where?.call(Event.t),
      orderBy: orderBy?.call(Event.t),
      orderByList: orderByList?.call(Event.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Event] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Event?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventTable>? where,
    int? offset,
    _i1.OrderByBuilder<EventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTable>? orderByList,
    _i1.Transaction? transaction,
    EventInclude? include,
  }) async {
    return session.db.findFirstRow<Event>(
      where: where?.call(Event.t),
      orderBy: orderBy?.call(Event.t),
      orderByList: orderByList?.call(Event.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Event] by its [id] or null if no such row exists.
  Future<Event?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    EventInclude? include,
  }) async {
    return session.db.findById<Event>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Event]s in the list and returns the inserted rows.
  ///
  /// The returned [Event]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Event>> insert(
    _i1.Session session,
    List<Event> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Event>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Event] and returns the inserted row.
  ///
  /// The returned [Event] will have its `id` field set.
  Future<Event> insertRow(
    _i1.Session session,
    Event row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Event>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Event]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Event>> update(
    _i1.Session session,
    List<Event> rows, {
    _i1.ColumnSelections<EventTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Event>(
      rows,
      columns: columns?.call(Event.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Event]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Event> updateRow(
    _i1.Session session,
    Event row, {
    _i1.ColumnSelections<EventTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Event>(
      row,
      columns: columns?.call(Event.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Event] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Event?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<EventUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Event>(
      id,
      columnValues: columnValues(Event.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Event]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Event>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<EventUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<EventTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventTable>? orderBy,
    _i1.OrderByListBuilder<EventTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Event>(
      columnValues: columnValues(Event.t.updateTable),
      where: where(Event.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Event.t),
      orderByList: orderByList?.call(Event.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Event]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Event>> delete(
    _i1.Session session,
    List<Event> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Event>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Event].
  Future<Event> deleteRow(
    _i1.Session session,
    Event row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Event>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Event>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EventTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Event>(
      where: where(Event.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Event>(
      where: where?.call(Event.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class EventAttachRepository {
  const EventAttachRepository._();

  /// Creates a relation between this [Event] and the given [EventRegistration]s
  /// by setting each [EventRegistration]'s foreign key `eventId` to refer to this [Event].
  Future<void> eventRegistrations(
    _i1.Session session,
    Event event,
    List<_i3.EventRegistration> eventRegistration, {
    _i1.Transaction? transaction,
  }) async {
    if (eventRegistration.any((e) => e.id == null)) {
      throw ArgumentError.notNull('eventRegistration.id');
    }
    if (event.id == null) {
      throw ArgumentError.notNull('event.id');
    }

    var $eventRegistration = eventRegistration
        .map((e) => e.copyWith(eventId: event.id))
        .toList();
    await session.db.update<_i3.EventRegistration>(
      $eventRegistration,
      columns: [_i3.EventRegistration.t.eventId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Event] and the given [EventManager]s
  /// by setting each [EventManager]'s foreign key `eventId` to refer to this [Event].
  Future<void> eventManagers(
    _i1.Session session,
    Event event,
    List<_i4.EventManager> eventManager, {
    _i1.Transaction? transaction,
  }) async {
    if (eventManager.any((e) => e.id == null)) {
      throw ArgumentError.notNull('eventManager.id');
    }
    if (event.id == null) {
      throw ArgumentError.notNull('event.id');
    }

    var $eventManager = eventManager
        .map((e) => e.copyWith(eventId: event.id))
        .toList();
    await session.db.update<_i4.EventManager>(
      $eventManager,
      columns: [_i4.EventManager.t.eventId],
      transaction: transaction,
    );
  }
}

class EventAttachRowRepository {
  const EventAttachRowRepository._();

  /// Creates a relation between this [Event] and the given [EventRegistration]
  /// by setting the [EventRegistration]'s foreign key `eventId` to refer to this [Event].
  Future<void> eventRegistrations(
    _i1.Session session,
    Event event,
    _i3.EventRegistration eventRegistration, {
    _i1.Transaction? transaction,
  }) async {
    if (eventRegistration.id == null) {
      throw ArgumentError.notNull('eventRegistration.id');
    }
    if (event.id == null) {
      throw ArgumentError.notNull('event.id');
    }

    var $eventRegistration = eventRegistration.copyWith(eventId: event.id);
    await session.db.updateRow<_i3.EventRegistration>(
      $eventRegistration,
      columns: [_i3.EventRegistration.t.eventId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Event] and the given [EventManager]
  /// by setting the [EventManager]'s foreign key `eventId` to refer to this [Event].
  Future<void> eventManagers(
    _i1.Session session,
    Event event,
    _i4.EventManager eventManager, {
    _i1.Transaction? transaction,
  }) async {
    if (eventManager.id == null) {
      throw ArgumentError.notNull('eventManager.id');
    }
    if (event.id == null) {
      throw ArgumentError.notNull('event.id');
    }

    var $eventManager = eventManager.copyWith(eventId: event.id);
    await session.db.updateRow<_i4.EventManager>(
      $eventManager,
      columns: [_i4.EventManager.t.eventId],
      transaction: transaction,
    );
  }
}

class EventDetachRepository {
  const EventDetachRepository._();

  /// Detaches the relation between this [Event] and the given [EventRegistration]
  /// by setting the [EventRegistration]'s foreign key `eventId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> eventRegistrations(
    _i1.Session session,
    List<_i3.EventRegistration> eventRegistration, {
    _i1.Transaction? transaction,
  }) async {
    if (eventRegistration.any((e) => e.id == null)) {
      throw ArgumentError.notNull('eventRegistration.id');
    }

    var $eventRegistration = eventRegistration
        .map((e) => e.copyWith(eventId: null))
        .toList();
    await session.db.update<_i3.EventRegistration>(
      $eventRegistration,
      columns: [_i3.EventRegistration.t.eventId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Event] and the given [EventManager]
  /// by setting the [EventManager]'s foreign key `eventId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> eventManagers(
    _i1.Session session,
    List<_i4.EventManager> eventManager, {
    _i1.Transaction? transaction,
  }) async {
    if (eventManager.any((e) => e.id == null)) {
      throw ArgumentError.notNull('eventManager.id');
    }

    var $eventManager = eventManager
        .map((e) => e.copyWith(eventId: null))
        .toList();
    await session.db.update<_i4.EventManager>(
      $eventManager,
      columns: [_i4.EventManager.t.eventId],
      transaction: transaction,
    );
  }
}

class EventDetachRowRepository {
  const EventDetachRowRepository._();

  /// Detaches the relation between this [Event] and the given [EventRegistration]
  /// by setting the [EventRegistration]'s foreign key `eventId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> eventRegistrations(
    _i1.Session session,
    _i3.EventRegistration eventRegistration, {
    _i1.Transaction? transaction,
  }) async {
    if (eventRegistration.id == null) {
      throw ArgumentError.notNull('eventRegistration.id');
    }

    var $eventRegistration = eventRegistration.copyWith(eventId: null);
    await session.db.updateRow<_i3.EventRegistration>(
      $eventRegistration,
      columns: [_i3.EventRegistration.t.eventId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Event] and the given [EventManager]
  /// by setting the [EventManager]'s foreign key `eventId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> eventManagers(
    _i1.Session session,
    _i4.EventManager eventManager, {
    _i1.Transaction? transaction,
  }) async {
    if (eventManager.id == null) {
      throw ArgumentError.notNull('eventManager.id');
    }

    var $eventManager = eventManager.copyWith(eventId: null);
    await session.db.updateRow<_i4.EventManager>(
      $eventManager,
      columns: [_i4.EventManager.t.eventId],
      transaction: transaction,
    );
  }
}
