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

abstract class NotificationPreference
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  NotificationPreference._({
    this.id,
    required this.userId,
    this.user,
    bool? enableEmail,
    bool? enablePush,
    bool? enableInApp,
  }) : enableEmail = enableEmail ?? true,
       enablePush = enablePush ?? true,
       enableInApp = enableInApp ?? true;

  factory NotificationPreference({
    int? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    bool? enableEmail,
    bool? enablePush,
    bool? enableInApp,
  }) = _NotificationPreferenceImpl;

  factory NotificationPreference.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return NotificationPreference(
      id: jsonSerialization['id'] as int?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.AuthUser>(jsonSerialization['user']),
      enableEmail: jsonSerialization['enableEmail'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['enableEmail']),
      enablePush: jsonSerialization['enablePush'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['enablePush']),
      enableInApp: jsonSerialization['enableInApp'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['enableInApp']),
    );
  }

  static final t = NotificationPreferenceTable();

  static const db = NotificationPreferenceRepository._();

  @override
  int? id;

  _i1.UuidValue userId;

  _i2.AuthUser? user;

  bool enableEmail;

  bool enablePush;

  bool enableInApp;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [NotificationPreference]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  NotificationPreference copyWith({
    int? id,
    _i1.UuidValue? userId,
    _i2.AuthUser? user,
    bool? enableEmail,
    bool? enablePush,
    bool? enableInApp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'NotificationPreference',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'enableEmail': enableEmail,
      'enablePush': enablePush,
      'enableInApp': enableInApp,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'NotificationPreference',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'enableEmail': enableEmail,
      'enablePush': enablePush,
      'enableInApp': enableInApp,
    };
  }

  static NotificationPreferenceInclude include({_i2.AuthUserInclude? user}) {
    return NotificationPreferenceInclude._(user: user);
  }

  static NotificationPreferenceIncludeList includeList({
    _i1.WhereExpressionBuilder<NotificationPreferenceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationPreferenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationPreferenceTable>? orderByList,
    NotificationPreferenceInclude? include,
  }) {
    return NotificationPreferenceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NotificationPreference.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(NotificationPreference.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NotificationPreferenceImpl extends NotificationPreference {
  _NotificationPreferenceImpl({
    int? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    bool? enableEmail,
    bool? enablePush,
    bool? enableInApp,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         enableEmail: enableEmail,
         enablePush: enablePush,
         enableInApp: enableInApp,
       );

  /// Returns a shallow copy of this [NotificationPreference]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  NotificationPreference copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    bool? enableEmail,
    bool? enablePush,
    bool? enableInApp,
  }) {
    return NotificationPreference(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.AuthUser? ? user : this.user?.copyWith(),
      enableEmail: enableEmail ?? this.enableEmail,
      enablePush: enablePush ?? this.enablePush,
      enableInApp: enableInApp ?? this.enableInApp,
    );
  }
}

class NotificationPreferenceUpdateTable
    extends _i1.UpdateTable<NotificationPreferenceTable> {
  NotificationPreferenceUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<bool, bool> enableEmail(bool value) => _i1.ColumnValue(
    table.enableEmail,
    value,
  );

  _i1.ColumnValue<bool, bool> enablePush(bool value) => _i1.ColumnValue(
    table.enablePush,
    value,
  );

  _i1.ColumnValue<bool, bool> enableInApp(bool value) => _i1.ColumnValue(
    table.enableInApp,
    value,
  );
}

class NotificationPreferenceTable extends _i1.Table<int?> {
  NotificationPreferenceTable({super.tableRelation})
    : super(tableName: 'notification_preferences') {
    updateTable = NotificationPreferenceUpdateTable(this);
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    enableEmail = _i1.ColumnBool(
      'enableEmail',
      this,
      hasDefault: true,
    );
    enablePush = _i1.ColumnBool(
      'enablePush',
      this,
      hasDefault: true,
    );
    enableInApp = _i1.ColumnBool(
      'enableInApp',
      this,
      hasDefault: true,
    );
  }

  late final NotificationPreferenceUpdateTable updateTable;

  late final _i1.ColumnUuid userId;

  _i2.AuthUserTable? _user;

  late final _i1.ColumnBool enableEmail;

  late final _i1.ColumnBool enablePush;

  late final _i1.ColumnBool enableInApp;

  _i2.AuthUserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: NotificationPreference.t.userId,
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
    enableEmail,
    enablePush,
    enableInApp,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class NotificationPreferenceInclude extends _i1.IncludeObject {
  NotificationPreferenceInclude._({_i2.AuthUserInclude? user}) {
    _user = user;
  }

  _i2.AuthUserInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table<int?> get table => NotificationPreference.t;
}

class NotificationPreferenceIncludeList extends _i1.IncludeList {
  NotificationPreferenceIncludeList._({
    _i1.WhereExpressionBuilder<NotificationPreferenceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(NotificationPreference.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => NotificationPreference.t;
}

class NotificationPreferenceRepository {
  const NotificationPreferenceRepository._();

  final attachRow = const NotificationPreferenceAttachRowRepository._();

  /// Returns a list of [NotificationPreference]s matching the given query parameters.
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
  Future<List<NotificationPreference>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<NotificationPreferenceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationPreferenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationPreferenceTable>? orderByList,
    _i1.Transaction? transaction,
    NotificationPreferenceInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<NotificationPreference>(
      where: where?.call(NotificationPreference.t),
      orderBy: orderBy?.call(NotificationPreference.t),
      orderByList: orderByList?.call(NotificationPreference.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [NotificationPreference] matching the given query parameters.
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
  Future<NotificationPreference?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<NotificationPreferenceTable>? where,
    int? offset,
    _i1.OrderByBuilder<NotificationPreferenceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationPreferenceTable>? orderByList,
    _i1.Transaction? transaction,
    NotificationPreferenceInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<NotificationPreference>(
      where: where?.call(NotificationPreference.t),
      orderBy: orderBy?.call(NotificationPreference.t),
      orderByList: orderByList?.call(NotificationPreference.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [NotificationPreference] by its [id] or null if no such row exists.
  Future<NotificationPreference?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    NotificationPreferenceInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<NotificationPreference>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [NotificationPreference]s in the list and returns the inserted rows.
  ///
  /// The returned [NotificationPreference]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<NotificationPreference>> insert(
    _i1.DatabaseSession session,
    List<NotificationPreference> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<NotificationPreference>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [NotificationPreference] and returns the inserted row.
  ///
  /// The returned [NotificationPreference] will have its `id` field set.
  Future<NotificationPreference> insertRow(
    _i1.DatabaseSession session,
    NotificationPreference row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<NotificationPreference>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [NotificationPreference]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<NotificationPreference>> update(
    _i1.DatabaseSession session,
    List<NotificationPreference> rows, {
    _i1.ColumnSelections<NotificationPreferenceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<NotificationPreference>(
      rows,
      columns: columns?.call(NotificationPreference.t),
      transaction: transaction,
    );
  }

  /// Updates a single [NotificationPreference]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<NotificationPreference> updateRow(
    _i1.DatabaseSession session,
    NotificationPreference row, {
    _i1.ColumnSelections<NotificationPreferenceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<NotificationPreference>(
      row,
      columns: columns?.call(NotificationPreference.t),
      transaction: transaction,
    );
  }

  /// Updates a single [NotificationPreference] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<NotificationPreference?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<NotificationPreferenceUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<NotificationPreference>(
      id,
      columnValues: columnValues(NotificationPreference.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [NotificationPreference]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<NotificationPreference>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<NotificationPreferenceUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<NotificationPreferenceTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationPreferenceTable>? orderBy,
    _i1.OrderByListBuilder<NotificationPreferenceTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<NotificationPreference>(
      columnValues: columnValues(NotificationPreference.t.updateTable),
      where: where(NotificationPreference.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NotificationPreference.t),
      orderByList: orderByList?.call(NotificationPreference.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [NotificationPreference]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<NotificationPreference>> delete(
    _i1.DatabaseSession session,
    List<NotificationPreference> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<NotificationPreference>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [NotificationPreference].
  Future<NotificationPreference> deleteRow(
    _i1.DatabaseSession session,
    NotificationPreference row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<NotificationPreference>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<NotificationPreference>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<NotificationPreferenceTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<NotificationPreference>(
      where: where(NotificationPreference.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<NotificationPreferenceTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<NotificationPreference>(
      where: where?.call(NotificationPreference.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [NotificationPreference] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<NotificationPreferenceTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<NotificationPreference>(
      where: where(NotificationPreference.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class NotificationPreferenceAttachRowRepository {
  const NotificationPreferenceAttachRowRepository._();

  /// Creates a relation between the given [NotificationPreference] and [AuthUser]
  /// by setting the [NotificationPreference]'s foreign key `userId` to refer to the [AuthUser].
  Future<void> user(
    _i1.DatabaseSession session,
    NotificationPreference notificationPreference,
    _i2.AuthUser user, {
    _i1.Transaction? transaction,
  }) async {
    if (notificationPreference.id == null) {
      throw ArgumentError.notNull('notificationPreference.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $notificationPreference = notificationPreference.copyWith(
      userId: user.id,
    );
    await session.db.updateRow<NotificationPreference>(
      $notificationPreference,
      columns: [NotificationPreference.t.userId],
      transaction: transaction,
    );
  }
}
