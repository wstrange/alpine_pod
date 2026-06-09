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
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i2;
import 'notification.dart' as _i3;
import 'package:alpine_pod_server/src/generated/protocol.dart' as _i4;

abstract class UserNotification
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  UserNotification._({
    this.id,
    required this.userId,
    this.user,
    required this.notificationId,
    this.notification,
    bool? isRead,
    bool? isSeen,
    this.readAt,
    required this.createdAt,
  }) : isRead = isRead ?? false,
       isSeen = isSeen ?? false;

  factory UserNotification({
    int? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    required int notificationId,
    _i3.Notification? notification,
    bool? isRead,
    bool? isSeen,
    DateTime? readAt,
    required DateTime createdAt,
  }) = _UserNotificationImpl;

  factory UserNotification.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserNotification(
      id: jsonSerialization['id'] as int?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.AuthUser>(jsonSerialization['user']),
      notificationId: jsonSerialization['notificationId'] as int,
      notification: jsonSerialization['notification'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Notification>(
              jsonSerialization['notification'],
            ),
      isRead: jsonSerialization['isRead'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['isRead']),
      isSeen: jsonSerialization['isSeen'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['isSeen']),
      readAt: jsonSerialization['readAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['readAt']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = UserNotificationTable();

  static const db = UserNotificationRepository._();

  @override
  int? id;

  _i1.UuidValue userId;

  _i2.AuthUser? user;

  int notificationId;

  _i3.Notification? notification;

  bool isRead;

  bool isSeen;

  DateTime? readAt;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [UserNotification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserNotification copyWith({
    int? id,
    _i1.UuidValue? userId,
    _i2.AuthUser? user,
    int? notificationId,
    _i3.Notification? notification,
    bool? isRead,
    bool? isSeen,
    DateTime? readAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserNotification',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'notificationId': notificationId,
      if (notification != null) 'notification': notification?.toJson(),
      'isRead': isRead,
      'isSeen': isSeen,
      if (readAt != null) 'readAt': readAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserNotification',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'notificationId': notificationId,
      if (notification != null)
        'notification': notification?.toJsonForProtocol(),
      'isRead': isRead,
      'isSeen': isSeen,
      if (readAt != null) 'readAt': readAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static UserNotificationInclude include({
    _i2.AuthUserInclude? user,
    _i3.NotificationInclude? notification,
  }) {
    return UserNotificationInclude._(
      user: user,
      notification: notification,
    );
  }

  static UserNotificationIncludeList includeList({
    _i1.WhereExpressionBuilder<UserNotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserNotificationTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserNotificationTable>? orderByList,
    UserNotificationInclude? include,
  }) {
    return UserNotificationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserNotification.t),
      orderDescending: // ignore: deprecated_member_use_from_same_package
          orderDescending,
      orderByList: orderByList?.call(UserNotification.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserNotificationImpl extends UserNotification {
  _UserNotificationImpl({
    int? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    required int notificationId,
    _i3.Notification? notification,
    bool? isRead,
    bool? isSeen,
    DateTime? readAt,
    required DateTime createdAt,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         notificationId: notificationId,
         notification: notification,
         isRead: isRead,
         isSeen: isSeen,
         readAt: readAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [UserNotification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserNotification copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    int? notificationId,
    Object? notification = _Undefined,
    bool? isRead,
    bool? isSeen,
    Object? readAt = _Undefined,
    DateTime? createdAt,
  }) {
    return UserNotification(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.AuthUser? ? user : this.user?.copyWith(),
      notificationId: notificationId ?? this.notificationId,
      notification: notification is _i3.Notification?
          ? notification
          : this.notification?.copyWith(),
      isRead: isRead ?? this.isRead,
      isSeen: isSeen ?? this.isSeen,
      readAt: readAt is DateTime? ? readAt : this.readAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class UserNotificationUpdateTable
    extends _i1.UpdateTable<UserNotificationTable> {
  UserNotificationUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<int, int> notificationId(int value) => _i1.ColumnValue(
    table.notificationId,
    value,
  );

  _i1.ColumnValue<bool, bool> isRead(bool value) => _i1.ColumnValue(
    table.isRead,
    value,
  );

  _i1.ColumnValue<bool, bool> isSeen(bool value) => _i1.ColumnValue(
    table.isSeen,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> readAt(DateTime? value) =>
      _i1.ColumnValue(
        table.readAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class UserNotificationTable extends _i1.Table<int?> {
  UserNotificationTable({super.tableRelation})
    : super(tableName: 'user_notification') {
    updateTable = UserNotificationUpdateTable(this);
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    notificationId = _i1.ColumnInt(
      'notificationId',
      this,
    );
    isRead = _i1.ColumnBool(
      'isRead',
      this,
      hasDefault: true,
    );
    isSeen = _i1.ColumnBool(
      'isSeen',
      this,
      hasDefault: true,
    );
    readAt = _i1.ColumnDateTime(
      'readAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final UserNotificationUpdateTable updateTable;

  late final _i1.ColumnUuid userId;

  _i2.AuthUserTable? _user;

  late final _i1.ColumnInt notificationId;

  _i3.NotificationTable? _notification;

  late final _i1.ColumnBool isRead;

  late final _i1.ColumnBool isSeen;

  late final _i1.ColumnDateTime readAt;

  late final _i1.ColumnDateTime createdAt;

  _i2.AuthUserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: UserNotification.t.userId,
      foreignField: _i2.AuthUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AuthUserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i3.NotificationTable get notification {
    if (_notification != null) return _notification!;
    _notification = _i1.createRelationTable(
      relationFieldName: 'notification',
      field: UserNotification.t.notificationId,
      foreignField: _i3.Notification.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.NotificationTable(tableRelation: foreignTableRelation),
    );
    return _notification!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    notificationId,
    isRead,
    isSeen,
    readAt,
    createdAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'notification') {
      return notification;
    }
    return null;
  }
}

class UserNotificationInclude extends _i1.IncludeObject {
  UserNotificationInclude._({
    _i2.AuthUserInclude? user,
    _i3.NotificationInclude? notification,
  }) {
    _user = user;
    _notification = notification;
  }

  _i2.AuthUserInclude? _user;

  _i3.NotificationInclude? _notification;

  @override
  Map<String, _i1.Include?> get includes => {
    'user': _user,
    'notification': _notification,
  };

  @override
  _i1.Table<int?> get table => UserNotification.t;
}

class UserNotificationIncludeList extends _i1.IncludeList {
  UserNotificationIncludeList._({
    _i1.WhereExpressionBuilder<UserNotificationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserNotification.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => UserNotification.t;
}

class UserNotificationRepository {
  const UserNotificationRepository._();

  final attachRow = const UserNotificationAttachRowRepository._();

  /// Returns a list of [UserNotification]s matching the given query parameters.
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
  Future<List<UserNotification>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<UserNotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserNotificationTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserNotificationTable>? orderByList,
    _i1.Transaction? transaction,
    UserNotificationInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<UserNotification>(
      where: where?.call(UserNotification.t),
      orderBy: orderBy?.call(UserNotification.t),
      orderByList: orderByList?.call(UserNotification.t),
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

  /// Returns the first matching [UserNotification] matching the given query parameters.
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
  Future<UserNotification?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<UserNotificationTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserNotificationTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserNotificationTable>? orderByList,
    _i1.Transaction? transaction,
    UserNotificationInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<UserNotification>(
      where: where?.call(UserNotification.t),
      orderBy: orderBy?.call(UserNotification.t),
      orderByList: orderByList?.call(UserNotification.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [UserNotification] by its [id] or null if no such row exists.
  Future<UserNotification?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    UserNotificationInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<UserNotification>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [UserNotification]s in the list and returns the inserted rows.
  ///
  /// The returned [UserNotification]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<UserNotification>> insert(
    _i1.DatabaseSession session,
    List<UserNotification> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<UserNotification>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [UserNotification] and returns the inserted row.
  ///
  /// The returned [UserNotification] will have its `id` field set.
  Future<UserNotification> insertRow(
    _i1.DatabaseSession session,
    UserNotification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserNotification>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [UserNotification]s in the list and returns the resulting rows.
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
  /// The returned [UserNotification]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  Future<List<UserNotification>> upsert(
    _i1.DatabaseSession session,
    List<UserNotification> rows, {
    required _i1.ColumnSelections<UserNotificationTable> conflictColumns,
    _i1.ColumnSelections<UserNotificationTable>? updateColumns,
    _i1.WhereExpressionBuilder<UserNotificationTable>? updateWhere,
    _i1.Transaction? transaction,
  }) async {
    return session.db.upsert<UserNotification>(
      rows,
      conflictColumns: conflictColumns(UserNotification.t),
      updateColumns: updateColumns?.call(UserNotification.t),
      updateWhere: updateWhere?.call(UserNotification.t),
      transaction: transaction,
    );
  }

  /// Upserts a single [UserNotification] and returns the resulting row.
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
  /// The returned [UserNotification] will have its `id` field set.
  Future<UserNotification?> upsertRow(
    _i1.DatabaseSession session,
    UserNotification row, {
    required _i1.ColumnSelections<UserNotificationTable> conflictColumns,
    _i1.ColumnSelections<UserNotificationTable>? updateColumns,
    _i1.WhereExpressionBuilder<UserNotificationTable>? updateWhere,
    _i1.Transaction? transaction,
  }) async {
    return session.db.upsertRow<UserNotification>(
      row,
      conflictColumns: conflictColumns(UserNotification.t),
      updateColumns: updateColumns?.call(UserNotification.t),
      updateWhere: updateWhere?.call(UserNotification.t),
      transaction: transaction,
    );
  }

  /// Updates all [UserNotification]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<UserNotification>> update(
    _i1.DatabaseSession session,
    List<UserNotification> rows, {
    _i1.ColumnSelections<UserNotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserNotification>(
      rows,
      columns: columns?.call(UserNotification.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserNotification]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserNotification> updateRow(
    _i1.DatabaseSession session,
    UserNotification row, {
    _i1.ColumnSelections<UserNotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserNotification>(
      row,
      columns: columns?.call(UserNotification.t),
      transaction: transaction,
    );
  }

  /// Updates a single [UserNotification] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<UserNotification?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<UserNotificationUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<UserNotification>(
      id,
      columnValues: columnValues(UserNotification.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UserNotification]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<UserNotification>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<UserNotificationUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<UserNotificationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserNotificationTable>? orderBy,
    _i1.OrderByListBuilder<UserNotificationTable>? orderByList,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<UserNotification>(
      columnValues: columnValues(UserNotification.t.updateTable),
      where: where(UserNotification.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserNotification.t),
      orderByList: orderByList?.call(UserNotification.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [UserNotification]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<UserNotification>> delete(
    _i1.DatabaseSession session,
    List<UserNotification> rows, {
    _i1.OrderByBuilder<UserNotificationTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserNotificationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserNotification>(
      rows,
      orderBy: orderBy?.call(UserNotification.t),
      orderByList: orderByList?.call(UserNotification.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes a single [UserNotification].
  Future<UserNotification> deleteRow(
    _i1.DatabaseSession session,
    UserNotification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserNotification>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  Future<List<UserNotification>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<UserNotificationTable> where,
    _i1.OrderByBuilder<UserNotificationTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserNotificationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserNotification>(
      where: where(UserNotification.t),
      orderBy: orderBy?.call(UserNotification.t),
      orderByList: orderByList?.call(UserNotification.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<UserNotificationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserNotification>(
      where: where?.call(UserNotification.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [UserNotification] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<UserNotificationTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<UserNotification>(
      where: where(UserNotification.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class UserNotificationAttachRowRepository {
  const UserNotificationAttachRowRepository._();

  /// Creates a relation between the given [UserNotification] and [AuthUser]
  /// by setting the [UserNotification]'s foreign key `userId` to refer to the [AuthUser].
  Future<void> user(
    _i1.DatabaseSession session,
    UserNotification userNotification,
    _i2.AuthUser user, {
    _i1.Transaction? transaction,
  }) async {
    if (userNotification.id == null) {
      throw ArgumentError.notNull('userNotification.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $userNotification = userNotification.copyWith(userId: user.id);
    await session.db.updateRow<UserNotification>(
      $userNotification,
      columns: [UserNotification.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [UserNotification] and [Notification]
  /// by setting the [UserNotification]'s foreign key `notificationId` to refer to the [Notification].
  Future<void> notification(
    _i1.DatabaseSession session,
    UserNotification userNotification,
    _i3.Notification notification, {
    _i1.Transaction? transaction,
  }) async {
    if (userNotification.id == null) {
      throw ArgumentError.notNull('userNotification.id');
    }
    if (notification.id == null) {
      throw ArgumentError.notNull('notification.id');
    }

    var $userNotification = userNotification.copyWith(
      notificationId: notification.id,
    );
    await session.db.updateRow<UserNotification>(
      $userNotification,
      columns: [UserNotification.t.notificationId],
      transaction: transaction,
    );
  }
}
