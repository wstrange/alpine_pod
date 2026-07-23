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
import 'notification_template.dart' as _i2;
import 'package:alpine_pod_server/src/generated/protocol.dart' as _i3;

abstract class Notification
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  Notification._({
    this.id,
    required this.templateId,
    this.template,
    required this.data,
    this.actionUrl,
    required this.renderedTitle,
    required this.renderedBody,
    this.renderedHtml,
    required this.createdAt,
  });

  factory Notification({
    _i1.UuidValue? id,
    required _i1.UuidValue templateId,
    _i2.NotificationTemplate? template,
    required Map<String, String> data,
    String? actionUrl,
    required String renderedTitle,
    required String renderedBody,
    String? renderedHtml,
    required DateTime createdAt,
  }) = _NotificationImpl;

  factory Notification.fromJson(Map<String, dynamic> jsonSerialization) {
    return Notification(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      templateId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['templateId'],
      ),
      template: jsonSerialization['template'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.NotificationTemplate>(
              jsonSerialization['template'],
            ),
      data: _i3.Protocol().deserialize<Map<String, String>>(
        jsonSerialization['data'],
      ),
      actionUrl: jsonSerialization['actionUrl'] as String?,
      renderedTitle: jsonSerialization['renderedTitle'] as String,
      renderedBody: jsonSerialization['renderedBody'] as String,
      renderedHtml: jsonSerialization['renderedHtml'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = NotificationTable();

  static const db = NotificationRepository._();

  @override
  _i1.UuidValue? id;

  _i1.UuidValue templateId;

  _i2.NotificationTemplate? template;

  Map<String, String> data;

  String? actionUrl;

  String renderedTitle;

  String renderedBody;

  String? renderedHtml;

  DateTime createdAt;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Notification copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? templateId,
    _i2.NotificationTemplate? template,
    Map<String, String>? data,
    String? actionUrl,
    String? renderedTitle,
    String? renderedBody,
    String? renderedHtml,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Notification',
      if (id != null) 'id': id?.toJson(),
      'templateId': templateId.toJson(),
      if (template != null) 'template': template?.toJson(),
      'data': data.toJson(),
      if (actionUrl != null) 'actionUrl': actionUrl,
      'renderedTitle': renderedTitle,
      'renderedBody': renderedBody,
      if (renderedHtml != null) 'renderedHtml': renderedHtml,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Notification',
      if (id != null) 'id': id?.toJson(),
      'templateId': templateId.toJson(),
      if (template != null) 'template': template?.toJsonForProtocol(),
      'data': data.toJson(),
      if (actionUrl != null) 'actionUrl': actionUrl,
      'renderedTitle': renderedTitle,
      'renderedBody': renderedBody,
      if (renderedHtml != null) 'renderedHtml': renderedHtml,
      'createdAt': createdAt.toJson(),
    };
  }

  static NotificationInclude include({
    _i2.NotificationTemplateInclude? template,
  }) {
    return NotificationInclude._(template: template);
  }

  static NotificationIncludeList includeList({
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTable>? orderByList,
    NotificationInclude? include,
  }) {
    return NotificationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Notification.t),
      orderDescending: // ignore: deprecated_member_use_from_same_package
          orderDescending,
      orderByList: orderByList?.call(Notification.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NotificationImpl extends Notification {
  _NotificationImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue templateId,
    _i2.NotificationTemplate? template,
    required Map<String, String> data,
    String? actionUrl,
    required String renderedTitle,
    required String renderedBody,
    String? renderedHtml,
    required DateTime createdAt,
  }) : super._(
         id: id,
         templateId: templateId,
         template: template,
         data: data,
         actionUrl: actionUrl,
         renderedTitle: renderedTitle,
         renderedBody: renderedBody,
         renderedHtml: renderedHtml,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Notification copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? templateId,
    Object? template = _Undefined,
    Map<String, String>? data,
    Object? actionUrl = _Undefined,
    String? renderedTitle,
    String? renderedBody,
    Object? renderedHtml = _Undefined,
    DateTime? createdAt,
  }) {
    return Notification(
      id: id is _i1.UuidValue? ? id : this.id,
      templateId: templateId ?? this.templateId,
      template: template is _i2.NotificationTemplate?
          ? template
          : this.template?.copyWith(),
      data:
          data ??
          this.data.map(
            (
              key0,
              value0,
            ) => MapEntry(
              key0,
              value0,
            ),
          ),
      actionUrl: actionUrl is String? ? actionUrl : this.actionUrl,
      renderedTitle: renderedTitle ?? this.renderedTitle,
      renderedBody: renderedBody ?? this.renderedBody,
      renderedHtml: renderedHtml is String? ? renderedHtml : this.renderedHtml,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class NotificationUpdateTable extends _i1.UpdateTable<NotificationTable> {
  NotificationUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> templateId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.templateId,
    value,
  );

  _i1.ColumnValue<Map<String, String>, Map<String, String>> data(
    Map<String, String> value,
  ) => _i1.ColumnValue(
    table.data,
    value,
  );

  _i1.ColumnValue<String, String> actionUrl(String? value) => _i1.ColumnValue(
    table.actionUrl,
    value,
  );

  _i1.ColumnValue<String, String> renderedTitle(String value) =>
      _i1.ColumnValue(
        table.renderedTitle,
        value,
      );

  _i1.ColumnValue<String, String> renderedBody(String value) => _i1.ColumnValue(
    table.renderedBody,
    value,
  );

  _i1.ColumnValue<String, String> renderedHtml(String? value) =>
      _i1.ColumnValue(
        table.renderedHtml,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class NotificationTable extends _i1.Table<_i1.UuidValue?> {
  NotificationTable({super.tableRelation}) : super(tableName: 'notification') {
    updateTable = NotificationUpdateTable(this);
    templateId = _i1.ColumnUuid(
      'templateId',
      this,
    );
    data = _i1.ColumnSerializable<Map<String, String>>(
      'data',
      this,
    );
    actionUrl = _i1.ColumnString(
      'actionUrl',
      this,
    );
    renderedTitle = _i1.ColumnString(
      'renderedTitle',
      this,
    );
    renderedBody = _i1.ColumnString(
      'renderedBody',
      this,
    );
    renderedHtml = _i1.ColumnString(
      'renderedHtml',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final NotificationUpdateTable updateTable;

  late final _i1.ColumnUuid templateId;

  _i2.NotificationTemplateTable? _template;

  late final _i1.ColumnSerializable<Map<String, String>> data;

  late final _i1.ColumnString actionUrl;

  late final _i1.ColumnString renderedTitle;

  late final _i1.ColumnString renderedBody;

  late final _i1.ColumnString renderedHtml;

  late final _i1.ColumnDateTime createdAt;

  _i2.NotificationTemplateTable get template {
    if (_template != null) return _template!;
    _template = _i1.createRelationTable(
      relationFieldName: 'template',
      field: Notification.t.templateId,
      foreignField: _i2.NotificationTemplate.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.NotificationTemplateTable(tableRelation: foreignTableRelation),
    );
    return _template!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    templateId,
    data,
    actionUrl,
    renderedTitle,
    renderedBody,
    renderedHtml,
    createdAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'template') {
      return template;
    }
    return null;
  }
}

class NotificationInclude extends _i1.IncludeObject {
  NotificationInclude._({_i2.NotificationTemplateInclude? template}) {
    _template = template;
  }

  _i2.NotificationTemplateInclude? _template;

  @override
  Map<String, _i1.Include?> get includes => {'template': _template};

  @override
  _i1.Table<_i1.UuidValue?> get table => Notification.t;
}

class NotificationIncludeList extends _i1.IncludeList {
  NotificationIncludeList._({
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Notification.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => Notification.t;
}

class NotificationRepository {
  const NotificationRepository._();

  final attachRow = const NotificationAttachRowRepository._();

  /// Returns a list of [Notification]s matching the given query parameters.
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
  Future<List<Notification>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTable>? orderByList,
    _i1.Transaction? transaction,
    NotificationInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Notification>(
      where: where?.call(Notification.t),
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
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

  /// Returns the first matching [Notification] matching the given query parameters.
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
  Future<Notification?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    int? offset,
    _i1.OrderByBuilder<NotificationTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTable>? orderByList,
    _i1.Transaction? transaction,
    NotificationInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Notification>(
      where: where?.call(Notification.t),
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Notification] by its [id] or null if no such row exists.
  Future<Notification?> findById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    NotificationInclude? include,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Notification>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Notification]s in the list and returns the inserted rows.
  ///
  /// The returned [Notification]s will have their `id` fields set.
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
  Future<List<Notification>> insert(
    _i1.DatabaseSession session,
    List<Notification> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Notification>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Notification] and returns the inserted row.
  ///
  /// The returned [Notification] will have its `id` field set.
  Future<Notification> insertRow(
    _i1.DatabaseSession session,
    Notification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Notification>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Notification]s in the list and returns the resulting rows.
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
  /// The returned [Notification]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Notification>> upsert(
    _i1.DatabaseSession session,
    List<Notification> rows, {
    required _i1.ColumnSelections<NotificationTable> conflictColumns,
    _i1.ColumnSelections<NotificationTable>? updateColumns,
    _i1.WhereExpressionBuilder<NotificationTable>? updateWhere,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Notification>(
      rows,
      conflictColumns: conflictColumns(Notification.t),
      updateColumns: updateColumns?.call(Notification.t),
      updateWhere: updateWhere?.call(Notification.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Notification] and returns the resulting row.
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
  /// The returned [Notification] will have its `id` field set.
  Future<Notification?> upsertRow(
    _i1.DatabaseSession session,
    Notification row, {
    required _i1.ColumnSelections<NotificationTable> conflictColumns,
    _i1.ColumnSelections<NotificationTable>? updateColumns,
    _i1.WhereExpressionBuilder<NotificationTable>? updateWhere,
    _i1.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Notification>(
      row,
      conflictColumns: conflictColumns(Notification.t),
      updateColumns: updateColumns?.call(Notification.t),
      updateWhere: updateWhere?.call(Notification.t),
      transaction: transaction,
    );
  }

  /// Updates all [Notification]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Notification>> update(
    _i1.DatabaseSession session,
    List<Notification> rows, {
    _i1.ColumnSelections<NotificationTable>? columns,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Notification>(
      rows,
      columns: columns?.call(Notification.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Notification]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Notification> updateRow(
    _i1.DatabaseSession session,
    Notification row, {
    _i1.ColumnSelections<NotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Notification>(
      row,
      columns: columns?.call(Notification.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Notification] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Notification?> updateById(
    _i1.DatabaseSession session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<NotificationUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Notification>(
      id,
      columnValues: columnValues(Notification.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Notification]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Notification>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<NotificationUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<NotificationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationTable>? orderBy,
    _i1.OrderByListBuilder<NotificationTable>? orderByList,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Notification>(
      columnValues: columnValues(Notification.t.updateTable),
      where: where(Notification.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Notification]s in the list and returns the deleted rows.
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
  Future<List<Notification>> delete(
    _i1.DatabaseSession session,
    List<Notification> rows, {
    _i1.OrderByBuilder<NotificationTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Notification>(
      rows,
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Notification].
  Future<Notification> deleteRow(
    _i1.DatabaseSession session,
    Notification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Notification>(
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
  Future<List<Notification>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<NotificationTable> where,
    _i1.OrderByBuilder<NotificationTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Notification>(
      where: where(Notification.t),
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<NotificationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Notification>(
      where: where?.call(Notification.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Notification] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<NotificationTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Notification>(
      where: where(Notification.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class NotificationAttachRowRepository {
  const NotificationAttachRowRepository._();

  /// Creates a relation between the given [Notification] and [NotificationTemplate]
  /// by setting the [Notification]'s foreign key `templateId` to refer to the [NotificationTemplate].
  Future<void> template(
    _i1.DatabaseSession session,
    Notification notification,
    _i2.NotificationTemplate template, {
    _i1.Transaction? transaction,
  }) async {
    if (notification.id == null) {
      throw ArgumentError.notNull('notification.id');
    }
    if (template.id == null) {
      throw ArgumentError.notNull('template.id');
    }

    var $notification = notification.copyWith(templateId: template.id);
    await session.db.updateRow<Notification>(
      $notification,
      columns: [Notification.t.templateId],
      transaction: transaction,
    );
  }
}
