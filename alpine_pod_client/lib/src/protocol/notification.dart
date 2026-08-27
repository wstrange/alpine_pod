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
import 'package:alpine_pod_client/src/protocol/protocol.dart' as _iib3gdw5;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'package:serverpod_database/serverpod_database.dart' as _isd;
import 'notification_template.dart' as _ikosvoxr;

abstract class Notification
    implements _isd.TableRow<_isc.UuidValue?>, _isc.ProtocolSerialization {
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
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  factory Notification({
    _isc.UuidValue? id,
    required _isc.UuidValue templateId,
    _ikosvoxr.NotificationTemplate? template,
    required Map<String, String> data,
    String? actionUrl,
    required String renderedTitle,
    required String renderedBody,
    String? renderedHtml,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _NotificationImpl;

  factory Notification.fromJson(Map<String, dynamic> jsonSerialization) {
    return Notification(
      id: jsonSerialization['id'] == null
          ? null
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      templateId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['templateId'],
      ),
      template: jsonSerialization['template'] == null
          ? null
          : _iib3gdw5.Protocol().deserialize<_ikosvoxr.NotificationTemplate>(
              jsonSerialization['template'],
            ),
      data: _iib3gdw5.Protocol().deserialize<Map<String, String>>(
        jsonSerialization['data'],
      ),
      actionUrl: jsonSerialization['actionUrl'] as String?,
      renderedTitle: jsonSerialization['renderedTitle'] as String,
      renderedBody: jsonSerialization['renderedBody'] as String,
      renderedHtml: jsonSerialization['renderedHtml'] as String?,
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = NotificationTable();

  static const db = NotificationRepository._();

  @override
  _isc.UuidValue? id;

  _isc.UuidValue templateId;

  _ikosvoxr.NotificationTemplate? template;

  Map<String, String> data;

  String? actionUrl;

  String renderedTitle;

  String renderedBody;

  String? renderedHtml;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _isd.Table<_isc.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Notification copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? templateId,
    _ikosvoxr.NotificationTemplate? template,
    Map<String, String>? data,
    String? actionUrl,
    String? renderedTitle,
    String? renderedBody,
    String? renderedHtml,
    DateTime? createdAt,
    DateTime? updatedAt,
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
      'updatedAt': updatedAt.toJson(),
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
      'updatedAt': updatedAt.toJson(),
    };
  }

  static NotificationInclude include({
    _ikosvoxr.NotificationTemplateInclude? template,
  }) {
    return NotificationInclude._(template: template);
  }

  static NotificationIncludeList includeList({
    _isd.WhereExpressionBuilder<NotificationTable>? where,
    int? limit,
    int? offset,
    _isd.OrderByBuilder<NotificationTable>? orderBy,
    _isd.OrderByListBuilder<NotificationTable>? orderByList,
    NotificationInclude? include,
  }) {
    return NotificationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NotificationImpl extends Notification {
  _NotificationImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue templateId,
    _ikosvoxr.NotificationTemplate? template,
    required Map<String, String> data,
    String? actionUrl,
    required String renderedTitle,
    required String renderedBody,
    String? renderedHtml,
    required DateTime createdAt,
    DateTime? updatedAt,
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
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Notification]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Notification copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? templateId,
    Object? template = _Undefined,
    Map<String, String>? data,
    Object? actionUrl = _Undefined,
    String? renderedTitle,
    String? renderedBody,
    Object? renderedHtml = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Notification(
      id: id is _isc.UuidValue? ? id : this.id,
      templateId: templateId ?? this.templateId,
      template: template is _ikosvoxr.NotificationTemplate?
          ? template
          : this.template?.copyWith(),
      data: data ?? this.data.map((key0, value0) => MapEntry(key0, value0)),
      actionUrl: actionUrl is String? ? actionUrl : this.actionUrl,
      renderedTitle: renderedTitle ?? this.renderedTitle,
      renderedBody: renderedBody ?? this.renderedBody,
      renderedHtml: renderedHtml is String? ? renderedHtml : this.renderedHtml,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class NotificationUpdateTable extends _isd.UpdateTable<NotificationTable> {
  NotificationUpdateTable(super.table);

  _isd.ColumnValue<_isc.UuidValue, _isc.UuidValue> templateId(
    _isc.UuidValue value,
  ) => _isd.ColumnValue(table.templateId, value);

  _isd.ColumnValue<Map<String, String>, Map<String, String>> data(
    Map<String, String> value,
  ) => _isd.ColumnValue(table.data, value);

  _isd.ColumnValue<String, String> actionUrl(String? value) =>
      _isd.ColumnValue(table.actionUrl, value);

  _isd.ColumnValue<String, String> renderedTitle(String value) =>
      _isd.ColumnValue(table.renderedTitle, value);

  _isd.ColumnValue<String, String> renderedBody(String value) =>
      _isd.ColumnValue(table.renderedBody, value);

  _isd.ColumnValue<String, String> renderedHtml(String? value) =>
      _isd.ColumnValue(table.renderedHtml, value);

  _isd.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _isd.ColumnValue(table.createdAt, value);

  _isd.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _isd.ColumnValue(table.updatedAt, value);
}

class NotificationTable extends _isd.Table<_isc.UuidValue?> {
  NotificationTable({super.tableRelation}) : super(tableName: 'notification') {
    updateTable = NotificationUpdateTable(this);
    templateId = _isd.ColumnUuid('templateId', this);
    data = _isd.ColumnSerializable<Map<String, String>>('data', this);
    actionUrl = _isd.ColumnString('actionUrl', this);
    renderedTitle = _isd.ColumnString('renderedTitle', this);
    renderedBody = _isd.ColumnString('renderedBody', this);
    renderedHtml = _isd.ColumnString('renderedHtml', this);
    createdAt = _isd.ColumnDateTime('createdAt', this);
    updatedAt = _isd.ColumnDateTime('updatedAt', this, hasDefault: true);
  }

  late final NotificationUpdateTable updateTable;

  late final _isd.ColumnUuid templateId;

  _ikosvoxr.NotificationTemplateTable? _template;

  late final _isd.ColumnSerializable<Map<String, String>> data;

  late final _isd.ColumnString actionUrl;

  late final _isd.ColumnString renderedTitle;

  late final _isd.ColumnString renderedBody;

  late final _isd.ColumnString renderedHtml;

  late final _isd.ColumnDateTime createdAt;

  late final _isd.ColumnDateTime updatedAt;

  _ikosvoxr.NotificationTemplateTable get template {
    if (_template != null) return _template!;
    _template = _isd.createRelationTable(
      relationFieldName: 'template',
      field: Notification.t.templateId,
      foreignField: _ikosvoxr.NotificationTemplate.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ikosvoxr.NotificationTemplateTable(
            tableRelation: foreignTableRelation,
          ),
    );
    return _template!;
  }

  @override
  List<_isd.Column> get columns => [
    id,
    templateId,
    data,
    actionUrl,
    renderedTitle,
    renderedBody,
    renderedHtml,
    createdAt,
    updatedAt,
  ];

  @override
  _isd.Table? getRelationTable(String relationField) {
    if (relationField == 'template') {
      return template;
    }
    return null;
  }
}

class NotificationInclude extends _isd.IncludeObject {
  NotificationInclude._({_ikosvoxr.NotificationTemplateInclude? template}) {
    _template = template;
  }

  _ikosvoxr.NotificationTemplateInclude? _template;

  @override
  Map<String, _isd.Include?> get includes => {'template': _template};

  @override
  _isd.Table<_isc.UuidValue?> get table => Notification.t;
}

class NotificationIncludeList extends _isd.IncludeList {
  NotificationIncludeList._({
    _isd.WhereExpressionBuilder<NotificationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Notification.t);
  }

  @override
  Map<String, _isd.Include?> get includes => include?.includes ?? {};

  @override
  _isd.Table<_isc.UuidValue?> get table => Notification.t;
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
    _isd.DatabaseSession session, {
    _isd.WhereExpressionBuilder<NotificationTable>? where,
    int? limit,
    int? offset,
    _isd.OrderByBuilder<NotificationTable>? orderBy,
    _isd.OrderByListBuilder<NotificationTable>? orderByList,
    _isd.Transaction? transaction,
    NotificationInclude? include,
    _isd.LockMode? lockMode,
    _isd.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Notification>(
      where: where?.call(Notification.t),
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
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
    _isd.DatabaseSession session, {
    _isd.WhereExpressionBuilder<NotificationTable>? where,
    int? offset,
    _isd.OrderByBuilder<NotificationTable>? orderBy,
    _isd.OrderByListBuilder<NotificationTable>? orderByList,
    _isd.Transaction? transaction,
    NotificationInclude? include,
    _isd.LockMode? lockMode,
    _isd.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Notification>(
      where: where?.call(Notification.t),
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Notification] by its [id] or null if no such row exists.
  Future<Notification?> findById(
    _isd.DatabaseSession session,
    _isc.UuidValue id, {
    _isd.Transaction? transaction,
    NotificationInclude? include,
    _isd.LockMode? lockMode,
    _isd.LockBehavior? lockBehavior,
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
    _isd.DatabaseSession session,
    List<Notification> rows, {
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session,
    Notification row, {
    _isd.Transaction? transaction,
  }) async {
    return session.db.insertRow<Notification>(row, transaction: transaction);
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
    _isd.DatabaseSession session,
    List<Notification> rows, {
    required _isd.ColumnSelections<NotificationTable> conflictColumns,
    _isd.ColumnSelections<NotificationTable>? updateColumns,
    _isd.WhereExpressionBuilder<NotificationTable>? updateWhere,
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session,
    Notification row, {
    required _isd.ColumnSelections<NotificationTable> conflictColumns,
    _isd.ColumnSelections<NotificationTable>? updateColumns,
    _isd.WhereExpressionBuilder<NotificationTable>? updateWhere,
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session,
    List<Notification> rows, {
    _isd.ColumnSelections<NotificationTable>? columns,
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session,
    Notification row, {
    _isd.ColumnSelections<NotificationTable>? columns,
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session,
    _isc.UuidValue id, {
    required _isd.ColumnValueListBuilder<NotificationUpdateTable> columnValues,
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session, {
    required _isd.ColumnValueListBuilder<NotificationUpdateTable> columnValues,
    required _isd.WhereExpressionBuilder<NotificationTable> where,
    int? limit,
    int? offset,
    _isd.OrderByBuilder<NotificationTable>? orderBy,
    _isd.OrderByListBuilder<NotificationTable>? orderByList,
    _isd.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Notification>(
      columnValues: columnValues(Notification.t.updateTable),
      where: where(Notification.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
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
    _isd.DatabaseSession session,
    List<Notification> rows, {
    _isd.OrderByBuilder<NotificationTable>? orderBy,
    _isd.OrderByListBuilder<NotificationTable>? orderByList,
    _isd.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Notification>(
      rows,
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Notification].
  Future<Notification> deleteRow(
    _isd.DatabaseSession session,
    Notification row, {
    _isd.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Notification>(row, transaction: transaction);
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
    _isd.DatabaseSession session, {
    required _isd.WhereExpressionBuilder<NotificationTable> where,
    _isd.OrderByBuilder<NotificationTable>? orderBy,
    _isd.OrderByListBuilder<NotificationTable>? orderByList,
    _isd.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Notification>(
      where: where(Notification.t),
      orderBy: orderBy?.call(Notification.t),
      orderByList: orderByList?.call(Notification.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _isd.DatabaseSession session, {
    _isd.WhereExpressionBuilder<NotificationTable>? where,
    int? limit,
    _isd.Transaction? transaction,
  }) async {
    return session.db.count<Notification>(
      where: where?.call(Notification.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Notification] rows matching the [where] expression.
  Future<void> lockRows(
    _isd.DatabaseSession session, {
    required _isd.WhereExpressionBuilder<NotificationTable> where,
    required _isd.LockMode lockMode,
    required _isd.Transaction transaction,
    _isd.LockBehavior lockBehavior = _isd.LockBehavior.wait,
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
    _isd.DatabaseSession session,
    Notification notification,
    _ikosvoxr.NotificationTemplate template, {
    _isd.Transaction? transaction,
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
