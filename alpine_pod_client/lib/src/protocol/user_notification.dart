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

import 'package:alpine_pod_client/src/protocol/protocol.dart' as _iib3gdw5;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'package:serverpod_database/serverpod_database.dart' as _isd;
import 'notification.dart' as _irt10kca;

abstract class UserNotification
    implements _isd.TableRow<_isc.UuidValue>, _isc.ProtocolSerialization {
  UserNotification._({
    _isc.UuidValue? id,
    required this.userId,
    required this.notificationId,
    this.notification,
    bool? isRead,
    bool? isSeen,
    this.readAt,
    required this.createdAt,
    DateTime? updatedAt,
  }) : id = id ?? const _isc.Uuid().v7obj(),
       isRead = isRead ?? false,
       isSeen = isSeen ?? false,
       updatedAt = updatedAt ?? DateTime.now();

  factory UserNotification({
    _isc.UuidValue? id,
    required _isc.UuidValue userId,
    required _isc.UuidValue notificationId,
    _irt10kca.Notification? notification,
    bool? isRead,
    bool? isSeen,
    DateTime? readAt,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _UserNotificationImpl;

  factory UserNotification.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserNotification(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _isc.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      notificationId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['notificationId'],
      ),
      notification: jsonSerialization['notification'] == null
          ? null
          : _iib3gdw5.Protocol().deserialize<_irt10kca.Notification>(
              jsonSerialization['notification'],
            ),
      isRead: jsonSerialization['isRead'] == null
          ? null
          : _isc.BoolJsonExtension.fromJson(jsonSerialization['isRead']),
      isSeen: jsonSerialization['isSeen'] == null
          ? null
          : _isc.BoolJsonExtension.fromJson(jsonSerialization['isSeen']),
      readAt: jsonSerialization['readAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['readAt']),
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = UserNotificationTable();

  static const db = UserNotificationRepository._();

  @override
  _isc.UuidValue id;

  _isc.UuidValue userId;

  _isc.UuidValue notificationId;

  _irt10kca.Notification? notification;

  bool isRead;

  bool isSeen;

  DateTime? readAt;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _isd.Table<_isc.UuidValue> get table => t;

  /// Returns a shallow copy of this [UserNotification]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  UserNotification copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? userId,
    _isc.UuidValue? notificationId,
    _irt10kca.Notification? notification,
    bool? isRead,
    bool? isSeen,
    DateTime? readAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserNotification',
      'id': id.toJson(),
      'userId': userId.toJson(),
      'notificationId': notificationId.toJson(),
      if (notification != null) 'notification': notification?.toJson(),
      'isRead': isRead,
      'isSeen': isSeen,
      if (readAt != null) 'readAt': readAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserNotification',
      'id': id.toJson(),
      'userId': userId.toJson(),
      'notificationId': notificationId.toJson(),
      if (notification != null)
        'notification': notification?.toJsonForProtocol(),
      'isRead': isRead,
      'isSeen': isSeen,
      if (readAt != null) 'readAt': readAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static UserNotificationInclude include({
    _irt10kca.NotificationInclude? notification,
  }) {
    return UserNotificationInclude._(notification: notification);
  }

  static UserNotificationIncludeList includeList({
    _isd.WhereExpressionBuilder<UserNotificationTable>? where,
    int? limit,
    int? offset,
    _isd.OrderByBuilder<UserNotificationTable>? orderBy,
    _isd.OrderByListBuilder<UserNotificationTable>? orderByList,
    UserNotificationInclude? include,
  }) {
    return UserNotificationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserNotification.t),
      orderByList: orderByList?.call(UserNotification.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserNotificationImpl extends UserNotification {
  _UserNotificationImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue userId,
    required _isc.UuidValue notificationId,
    _irt10kca.Notification? notification,
    bool? isRead,
    bool? isSeen,
    DateTime? readAt,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         notificationId: notificationId,
         notification: notification,
         isRead: isRead,
         isSeen: isSeen,
         readAt: readAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [UserNotification]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  UserNotification copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? userId,
    _isc.UuidValue? notificationId,
    Object? notification = _Undefined,
    bool? isRead,
    bool? isSeen,
    Object? readAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserNotification(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      notificationId: notificationId ?? this.notificationId,
      notification: notification is _irt10kca.Notification?
          ? notification
          : this.notification?.copyWith(),
      isRead: isRead ?? this.isRead,
      isSeen: isSeen ?? this.isSeen,
      readAt: readAt is DateTime? ? readAt : this.readAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class UserNotificationUpdateTable
    extends _isd.UpdateTable<UserNotificationTable> {
  UserNotificationUpdateTable(super.table);

  _isd.ColumnValue<_isc.UuidValue, _isc.UuidValue> userId(
    _isc.UuidValue value,
  ) => _isd.ColumnValue(table.userId, value);

  _isd.ColumnValue<_isc.UuidValue, _isc.UuidValue> notificationId(
    _isc.UuidValue value,
  ) => _isd.ColumnValue(table.notificationId, value);

  _isd.ColumnValue<bool, bool> isRead(bool value) =>
      _isd.ColumnValue(table.isRead, value);

  _isd.ColumnValue<bool, bool> isSeen(bool value) =>
      _isd.ColumnValue(table.isSeen, value);

  _isd.ColumnValue<DateTime, DateTime> readAt(DateTime? value) =>
      _isd.ColumnValue(table.readAt, value);

  _isd.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _isd.ColumnValue(table.createdAt, value);

  _isd.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _isd.ColumnValue(table.updatedAt, value);
}

class UserNotificationTable extends _isd.Table<_isc.UuidValue> {
  UserNotificationTable({super.tableRelation})
    : super(tableName: 'user_notification') {
    updateTable = UserNotificationUpdateTable(this);
    userId = _isd.ColumnUuid('userId', this);
    notificationId = _isd.ColumnUuid('notificationId', this);
    isRead = _isd.ColumnBool('isRead', this, hasDefault: true);
    isSeen = _isd.ColumnBool('isSeen', this, hasDefault: true);
    readAt = _isd.ColumnDateTime('readAt', this);
    createdAt = _isd.ColumnDateTime('createdAt', this);
    updatedAt = _isd.ColumnDateTime('updatedAt', this, hasDefault: true);
  }

  late final UserNotificationUpdateTable updateTable;

  late final _isd.ColumnUuid userId;

  late final _isd.ColumnUuid notificationId;

  _irt10kca.NotificationTable? _notification;

  late final _isd.ColumnBool isRead;

  late final _isd.ColumnBool isSeen;

  late final _isd.ColumnDateTime readAt;

  late final _isd.ColumnDateTime createdAt;

  late final _isd.ColumnDateTime updatedAt;

  _irt10kca.NotificationTable get notification {
    if (_notification != null) return _notification!;
    _notification = _isd.createRelationTable(
      relationFieldName: 'notification',
      field: UserNotification.t.notificationId,
      foreignField: _irt10kca.Notification.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _irt10kca.NotificationTable(tableRelation: foreignTableRelation),
    );
    return _notification!;
  }

  @override
  List<_isd.Column> get columns => [
    id,
    userId,
    notificationId,
    isRead,
    isSeen,
    readAt,
    createdAt,
    updatedAt,
  ];

  @override
  _isd.Table? getRelationTable(String relationField) {
    if (relationField == 'notification') {
      return notification;
    }
    return null;
  }
}

class UserNotificationInclude extends _isd.IncludeObject {
  UserNotificationInclude._({_irt10kca.NotificationInclude? notification}) {
    _notification = notification;
  }

  _irt10kca.NotificationInclude? _notification;

  @override
  Map<String, _isd.Include?> get includes => {'notification': _notification};

  @override
  _isd.Table<_isc.UuidValue> get table => UserNotification.t;
}

class UserNotificationIncludeList extends _isd.IncludeList {
  UserNotificationIncludeList._({
    _isd.WhereExpressionBuilder<UserNotificationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserNotification.t);
  }

  @override
  Map<String, _isd.Include?> get includes => include?.includes ?? {};

  @override
  _isd.Table<_isc.UuidValue> get table => UserNotification.t;
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
    _isd.DatabaseSession session, {
    _isd.WhereExpressionBuilder<UserNotificationTable>? where,
    int? limit,
    int? offset,
    _isd.OrderByBuilder<UserNotificationTable>? orderBy,
    _isd.OrderByListBuilder<UserNotificationTable>? orderByList,
    _isd.Transaction? transaction,
    UserNotificationInclude? include,
    _isd.LockMode? lockMode,
    _isd.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<UserNotification>(
      where: where?.call(UserNotification.t),
      orderBy: orderBy?.call(UserNotification.t),
      orderByList: orderByList?.call(UserNotification.t),
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
    _isd.DatabaseSession session, {
    _isd.WhereExpressionBuilder<UserNotificationTable>? where,
    int? offset,
    _isd.OrderByBuilder<UserNotificationTable>? orderBy,
    _isd.OrderByListBuilder<UserNotificationTable>? orderByList,
    _isd.Transaction? transaction,
    UserNotificationInclude? include,
    _isd.LockMode? lockMode,
    _isd.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<UserNotification>(
      where: where?.call(UserNotification.t),
      orderBy: orderBy?.call(UserNotification.t),
      orderByList: orderByList?.call(UserNotification.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [UserNotification] by its [id] or null if no such row exists.
  Future<UserNotification?> findById(
    _isd.DatabaseSession session,
    _isc.UuidValue id, {
    _isd.Transaction? transaction,
    UserNotificationInclude? include,
    _isd.LockMode? lockMode,
    _isd.LockBehavior? lockBehavior,
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
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserNotification>> insert(
    _isd.DatabaseSession session,
    List<UserNotification> rows, {
    _isd.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<UserNotification>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [UserNotification] and returns the inserted row.
  ///
  /// The returned [UserNotification] will have its `id` field set.
  Future<UserNotification> insertRow(
    _isd.DatabaseSession session,
    UserNotification row, {
    _isd.Transaction? transaction,
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
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserNotification>> upsert(
    _isd.DatabaseSession session,
    List<UserNotification> rows, {
    required _isd.ColumnSelections<UserNotificationTable> conflictColumns,
    _isd.ColumnSelections<UserNotificationTable>? updateColumns,
    _isd.WhereExpressionBuilder<UserNotificationTable>? updateWhere,
    _isd.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<UserNotification>(
      rows,
      conflictColumns: conflictColumns(UserNotification.t),
      updateColumns: updateColumns?.call(UserNotification.t),
      updateWhere: updateWhere?.call(UserNotification.t),
      transaction: transaction,
      noReturn: noReturn,
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
    _isd.DatabaseSession session,
    UserNotification row, {
    required _isd.ColumnSelections<UserNotificationTable> conflictColumns,
    _isd.ColumnSelections<UserNotificationTable>? updateColumns,
    _isd.WhereExpressionBuilder<UserNotificationTable>? updateWhere,
    _isd.Transaction? transaction,
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
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserNotification>> update(
    _isd.DatabaseSession session,
    List<UserNotification> rows, {
    _isd.ColumnSelections<UserNotificationTable>? columns,
    _isd.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<UserNotification>(
      rows,
      columns: columns?.call(UserNotification.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [UserNotification]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<UserNotification> updateRow(
    _isd.DatabaseSession session,
    UserNotification row, {
    _isd.ColumnSelections<UserNotificationTable>? columns,
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session,
    _isc.UuidValue id, {
    required _isd.ColumnValueListBuilder<UserNotificationUpdateTable>
    columnValues,
    _isd.Transaction? transaction,
  }) async {
    return session.db.updateById<UserNotification>(
      id,
      columnValues: columnValues(UserNotification.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [UserNotification]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserNotification>> updateWhere(
    _isd.DatabaseSession session, {
    required _isd.ColumnValueListBuilder<UserNotificationUpdateTable>
    columnValues,
    required _isd.WhereExpressionBuilder<UserNotificationTable> where,
    int? limit,
    int? offset,
    _isd.OrderByBuilder<UserNotificationTable>? orderBy,
    _isd.OrderByListBuilder<UserNotificationTable>? orderByList,
    _isd.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<UserNotification>(
      columnValues: columnValues(UserNotification.t.updateTable),
      where: where(UserNotification.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserNotification.t),
      orderByList: orderByList?.call(UserNotification.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [UserNotification]s in the list and returns the deleted rows.
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
  Future<List<UserNotification>> delete(
    _isd.DatabaseSession session,
    List<UserNotification> rows, {
    _isd.OrderByBuilder<UserNotificationTable>? orderBy,
    _isd.OrderByListBuilder<UserNotificationTable>? orderByList,
    _isd.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<UserNotification>(
      rows,
      orderBy: orderBy?.call(UserNotification.t),
      orderByList: orderByList?.call(UserNotification.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [UserNotification].
  Future<UserNotification> deleteRow(
    _isd.DatabaseSession session,
    UserNotification row, {
    _isd.Transaction? transaction,
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
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<UserNotification>> deleteWhere(
    _isd.DatabaseSession session, {
    required _isd.WhereExpressionBuilder<UserNotificationTable> where,
    _isd.OrderByBuilder<UserNotificationTable>? orderBy,
    _isd.OrderByListBuilder<UserNotificationTable>? orderByList,
    _isd.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<UserNotification>(
      where: where(UserNotification.t),
      orderBy: orderBy?.call(UserNotification.t),
      orderByList: orderByList?.call(UserNotification.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _isd.DatabaseSession session, {
    _isd.WhereExpressionBuilder<UserNotificationTable>? where,
    int? limit,
    _isd.Transaction? transaction,
  }) async {
    return session.db.count<UserNotification>(
      where: where?.call(UserNotification.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [UserNotification] rows matching the [where] expression.
  Future<void> lockRows(
    _isd.DatabaseSession session, {
    required _isd.WhereExpressionBuilder<UserNotificationTable> where,
    required _isd.LockMode lockMode,
    required _isd.Transaction transaction,
    _isd.LockBehavior lockBehavior = _isd.LockBehavior.wait,
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

  /// Creates a relation between the given [UserNotification] and [Notification]
  /// by setting the [UserNotification]'s foreign key `notificationId` to refer to the [Notification].
  Future<void> notification(
    _isd.DatabaseSession session,
    UserNotification userNotification,
    _irt10kca.Notification notification, {
    _isd.Transaction? transaction,
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
