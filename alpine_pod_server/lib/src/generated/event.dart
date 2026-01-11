/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'event_type.dart' as _i2;

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
    this.maxParticipants,
    this.difficulty,
    this.requiredEquipment,
    this.prerequisites,
    this.recurring,
    this.registrationDeadline,
    this.registrationStartDate,
    required this.waitlistEnabled,
    this.registrationFee,
    this.currentRegistrationCount,
    required this.requiresApproval,
    required this.waiverRequired,
    this.minimumParticipants,
    this.cancellationDeadline,
    this.registrationNotes,
    required this.sectionId,
    this.documentsJson,
    bool? published,
  }) : published = published ?? false;

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
    int? maxParticipants,
    String? difficulty,
    String? requiredEquipment,
    String? prerequisites,
    String? recurring,
    DateTime? registrationDeadline,
    DateTime? registrationStartDate,
    required bool waitlistEnabled,
    double? registrationFee,
    int? currentRegistrationCount,
    required bool requiresApproval,
    required bool waiverRequired,
    int? minimumParticipants,
    DateTime? cancellationDeadline,
    String? registrationNotes,
    required int sectionId,
    String? documentsJson,
    bool? published,
  }) = _EventImpl;

  factory Event.fromJson(Map<String, dynamic> jsonSerialization) {
    return Event(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      type: _i2.EventType.fromJson((jsonSerialization['type'] as int)),
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
      requiresApproval: jsonSerialization['requiresApproval'] as bool,
      waiverRequired: jsonSerialization['waiverRequired'] as bool,
      minimumParticipants: jsonSerialization['minimumParticipants'] as int?,
      cancellationDeadline: jsonSerialization['cancellationDeadline'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['cancellationDeadline']),
      registrationNotes: jsonSerialization['registrationNotes'] as String?,
      sectionId: jsonSerialization['sectionId'] as int,
      documentsJson: jsonSerialization['documentsJson'] as String?,
      published: jsonSerialization['published'] as bool,
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

  int? maxParticipants;

  String? difficulty;

  String? requiredEquipment;

  String? prerequisites;

  String? recurring;

  DateTime? registrationDeadline;

  DateTime? registrationStartDate;

  bool waitlistEnabled;

  double? registrationFee;

  int? currentRegistrationCount;

  bool requiresApproval;

  bool waiverRequired;

  int? minimumParticipants;

  DateTime? cancellationDeadline;

  String? registrationNotes;

  int sectionId;

  String? documentsJson;

  bool published;

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
    int? maxParticipants,
    String? difficulty,
    String? requiredEquipment,
    String? prerequisites,
    String? recurring,
    DateTime? registrationDeadline,
    DateTime? registrationStartDate,
    bool? waitlistEnabled,
    double? registrationFee,
    int? currentRegistrationCount,
    bool? requiresApproval,
    bool? waiverRequired,
    int? minimumParticipants,
    DateTime? cancellationDeadline,
    String? registrationNotes,
    int? sectionId,
    String? documentsJson,
    bool? published,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
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
      if (maxParticipants != null) 'maxParticipants': maxParticipants,
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
      'requiresApproval': requiresApproval,
      'waiverRequired': waiverRequired,
      if (minimumParticipants != null)
        'minimumParticipants': minimumParticipants,
      if (cancellationDeadline != null)
        'cancellationDeadline': cancellationDeadline?.toJson(),
      if (registrationNotes != null) 'registrationNotes': registrationNotes,
      'sectionId': sectionId,
      if (documentsJson != null) 'documentsJson': documentsJson,
      'published': published,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
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
      if (maxParticipants != null) 'maxParticipants': maxParticipants,
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
      'requiresApproval': requiresApproval,
      'waiverRequired': waiverRequired,
      if (minimumParticipants != null)
        'minimumParticipants': minimumParticipants,
      if (cancellationDeadline != null)
        'cancellationDeadline': cancellationDeadline?.toJson(),
      if (registrationNotes != null) 'registrationNotes': registrationNotes,
      'sectionId': sectionId,
      if (documentsJson != null) 'documentsJson': documentsJson,
      'published': published,
    };
  }

  static EventInclude include() {
    return EventInclude._();
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
    int? maxParticipants,
    String? difficulty,
    String? requiredEquipment,
    String? prerequisites,
    String? recurring,
    DateTime? registrationDeadline,
    DateTime? registrationStartDate,
    required bool waitlistEnabled,
    double? registrationFee,
    int? currentRegistrationCount,
    required bool requiresApproval,
    required bool waiverRequired,
    int? minimumParticipants,
    DateTime? cancellationDeadline,
    String? registrationNotes,
    required int sectionId,
    String? documentsJson,
    bool? published,
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
          maxParticipants: maxParticipants,
          difficulty: difficulty,
          requiredEquipment: requiredEquipment,
          prerequisites: prerequisites,
          recurring: recurring,
          registrationDeadline: registrationDeadline,
          registrationStartDate: registrationStartDate,
          waitlistEnabled: waitlistEnabled,
          registrationFee: registrationFee,
          currentRegistrationCount: currentRegistrationCount,
          requiresApproval: requiresApproval,
          waiverRequired: waiverRequired,
          minimumParticipants: minimumParticipants,
          cancellationDeadline: cancellationDeadline,
          registrationNotes: registrationNotes,
          sectionId: sectionId,
          documentsJson: documentsJson,
          published: published,
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
    Object? maxParticipants = _Undefined,
    Object? difficulty = _Undefined,
    Object? requiredEquipment = _Undefined,
    Object? prerequisites = _Undefined,
    Object? recurring = _Undefined,
    Object? registrationDeadline = _Undefined,
    Object? registrationStartDate = _Undefined,
    bool? waitlistEnabled,
    Object? registrationFee = _Undefined,
    Object? currentRegistrationCount = _Undefined,
    bool? requiresApproval,
    bool? waiverRequired,
    Object? minimumParticipants = _Undefined,
    Object? cancellationDeadline = _Undefined,
    Object? registrationNotes = _Undefined,
    int? sectionId,
    Object? documentsJson = _Undefined,
    bool? published,
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
      carPoolingTime:
          carPoolingTime is DateTime? ? carPoolingTime : this.carPoolingTime,
      carPoolingPlace:
          carPoolingPlace is String? ? carPoolingPlace : this.carPoolingPlace,
      carPoolingDriveOrRide: carPoolingDriveOrRide is String?
          ? carPoolingDriveOrRide
          : this.carPoolingDriveOrRide,
      maxParticipants:
          maxParticipants is int? ? maxParticipants : this.maxParticipants,
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
      requiresApproval: requiresApproval ?? this.requiresApproval,
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
      sectionId: sectionId ?? this.sectionId,
      documentsJson:
          documentsJson is String? ? documentsJson : this.documentsJson,
      published: published ?? this.published,
    );
  }
}

class EventTable extends _i1.Table<int?> {
  EventTable({super.tableRelation}) : super(tableName: 'events') {
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
      _i1.EnumSerialization.byIndex,
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
    maxParticipants = _i1.ColumnInt(
      'maxParticipants',
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
    waitlistEnabled = _i1.ColumnBool(
      'waitlistEnabled',
      this,
    );
    registrationFee = _i1.ColumnDouble(
      'registrationFee',
      this,
    );
    currentRegistrationCount = _i1.ColumnInt(
      'currentRegistrationCount',
      this,
    );
    requiresApproval = _i1.ColumnBool(
      'requiresApproval',
      this,
    );
    waiverRequired = _i1.ColumnBool(
      'waiverRequired',
      this,
    );
    minimumParticipants = _i1.ColumnInt(
      'minimumParticipants',
      this,
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

  late final _i1.ColumnInt maxParticipants;

  late final _i1.ColumnString difficulty;

  late final _i1.ColumnString requiredEquipment;

  late final _i1.ColumnString prerequisites;

  late final _i1.ColumnString recurring;

  late final _i1.ColumnDateTime registrationDeadline;

  late final _i1.ColumnDateTime registrationStartDate;

  late final _i1.ColumnBool waitlistEnabled;

  late final _i1.ColumnDouble registrationFee;

  late final _i1.ColumnInt currentRegistrationCount;

  late final _i1.ColumnBool requiresApproval;

  late final _i1.ColumnBool waiverRequired;

  late final _i1.ColumnInt minimumParticipants;

  late final _i1.ColumnDateTime cancellationDeadline;

  late final _i1.ColumnString registrationNotes;

  late final _i1.ColumnInt sectionId;

  late final _i1.ColumnString documentsJson;

  late final _i1.ColumnBool published;

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
        maxParticipants,
        difficulty,
        requiredEquipment,
        prerequisites,
        recurring,
        registrationDeadline,
        registrationStartDate,
        waitlistEnabled,
        registrationFee,
        currentRegistrationCount,
        requiresApproval,
        waiverRequired,
        minimumParticipants,
        cancellationDeadline,
        registrationNotes,
        sectionId,
        documentsJson,
        published,
      ];
}

class EventInclude extends _i1.IncludeObject {
  EventInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

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
  }) async {
    return session.db.find<Event>(
      where: where?.call(Event.t),
      orderBy: orderBy?.call(Event.t),
      orderByList: orderByList?.call(Event.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
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
  }) async {
    return session.db.findFirstRow<Event>(
      where: where?.call(Event.t),
      orderBy: orderBy?.call(Event.t),
      orderByList: orderByList?.call(Event.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Event] by its [id] or null if no such row exists.
  Future<Event?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Event>(
      id,
      transaction: transaction,
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
