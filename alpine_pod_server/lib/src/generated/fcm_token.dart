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

import 'package:serverpod/serverpod.dart' as _is;

abstract class FcmToken
    implements _is.TableRow<_is.UuidValue>, _is.ProtocolSerialization {
  FcmToken._({
    _is.UuidValue? id,
    required this.token,
    this.deviceId,
    DateTime? updatedAt,
  }) : id = id ?? const _is.Uuid().v7obj(),
       updatedAt = updatedAt ?? DateTime.now();

  factory FcmToken({
    _is.UuidValue? id,
    required String token,
    String? deviceId,
    DateTime? updatedAt,
  }) = _FcmTokenImpl;

  factory FcmToken.fromJson(Map<String, dynamic> jsonSerialization) {
    return FcmToken(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      token: jsonSerialization['token'] as String,
      deviceId: jsonSerialization['deviceId'] as String?,
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = FcmTokenTable();

  static const db = FcmTokenRepository._();

  @override
  _is.UuidValue id;

  String token;

  String? deviceId;

  DateTime updatedAt;

  @override
  _is.Table<_is.UuidValue> get table => t;

  /// Returns a shallow copy of this [FcmToken]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  FcmToken copyWith({
    _is.UuidValue? id,
    String? token,
    String? deviceId,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'FcmToken',
      'id': id.toJson(),
      'token': token,
      if (deviceId != null) 'deviceId': deviceId,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'FcmToken',
      'id': id.toJson(),
      'token': token,
      if (deviceId != null) 'deviceId': deviceId,
      'updatedAt': updatedAt.toJson(),
    };
  }

  static FcmTokenInclude include() {
    return FcmTokenInclude._();
  }

  static FcmTokenIncludeList includeList({
    _is.WhereExpressionBuilder<FcmTokenTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FcmTokenTable>? orderBy,
    _is.OrderByListBuilder<FcmTokenTable>? orderByList,
    FcmTokenInclude? include,
  }) {
    return FcmTokenIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FcmToken.t),
      orderByList: orderByList?.call(FcmToken.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FcmTokenImpl extends FcmToken {
  _FcmTokenImpl({
    _is.UuidValue? id,
    required String token,
    String? deviceId,
    DateTime? updatedAt,
  }) : super._(id: id, token: token, deviceId: deviceId, updatedAt: updatedAt);

  /// Returns a shallow copy of this [FcmToken]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  FcmToken copyWith({
    _is.UuidValue? id,
    String? token,
    Object? deviceId = _Undefined,
    DateTime? updatedAt,
  }) {
    return FcmToken(
      id: id ?? this.id,
      token: token ?? this.token,
      deviceId: deviceId is String? ? deviceId : this.deviceId,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class FcmTokenUpdateTable extends _is.UpdateTable<FcmTokenTable> {
  FcmTokenUpdateTable(super.table);

  _is.ColumnValue<String, String> token(String value) =>
      _is.ColumnValue(table.token, value);

  _is.ColumnValue<String, String> deviceId(String? value) =>
      _is.ColumnValue(table.deviceId, value);

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(table.updatedAt, value);
}

class FcmTokenTable extends _is.Table<_is.UuidValue> {
  FcmTokenTable({super.tableRelation}) : super(tableName: 'fcm_tokens') {
    updateTable = FcmTokenUpdateTable(this);
    token = _is.ColumnString('token', this);
    deviceId = _is.ColumnString('deviceId', this);
    updatedAt = _is.ColumnDateTime('updatedAt', this, hasDefault: true);
  }

  late final FcmTokenUpdateTable updateTable;

  late final _is.ColumnString token;

  late final _is.ColumnString deviceId;

  late final _is.ColumnDateTime updatedAt;

  @override
  List<_is.Column> get columns => [id, token, deviceId, updatedAt];
}

class FcmTokenInclude extends _is.IncludeObject {
  FcmTokenInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<_is.UuidValue> get table => FcmToken.t;
}

class FcmTokenIncludeList extends _is.IncludeList {
  FcmTokenIncludeList._({
    _is.WhereExpressionBuilder<FcmTokenTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(FcmToken.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue> get table => FcmToken.t;
}

class FcmTokenRepository {
  const FcmTokenRepository._();

  /// Returns a list of [FcmToken]s matching the given query parameters.
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
  Future<List<FcmToken>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FcmTokenTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FcmTokenTable>? orderBy,
    _is.OrderByListBuilder<FcmTokenTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<FcmToken>(
      where: where?.call(FcmToken.t),
      orderBy: orderBy?.call(FcmToken.t),
      orderByList: orderByList?.call(FcmToken.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [FcmToken] matching the given query parameters.
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
  Future<FcmToken?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FcmTokenTable>? where,
    int? offset,
    _is.OrderByBuilder<FcmTokenTable>? orderBy,
    _is.OrderByListBuilder<FcmTokenTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<FcmToken>(
      where: where?.call(FcmToken.t),
      orderBy: orderBy?.call(FcmToken.t),
      orderByList: orderByList?.call(FcmToken.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [FcmToken] by its [id] or null if no such row exists.
  Future<FcmToken?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<FcmToken>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [FcmToken]s in the list and returns the inserted rows.
  ///
  /// The returned [FcmToken]s will have their `id` fields set.
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
  Future<List<FcmToken>> insert(
    _is.DatabaseSession session,
    List<FcmToken> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<FcmToken>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [FcmToken] and returns the inserted row.
  ///
  /// The returned [FcmToken] will have its `id` field set.
  Future<FcmToken> insertRow(
    _is.DatabaseSession session,
    FcmToken row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<FcmToken>(row, transaction: transaction);
  }

  /// Upserts all [FcmToken]s in the list and returns the resulting rows.
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
  /// The returned [FcmToken]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FcmToken>> upsert(
    _is.DatabaseSession session,
    List<FcmToken> rows, {
    required _is.ColumnSelections<FcmTokenTable> conflictColumns,
    _is.ColumnSelections<FcmTokenTable>? updateColumns,
    _is.WhereExpressionBuilder<FcmTokenTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<FcmToken>(
      rows,
      conflictColumns: conflictColumns(FcmToken.t),
      updateColumns: updateColumns?.call(FcmToken.t),
      updateWhere: updateWhere?.call(FcmToken.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [FcmToken] and returns the resulting row.
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
  /// The returned [FcmToken] will have its `id` field set.
  Future<FcmToken?> upsertRow(
    _is.DatabaseSession session,
    FcmToken row, {
    required _is.ColumnSelections<FcmTokenTable> conflictColumns,
    _is.ColumnSelections<FcmTokenTable>? updateColumns,
    _is.WhereExpressionBuilder<FcmTokenTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<FcmToken>(
      row,
      conflictColumns: conflictColumns(FcmToken.t),
      updateColumns: updateColumns?.call(FcmToken.t),
      updateWhere: updateWhere?.call(FcmToken.t),
      transaction: transaction,
    );
  }

  /// Updates all [FcmToken]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FcmToken>> update(
    _is.DatabaseSession session,
    List<FcmToken> rows, {
    _is.ColumnSelections<FcmTokenTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<FcmToken>(
      rows,
      columns: columns?.call(FcmToken.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [FcmToken]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<FcmToken> updateRow(
    _is.DatabaseSession session,
    FcmToken row, {
    _is.ColumnSelections<FcmTokenTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<FcmToken>(
      row,
      columns: columns?.call(FcmToken.t),
      transaction: transaction,
    );
  }

  /// Updates a single [FcmToken] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<FcmToken?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<FcmTokenUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<FcmToken>(
      id,
      columnValues: columnValues(FcmToken.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [FcmToken]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FcmToken>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<FcmTokenUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<FcmTokenTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<FcmTokenTable>? orderBy,
    _is.OrderByListBuilder<FcmTokenTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<FcmToken>(
      columnValues: columnValues(FcmToken.t.updateTable),
      where: where(FcmToken.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FcmToken.t),
      orderByList: orderByList?.call(FcmToken.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [FcmToken]s in the list and returns the deleted rows.
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
  Future<List<FcmToken>> delete(
    _is.DatabaseSession session,
    List<FcmToken> rows, {
    _is.OrderByBuilder<FcmTokenTable>? orderBy,
    _is.OrderByListBuilder<FcmTokenTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<FcmToken>(
      rows,
      orderBy: orderBy?.call(FcmToken.t),
      orderByList: orderByList?.call(FcmToken.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [FcmToken].
  Future<FcmToken> deleteRow(
    _is.DatabaseSession session,
    FcmToken row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<FcmToken>(row, transaction: transaction);
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<FcmToken>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<FcmTokenTable> where,
    _is.OrderByBuilder<FcmTokenTable>? orderBy,
    _is.OrderByListBuilder<FcmTokenTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<FcmToken>(
      where: where(FcmToken.t),
      orderBy: orderBy?.call(FcmToken.t),
      orderByList: orderByList?.call(FcmToken.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<FcmTokenTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<FcmToken>(
      where: where?.call(FcmToken.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [FcmToken] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<FcmTokenTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<FcmToken>(
      where: where(FcmToken.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
