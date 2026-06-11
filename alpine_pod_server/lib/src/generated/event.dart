/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'section.dart' as _i2;
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
    this.eventLocation,
    this.carpoolLocation,
    this.carpoolTime,
    this.registrationDeadline,
    this.registrationStartDate,
    this.registrationFee,
    bool? requiresApproval,
    int? minimumParticipants,
    int? maxParticipants,
    this.cancellationDeadline,
    bool? cancelled,
    required this.sectionId,
    this.section,
    bool? published,
    this.eventRegistrations,
    this.eventManagers,
  }) : requiresApproval = requiresApproval ?? true,
       minimumParticipants = minimumParticipants ?? 0,
       maxParticipants = maxParticipants ?? 8,
       cancelled = cancelled ?? false,
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
    DateTime? registrationDeadline,
    DateTime? registrationStartDate,
    double? registrationFee,
    bool? requiresApproval,
    int? minimumParticipants,
    int? maxParticipants,
    DateTime? cancellationDeadline,
    bool? cancelled,
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
      cancelled: jsonSerialization['cancelled'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['cancelled']),
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

  static final t = EventTable();

  static const db = EventRepository._();

  @override
  int? id;

  String title;

  String description;

  String type;

  DateTime startTime;

  DateTime endTime;

  String? eventLocation;

  String? carpoolLocation;

  DateTime? carpoolTime;

  DateTime? registrationDeadline;

  DateTime? registrationStartDate;

  double? registrationFee;

  bool requiresApproval;

  int minimumParticipants;

  int maxParticipants;

  DateTime? cancellationDeadline;

  bool cancelled;

  int sectionId;

  _i2.Section? section;

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
    String? type,
    DateTime? startTime,
    DateTime? endTime,
    String? eventLocation,
    String? carpoolLocation,
    DateTime? carpoolTime,
    DateTime? registrationDeadline,
    DateTime? registrationStartDate,
    double? registrationFee,
    bool? requiresApproval,
    int? minimumParticipants,
    int? maxParticipants,
    DateTime? cancellationDeadline,
    bool? cancelled,
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
      'cancelled': cancelled,
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
  Map<String, dynamic> toJsonForProtocol() {
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
      'cancelled': cancelled,
      'sectionId': sectionId,
      if (section != null) 'section': section?.toJsonForProtocol(),
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
    _i2.SectionInclude? section,
    _i3.EventRegistrationIncludeList? eventRegistrations,
    _i4.EventManagerIncludeList? eventManagers,
  }) {
    return EventInclude._(
      section: section,
      eventRegistrations: eventRegistrations,
      eventManagers: eventManagers,
    );
  }

  static EventIncludeList includeList({
    _i1.WhereExpressionBuilder<EventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTable>? orderByList,
    EventInclude? include,
  }) {
    return EventIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Event.t),
      orderDescending: // ignore: deprecated_member_use_from_same_package
          orderDescending,
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
    required String type,
    required DateTime startTime,
    required DateTime endTime,
    String? eventLocation,
    String? carpoolLocation,
    DateTime? carpoolTime,
    DateTime? registrationDeadline,
    DateTime? registrationStartDate,
    double? registrationFee,
    bool? requiresApproval,
    int? minimumParticipants,
    int? maxParticipants,
    DateTime? cancellationDeadline,
    bool? cancelled,
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
         registrationDeadline: registrationDeadline,
         registrationStartDate: registrationStartDate,
         registrationFee: registrationFee,
         requiresApproval: requiresApproval,
         minimumParticipants: minimumParticipants,
         maxParticipants: maxParticipants,
         cancellationDeadline: cancellationDeadline,
         cancelled: cancelled,
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
    Object? registrationDeadline = _Undefined,
    Object? registrationStartDate = _Undefined,
    Object? registrationFee = _Undefined,
    bool? requiresApproval,
    int? minimumParticipants,
    int? maxParticipants,
    Object? cancellationDeadline = _Undefined,
    bool? cancelled,
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
      cancelled: cancelled ?? this.cancelled,
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

  _i1.ColumnValue<String, String> type(String value) => _i1.ColumnValue(
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

  _i1.ColumnValue<String, String> eventLocation(String? value) =>
      _i1.ColumnValue(
        table.eventLocation,
        value,
      );

  _i1.ColumnValue<String, String> carpoolLocation(String? value) =>
      _i1.ColumnValue(
        table.carpoolLocation,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> carpoolTime(DateTime? value) =>
      _i1.ColumnValue(
        table.carpoolTime,
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

  _i1.ColumnValue<bool, bool> cancelled(bool value) => _i1.ColumnValue(
    table.cancelled,
    value,
  );

  _i1.ColumnValue<int, int> sectionId(int value) => _i1.ColumnValue(
    table.sectionId,
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
    type = _i1.ColumnString(
      'type',
      this,
    );
    startTime = _i1.ColumnDateTime(
      'startTime',
      this,
    );
    endTime = _i1.ColumnDateTime(
      'endTime',
      this,
    );
    eventLocation = _i1.ColumnString(
      'eventLocation',
      this,
    );
    carpoolLocation = _i1.ColumnString(
      'carpoolLocation',
      this,
    );
    carpoolTime = _i1.ColumnDateTime(
      'carpoolTime',
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
    cancelled = _i1.ColumnBool(
      'cancelled',
      this,
      hasDefault: true,
    );
    sectionId = _i1.ColumnInt(
      'sectionId',
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

  late final _i1.ColumnString type;

  late final _i1.ColumnDateTime startTime;

  late final _i1.ColumnDateTime endTime;

  late final _i1.ColumnString eventLocation;

  late final _i1.ColumnString carpoolLocation;

  late final _i1.ColumnDateTime carpoolTime;

  late final _i1.ColumnDateTime registrationDeadline;

  late final _i1.ColumnDateTime registrationStartDate;

  late final _i1.ColumnDouble registrationFee;

  late final _i1.ColumnBool requiresApproval;

  late final _i1.ColumnInt minimumParticipants;

  late final _i1.ColumnInt maxParticipants;

  late final _i1.ColumnDateTime cancellationDeadline;

  late final _i1.ColumnBool cancelled;

  late final _i1.ColumnInt sectionId;

  _i2.SectionTable? _section;

  late final _i1.ColumnBool published;

  _i3.EventRegistrationTable? ___eventRegistrations;

  _i1.ManyRelation<_i3.EventRegistrationTable>? _eventRegistrations;

  _i4.EventManagerTable? ___eventManagers;

  _i1.ManyRelation<_i4.EventManagerTable>? _eventManagers;

  _i2.SectionTable get section {
    if (_section != null) return _section!;
    _section = _i1.createRelationTable(
      relationFieldName: 'section',
      field: Event.t.sectionId,
      foreignField: _i2.Section.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.SectionTable(tableRelation: foreignTableRelation),
    );
    return _section!;
  }

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
    eventLocation,
    carpoolLocation,
    carpoolTime,
    registrationDeadline,
    registrationStartDate,
    registrationFee,
    requiresApproval,
    minimumParticipants,
    maxParticipants,
    cancellationDeadline,
    cancelled,
    sectionId,
    published,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'section') {
      return section;
    }
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
    _i2.SectionInclude? section,
    _i3.EventRegistrationIncludeList? eventRegistrations,
    _i4.EventManagerIncludeList? eventManagers,
  }) {
    _section = section;
    _eventRegistrations = eventRegistrations;
    _eventManagers = eventManagers;
  }

  _i2.SectionInclude? _section;

  _i3.EventRegistrationIncludeList? _eventRegistrations;

  _i4.EventManagerIncludeList? _eventManagers;

  @override
  Map<String, _i1.Include?> get includes => {
    'section': _section,
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
    @Deprecated('Use desc() on the orderBy column instead.')
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
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<EventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTable>? orderByList,
    _i1.Transaction? transaction,
    EventInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Event>(
      where: where?.call(Event.t),
      orderBy: orderBy?.call(Event.t),
      orderByList: orderByList?.call(Event.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
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
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<EventTable>? where,
    int? offset,
    _i1.OrderByBuilder<EventTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTable>? orderByList,
    _i1.Transaction? transaction,
    EventInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Event>(
      where: where?.call(Event.t),
      orderBy: orderBy?.call(Event.t),
      orderByList: orderByList?.call(Event.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Event] by its [id] or null if no such row exists.
  Future<Event?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    EventInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Event>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Event]s in the list and returns the inserted rows.
  ///
  /// The returned [Event]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Event>> insert(
    _i1.DatabaseSession session,
    List<Event> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Event>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Event] and returns the inserted row.
  ///
  /// The returned [Event] will have its `id` field set.
  Future<Event> insertRow(
    _i1.DatabaseSession session,
    Event row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Event>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Event]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [Event]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  Future<List<Event>> upsert(
    _i1.DatabaseSession session,
    List<Event> rows, {
    required _i1.ColumnSelections<EventTable> conflictColumns,
    _i1.ColumnSelections<EventTable>? updateColumns,
    _i1.WhereExpressionBuilder<EventTable>? updateWhere,
    _i1.Transaction? transaction,
  }) async {
    return session.db.upsert<Event>(
      rows,
      conflictColumns: conflictColumns(Event.t),
      updateColumns: updateColumns?.call(Event.t),
      updateWhere: updateWhere?.call(Event.t),
      transaction: transaction,
    );
  }

  /// Upserts a single [Event] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [Event] will have its `id` field set.
  Future<Event?> upsertRow(
    _i1.DatabaseSession session,
    Event row, {
    required _i1.ColumnSelections<EventTable> conflictColumns,
    _i1.ColumnSelections<EventTable>? updateColumns,
    _i1.WhereExpressionBuilder<EventTable>? updateWhere,
    _i1.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Event>(
      row,
      conflictColumns: conflictColumns(Event.t),
      updateColumns: updateColumns?.call(Event.t),
      updateWhere: updateWhere?.call(Event.t),
      transaction: transaction,
    );
  }

  /// Updates all [Event]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Event>> update(
    _i1.DatabaseSession session,
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
    _i1.DatabaseSession session,
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
    _i1.DatabaseSession session,
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
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<EventUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<EventTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventTable>? orderBy,
    _i1.OrderByListBuilder<EventTable>? orderByList,
    @Deprecated('Use desc() on the orderBy column instead.')
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
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Event]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Event>> delete(
    _i1.DatabaseSession session,
    List<Event> rows, {
    _i1.OrderByBuilder<EventTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Event>(
      rows,
      orderBy: orderBy?.call(Event.t),
      orderByList: orderByList?.call(Event.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes a single [Event].
  Future<Event> deleteRow(
    _i1.DatabaseSession session,
    Event row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Event>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  Future<List<Event>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<EventTable> where,
    _i1.OrderByBuilder<EventTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Event>(
      where: where(Event.t),
      orderBy: orderBy?.call(Event.t),
      orderByList: orderByList?.call(Event.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
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

  /// Acquires row-level locks on [Event] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<EventTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Event>(
      where: where(Event.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class EventAttachRepository {
  const EventAttachRepository._();

  /// Creates a relation between this [Event] and the given [EventRegistration]s
  /// by setting each [EventRegistration]'s foreign key `eventId` to refer to this [Event].
  Future<void> eventRegistrations(
    _i1.DatabaseSession session,
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
    _i1.DatabaseSession session,
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

  /// Creates a relation between the given [Event] and [Section]
  /// by setting the [Event]'s foreign key `sectionId` to refer to the [Section].
  Future<void> section(
    _i1.DatabaseSession session,
    Event event,
    _i2.Section section, {
    _i1.Transaction? transaction,
  }) async {
    if (event.id == null) {
      throw ArgumentError.notNull('event.id');
    }
    if (section.id == null) {
      throw ArgumentError.notNull('section.id');
    }

    var $event = event.copyWith(sectionId: section.id);
    await session.db.updateRow<Event>(
      $event,
      columns: [Event.t.sectionId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Event] and the given [EventRegistration]
  /// by setting the [EventRegistration]'s foreign key `eventId` to refer to this [Event].
  Future<void> eventRegistrations(
    _i1.DatabaseSession session,
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
    _i1.DatabaseSession session,
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
    _i1.DatabaseSession session,
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
    _i1.DatabaseSession session,
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
    _i1.DatabaseSession session,
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
    _i1.DatabaseSession session,
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
