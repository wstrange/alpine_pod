/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, no_leading_underscores_for_library_prefixes
// ignore_for_file: unnecessary_null_comparison

import 'package:alpine_pod_server/src/generated/protocol.dart' as _i1rm9ghy;
import 'package:serverpod/serverpod.dart' as _is;
import 'event.dart' as _iu57571s;
import 'member.dart' as _i7zhj6lg;
import 'registration_status.dart' as _infnr7i7;

abstract class EventRegistration
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  EventRegistration._({
    this.id,
    required this.memberId,
    this.member,
    required this.eventId,
    this.event,
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
    DateTime? updatedAt,
    bool? noShow,
  }) : additionalGuests = additionalGuests ?? 0,
       paymentStatus = paymentStatus ?? 'N/A',
       paymentAmount = paymentAmount ?? 0.0,
       updatedAt = updatedAt ?? DateTime.now(),
       noShow = noShow ?? false;

  factory EventRegistration({
    _is.UuidValue? id,
    required _is.UuidValue memberId,
    _i7zhj6lg.Member? member,
    required _is.UuidValue eventId,
    _iu57571s.Event? event,
    required _infnr7i7.RegistrationStatus registrationStatus,
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
    DateTime? updatedAt,
    bool? noShow,
  }) = _EventRegistrationImpl;

  factory EventRegistration.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventRegistration(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      memberId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['memberId'],
      ),
      member: jsonSerialization['member'] == null
          ? null
          : _i1rm9ghy.Protocol().deserialize<_i7zhj6lg.Member>(
              jsonSerialization['member'],
            ),
      eventId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['eventId'],
      ),
      event: jsonSerialization['event'] == null
          ? null
          : _i1rm9ghy.Protocol().deserialize<_iu57571s.Event>(
              jsonSerialization['event'],
            ),
      registrationStatus: _infnr7i7.RegistrationStatus.fromJson(
        (jsonSerialization['registrationStatus'] as String),
      ),
      registrationDate: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['registrationDate'],
      ),
      carPoolPreference: jsonSerialization['carPoolPreference'] as String?,
      additionalGuests: jsonSerialization['additionalGuests'] as int?,
      waiverAccepted: _is.BoolJsonExtension.fromJson(
        jsonSerialization['waiverAccepted'],
      ),
      participantNotes: jsonSerialization['participantNotes'] as String?,
      waitlistPosition: jsonSerialization['waitlistPosition'] as int?,
      waitlistedAt: jsonSerialization['waitlistedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['waitlistedAt'],
            ),
      paymentStatus: jsonSerialization['paymentStatus'] as String?,
      paymentAmount: (jsonSerialization['paymentAmount'] as num?)?.toDouble(),
      modifiedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['modifiedAt'],
      ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      noShow: jsonSerialization['noShow'] == null
          ? null
          : _is.BoolJsonExtension.fromJson(jsonSerialization['noShow']),
    );
  }

  static final t = EventRegistrationTable();

  static const db = EventRegistrationRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue memberId;

  _i7zhj6lg.Member? member;

  _is.UuidValue eventId;

  _iu57571s.Event? event;

  _infnr7i7.RegistrationStatus registrationStatus;

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

  DateTime updatedAt;

  bool noShow;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [EventRegistration]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  EventRegistration copyWith({
    _is.UuidValue? id,
    _is.UuidValue? memberId,
    _i7zhj6lg.Member? member,
    _is.UuidValue? eventId,
    _iu57571s.Event? event,
    _infnr7i7.RegistrationStatus? registrationStatus,
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
    DateTime? updatedAt,
    bool? noShow,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventRegistration',
      if (id != null) 'id': id?.toJson(),
      'memberId': memberId.toJson(),
      if (member != null) 'member': member?.toJson(),
      'eventId': eventId.toJson(),
      if (event != null) 'event': event?.toJson(),
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
      'updatedAt': updatedAt.toJson(),
      'noShow': noShow,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EventRegistration',
      if (id != null) 'id': id?.toJson(),
      'memberId': memberId.toJson(),
      if (member != null) 'member': member?.toJsonForProtocol(),
      'eventId': eventId.toJson(),
      if (event != null) 'event': event?.toJsonForProtocol(),
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
      'updatedAt': updatedAt.toJson(),
      'noShow': noShow,
    };
  }

  static EventRegistrationInclude include({
    _i7zhj6lg.MemberInclude? member,
    _iu57571s.EventInclude? event,
  }) {
    return EventRegistrationInclude._(member: member, event: event);
  }

  static EventRegistrationIncludeList includeList({
    _is.WhereExpressionBuilder<EventRegistrationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EventRegistrationTable>? orderBy,
    _is.OrderByListBuilder<EventRegistrationTable>? orderByList,
    EventRegistrationInclude? include,
  }) {
    return EventRegistrationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventRegistrationImpl extends EventRegistration {
  _EventRegistrationImpl({
    _is.UuidValue? id,
    required _is.UuidValue memberId,
    _i7zhj6lg.Member? member,
    required _is.UuidValue eventId,
    _iu57571s.Event? event,
    required _infnr7i7.RegistrationStatus registrationStatus,
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
    DateTime? updatedAt,
    bool? noShow,
  }) : super._(
         id: id,
         memberId: memberId,
         member: member,
         eventId: eventId,
         event: event,
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
         updatedAt: updatedAt,
         noShow: noShow,
       );

  /// Returns a shallow copy of this [EventRegistration]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  EventRegistration copyWith({
    Object? id = _Undefined,
    _is.UuidValue? memberId,
    Object? member = _Undefined,
    _is.UuidValue? eventId,
    Object? event = _Undefined,
    _infnr7i7.RegistrationStatus? registrationStatus,
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
    DateTime? updatedAt,
    bool? noShow,
  }) {
    return EventRegistration(
      id: id is _is.UuidValue? ? id : this.id,
      memberId: memberId ?? this.memberId,
      member: member is _i7zhj6lg.Member? ? member : this.member?.copyWith(),
      eventId: eventId ?? this.eventId,
      event: event is _iu57571s.Event? ? event : this.event?.copyWith(),
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
      waitlistPosition: waitlistPosition is int?
          ? waitlistPosition
          : this.waitlistPosition,
      waitlistedAt: waitlistedAt is DateTime?
          ? waitlistedAt
          : this.waitlistedAt,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paymentAmount: paymentAmount ?? this.paymentAmount,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      noShow: noShow ?? this.noShow,
    );
  }
}

class EventRegistrationUpdateTable
    extends _is.UpdateTable<EventRegistrationTable> {
  EventRegistrationUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> memberId(_is.UuidValue value) =>
      _is.ColumnValue(table.memberId, value);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> eventId(_is.UuidValue value) =>
      _is.ColumnValue(table.eventId, value);

  _is.ColumnValue<_infnr7i7.RegistrationStatus, _infnr7i7.RegistrationStatus>
  registrationStatus(_infnr7i7.RegistrationStatus value) =>
      _is.ColumnValue(table.registrationStatus, value);

  _is.ColumnValue<DateTime, DateTime> registrationDate(DateTime value) =>
      _is.ColumnValue(table.registrationDate, value);

  _is.ColumnValue<String, String> carPoolPreference(String? value) =>
      _is.ColumnValue(table.carPoolPreference, value);

  _is.ColumnValue<int, int> additionalGuests(int value) =>
      _is.ColumnValue(table.additionalGuests, value);

  _is.ColumnValue<bool, bool> waiverAccepted(bool value) =>
      _is.ColumnValue(table.waiverAccepted, value);

  _is.ColumnValue<String, String> participantNotes(String? value) =>
      _is.ColumnValue(table.participantNotes, value);

  _is.ColumnValue<int, int> waitlistPosition(int? value) =>
      _is.ColumnValue(table.waitlistPosition, value);

  _is.ColumnValue<DateTime, DateTime> waitlistedAt(DateTime? value) =>
      _is.ColumnValue(table.waitlistedAt, value);

  _is.ColumnValue<String, String> paymentStatus(String value) =>
      _is.ColumnValue(table.paymentStatus, value);

  _is.ColumnValue<double, double> paymentAmount(double value) =>
      _is.ColumnValue(table.paymentAmount, value);

  _is.ColumnValue<DateTime, DateTime> modifiedAt(DateTime value) =>
      _is.ColumnValue(table.modifiedAt, value);

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(table.updatedAt, value);

  _is.ColumnValue<bool, bool> noShow(bool value) =>
      _is.ColumnValue(table.noShow, value);
}

class EventRegistrationTable extends _is.Table<_is.UuidValue?> {
  EventRegistrationTable({super.tableRelation})
    : super(tableName: 'event_registrations') {
    updateTable = EventRegistrationUpdateTable(this);
    memberId = _is.ColumnUuid('memberId', this);
    eventId = _is.ColumnUuid('eventId', this);
    registrationStatus = _is.ColumnEnum(
      'registrationStatus',
      this,
      _is.EnumSerialization.byName,
    );
    registrationDate = _is.ColumnDateTime('registrationDate', this);
    carPoolPreference = _is.ColumnString('carPoolPreference', this);
    additionalGuests = _is.ColumnInt(
      'additionalGuests',
      this,
      hasDefault: true,
    );
    waiverAccepted = _is.ColumnBool('waiverAccepted', this);
    participantNotes = _is.ColumnString('participantNotes', this);
    waitlistPosition = _is.ColumnInt('waitlistPosition', this);
    waitlistedAt = _is.ColumnDateTime('waitlistedAt', this);
    paymentStatus = _is.ColumnString('paymentStatus', this, hasDefault: true);
    paymentAmount = _is.ColumnDouble('paymentAmount', this, hasDefault: true);
    modifiedAt = _is.ColumnDateTime('modifiedAt', this);
    updatedAt = _is.ColumnDateTime('updatedAt', this, hasDefault: true);
    noShow = _is.ColumnBool('noShow', this, hasDefault: true);
  }

  late final EventRegistrationUpdateTable updateTable;

  late final _is.ColumnUuid memberId;

  _i7zhj6lg.MemberTable? _member;

  late final _is.ColumnUuid eventId;

  _iu57571s.EventTable? _event;

  late final _is.ColumnEnum<_infnr7i7.RegistrationStatus> registrationStatus;

  late final _is.ColumnDateTime registrationDate;

  late final _is.ColumnString carPoolPreference;

  late final _is.ColumnInt additionalGuests;

  late final _is.ColumnBool waiverAccepted;

  late final _is.ColumnString participantNotes;

  late final _is.ColumnInt waitlistPosition;

  late final _is.ColumnDateTime waitlistedAt;

  late final _is.ColumnString paymentStatus;

  late final _is.ColumnDouble paymentAmount;

  late final _is.ColumnDateTime modifiedAt;

  late final _is.ColumnDateTime updatedAt;

  late final _is.ColumnBool noShow;

  _i7zhj6lg.MemberTable get member {
    if (_member != null) return _member!;
    _member = _is.createRelationTable(
      relationFieldName: 'member',
      field: EventRegistration.t.memberId,
      foreignField: _i7zhj6lg.Member.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7zhj6lg.MemberTable(tableRelation: foreignTableRelation),
    );
    return _member!;
  }

  _iu57571s.EventTable get event {
    if (_event != null) return _event!;
    _event = _is.createRelationTable(
      relationFieldName: 'event',
      field: EventRegistration.t.eventId,
      foreignField: _iu57571s.Event.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _iu57571s.EventTable(tableRelation: foreignTableRelation),
    );
    return _event!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    memberId,
    eventId,
    registrationStatus,
    registrationDate,
    carPoolPreference,
    additionalGuests,
    waiverAccepted,
    participantNotes,
    waitlistPosition,
    waitlistedAt,
    paymentStatus,
    paymentAmount,
    modifiedAt,
    updatedAt,
    noShow,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'member') {
      return member;
    }
    if (relationField == 'event') {
      return event;
    }
    return null;
  }
}

class EventRegistrationInclude extends _is.IncludeObject {
  EventRegistrationInclude._({
    _i7zhj6lg.MemberInclude? member,
    _iu57571s.EventInclude? event,
  }) {
    _member = member;
    _event = event;
  }

  _i7zhj6lg.MemberInclude? _member;

  _iu57571s.EventInclude? _event;

  @override
  Map<String, _is.Include?> get includes => {
    'member': _member,
    'event': _event,
  };

  @override
  _is.Table<_is.UuidValue?> get table => EventRegistration.t;
}

class EventRegistrationIncludeList extends _is.IncludeList {
  EventRegistrationIncludeList._({
    _is.WhereExpressionBuilder<EventRegistrationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EventRegistration.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => EventRegistration.t;
}

class EventRegistrationRepository {
  const EventRegistrationRepository._();

  final attachRow = const EventRegistrationAttachRowRepository._();

  /// Returns a list of [EventRegistration]s matching the given query parameters.
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
  Future<List<EventRegistration>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EventRegistrationTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EventRegistrationTable>? orderBy,
    _is.OrderByListBuilder<EventRegistrationTable>? orderByList,
    _is.Transaction? transaction,
    EventRegistrationInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<EventRegistration>(
      where: where?.call(EventRegistration.t),
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [EventRegistration] matching the given query parameters.
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
  Future<EventRegistration?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EventRegistrationTable>? where,
    int? offset,
    _is.OrderByBuilder<EventRegistrationTable>? orderBy,
    _is.OrderByListBuilder<EventRegistrationTable>? orderByList,
    _is.Transaction? transaction,
    EventRegistrationInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<EventRegistration>(
      where: where?.call(EventRegistration.t),
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [EventRegistration] by its [id] or null if no such row exists.
  Future<EventRegistration?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    EventRegistrationInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<EventRegistration>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [EventRegistration]s in the list and returns the inserted rows.
  ///
  /// The returned [EventRegistration]s will have their `id` fields set.
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
  Future<List<EventRegistration>> insert(
    _is.DatabaseSession session,
    List<EventRegistration> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<EventRegistration>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [EventRegistration] and returns the inserted row.
  ///
  /// The returned [EventRegistration] will have its `id` field set.
  Future<EventRegistration> insertRow(
    _is.DatabaseSession session,
    EventRegistration row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<EventRegistration>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [EventRegistration]s in the list and returns the resulting rows.
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
  /// The returned [EventRegistration]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EventRegistration>> upsert(
    _is.DatabaseSession session,
    List<EventRegistration> rows, {
    required _is.ColumnSelections<EventRegistrationTable> conflictColumns,
    _is.ColumnSelections<EventRegistrationTable>? updateColumns,
    _is.WhereExpressionBuilder<EventRegistrationTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<EventRegistration>(
      rows,
      conflictColumns: conflictColumns(EventRegistration.t),
      updateColumns: updateColumns?.call(EventRegistration.t),
      updateWhere: updateWhere?.call(EventRegistration.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [EventRegistration] and returns the resulting row.
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
  /// The returned [EventRegistration] will have its `id` field set.
  Future<EventRegistration?> upsertRow(
    _is.DatabaseSession session,
    EventRegistration row, {
    required _is.ColumnSelections<EventRegistrationTable> conflictColumns,
    _is.ColumnSelections<EventRegistrationTable>? updateColumns,
    _is.WhereExpressionBuilder<EventRegistrationTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<EventRegistration>(
      row,
      conflictColumns: conflictColumns(EventRegistration.t),
      updateColumns: updateColumns?.call(EventRegistration.t),
      updateWhere: updateWhere?.call(EventRegistration.t),
      transaction: transaction,
    );
  }

  /// Updates all [EventRegistration]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EventRegistration>> update(
    _is.DatabaseSession session,
    List<EventRegistration> rows, {
    _is.ColumnSelections<EventRegistrationTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<EventRegistration>(
      rows,
      columns: columns?.call(EventRegistration.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [EventRegistration]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EventRegistration> updateRow(
    _is.DatabaseSession session,
    EventRegistration row, {
    _is.ColumnSelections<EventRegistrationTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<EventRegistration>(
      row,
      columns: columns?.call(EventRegistration.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EventRegistration] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<EventRegistration?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<EventRegistrationUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<EventRegistration>(
      id,
      columnValues: columnValues(EventRegistration.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [EventRegistration]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EventRegistration>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<EventRegistrationUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<EventRegistrationTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EventRegistrationTable>? orderBy,
    _is.OrderByListBuilder<EventRegistrationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<EventRegistration>(
      columnValues: columnValues(EventRegistration.t.updateTable),
      where: where(EventRegistration.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [EventRegistration]s in the list and returns the deleted rows.
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
  Future<List<EventRegistration>> delete(
    _is.DatabaseSession session,
    List<EventRegistration> rows, {
    _is.OrderByBuilder<EventRegistrationTable>? orderBy,
    _is.OrderByListBuilder<EventRegistrationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<EventRegistration>(
      rows,
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [EventRegistration].
  Future<EventRegistration> deleteRow(
    _is.DatabaseSession session,
    EventRegistration row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EventRegistration>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EventRegistration>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<EventRegistrationTable> where,
    _is.OrderByBuilder<EventRegistrationTable>? orderBy,
    _is.OrderByListBuilder<EventRegistrationTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<EventRegistration>(
      where: where(EventRegistration.t),
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EventRegistrationTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<EventRegistration>(
      where: where?.call(EventRegistration.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [EventRegistration] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<EventRegistrationTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<EventRegistration>(
      where: where(EventRegistration.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class EventRegistrationAttachRowRepository {
  const EventRegistrationAttachRowRepository._();

  /// Creates a relation between the given [EventRegistration] and [Member]
  /// by setting the [EventRegistration]'s foreign key `memberId` to refer to the [Member].
  Future<void> member(
    _is.DatabaseSession session,
    EventRegistration eventRegistration,
    _i7zhj6lg.Member member, {
    _is.Transaction? transaction,
  }) async {
    if (eventRegistration.id == null) {
      throw ArgumentError.notNull('eventRegistration.id');
    }
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    var $eventRegistration = eventRegistration.copyWith(memberId: member.id);
    await session.db.updateRow<EventRegistration>(
      $eventRegistration,
      columns: [EventRegistration.t.memberId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [EventRegistration] and [Event]
  /// by setting the [EventRegistration]'s foreign key `eventId` to refer to the [Event].
  Future<void> event(
    _is.DatabaseSession session,
    EventRegistration eventRegistration,
    _iu57571s.Event event, {
    _is.Transaction? transaction,
  }) async {
    if (eventRegistration.id == null) {
      throw ArgumentError.notNull('eventRegistration.id');
    }
    if (event.id == null) {
      throw ArgumentError.notNull('event.id');
    }

    var $eventRegistration = eventRegistration.copyWith(eventId: event.id);
    await session.db.updateRow<EventRegistration>(
      $eventRegistration,
      columns: [EventRegistration.t.eventId],
      transaction: transaction,
    );
  }
}
