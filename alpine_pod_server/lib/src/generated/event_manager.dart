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
import 'event.dart' as _i2;
import 'member.dart' as _i3;
import 'package:alpine_pod_server/src/generated/protocol.dart' as _i4;

abstract class EventManager
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  EventManager._({
    this.id,
    required this.eventId,
    this.event,
    required this.memberId,
    this.member,
    this.assignedAt,
  }) : _eventsEventmanagersEventsId = null;

  factory EventManager({
    int? id,
    required int eventId,
    _i2.Event? event,
    required int memberId,
    _i3.Member? member,
    DateTime? assignedAt,
  }) = _EventManagerImpl;

  factory EventManager.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventManagerImplicit._(
      id: jsonSerialization['id'] as int?,
      eventId: jsonSerialization['eventId'] as int,
      event: jsonSerialization['event'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Event>(jsonSerialization['event']),
      memberId: jsonSerialization['memberId'] as int,
      member: jsonSerialization['member'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Member>(jsonSerialization['member']),
      assignedAt: jsonSerialization['assignedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['assignedAt']),
      $_eventsEventmanagersEventsId:
          jsonSerialization['_eventsEventmanagersEventsId'] as int?,
    );
  }

  static final t = EventManagerTable();

  static const db = EventManagerRepository._();

  @override
  int? id;

  int eventId;

  _i2.Event? event;

  int memberId;

  _i3.Member? member;

  DateTime? assignedAt;

  final int? _eventsEventmanagersEventsId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [EventManager]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EventManager copyWith({
    int? id,
    int? eventId,
    _i2.Event? event,
    int? memberId,
    _i3.Member? member,
    DateTime? assignedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventManager',
      if (id != null) 'id': id,
      'eventId': eventId,
      if (event != null) 'event': event?.toJson(),
      'memberId': memberId,
      if (member != null) 'member': member?.toJson(),
      if (assignedAt != null) 'assignedAt': assignedAt?.toJson(),
      if (_eventsEventmanagersEventsId != null)
        '_eventsEventmanagersEventsId': _eventsEventmanagersEventsId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EventManager',
      if (id != null) 'id': id,
      'eventId': eventId,
      if (event != null) 'event': event?.toJsonForProtocol(),
      'memberId': memberId,
      if (member != null) 'member': member?.toJsonForProtocol(),
      if (assignedAt != null) 'assignedAt': assignedAt?.toJson(),
    };
  }

  static EventManagerInclude include({
    _i2.EventInclude? event,
    _i3.MemberInclude? member,
  }) {
    return EventManagerInclude._(
      event: event,
      member: member,
    );
  }

  static EventManagerIncludeList includeList({
    _i1.WhereExpressionBuilder<EventManagerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventManagerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventManagerTable>? orderByList,
    EventManagerInclude? include,
  }) {
    return EventManagerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventManager.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(EventManager.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventManagerImpl extends EventManager {
  _EventManagerImpl({
    int? id,
    required int eventId,
    _i2.Event? event,
    required int memberId,
    _i3.Member? member,
    DateTime? assignedAt,
  }) : super._(
         id: id,
         eventId: eventId,
         event: event,
         memberId: memberId,
         member: member,
         assignedAt: assignedAt,
       );

  /// Returns a shallow copy of this [EventManager]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventManager copyWith({
    Object? id = _Undefined,
    int? eventId,
    Object? event = _Undefined,
    int? memberId,
    Object? member = _Undefined,
    Object? assignedAt = _Undefined,
  }) {
    return EventManagerImplicit._(
      id: id is int? ? id : this.id,
      eventId: eventId ?? this.eventId,
      event: event is _i2.Event? ? event : this.event?.copyWith(),
      memberId: memberId ?? this.memberId,
      member: member is _i3.Member? ? member : this.member?.copyWith(),
      assignedAt: assignedAt is DateTime? ? assignedAt : this.assignedAt,
      $_eventsEventmanagersEventsId: this._eventsEventmanagersEventsId,
    );
  }
}

class EventManagerImplicit extends _EventManagerImpl {
  EventManagerImplicit._({
    int? id,
    required int eventId,
    _i2.Event? event,
    required int memberId,
    _i3.Member? member,
    DateTime? assignedAt,
    int? $_eventsEventmanagersEventsId,
  }) : _eventsEventmanagersEventsId = $_eventsEventmanagersEventsId,
       super(
         id: id,
         eventId: eventId,
         event: event,
         memberId: memberId,
         member: member,
         assignedAt: assignedAt,
       );

  factory EventManagerImplicit(
    EventManager eventManager, {
    int? $_eventsEventmanagersEventsId,
  }) {
    return EventManagerImplicit._(
      id: eventManager.id,
      eventId: eventManager.eventId,
      event: eventManager.event,
      memberId: eventManager.memberId,
      member: eventManager.member,
      assignedAt: eventManager.assignedAt,
      $_eventsEventmanagersEventsId: $_eventsEventmanagersEventsId,
    );
  }

  @override
  final int? _eventsEventmanagersEventsId;
}

class EventManagerUpdateTable extends _i1.UpdateTable<EventManagerTable> {
  EventManagerUpdateTable(super.table);

  _i1.ColumnValue<int, int> eventId(int value) => _i1.ColumnValue(
    table.eventId,
    value,
  );

  _i1.ColumnValue<int, int> memberId(int value) => _i1.ColumnValue(
    table.memberId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> assignedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.assignedAt,
        value,
      );

  _i1.ColumnValue<int, int> $_eventsEventmanagersEventsId(int? value) =>
      _i1.ColumnValue(
        table.$_eventsEventmanagersEventsId,
        value,
      );
}

class EventManagerTable extends _i1.Table<int?> {
  EventManagerTable({super.tableRelation})
    : super(tableName: 'event_managers') {
    updateTable = EventManagerUpdateTable(this);
    eventId = _i1.ColumnInt(
      'eventId',
      this,
    );
    memberId = _i1.ColumnInt(
      'memberId',
      this,
    );
    assignedAt = _i1.ColumnDateTime(
      'assignedAt',
      this,
    );
    $_eventsEventmanagersEventsId = _i1.ColumnInt(
      '_eventsEventmanagersEventsId',
      this,
    );
  }

  late final EventManagerUpdateTable updateTable;

  late final _i1.ColumnInt eventId;

  _i2.EventTable? _event;

  late final _i1.ColumnInt memberId;

  _i3.MemberTable? _member;

  late final _i1.ColumnDateTime assignedAt;

  late final _i1.ColumnInt $_eventsEventmanagersEventsId;

  _i2.EventTable get event {
    if (_event != null) return _event!;
    _event = _i1.createRelationTable(
      relationFieldName: 'event',
      field: EventManager.t.eventId,
      foreignField: _i2.Event.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.EventTable(tableRelation: foreignTableRelation),
    );
    return _event!;
  }

  _i3.MemberTable get member {
    if (_member != null) return _member!;
    _member = _i1.createRelationTable(
      relationFieldName: 'member',
      field: EventManager.t.memberId,
      foreignField: _i3.Member.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.MemberTable(tableRelation: foreignTableRelation),
    );
    return _member!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    eventId,
    memberId,
    assignedAt,
    $_eventsEventmanagersEventsId,
  ];

  @override
  List<_i1.Column> get managedColumns => [
    id,
    eventId,
    memberId,
    assignedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'event') {
      return event;
    }
    if (relationField == 'member') {
      return member;
    }
    return null;
  }
}

class EventManagerInclude extends _i1.IncludeObject {
  EventManagerInclude._({
    _i2.EventInclude? event,
    _i3.MemberInclude? member,
  }) {
    _event = event;
    _member = member;
  }

  _i2.EventInclude? _event;

  _i3.MemberInclude? _member;

  @override
  Map<String, _i1.Include?> get includes => {
    'event': _event,
    'member': _member,
  };

  @override
  _i1.Table<int?> get table => EventManager.t;
}

class EventManagerIncludeList extends _i1.IncludeList {
  EventManagerIncludeList._({
    _i1.WhereExpressionBuilder<EventManagerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EventManager.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => EventManager.t;
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
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventManagerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventManagerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventManagerTable>? orderByList,
    _i1.Transaction? transaction,
    EventManagerInclude? include,
  }) async {
    return session.db.find<EventManager>(
      where: where?.call(EventManager.t),
      orderBy: orderBy?.call(EventManager.t),
      orderByList: orderByList?.call(EventManager.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
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
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventManagerTable>? where,
    int? offset,
    _i1.OrderByBuilder<EventManagerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventManagerTable>? orderByList,
    _i1.Transaction? transaction,
    EventManagerInclude? include,
  }) async {
    return session.db.findFirstRow<EventManager>(
      where: where?.call(EventManager.t),
      orderBy: orderBy?.call(EventManager.t),
      orderByList: orderByList?.call(EventManager.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [EventManager] by its [id] or null if no such row exists.
  Future<EventManager?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    EventManagerInclude? include,
  }) async {
    return session.db.findById<EventManager>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [EventManager]s in the list and returns the inserted rows.
  ///
  /// The returned [EventManager]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<EventManager>> insert(
    _i1.Session session,
    List<EventManager> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<EventManager>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [EventManager] and returns the inserted row.
  ///
  /// The returned [EventManager] will have its `id` field set.
  Future<EventManager> insertRow(
    _i1.Session session,
    EventManager row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<EventManager>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [EventManager]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<EventManager>> update(
    _i1.Session session,
    List<EventManager> rows, {
    _i1.ColumnSelections<EventManagerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<EventManager>(
      rows,
      columns: columns?.call(EventManager.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EventManager]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EventManager> updateRow(
    _i1.Session session,
    EventManager row, {
    _i1.ColumnSelections<EventManagerTable>? columns,
    _i1.Transaction? transaction,
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
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<EventManagerUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<EventManager>(
      id,
      columnValues: columnValues(EventManager.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [EventManager]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<EventManager>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<EventManagerUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<EventManagerTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventManagerTable>? orderBy,
    _i1.OrderByListBuilder<EventManagerTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<EventManager>(
      columnValues: columnValues(EventManager.t.updateTable),
      where: where(EventManager.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventManager.t),
      orderByList: orderByList?.call(EventManager.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [EventManager]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<EventManager>> delete(
    _i1.Session session,
    List<EventManager> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EventManager>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [EventManager].
  Future<EventManager> deleteRow(
    _i1.Session session,
    EventManager row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EventManager>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<EventManager>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EventManagerTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<EventManager>(
      where: where(EventManager.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventManagerTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EventManager>(
      where: where?.call(EventManager.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class EventManagerAttachRowRepository {
  const EventManagerAttachRowRepository._();

  /// Creates a relation between the given [EventManager] and [Event]
  /// by setting the [EventManager]'s foreign key `eventId` to refer to the [Event].
  Future<void> event(
    _i1.Session session,
    EventManager eventManager,
    _i2.Event event, {
    _i1.Transaction? transaction,
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
    _i1.Session session,
    EventManager eventManager,
    _i3.Member member, {
    _i1.Transaction? transaction,
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
