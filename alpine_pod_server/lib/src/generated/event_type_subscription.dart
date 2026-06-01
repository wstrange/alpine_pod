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
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i2;
import 'package:alpine_pod_server/src/generated/protocol.dart' as _i3;

abstract class EventTypeSubscription
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  EventTypeSubscription._({
    this.id,
    required this.userId,
    this.user,
    required this.eventType,
  });

  factory EventTypeSubscription({
    int? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    required String eventType,
  }) = _EventTypeSubscriptionImpl;

  factory EventTypeSubscription.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return EventTypeSubscription(
      id: jsonSerialization['id'] as int?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.AuthUser>(jsonSerialization['user']),
      eventType: jsonSerialization['eventType'] as String,
    );
  }

  static final t = EventTypeSubscriptionTable();

  static const db = EventTypeSubscriptionRepository._();

  @override
  int? id;

  _i1.UuidValue userId;

  _i2.AuthUser? user;

  String eventType;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [EventTypeSubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EventTypeSubscription copyWith({
    int? id,
    _i1.UuidValue? userId,
    _i2.AuthUser? user,
    String? eventType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventTypeSubscription',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'eventType': eventType,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EventTypeSubscription',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'eventType': eventType,
    };
  }

  static EventTypeSubscriptionInclude include({_i2.AuthUserInclude? user}) {
    return EventTypeSubscriptionInclude._(user: user);
  }

  static EventTypeSubscriptionIncludeList includeList({
    _i1.WhereExpressionBuilder<EventTypeSubscriptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventTypeSubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTypeSubscriptionTable>? orderByList,
    EventTypeSubscriptionInclude? include,
  }) {
    return EventTypeSubscriptionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventTypeSubscription.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(EventTypeSubscription.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventTypeSubscriptionImpl extends EventTypeSubscription {
  _EventTypeSubscriptionImpl({
    int? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    required String eventType,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         eventType: eventType,
       );

  /// Returns a shallow copy of this [EventTypeSubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventTypeSubscription copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    String? eventType,
  }) {
    return EventTypeSubscription(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.AuthUser? ? user : this.user?.copyWith(),
      eventType: eventType ?? this.eventType,
    );
  }
}

class EventTypeSubscriptionUpdateTable
    extends _i1.UpdateTable<EventTypeSubscriptionTable> {
  EventTypeSubscriptionUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<String, String> eventType(String value) => _i1.ColumnValue(
    table.eventType,
    value,
  );
}

class EventTypeSubscriptionTable extends _i1.Table<int?> {
  EventTypeSubscriptionTable({super.tableRelation})
    : super(tableName: 'event_type_subscriptions') {
    updateTable = EventTypeSubscriptionUpdateTable(this);
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    eventType = _i1.ColumnString(
      'eventType',
      this,
    );
  }

  late final EventTypeSubscriptionUpdateTable updateTable;

  late final _i1.ColumnUuid userId;

  _i2.AuthUserTable? _user;

  late final _i1.ColumnString eventType;

  _i2.AuthUserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: EventTypeSubscription.t.userId,
      foreignField: _i2.AuthUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AuthUserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    eventType,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class EventTypeSubscriptionInclude extends _i1.IncludeObject {
  EventTypeSubscriptionInclude._({_i2.AuthUserInclude? user}) {
    _user = user;
  }

  _i2.AuthUserInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table<int?> get table => EventTypeSubscription.t;
}

class EventTypeSubscriptionIncludeList extends _i1.IncludeList {
  EventTypeSubscriptionIncludeList._({
    _i1.WhereExpressionBuilder<EventTypeSubscriptionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EventTypeSubscription.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => EventTypeSubscription.t;
}

class EventTypeSubscriptionRepository {
  const EventTypeSubscriptionRepository._();

  final attachRow = const EventTypeSubscriptionAttachRowRepository._();

  /// Returns a list of [EventTypeSubscription]s matching the given query parameters.
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
  Future<List<EventTypeSubscription>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<EventTypeSubscriptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventTypeSubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTypeSubscriptionTable>? orderByList,
    _i1.Transaction? transaction,
    EventTypeSubscriptionInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<EventTypeSubscription>(
      where: where?.call(EventTypeSubscription.t),
      orderBy: orderBy?.call(EventTypeSubscription.t),
      orderByList: orderByList?.call(EventTypeSubscription.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [EventTypeSubscription] matching the given query parameters.
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
  Future<EventTypeSubscription?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<EventTypeSubscriptionTable>? where,
    int? offset,
    _i1.OrderByBuilder<EventTypeSubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTypeSubscriptionTable>? orderByList,
    _i1.Transaction? transaction,
    EventTypeSubscriptionInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<EventTypeSubscription>(
      where: where?.call(EventTypeSubscription.t),
      orderBy: orderBy?.call(EventTypeSubscription.t),
      orderByList: orderByList?.call(EventTypeSubscription.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [EventTypeSubscription] by its [id] or null if no such row exists.
  Future<EventTypeSubscription?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    EventTypeSubscriptionInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<EventTypeSubscription>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [EventTypeSubscription]s in the list and returns the inserted rows.
  ///
  /// The returned [EventTypeSubscription]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<EventTypeSubscription>> insert(
    _i1.DatabaseSession session,
    List<EventTypeSubscription> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<EventTypeSubscription>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [EventTypeSubscription] and returns the inserted row.
  ///
  /// The returned [EventTypeSubscription] will have its `id` field set.
  Future<EventTypeSubscription> insertRow(
    _i1.DatabaseSession session,
    EventTypeSubscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<EventTypeSubscription>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [EventTypeSubscription]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<EventTypeSubscription>> update(
    _i1.DatabaseSession session,
    List<EventTypeSubscription> rows, {
    _i1.ColumnSelections<EventTypeSubscriptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<EventTypeSubscription>(
      rows,
      columns: columns?.call(EventTypeSubscription.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EventTypeSubscription]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EventTypeSubscription> updateRow(
    _i1.DatabaseSession session,
    EventTypeSubscription row, {
    _i1.ColumnSelections<EventTypeSubscriptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<EventTypeSubscription>(
      row,
      columns: columns?.call(EventTypeSubscription.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EventTypeSubscription] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<EventTypeSubscription?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<EventTypeSubscriptionUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<EventTypeSubscription>(
      id,
      columnValues: columnValues(EventTypeSubscription.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [EventTypeSubscription]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<EventTypeSubscription>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<EventTypeSubscriptionUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<EventTypeSubscriptionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventTypeSubscriptionTable>? orderBy,
    _i1.OrderByListBuilder<EventTypeSubscriptionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<EventTypeSubscription>(
      columnValues: columnValues(EventTypeSubscription.t.updateTable),
      where: where(EventTypeSubscription.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventTypeSubscription.t),
      orderByList: orderByList?.call(EventTypeSubscription.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [EventTypeSubscription]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<EventTypeSubscription>> delete(
    _i1.DatabaseSession session,
    List<EventTypeSubscription> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EventTypeSubscription>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [EventTypeSubscription].
  Future<EventTypeSubscription> deleteRow(
    _i1.DatabaseSession session,
    EventTypeSubscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EventTypeSubscription>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<EventTypeSubscription>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<EventTypeSubscriptionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<EventTypeSubscription>(
      where: where(EventTypeSubscription.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<EventTypeSubscriptionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EventTypeSubscription>(
      where: where?.call(EventTypeSubscription.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [EventTypeSubscription] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<EventTypeSubscriptionTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<EventTypeSubscription>(
      where: where(EventTypeSubscription.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class EventTypeSubscriptionAttachRowRepository {
  const EventTypeSubscriptionAttachRowRepository._();

  /// Creates a relation between the given [EventTypeSubscription] and [AuthUser]
  /// by setting the [EventTypeSubscription]'s foreign key `userId` to refer to the [AuthUser].
  Future<void> user(
    _i1.DatabaseSession session,
    EventTypeSubscription eventTypeSubscription,
    _i2.AuthUser user, {
    _i1.Transaction? transaction,
  }) async {
    if (eventTypeSubscription.id == null) {
      throw ArgumentError.notNull('eventTypeSubscription.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $eventTypeSubscription = eventTypeSubscription.copyWith(
      userId: user.id,
    );
    await session.db.updateRow<EventTypeSubscription>(
      $eventTypeSubscription,
      columns: [EventTypeSubscription.t.userId],
      transaction: transaction,
    );
  }
}
