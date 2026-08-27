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
import 'package:alpine_pod_server/src/generated/protocol.dart' as _i1rm9ghy;
import 'package:serverpod/serverpod.dart' as _is;

import 'event_manager.dart' as _ich6ygep;
import 'event_registration.dart' as _i27uzliw;
import 'section.dart' as _ibhmj7lb;

abstract class Event
    implements _is.TableRow<_is.UuidValue>, _is.ProtocolSerialization {
  Event._({
    _is.UuidValue? id,
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
    DateTime? updatedAt,
  }) : id = id ?? const _is.Uuid().v7obj(),
       requiresApproval = requiresApproval ?? true,
       minimumParticipants = minimumParticipants ?? 0,
       maxParticipants = maxParticipants ?? 8,
       cancelled = cancelled ?? false,
       published = published ?? false,
       updatedAt = updatedAt ?? DateTime.now();

  factory Event({
    _is.UuidValue? id,
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
    required _is.UuidValue sectionId,
    _ibhmj7lb.Section? section,
    bool? published,
    List<_i27uzliw.EventRegistration>? eventRegistrations,
    List<_ich6ygep.EventManager>? eventManagers,
    DateTime? updatedAt,
  }) = _EventImpl;

  factory Event.fromJson(Map<String, dynamic> jsonSerialization) {
    return Event(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      type: jsonSerialization['type'] as String,
      startTime: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['startTime'],
      ),
      endTime: _is.DateTimeJsonExtension.fromJson(jsonSerialization['endTime']),
      eventLocation: jsonSerialization['eventLocation'] as String?,
      carpoolLocation: jsonSerialization['carpoolLocation'] as String?,
      carpoolTime: jsonSerialization['carpoolTime'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['carpoolTime'],
            ),
      registrationDeadline: jsonSerialization['registrationDeadline'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['registrationDeadline'],
            ),
      registrationStartDate: jsonSerialization['registrationStartDate'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['registrationStartDate'],
            ),
      registrationFee: (jsonSerialization['registrationFee'] as num?)
          ?.toDouble(),
      requiresApproval: jsonSerialization['requiresApproval'] == null
          ? null
          : _is.BoolJsonExtension.fromJson(
              jsonSerialization['requiresApproval'],
            ),
      minimumParticipants: jsonSerialization['minimumParticipants'] as int?,
      maxParticipants: jsonSerialization['maxParticipants'] as int?,
      cancellationDeadline: jsonSerialization['cancellationDeadline'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['cancellationDeadline'],
            ),
      cancelled: jsonSerialization['cancelled'] == null
          ? null
          : _is.BoolJsonExtension.fromJson(jsonSerialization['cancelled']),
      sectionId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['sectionId'],
      ),
      section: jsonSerialization['section'] == null
          ? null
          : _i1rm9ghy.Protocol().deserialize<_ibhmj7lb.Section>(
              jsonSerialization['section'],
            ),
      published: jsonSerialization['published'] == null
          ? null
          : _is.BoolJsonExtension.fromJson(jsonSerialization['published']),
      eventRegistrations: jsonSerialization['eventRegistrations'] == null
          ? null
          : _i1rm9ghy.Protocol().deserialize<List<_i27uzliw.EventRegistration>>(
              jsonSerialization['eventRegistrations'],
            ),
      eventManagers: jsonSerialization['eventManagers'] == null
          ? null
          : _i1rm9ghy.Protocol().deserialize<List<_ich6ygep.EventManager>>(
              jsonSerialization['eventManagers'],
            ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = EventTable();

  static const db = EventRepository._();

  @override
  _is.UuidValue id;

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

  _is.UuidValue sectionId;

  _ibhmj7lb.Section? section;

  bool published;

  List<_i27uzliw.EventRegistration>? eventRegistrations;

  List<_ich6ygep.EventManager>? eventManagers;

  DateTime updatedAt;

  @override
  _is.Table<_is.UuidValue> get table => t;

  /// Returns a shallow copy of this [Event]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Event copyWith({
    _is.UuidValue? id,
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
    _is.UuidValue? sectionId,
    _ibhmj7lb.Section? section,
    bool? published,
    List<_i27uzliw.EventRegistration>? eventRegistrations,
    List<_ich6ygep.EventManager>? eventManagers,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Event',
      'id': id.toJson(),
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
      'sectionId': sectionId.toJson(),
      if (section != null) 'section': section?.toJson(),
      'published': published,
      if (eventRegistrations != null)
        'eventRegistrations': eventRegistrations?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (eventManagers != null)
        'eventManagers': eventManagers?.toJson(valueToJson: (v) => v.toJson()),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Event',
      'id': id.toJson(),
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
      'sectionId': sectionId.toJson(),
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
      'updatedAt': updatedAt.toJson(),
    };
  }

  static EventInclude include({
    _ibhmj7lb.SectionInclude? section,
    _i27uzliw.EventRegistrationIncludeList? eventRegistrations,
    _ich6ygep.EventManagerIncludeList? eventManagers,
  }) {
    return EventInclude._(
      section: section,
      eventRegistrations: eventRegistrations,
      eventManagers: eventManagers,
    );
  }

  static EventIncludeList includeList({
    _is.WhereExpressionBuilder<EventTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EventTable>? orderBy,
    _is.OrderByListBuilder<EventTable>? orderByList,
    EventInclude? include,
  }) {
    return EventIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Event.t),
      orderByList: orderByList?.call(Event.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventImpl extends Event {
  _EventImpl({
    _is.UuidValue? id,
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
    required _is.UuidValue sectionId,
    _ibhmj7lb.Section? section,
    bool? published,
    List<_i27uzliw.EventRegistration>? eventRegistrations,
    List<_ich6ygep.EventManager>? eventManagers,
    DateTime? updatedAt,
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
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Event]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Event copyWith({
    _is.UuidValue? id,
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
    _is.UuidValue? sectionId,
    Object? section = _Undefined,
    bool? published,
    Object? eventRegistrations = _Undefined,
    Object? eventManagers = _Undefined,
    DateTime? updatedAt,
  }) {
    return Event(
      id: id ?? this.id,
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
      section: section is _ibhmj7lb.Section?
          ? section
          : this.section?.copyWith(),
      published: published ?? this.published,
      eventRegistrations:
          eventRegistrations is List<_i27uzliw.EventRegistration>?
          ? eventRegistrations
          : this.eventRegistrations?.map((e0) => e0.copyWith()).toList(),
      eventManagers: eventManagers is List<_ich6ygep.EventManager>?
          ? eventManagers
          : this.eventManagers?.map((e0) => e0.copyWith()).toList(),
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class EventUpdateTable extends _is.UpdateTable<EventTable> {
  EventUpdateTable(super.table);

  _is.ColumnValue<String, String> title(String value) =>
      _is.ColumnValue(table.title, value);

  _is.ColumnValue<String, String> description(String value) =>
      _is.ColumnValue(table.description, value);

  _is.ColumnValue<String, String> type(String value) =>
      _is.ColumnValue(table.type, value);

  _is.ColumnValue<DateTime, DateTime> startTime(DateTime value) =>
      _is.ColumnValue(table.startTime, value);

  _is.ColumnValue<DateTime, DateTime> endTime(DateTime value) =>
      _is.ColumnValue(table.endTime, value);

  _is.ColumnValue<String, String> eventLocation(String? value) =>
      _is.ColumnValue(table.eventLocation, value);

  _is.ColumnValue<String, String> carpoolLocation(String? value) =>
      _is.ColumnValue(table.carpoolLocation, value);

  _is.ColumnValue<DateTime, DateTime> carpoolTime(DateTime? value) =>
      _is.ColumnValue(table.carpoolTime, value);

  _is.ColumnValue<DateTime, DateTime> registrationDeadline(DateTime? value) =>
      _is.ColumnValue(table.registrationDeadline, value);

  _is.ColumnValue<DateTime, DateTime> registrationStartDate(DateTime? value) =>
      _is.ColumnValue(table.registrationStartDate, value);

  _is.ColumnValue<double, double> registrationFee(double? value) =>
      _is.ColumnValue(table.registrationFee, value);

  _is.ColumnValue<bool, bool> requiresApproval(bool value) =>
      _is.ColumnValue(table.requiresApproval, value);

  _is.ColumnValue<int, int> minimumParticipants(int value) =>
      _is.ColumnValue(table.minimumParticipants, value);

  _is.ColumnValue<int, int> maxParticipants(int value) =>
      _is.ColumnValue(table.maxParticipants, value);

  _is.ColumnValue<DateTime, DateTime> cancellationDeadline(DateTime? value) =>
      _is.ColumnValue(table.cancellationDeadline, value);

  _is.ColumnValue<bool, bool> cancelled(bool value) =>
      _is.ColumnValue(table.cancelled, value);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> sectionId(
    _is.UuidValue value,
  ) => _is.ColumnValue(table.sectionId, value);

  _is.ColumnValue<bool, bool> published(bool value) =>
      _is.ColumnValue(table.published, value);

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(table.updatedAt, value);
}

class EventTable extends _is.Table<_is.UuidValue> {
  EventTable({super.tableRelation}) : super(tableName: 'events') {
    updateTable = EventUpdateTable(this);
    title = _is.ColumnString('title', this);
    description = _is.ColumnString('description', this);
    type = _is.ColumnString('type', this);
    startTime = _is.ColumnDateTime('startTime', this);
    endTime = _is.ColumnDateTime('endTime', this);
    eventLocation = _is.ColumnString('eventLocation', this);
    carpoolLocation = _is.ColumnString('carpoolLocation', this);
    carpoolTime = _is.ColumnDateTime('carpoolTime', this);
    registrationDeadline = _is.ColumnDateTime('registrationDeadline', this);
    registrationStartDate = _is.ColumnDateTime('registrationStartDate', this);
    registrationFee = _is.ColumnDouble('registrationFee', this);
    requiresApproval = _is.ColumnBool(
      'requiresApproval',
      this,
      hasDefault: true,
    );
    minimumParticipants = _is.ColumnInt(
      'minimumParticipants',
      this,
      hasDefault: true,
    );
    maxParticipants = _is.ColumnInt('maxParticipants', this, hasDefault: true);
    cancellationDeadline = _is.ColumnDateTime('cancellationDeadline', this);
    cancelled = _is.ColumnBool('cancelled', this, hasDefault: true);
    sectionId = _is.ColumnUuid('sectionId', this);
    published = _is.ColumnBool('published', this, hasDefault: true);
    updatedAt = _is.ColumnDateTime('updatedAt', this, hasDefault: true);
  }

  late final EventUpdateTable updateTable;

  late final _is.ColumnString title;

  late final _is.ColumnString description;

  late final _is.ColumnString type;

  late final _is.ColumnDateTime startTime;

  late final _is.ColumnDateTime endTime;

  late final _is.ColumnString eventLocation;

  late final _is.ColumnString carpoolLocation;

  late final _is.ColumnDateTime carpoolTime;

  late final _is.ColumnDateTime registrationDeadline;

  late final _is.ColumnDateTime registrationStartDate;

  late final _is.ColumnDouble registrationFee;

  late final _is.ColumnBool requiresApproval;

  late final _is.ColumnInt minimumParticipants;

  late final _is.ColumnInt maxParticipants;

  late final _is.ColumnDateTime cancellationDeadline;

  late final _is.ColumnBool cancelled;

  late final _is.ColumnUuid sectionId;

  _ibhmj7lb.SectionTable? _section;

  late final _is.ColumnBool published;

  _i27uzliw.EventRegistrationTable? ___eventRegistrations;

  _is.ManyRelation<_i27uzliw.EventRegistrationTable>? _eventRegistrations;

  _ich6ygep.EventManagerTable? ___eventManagers;

  _is.ManyRelation<_ich6ygep.EventManagerTable>? _eventManagers;

  late final _is.ColumnDateTime updatedAt;

  _ibhmj7lb.SectionTable get section {
    if (_section != null) return _section!;
    _section = _is.createRelationTable(
      relationFieldName: 'section',
      field: Event.t.sectionId,
      foreignField: _ibhmj7lb.Section.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ibhmj7lb.SectionTable(tableRelation: foreignTableRelation),
    );
    return _section!;
  }

  _i27uzliw.EventRegistrationTable get __eventRegistrations {
    if (___eventRegistrations != null) return ___eventRegistrations!;
    ___eventRegistrations = _is.createRelationTable(
      relationFieldName: '__eventRegistrations',
      field: Event.t.id,
      foreignField: _i27uzliw.EventRegistration.t.eventId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i27uzliw.EventRegistrationTable(tableRelation: foreignTableRelation),
    );
    return ___eventRegistrations!;
  }

  _ich6ygep.EventManagerTable get __eventManagers {
    if (___eventManagers != null) return ___eventManagers!;
    ___eventManagers = _is.createRelationTable(
      relationFieldName: '__eventManagers',
      field: Event.t.id,
      foreignField: _ich6ygep.EventManager.t.eventId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ich6ygep.EventManagerTable(tableRelation: foreignTableRelation),
    );
    return ___eventManagers!;
  }

  _is.ManyRelation<_i27uzliw.EventRegistrationTable> get eventRegistrations {
    if (_eventRegistrations != null) return _eventRegistrations!;
    var relationTable = _is.createRelationTable(
      relationFieldName: 'eventRegistrations',
      field: Event.t.id,
      foreignField: _i27uzliw.EventRegistration.t.eventId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i27uzliw.EventRegistrationTable(tableRelation: foreignTableRelation),
    );
    _eventRegistrations = _is.ManyRelation<_i27uzliw.EventRegistrationTable>(
      tableWithRelations: relationTable,
      table: _i27uzliw.EventRegistrationTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _eventRegistrations!;
  }

  _is.ManyRelation<_ich6ygep.EventManagerTable> get eventManagers {
    if (_eventManagers != null) return _eventManagers!;
    var relationTable = _is.createRelationTable(
      relationFieldName: 'eventManagers',
      field: Event.t.id,
      foreignField: _ich6ygep.EventManager.t.eventId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ich6ygep.EventManagerTable(tableRelation: foreignTableRelation),
    );
    _eventManagers = _is.ManyRelation<_ich6ygep.EventManagerTable>(
      tableWithRelations: relationTable,
      table: _ich6ygep.EventManagerTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _eventManagers!;
  }

  @override
  List<_is.Column> get columns => [
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
    updatedAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
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

class EventInclude extends _is.IncludeObject {
  EventInclude._({
    _ibhmj7lb.SectionInclude? section,
    _i27uzliw.EventRegistrationIncludeList? eventRegistrations,
    _ich6ygep.EventManagerIncludeList? eventManagers,
  }) {
    _section = section;
    _eventRegistrations = eventRegistrations;
    _eventManagers = eventManagers;
  }

  _ibhmj7lb.SectionInclude? _section;

  _i27uzliw.EventRegistrationIncludeList? _eventRegistrations;

  _ich6ygep.EventManagerIncludeList? _eventManagers;

  @override
  Map<String, _is.Include?> get includes => {
    'section': _section,
    'eventRegistrations': _eventRegistrations,
    'eventManagers': _eventManagers,
  };

  @override
  _is.Table<_is.UuidValue> get table => Event.t;
}

class EventIncludeList extends _is.IncludeList {
  EventIncludeList._({
    _is.WhereExpressionBuilder<EventTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Event.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue> get table => Event.t;
}

class EventRepository {
  const EventRepository._();

  final attach = const EventAttachRepository._();

  final attachRow = const EventAttachRowRepository._();

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
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EventTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EventTable>? orderBy,
    _is.OrderByListBuilder<EventTable>? orderByList,
    _is.Transaction? transaction,
    EventInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Event>(
      where: where?.call(Event.t),
      orderBy: orderBy?.call(Event.t),
      orderByList: orderByList?.call(Event.t),
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
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EventTable>? where,
    int? offset,
    _is.OrderByBuilder<EventTable>? orderBy,
    _is.OrderByListBuilder<EventTable>? orderByList,
    _is.Transaction? transaction,
    EventInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Event>(
      where: where?.call(Event.t),
      orderBy: orderBy?.call(Event.t),
      orderByList: orderByList?.call(Event.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Event] by its [id] or null if no such row exists.
  Future<Event?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    EventInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
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
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Event>> insert(
    _is.DatabaseSession session,
    List<Event> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Event>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Event] and returns the inserted row.
  ///
  /// The returned [Event] will have its `id` field set.
  Future<Event> insertRow(
    _is.DatabaseSession session,
    Event row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Event>(row, transaction: transaction);
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
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Event>> upsert(
    _is.DatabaseSession session,
    List<Event> rows, {
    required _is.ColumnSelections<EventTable> conflictColumns,
    _is.ColumnSelections<EventTable>? updateColumns,
    _is.WhereExpressionBuilder<EventTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Event>(
      rows,
      conflictColumns: conflictColumns(Event.t),
      updateColumns: updateColumns?.call(Event.t),
      updateWhere: updateWhere?.call(Event.t),
      transaction: transaction,
      noReturn: noReturn,
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
    _is.DatabaseSession session,
    Event row, {
    required _is.ColumnSelections<EventTable> conflictColumns,
    _is.ColumnSelections<EventTable>? updateColumns,
    _is.WhereExpressionBuilder<EventTable>? updateWhere,
    _is.Transaction? transaction,
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
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Event>> update(
    _is.DatabaseSession session,
    List<Event> rows, {
    _is.ColumnSelections<EventTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Event>(
      rows,
      columns: columns?.call(Event.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Event]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Event> updateRow(
    _is.DatabaseSession session,
    Event row, {
    _is.ColumnSelections<EventTable>? columns,
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<EventUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Event>(
      id,
      columnValues: columnValues(Event.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Event]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Event>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<EventUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<EventTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EventTable>? orderBy,
    _is.OrderByListBuilder<EventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Event>(
      columnValues: columnValues(Event.t.updateTable),
      where: where(Event.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Event.t),
      orderByList: orderByList?.call(Event.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Event]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Event>> delete(
    _is.DatabaseSession session,
    List<Event> rows, {
    _is.OrderByBuilder<EventTable>? orderBy,
    _is.OrderByListBuilder<EventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Event>(
      rows,
      orderBy: orderBy?.call(Event.t),
      orderByList: orderByList?.call(Event.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Event].
  Future<Event> deleteRow(
    _is.DatabaseSession session,
    Event row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Event>(row, transaction: transaction);
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Event>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<EventTable> where,
    _is.OrderByBuilder<EventTable>? orderBy,
    _is.OrderByListBuilder<EventTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Event>(
      where: where(Event.t),
      orderBy: orderBy?.call(Event.t),
      orderByList: orderByList?.call(Event.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EventTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Event>(
      where: where?.call(Event.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Event] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<EventTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
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
    _is.DatabaseSession session,
    Event event,
    List<_i27uzliw.EventRegistration> eventRegistration, {
    _is.Transaction? transaction,
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
    await session.db.update<_i27uzliw.EventRegistration>(
      $eventRegistration,
      columns: [_i27uzliw.EventRegistration.t.eventId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Event] and the given [EventManager]s
  /// by setting each [EventManager]'s foreign key `eventId` to refer to this [Event].
  Future<void> eventManagers(
    _is.DatabaseSession session,
    Event event,
    List<_ich6ygep.EventManager> eventManager, {
    _is.Transaction? transaction,
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
    await session.db.update<_ich6ygep.EventManager>(
      $eventManager,
      columns: [_ich6ygep.EventManager.t.eventId],
      transaction: transaction,
    );
  }
}

class EventAttachRowRepository {
  const EventAttachRowRepository._();

  /// Creates a relation between the given [Event] and [Section]
  /// by setting the [Event]'s foreign key `sectionId` to refer to the [Section].
  Future<void> section(
    _is.DatabaseSession session,
    Event event,
    _ibhmj7lb.Section section, {
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    Event event,
    _i27uzliw.EventRegistration eventRegistration, {
    _is.Transaction? transaction,
  }) async {
    if (eventRegistration.id == null) {
      throw ArgumentError.notNull('eventRegistration.id');
    }
    if (event.id == null) {
      throw ArgumentError.notNull('event.id');
    }

    var $eventRegistration = eventRegistration.copyWith(eventId: event.id);
    await session.db.updateRow<_i27uzliw.EventRegistration>(
      $eventRegistration,
      columns: [_i27uzliw.EventRegistration.t.eventId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Event] and the given [EventManager]
  /// by setting the [EventManager]'s foreign key `eventId` to refer to this [Event].
  Future<void> eventManagers(
    _is.DatabaseSession session,
    Event event,
    _ich6ygep.EventManager eventManager, {
    _is.Transaction? transaction,
  }) async {
    if (eventManager.id == null) {
      throw ArgumentError.notNull('eventManager.id');
    }
    if (event.id == null) {
      throw ArgumentError.notNull('event.id');
    }

    var $eventManager = eventManager.copyWith(eventId: event.id);
    await session.db.updateRow<_ich6ygep.EventManager>(
      $eventManager,
      columns: [_ich6ygep.EventManager.t.eventId],
      transaction: transaction,
    );
  }
}
