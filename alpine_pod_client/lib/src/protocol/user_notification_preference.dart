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
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'package:serverpod_database/serverpod_database.dart' as _isd;

abstract class UserNotificationPreference
    implements _isd.TableRow<_isc.UuidValue?>, _isc.ProtocolSerialization {
  UserNotificationPreference._({
    this.id,
    bool? allowInApp,
    bool? allowEmail,
    bool? allowPush,
    bool? allowSms,
    bool? newEvents,
    DateTime? updatedAt,
  }) : allowInApp = allowInApp ?? true,
       allowEmail = allowEmail ?? true,
       allowPush = allowPush ?? true,
       allowSms = allowSms ?? false,
       newEvents = newEvents ?? true,
       updatedAt = updatedAt ?? DateTime.now();

  factory UserNotificationPreference({
    _isc.UuidValue? id,
    bool? allowInApp,
    bool? allowEmail,
    bool? allowPush,
    bool? allowSms,
    bool? newEvents,
    DateTime? updatedAt,
  }) = _UserNotificationPreferenceImpl;

  factory UserNotificationPreference.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UserNotificationPreference(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      allowInApp: jsonSerialization['allowInApp'] == null
          ? null
          : _isc.BoolJsonExtension.fromJson(jsonSerialization['allowInApp']),
      allowEmail: jsonSerialization['allowEmail'] == null
          ? null
          : _isc.BoolJsonExtension.fromJson(jsonSerialization['allowEmail']),
      allowPush: jsonSerialization['allowPush'] == null
          ? null
          : _isc.BoolJsonExtension.fromJson(jsonSerialization['allowPush']),
      allowSms: jsonSerialization['allowSms'] == null
          ? null
          : _isc.BoolJsonExtension.fromJson(jsonSerialization['allowSms']),
      newEvents: jsonSerialization['newEvents'] == null
          ? null
          : _isc.BoolJsonExtension.fromJson(jsonSerialization['newEvents']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = UserNotificationPreferenceTable();

  static const db = UserNotificationPreferenceRepository._();

  @override
  _isc.UuidValue? id;

  bool allowInApp;

  bool allowEmail;

  bool allowPush;

  bool allowSms;

  bool newEvents;

  DateTime updatedAt;

  @override
  _isd.Table<_isc.UuidValue?> get table => t;

  /// Returns a shallow copy of this [UserNotificationPreference]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  UserNotificationPreference copyWith({
    _isc.UuidValue? id,
    bool? allowInApp,
    bool? allowEmail,
    bool? allowPush,
    bool? allowSms,
    bool? newEvents,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserNotificationPreference',
      if (id != null) 'id': id?.toJson(),
      'allowInApp': allowInApp,
      'allowEmail': allowEmail,
      'allowPush': allowPush,
      'allowSms': allowSms,
      'newEvents': newEvents,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserNotificationPreference',
      if (id != null) 'id': id?.toJson(),
      'allowInApp': allowInApp,
      'allowEmail': allowEmail,
      'allowPush': allowPush,
      'allowSms': allowSms,
      'newEvents': newEvents,
      'updatedAt': updatedAt.toJson(),
    };
  }

  static UserNotificationPreferenceInclude include() {
    return UserNotificationPreferenceInclude._();
  }

  static UserNotificationPreferenceIncludeList includeList({
    _isd.WhereExpressionBuilder<UserNotificationPreferenceTable>? where,
    int? limit,
    int? offset,
    _isd.OrderByBuilder<UserNotificationPreferenceTable>? orderBy,
    _isd.OrderByListBuilder<UserNotificationPreferenceTable>? orderByList,
    UserNotificationPreferenceInclude? include,
  }) {
    return UserNotificationPreferenceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserNotificationPreference.t),
      orderByList: orderByList?.call(UserNotificationPreference.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserNotificationPreferenceImpl extends UserNotificationPreference {
  _UserNotificationPreferenceImpl({
    _isc.UuidValue? id,
    bool? allowInApp,
    bool? allowEmail,
    bool? allowPush,
    bool? allowSms,
    bool? newEvents,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         allowInApp: allowInApp,
         allowEmail: allowEmail,
         allowPush: allowPush,
         allowSms: allowSms,
         newEvents: newEvents,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [UserNotificationPreference]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  UserNotificationPreference copyWith({
    Object? id = _Undefined,
    bool? allowInApp,
    bool? allowEmail,
    bool? allowPush,
    bool? allowSms,
    bool? newEvents,
    DateTime? updatedAt,
  }) {
    return UserNotificationPreference(
      id: id is _isc.UuidValue? ? id : this.id,
      allowInApp: allowInApp ?? this.allowInApp,
      allowEmail: allowEmail ?? this.allowEmail,
      allowPush: allowPush ?? this.allowPush,
      allowSms: allowSms ?? this.allowSms,
      newEvents: newEvents ?? this.newEvents,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class UserNotificationPreferenceUpdateTable
    extends _isd.UpdateTable<UserNotificationPreferenceTable> {
  UserNotificationPreferenceUpdateTable(super.table);

  _isd.ColumnValue<bool, bool> allowInApp(bool value) =>
      _isd.ColumnValue(table.allowInApp, value);

  _isd.ColumnValue<bool, bool> allowEmail(bool value) =>
      _isd.ColumnValue(table.allowEmail, value);

  _isd.ColumnValue<bool, bool> allowPush(bool value) =>
      _isd.ColumnValue(table.allowPush, value);

  _isd.ColumnValue<bool, bool> allowSms(bool value) =>
      _isd.ColumnValue(table.allowSms, value);

  _isd.ColumnValue<bool, bool> newEvents(bool value) =>
      _isd.ColumnValue(table.newEvents, value);

  _isd.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _isd.ColumnValue(table.updatedAt, value);
}

class UserNotificationPreferenceTable extends _isd.Table<_isc.UuidValue?> {
  UserNotificationPreferenceTable({super.tableRelation})
    : super(tableName: 'user_notification_preference') {
    updateTable = UserNotificationPreferenceUpdateTable(this);
    allowInApp = _isd.ColumnBool('allowInApp', this, hasDefault: true);
    allowEmail = _isd.ColumnBool('allowEmail', this, hasDefault: true);
    allowPush = _isd.ColumnBool('allowPush', this, hasDefault: true);
    allowSms = _isd.ColumnBool('allowSms', this, hasDefault: true);
    newEvents = _isd.ColumnBool('newEvents', this, hasDefault: true);
    updatedAt = _isd.ColumnDateTime('updatedAt', this, hasDefault: true);
  }

  late final UserNotificationPreferenceUpdateTable updateTable;

  late final _isd.ColumnBool allowInApp;

  late final _isd.ColumnBool allowEmail;

  late final _isd.ColumnBool allowPush;

  late final _isd.ColumnBool allowSms;

  late final _isd.ColumnBool newEvents;

  late final _isd.ColumnDateTime updatedAt;

  @override
  List<_isd.Column> get columns => [
    id,
    allowInApp,
    allowEmail,
    allowPush,
    allowSms,
    newEvents,
    updatedAt,
  ];
}

class UserNotificationPreferenceInclude extends _isd.IncludeObject {
  UserNotificationPreferenceInclude._();

  @override
  Map<String, _isd.Include?> get includes => {};

  @override
  _isd.Table<_isc.UuidValue?> get table => UserNotificationPreference.t;
}

class UserNotificationPreferenceIncludeList extends _isd.IncludeList {
  UserNotificationPreferenceIncludeList._({
    _isd.WhereExpressionBuilder<UserNotificationPreferenceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserNotificationPreference.t);
  }

  @override
  Map<String, _isd.Include?> get includes => include?.includes ?? {};

  @override
  _isd.Table<_isc.UuidValue?> get table => UserNotificationPreference.t;
}

class UserNotificationPreferenceRepository {
  const UserNotificationPreferenceRepository._();

  /// Returns a list of [UserNotificationPreference]s matching the given query parameters.
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
  Future<List<UserNotificationPreference>> find(
    _isd.DatabaseSession session, {
    _isd.WhereExpressionBuilder<UserNotificationPreferenceTable>? where,
    int? limit,
    int? offset,
    _isd.OrderByBuilder<UserNotificationPreferenceTable>? orderBy,
    _isd.OrderByListBuilder<UserNotificationPreferenceTable>? orderByList,
    _isd.Transaction? transaction,
    _isd.LockMode? lockMode,
    _isd.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<UserNotificationPreference>(
      where: where?.call(UserNotificationPreference.t),
      orderBy: orderBy?.call(UserNotificationPreference.t),
      orderByList: orderByList?.call(UserNotificationPreference.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [UserNotificationPreference] matching the given query parameters.
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
  Future<UserNotificationPreference?> findFirstRow(
    _isd.DatabaseSession session, {
    _isd.WhereExpressionBuilder<UserNotificationPreferenceTable>? where,
    int? offset,
    _isd.OrderByBuilder<UserNotificationPreferenceTable>? orderBy,
    _isd.OrderByListBuilder<UserNotificationPreferenceTable>? orderByList,
    _isd.Transaction? transaction,
    _isd.LockMode? lockMode,
    _isd.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<UserNotificationPreference>(
      where: where?.call(UserNotificationPreference.t),
      orderBy: orderBy?.call(UserNotificationPreference.t),
      orderByList: orderByList?.call(UserNotificationPreference.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [UserNotificationPreference] by its [id] or null if no such row exists.
  Future<UserNotificationPreference?> findById(
    _isd.DatabaseSession session,
    _isc.UuidValue id, {
    _isd.Transaction? transaction,
    _isd.LockMode? lockMode,
    _isd.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<UserNotificationPreference>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [UserNotificationPreference]s in the list and returns the inserted rows.
  ///
  /// The returned [UserNotificationPreference]s will have their `id` fields set.
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
  Future<List<UserNotificationPreference>> insert(
    _isd.DatabaseSession session,
    List<UserNotificationPreference> rows, {
    _isd.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<UserNotificationPreference>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [UserNotificationPreference] and returns the inserted row.
  ///
  /// The returned [UserNotificationPreference] will have its `id` field set.
  Future<UserNotificationPreference> insertRow(
    _isd.DatabaseSession session,
    UserNotificationPreference row, {
    _isd.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserNotificationPreference>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [UserNotificationPreference]s in the list and returns the resulting rows.
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
  /// The returned [UserNotificationPreference]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserNotificationPreference>> upsert(
    _isd.DatabaseSession session,
    List<UserNotificationPreference> rows, {
    required _isd.ColumnSelections<UserNotificationPreferenceTable>
    conflictColumns,
    _isd.ColumnSelections<UserNotificationPreferenceTable>? updateColumns,
    _isd.WhereExpressionBuilder<UserNotificationPreferenceTable>? updateWhere,
    _isd.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<UserNotificationPreference>(
      rows,
      conflictColumns: conflictColumns(UserNotificationPreference.t),
      updateColumns: updateColumns?.call(UserNotificationPreference.t),
      updateWhere: updateWhere?.call(UserNotificationPreference.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [UserNotificationPreference] and returns the resulting row.
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
  /// The returned [UserNotificationPreference] will have its `id` field set.
  Future<UserNotificationPreference?> upsertRow(
    _isd.DatabaseSession session,
    UserNotificationPreference row, {
    required _isd.ColumnSelections<UserNotificationPreferenceTable>
    conflictColumns,
    _isd.ColumnSelections<UserNotificationPreferenceTable>? updateColumns,
    _isd.WhereExpressionBuilder<UserNotificationPreferenceTable>? updateWhere,
    _isd.Transaction? transaction,
  }) async {
    return session.db.upsertRow<UserNotificationPreference>(
      row,
      conflictColumns: conflictColumns(UserNotificationPreference.t),
      updateColumns: updateColumns?.call(UserNotificationPreference.t),
      updateWhere: updateWhere?.call(UserNotificationPreference.t),
      transaction: transaction,
    );
  }

  /// Updates all [UserNotificationPreference]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserNotificationPreference>> update(
    _isd.DatabaseSession session,
    List<UserNotificationPreference> rows, {
    _isd.ColumnSelections<UserNotificationPreferenceTable>? columns,
    _isd.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<UserNotificationPreference>(
      rows,
      columns: columns?.call(UserNotificationPreference.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [UserNotificationPreference]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserNotificationPreference> updateRow(
    _isd.DatabaseSession session,
    UserNotificationPreference row, {
    _isd.ColumnSelections<UserNotificationPreferenceTable>? columns,
    _isd.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserNotificationPreference>(
      row,
      columns: columns?.call(UserNotificationPreference.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserNotificationPreference] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UserNotificationPreference?> updateById(
    _isd.DatabaseSession session,
    _isc.UuidValue id, {
    required _isd.ColumnValueListBuilder<UserNotificationPreferenceUpdateTable>
    columnValues,
    _isd.Transaction? transaction,
  }) async {
    return session.db.updateById<UserNotificationPreference>(
      id,
      columnValues: columnValues(UserNotificationPreference.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UserNotificationPreference]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserNotificationPreference>> updateWhere(
    _isd.DatabaseSession session, {
    required _isd.ColumnValueListBuilder<UserNotificationPreferenceUpdateTable>
    columnValues,
    required _isd.WhereExpressionBuilder<UserNotificationPreferenceTable> where,
    int? limit,
    int? offset,
    _isd.OrderByBuilder<UserNotificationPreferenceTable>? orderBy,
    _isd.OrderByListBuilder<UserNotificationPreferenceTable>? orderByList,
    _isd.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<UserNotificationPreference>(
      columnValues: columnValues(UserNotificationPreference.t.updateTable),
      where: where(UserNotificationPreference.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserNotificationPreference.t),
      orderByList: orderByList?.call(UserNotificationPreference.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [UserNotificationPreference]s in the list and returns the deleted rows.
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
  Future<List<UserNotificationPreference>> delete(
    _isd.DatabaseSession session,
    List<UserNotificationPreference> rows, {
    _isd.OrderByBuilder<UserNotificationPreferenceTable>? orderBy,
    _isd.OrderByListBuilder<UserNotificationPreferenceTable>? orderByList,
    _isd.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<UserNotificationPreference>(
      rows,
      orderBy: orderBy?.call(UserNotificationPreference.t),
      orderByList: orderByList?.call(UserNotificationPreference.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [UserNotificationPreference].
  Future<UserNotificationPreference> deleteRow(
    _isd.DatabaseSession session,
    UserNotificationPreference row, {
    _isd.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserNotificationPreference>(
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
  Future<List<UserNotificationPreference>> deleteWhere(
    _isd.DatabaseSession session, {
    required _isd.WhereExpressionBuilder<UserNotificationPreferenceTable> where,
    _isd.OrderByBuilder<UserNotificationPreferenceTable>? orderBy,
    _isd.OrderByListBuilder<UserNotificationPreferenceTable>? orderByList,
    _isd.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<UserNotificationPreference>(
      where: where(UserNotificationPreference.t),
      orderBy: orderBy?.call(UserNotificationPreference.t),
      orderByList: orderByList?.call(UserNotificationPreference.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _isd.DatabaseSession session, {
    _isd.WhereExpressionBuilder<UserNotificationPreferenceTable>? where,
    int? limit,
    _isd.Transaction? transaction,
  }) async {
    return session.db.count<UserNotificationPreference>(
      where: where?.call(UserNotificationPreference.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [UserNotificationPreference] rows matching the [where] expression.
  Future<void> lockRows(
    _isd.DatabaseSession session, {
    required _isd.WhereExpressionBuilder<UserNotificationPreferenceTable> where,
    required _isd.LockMode lockMode,
    required _isd.Transaction transaction,
    _isd.LockBehavior lockBehavior = _isd.LockBehavior.wait,
  }) async {
    return session.db.lockRows<UserNotificationPreference>(
      where: where(UserNotificationPreference.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
