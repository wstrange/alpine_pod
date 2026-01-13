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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class EventTripLeader
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  EventTripLeader._({
    this.id,
    this.eventId,
    this.userId,
    this.assignedAt,
  });

  factory EventTripLeader({
    int? id,
    int? eventId,
    int? userId,
    DateTime? assignedAt,
  }) = _EventTripLeaderImpl;

  factory EventTripLeader.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventTripLeader(
      id: jsonSerialization['id'] as int?,
      eventId: jsonSerialization['eventId'] as int?,
      userId: jsonSerialization['userId'] as int?,
      assignedAt: jsonSerialization['assignedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['assignedAt']),
    );
  }

  static final t = EventTripLeaderTable();

  static const db = EventTripLeaderRepository._();

  @override
  int? id;

  int? eventId;

  int? userId;

  DateTime? assignedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [EventTripLeader]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EventTripLeader copyWith({
    int? id,
    int? eventId,
    int? userId,
    DateTime? assignedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventTripLeader',
      if (id != null) 'id': id,
      if (eventId != null) 'eventId': eventId,
      if (userId != null) 'userId': userId,
      if (assignedAt != null) 'assignedAt': assignedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EventTripLeader',
      if (id != null) 'id': id,
      if (eventId != null) 'eventId': eventId,
      if (userId != null) 'userId': userId,
      if (assignedAt != null) 'assignedAt': assignedAt?.toJson(),
    };
  }

  static EventTripLeaderInclude include() {
    return EventTripLeaderInclude._();
  }

  static EventTripLeaderIncludeList includeList({
    _i1.WhereExpressionBuilder<EventTripLeaderTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventTripLeaderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTripLeaderTable>? orderByList,
    EventTripLeaderInclude? include,
  }) {
    return EventTripLeaderIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventTripLeader.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(EventTripLeader.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventTripLeaderImpl extends EventTripLeader {
  _EventTripLeaderImpl({
    int? id,
    int? eventId,
    int? userId,
    DateTime? assignedAt,
  }) : super._(
         id: id,
         eventId: eventId,
         userId: userId,
         assignedAt: assignedAt,
       );

  /// Returns a shallow copy of this [EventTripLeader]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventTripLeader copyWith({
    Object? id = _Undefined,
    Object? eventId = _Undefined,
    Object? userId = _Undefined,
    Object? assignedAt = _Undefined,
  }) {
    return EventTripLeader(
      id: id is int? ? id : this.id,
      eventId: eventId is int? ? eventId : this.eventId,
      userId: userId is int? ? userId : this.userId,
      assignedAt: assignedAt is DateTime? ? assignedAt : this.assignedAt,
    );
  }
}

class EventTripLeaderUpdateTable extends _i1.UpdateTable<EventTripLeaderTable> {
  EventTripLeaderUpdateTable(super.table);

  _i1.ColumnValue<int, int> eventId(int? value) => _i1.ColumnValue(
    table.eventId,
    value,
  );

  _i1.ColumnValue<int, int> userId(int? value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> assignedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.assignedAt,
        value,
      );
}

class EventTripLeaderTable extends _i1.Table<int?> {
  EventTripLeaderTable({super.tableRelation})
    : super(tableName: 'event_trip_leaders') {
    updateTable = EventTripLeaderUpdateTable(this);
    eventId = _i1.ColumnInt(
      'eventId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    assignedAt = _i1.ColumnDateTime(
      'assignedAt',
      this,
    );
  }

  late final EventTripLeaderUpdateTable updateTable;

  late final _i1.ColumnInt eventId;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnDateTime assignedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    eventId,
    userId,
    assignedAt,
  ];
}

class EventTripLeaderInclude extends _i1.IncludeObject {
  EventTripLeaderInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => EventTripLeader.t;
}

class EventTripLeaderIncludeList extends _i1.IncludeList {
  EventTripLeaderIncludeList._({
    _i1.WhereExpressionBuilder<EventTripLeaderTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EventTripLeader.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => EventTripLeader.t;
}

class EventTripLeaderRepository {
  const EventTripLeaderRepository._();

  /// Returns a list of [EventTripLeader]s matching the given query parameters.
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
  Future<List<EventTripLeader>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventTripLeaderTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventTripLeaderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTripLeaderTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EventTripLeader>(
      where: where?.call(EventTripLeader.t),
      orderBy: orderBy?.call(EventTripLeader.t),
      orderByList: orderByList?.call(EventTripLeader.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [EventTripLeader] matching the given query parameters.
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
  Future<EventTripLeader?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventTripLeaderTable>? where,
    int? offset,
    _i1.OrderByBuilder<EventTripLeaderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTripLeaderTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<EventTripLeader>(
      where: where?.call(EventTripLeader.t),
      orderBy: orderBy?.call(EventTripLeader.t),
      orderByList: orderByList?.call(EventTripLeader.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [EventTripLeader] by its [id] or null if no such row exists.
  Future<EventTripLeader?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<EventTripLeader>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [EventTripLeader]s in the list and returns the inserted rows.
  ///
  /// The returned [EventTripLeader]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<EventTripLeader>> insert(
    _i1.Session session,
    List<EventTripLeader> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<EventTripLeader>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [EventTripLeader] and returns the inserted row.
  ///
  /// The returned [EventTripLeader] will have its `id` field set.
  Future<EventTripLeader> insertRow(
    _i1.Session session,
    EventTripLeader row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<EventTripLeader>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [EventTripLeader]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<EventTripLeader>> update(
    _i1.Session session,
    List<EventTripLeader> rows, {
    _i1.ColumnSelections<EventTripLeaderTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<EventTripLeader>(
      rows,
      columns: columns?.call(EventTripLeader.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EventTripLeader]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EventTripLeader> updateRow(
    _i1.Session session,
    EventTripLeader row, {
    _i1.ColumnSelections<EventTripLeaderTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<EventTripLeader>(
      row,
      columns: columns?.call(EventTripLeader.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EventTripLeader] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<EventTripLeader?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<EventTripLeaderUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<EventTripLeader>(
      id,
      columnValues: columnValues(EventTripLeader.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [EventTripLeader]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<EventTripLeader>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<EventTripLeaderUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<EventTripLeaderTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventTripLeaderTable>? orderBy,
    _i1.OrderByListBuilder<EventTripLeaderTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<EventTripLeader>(
      columnValues: columnValues(EventTripLeader.t.updateTable),
      where: where(EventTripLeader.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventTripLeader.t),
      orderByList: orderByList?.call(EventTripLeader.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [EventTripLeader]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<EventTripLeader>> delete(
    _i1.Session session,
    List<EventTripLeader> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EventTripLeader>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [EventTripLeader].
  Future<EventTripLeader> deleteRow(
    _i1.Session session,
    EventTripLeader row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EventTripLeader>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<EventTripLeader>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EventTripLeaderTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<EventTripLeader>(
      where: where(EventTripLeader.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventTripLeaderTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EventTripLeader>(
      where: where?.call(EventTripLeader.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
