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
import 'event.dart' as _iu57571s;
import 'member.dart' as _i7zhj6lg;

abstract class EventManager
    implements _is.TableRow<_is.UuidValue>, _is.ProtocolSerialization {
  EventManager._({
    _is.UuidValue? id,
    required this.eventId,
    this.event,
    required this.memberId,
    this.member,
    this.assignedAt,
    DateTime? updatedAt,
  }) : id = id ?? const _is.Uuid().v7obj(),
       updatedAt = updatedAt ?? DateTime.now();

  factory EventManager({
    _is.UuidValue? id,
    required _is.UuidValue eventId,
    _iu57571s.Event? event,
    required _is.UuidValue memberId,
    _i7zhj6lg.Member? member,
    DateTime? assignedAt,
    DateTime? updatedAt,
  }) = _EventManagerImpl;

  factory EventManager.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventManager(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      eventId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['eventId'],
      ),
      event: jsonSerialization['event'] == null
          ? null
          : _i1rm9ghy.Protocol().deserialize<_iu57571s.Event>(
              jsonSerialization['event'],
            ),
      memberId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['memberId'],
      ),
      member: jsonSerialization['member'] == null
          ? null
          : _i1rm9ghy.Protocol().deserialize<_i7zhj6lg.Member>(
              jsonSerialization['member'],
            ),
      assignedAt: jsonSerialization['assignedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['assignedAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = EventManagerTable();

  static const db = EventManagerRepository._();

  @override
  _is.UuidValue id;

  _is.UuidValue eventId;

  _iu57571s.Event? event;

  _is.UuidValue memberId;

  _i7zhj6lg.Member? member;

  DateTime? assignedAt;

  DateTime updatedAt;

  @override
  _is.Table<_is.UuidValue> get table => t;

  /// Returns a shallow copy of this [EventManager]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  EventManager copyWith({
    _is.UuidValue? id,
    _is.UuidValue? eventId,
    _iu57571s.Event? event,
    _is.UuidValue? memberId,
    _i7zhj6lg.Member? member,
    DateTime? assignedAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventManager',
      'id': id.toJson(),
      'eventId': eventId.toJson(),
      if (event != null) 'event': event?.toJson(),
      'memberId': memberId.toJson(),
      if (member != null) 'member': member?.toJson(),
      if (assignedAt != null) 'assignedAt': assignedAt?.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EventManager',
      'id': id.toJson(),
      'eventId': eventId.toJson(),
      if (event != null) 'event': event?.toJsonForProtocol(),
      'memberId': memberId.toJson(),
      if (member != null) 'member': member?.toJsonForProtocol(),
      if (assignedAt != null) 'assignedAt': assignedAt?.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static EventManagerInclude include({
    _iu57571s.EventInclude? event,
    _i7zhj6lg.MemberInclude? member,
  }) {
    return EventManagerInclude._(event: event, member: member);
  }

  static EventManagerIncludeList includeList({
    _is.WhereExpressionBuilder<EventManagerTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EventManagerTable>? orderBy,
    _is.OrderByListBuilder<EventManagerTable>? orderByList,
    EventManagerInclude? include,
  }) {
    return EventManagerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventManager.t),
      orderByList: orderByList?.call(EventManager.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventManagerImpl extends EventManager {
  _EventManagerImpl({
    _is.UuidValue? id,
    required _is.UuidValue eventId,
    _iu57571s.Event? event,
    required _is.UuidValue memberId,
    _i7zhj6lg.Member? member,
    DateTime? assignedAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         eventId: eventId,
         event: event,
         memberId: memberId,
         member: member,
         assignedAt: assignedAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [EventManager]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  EventManager copyWith({
    _is.UuidValue? id,
    _is.UuidValue? eventId,
    Object? event = _Undefined,
    _is.UuidValue? memberId,
    Object? member = _Undefined,
    Object? assignedAt = _Undefined,
    DateTime? updatedAt,
  }) {
    return EventManager(
      id: id ?? this.id,
      eventId: eventId ?? this.eventId,
      event: event is _iu57571s.Event? ? event : this.event?.copyWith(),
      memberId: memberId ?? this.memberId,
      member: member is _i7zhj6lg.Member? ? member : this.member?.copyWith(),
      assignedAt: assignedAt is DateTime? ? assignedAt : this.assignedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class EventManagerUpdateTable extends _is.UpdateTable<EventManagerTable> {
  EventManagerUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> eventId(_is.UuidValue value) =>
      _is.ColumnValue(table.eventId, value);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> memberId(_is.UuidValue value) =>
      _is.ColumnValue(table.memberId, value);

  _is.ColumnValue<DateTime, DateTime> assignedAt(DateTime? value) =>
      _is.ColumnValue(table.assignedAt, value);

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(table.updatedAt, value);
}

class EventManagerTable extends _is.Table<_is.UuidValue> {
  EventManagerTable({super.tableRelation})
    : super(tableName: 'event_managers') {
    updateTable = EventManagerUpdateTable(this);
    eventId = _is.ColumnUuid('eventId', this);
    memberId = _is.ColumnUuid('memberId', this);
    assignedAt = _is.ColumnDateTime('assignedAt', this);
    updatedAt = _is.ColumnDateTime('updatedAt', this, hasDefault: true);
  }

  late final EventManagerUpdateTable updateTable;

  late final _is.ColumnUuid eventId;

  _iu57571s.EventTable? _event;

  late final _is.ColumnUuid memberId;

  _i7zhj6lg.MemberTable? _member;

  late final _is.ColumnDateTime assignedAt;

  late final _is.ColumnDateTime updatedAt;

  _iu57571s.EventTable get event {
    if (_event != null) return _event!;
    _event = _is.createRelationTable(
      relationFieldName: 'event',
      field: EventManager.t.eventId,
      foreignField: _iu57571s.Event.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _iu57571s.EventTable(tableRelation: foreignTableRelation),
    );
    return _event!;
  }

  _i7zhj6lg.MemberTable get member {
    if (_member != null) return _member!;
    _member = _is.createRelationTable(
      relationFieldName: 'member',
      field: EventManager.t.memberId,
      foreignField: _i7zhj6lg.Member.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7zhj6lg.MemberTable(tableRelation: foreignTableRelation),
    );
    return _member!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    eventId,
    memberId,
    assignedAt,
    updatedAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'event') {
      return event;
    }
    if (relationField == 'member') {
      return member;
    }
    return null;
  }
}

class EventManagerInclude extends _is.IncludeObject {
  EventManagerInclude._({
    _iu57571s.EventInclude? event,
    _i7zhj6lg.MemberInclude? member,
  }) {
    _event = event;
    _member = member;
  }

  _iu57571s.EventInclude? _event;

  _i7zhj6lg.MemberInclude? _member;

  @override
  Map<String, _is.Include?> get includes => {
    'event': _event,
    'member': _member,
  };

  @override
  _is.Table<_is.UuidValue> get table => EventManager.t;
}

class EventManagerIncludeList extends _is.IncludeList {
  EventManagerIncludeList._({
    _is.WhereExpressionBuilder<EventManagerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EventManager.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue> get table => EventManager.t;
}

class EventManagerRepository {
  const EventManagerRepository._();

  final attachRow = const EventManagerAttachRowRepository._();

  /// Returns a list of [EventManager]s matching the given query parameters.
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
  Future<List<EventManager>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EventManagerTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EventManagerTable>? orderBy,
    _is.OrderByListBuilder<EventManagerTable>? orderByList,
    _is.Transaction? transaction,
    EventManagerInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<EventManager>(
      where: where?.call(EventManager.t),
      orderBy: orderBy?.call(EventManager.t),
      orderByList: orderByList?.call(EventManager.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [EventManager] matching the given query parameters.
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
  Future<EventManager?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EventManagerTable>? where,
    int? offset,
    _is.OrderByBuilder<EventManagerTable>? orderBy,
    _is.OrderByListBuilder<EventManagerTable>? orderByList,
    _is.Transaction? transaction,
    EventManagerInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<EventManager>(
      where: where?.call(EventManager.t),
      orderBy: orderBy?.call(EventManager.t),
      orderByList: orderByList?.call(EventManager.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [EventManager] by its [id] or null if no such row exists.
  Future<EventManager?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    EventManagerInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<EventManager>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [EventManager]s in the list and returns the inserted rows.
  ///
  /// The returned [EventManager]s will have their `id` fields set.
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
  Future<List<EventManager>> insert(
    _is.DatabaseSession session,
    List<EventManager> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<EventManager>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [EventManager] and returns the inserted row.
  ///
  /// The returned [EventManager] will have its `id` field set.
  Future<EventManager> insertRow(
    _is.DatabaseSession session,
    EventManager row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<EventManager>(row, transaction: transaction);
  }

  /// Upserts all [EventManager]s in the list and returns the resulting rows.
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
  /// The returned [EventManager]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EventManager>> upsert(
    _is.DatabaseSession session,
    List<EventManager> rows, {
    required _is.ColumnSelections<EventManagerTable> conflictColumns,
    _is.ColumnSelections<EventManagerTable>? updateColumns,
    _is.WhereExpressionBuilder<EventManagerTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<EventManager>(
      rows,
      conflictColumns: conflictColumns(EventManager.t),
      updateColumns: updateColumns?.call(EventManager.t),
      updateWhere: updateWhere?.call(EventManager.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [EventManager] and returns the resulting row.
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
  /// The returned [EventManager] will have its `id` field set.
  Future<EventManager?> upsertRow(
    _is.DatabaseSession session,
    EventManager row, {
    required _is.ColumnSelections<EventManagerTable> conflictColumns,
    _is.ColumnSelections<EventManagerTable>? updateColumns,
    _is.WhereExpressionBuilder<EventManagerTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<EventManager>(
      row,
      conflictColumns: conflictColumns(EventManager.t),
      updateColumns: updateColumns?.call(EventManager.t),
      updateWhere: updateWhere?.call(EventManager.t),
      transaction: transaction,
    );
  }

  /// Updates all [EventManager]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EventManager>> update(
    _is.DatabaseSession session,
    List<EventManager> rows, {
    _is.ColumnSelections<EventManagerTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<EventManager>(
      rows,
      columns: columns?.call(EventManager.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [EventManager]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EventManager> updateRow(
    _is.DatabaseSession session,
    EventManager row, {
    _is.ColumnSelections<EventManagerTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<EventManager>(
      row,
      columns: columns?.call(EventManager.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EventManager] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<EventManager?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<EventManagerUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<EventManager>(
      id,
      columnValues: columnValues(EventManager.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [EventManager]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EventManager>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<EventManagerUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<EventManagerTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EventManagerTable>? orderBy,
    _is.OrderByListBuilder<EventManagerTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<EventManager>(
      columnValues: columnValues(EventManager.t.updateTable),
      where: where(EventManager.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventManager.t),
      orderByList: orderByList?.call(EventManager.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [EventManager]s in the list and returns the deleted rows.
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
  Future<List<EventManager>> delete(
    _is.DatabaseSession session,
    List<EventManager> rows, {
    _is.OrderByBuilder<EventManagerTable>? orderBy,
    _is.OrderByListBuilder<EventManagerTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<EventManager>(
      rows,
      orderBy: orderBy?.call(EventManager.t),
      orderByList: orderByList?.call(EventManager.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [EventManager].
  Future<EventManager> deleteRow(
    _is.DatabaseSession session,
    EventManager row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EventManager>(row, transaction: transaction);
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EventManager>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<EventManagerTable> where,
    _is.OrderByBuilder<EventManagerTable>? orderBy,
    _is.OrderByListBuilder<EventManagerTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<EventManager>(
      where: where(EventManager.t),
      orderBy: orderBy?.call(EventManager.t),
      orderByList: orderByList?.call(EventManager.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EventManagerTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<EventManager>(
      where: where?.call(EventManager.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [EventManager] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<EventManagerTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<EventManager>(
      where: where(EventManager.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class EventManagerAttachRowRepository {
  const EventManagerAttachRowRepository._();

  /// Creates a relation between the given [EventManager] and [Event]
  /// by setting the [EventManager]'s foreign key `eventId` to refer to the [Event].
  Future<void> event(
    _is.DatabaseSession session,
    EventManager eventManager,
    _iu57571s.Event event, {
    _is.Transaction? transaction,
  }) async {
    if (eventManager.id == null) {
      throw ArgumentError.notNull('eventManager.id');
    }
    if (event.id == null) {
      throw ArgumentError.notNull('event.id');
    }

    var $eventManager = eventManager.copyWith(eventId: event.id);
    await session.db.updateRow<EventManager>(
      $eventManager,
      columns: [EventManager.t.eventId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [EventManager] and [Member]
  /// by setting the [EventManager]'s foreign key `memberId` to refer to the [Member].
  Future<void> member(
    _is.DatabaseSession session,
    EventManager eventManager,
    _i7zhj6lg.Member member, {
    _is.Transaction? transaction,
  }) async {
    if (eventManager.id == null) {
      throw ArgumentError.notNull('eventManager.id');
    }
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    var $eventManager = eventManager.copyWith(memberId: member.id);
    await session.db.updateRow<EventManager>(
      $eventManager,
      columns: [EventManager.t.memberId],
      transaction: transaction,
    );
  }
}
