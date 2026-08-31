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

abstract class NotificationTemplate
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  NotificationTemplate._({
    this.id,
    required this.name,
    required this.titleTemplate,
    required this.bodyTemplate,
    this.htmlTemplate,
    required this.createdAt,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();

  factory NotificationTemplate({
    _is.UuidValue? id,
    required String name,
    required String titleTemplate,
    required String bodyTemplate,
    String? htmlTemplate,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _NotificationTemplateImpl;

  factory NotificationTemplate.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return NotificationTemplate(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      titleTemplate: jsonSerialization['titleTemplate'] as String,
      bodyTemplate: jsonSerialization['bodyTemplate'] as String,
      htmlTemplate: jsonSerialization['htmlTemplate'] as String?,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = NotificationTemplateTable();

  static const db = NotificationTemplateRepository._();

  @override
  _is.UuidValue? id;

  String name;

  String titleTemplate;

  String bodyTemplate;

  String? htmlTemplate;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [NotificationTemplate]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  NotificationTemplate copyWith({
    _is.UuidValue? id,
    String? name,
    String? titleTemplate,
    String? bodyTemplate,
    String? htmlTemplate,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'NotificationTemplate',
      if (id != null) 'id': id?.toJson(),
      'name': name,
      'titleTemplate': titleTemplate,
      'bodyTemplate': bodyTemplate,
      if (htmlTemplate != null) 'htmlTemplate': htmlTemplate,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'NotificationTemplate',
      if (id != null) 'id': id?.toJson(),
      'name': name,
      'titleTemplate': titleTemplate,
      'bodyTemplate': bodyTemplate,
      if (htmlTemplate != null) 'htmlTemplate': htmlTemplate,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static NotificationTemplateInclude include() {
    return NotificationTemplateInclude._();
  }

  static NotificationTemplateIncludeList includeList({
    _is.WhereExpressionBuilder<NotificationTemplateTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<NotificationTemplateTable>? orderBy,
    _is.OrderByListBuilder<NotificationTemplateTable>? orderByList,
    NotificationTemplateInclude? include,
  }) {
    return NotificationTemplateIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NotificationTemplate.t),
      orderByList: orderByList?.call(NotificationTemplate.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NotificationTemplateImpl extends NotificationTemplate {
  _NotificationTemplateImpl({
    _is.UuidValue? id,
    required String name,
    required String titleTemplate,
    required String bodyTemplate,
    String? htmlTemplate,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         name: name,
         titleTemplate: titleTemplate,
         bodyTemplate: bodyTemplate,
         htmlTemplate: htmlTemplate,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [NotificationTemplate]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  NotificationTemplate copyWith({
    Object? id = _Undefined,
    String? name,
    String? titleTemplate,
    String? bodyTemplate,
    Object? htmlTemplate = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return NotificationTemplate(
      id: id is _is.UuidValue? ? id : this.id,
      name: name ?? this.name,
      titleTemplate: titleTemplate ?? this.titleTemplate,
      bodyTemplate: bodyTemplate ?? this.bodyTemplate,
      htmlTemplate: htmlTemplate is String? ? htmlTemplate : this.htmlTemplate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class NotificationTemplateUpdateTable
    extends _is.UpdateTable<NotificationTemplateTable> {
  NotificationTemplateUpdateTable(super.table);

  _is.ColumnValue<String, String> name(String value) =>
      _is.ColumnValue(table.name, value);

  _is.ColumnValue<String, String> titleTemplate(String value) =>
      _is.ColumnValue(table.titleTemplate, value);

  _is.ColumnValue<String, String> bodyTemplate(String value) =>
      _is.ColumnValue(table.bodyTemplate, value);

  _is.ColumnValue<String, String> htmlTemplate(String? value) =>
      _is.ColumnValue(table.htmlTemplate, value);

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(table.createdAt, value);

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(table.updatedAt, value);
}

class NotificationTemplateTable extends _is.Table<_is.UuidValue?> {
  NotificationTemplateTable({super.tableRelation})
    : super(tableName: 'notification_template') {
    updateTable = NotificationTemplateUpdateTable(this);
    name = _is.ColumnString('name', this);
    titleTemplate = _is.ColumnString('titleTemplate', this);
    bodyTemplate = _is.ColumnString('bodyTemplate', this);
    htmlTemplate = _is.ColumnString('htmlTemplate', this);
    createdAt = _is.ColumnDateTime('createdAt', this);
    updatedAt = _is.ColumnDateTime('updatedAt', this, hasDefault: true);
  }

  late final NotificationTemplateUpdateTable updateTable;

  late final _is.ColumnString name;

  late final _is.ColumnString titleTemplate;

  late final _is.ColumnString bodyTemplate;

  late final _is.ColumnString htmlTemplate;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime updatedAt;

  @override
  List<_is.Column> get columns => [
    id,
    name,
    titleTemplate,
    bodyTemplate,
    htmlTemplate,
    createdAt,
    updatedAt,
  ];
}

class NotificationTemplateInclude extends _is.IncludeObject {
  NotificationTemplateInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<_is.UuidValue?> get table => NotificationTemplate.t;
}

class NotificationTemplateIncludeList extends _is.IncludeList {
  NotificationTemplateIncludeList._({
    _is.WhereExpressionBuilder<NotificationTemplateTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(NotificationTemplate.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => NotificationTemplate.t;
}

class NotificationTemplateRepository {
  const NotificationTemplateRepository._();

  /// Returns a list of [NotificationTemplate]s matching the given query parameters.
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
  Future<List<NotificationTemplate>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<NotificationTemplateTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<NotificationTemplateTable>? orderBy,
    _is.OrderByListBuilder<NotificationTemplateTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<NotificationTemplate>(
      where: where?.call(NotificationTemplate.t),
      orderBy: orderBy?.call(NotificationTemplate.t),
      orderByList: orderByList?.call(NotificationTemplate.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [NotificationTemplate] matching the given query parameters.
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
  Future<NotificationTemplate?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<NotificationTemplateTable>? where,
    int? offset,
    _is.OrderByBuilder<NotificationTemplateTable>? orderBy,
    _is.OrderByListBuilder<NotificationTemplateTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<NotificationTemplate>(
      where: where?.call(NotificationTemplate.t),
      orderBy: orderBy?.call(NotificationTemplate.t),
      orderByList: orderByList?.call(NotificationTemplate.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [NotificationTemplate] by its [id] or null if no such row exists.
  Future<NotificationTemplate?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<NotificationTemplate>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [NotificationTemplate]s in the list and returns the inserted rows.
  ///
  /// The returned [NotificationTemplate]s will have their `id` fields set.
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
  Future<List<NotificationTemplate>> insert(
    _is.DatabaseSession session,
    List<NotificationTemplate> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<NotificationTemplate>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [NotificationTemplate] and returns the inserted row.
  ///
  /// The returned [NotificationTemplate] will have its `id` field set.
  Future<NotificationTemplate> insertRow(
    _is.DatabaseSession session,
    NotificationTemplate row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<NotificationTemplate>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [NotificationTemplate]s in the list and returns the resulting rows.
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
  /// The returned [NotificationTemplate]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<NotificationTemplate>> upsert(
    _is.DatabaseSession session,
    List<NotificationTemplate> rows, {
    required _is.ColumnSelections<NotificationTemplateTable> conflictColumns,
    _is.ColumnSelections<NotificationTemplateTable>? updateColumns,
    _is.WhereExpressionBuilder<NotificationTemplateTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<NotificationTemplate>(
      rows,
      conflictColumns: conflictColumns(NotificationTemplate.t),
      updateColumns: updateColumns?.call(NotificationTemplate.t),
      updateWhere: updateWhere?.call(NotificationTemplate.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [NotificationTemplate] and returns the resulting row.
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
  /// The returned [NotificationTemplate] will have its `id` field set.
  Future<NotificationTemplate?> upsertRow(
    _is.DatabaseSession session,
    NotificationTemplate row, {
    required _is.ColumnSelections<NotificationTemplateTable> conflictColumns,
    _is.ColumnSelections<NotificationTemplateTable>? updateColumns,
    _is.WhereExpressionBuilder<NotificationTemplateTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<NotificationTemplate>(
      row,
      conflictColumns: conflictColumns(NotificationTemplate.t),
      updateColumns: updateColumns?.call(NotificationTemplate.t),
      updateWhere: updateWhere?.call(NotificationTemplate.t),
      transaction: transaction,
    );
  }

  /// Updates all [NotificationTemplate]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<NotificationTemplate>> update(
    _is.DatabaseSession session,
    List<NotificationTemplate> rows, {
    _is.ColumnSelections<NotificationTemplateTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<NotificationTemplate>(
      rows,
      columns: columns?.call(NotificationTemplate.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [NotificationTemplate]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<NotificationTemplate> updateRow(
    _is.DatabaseSession session,
    NotificationTemplate row, {
    _is.ColumnSelections<NotificationTemplateTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<NotificationTemplate>(
      row,
      columns: columns?.call(NotificationTemplate.t),
      transaction: transaction,
    );
  }

  /// Updates a single [NotificationTemplate] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<NotificationTemplate?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<NotificationTemplateUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<NotificationTemplate>(
      id,
      columnValues: columnValues(NotificationTemplate.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [NotificationTemplate]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<NotificationTemplate>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<NotificationTemplateUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<NotificationTemplateTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<NotificationTemplateTable>? orderBy,
    _is.OrderByListBuilder<NotificationTemplateTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<NotificationTemplate>(
      columnValues: columnValues(NotificationTemplate.t.updateTable),
      where: where(NotificationTemplate.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NotificationTemplate.t),
      orderByList: orderByList?.call(NotificationTemplate.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [NotificationTemplate]s in the list and returns the deleted rows.
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
  Future<List<NotificationTemplate>> delete(
    _is.DatabaseSession session,
    List<NotificationTemplate> rows, {
    _is.OrderByBuilder<NotificationTemplateTable>? orderBy,
    _is.OrderByListBuilder<NotificationTemplateTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<NotificationTemplate>(
      rows,
      orderBy: orderBy?.call(NotificationTemplate.t),
      orderByList: orderByList?.call(NotificationTemplate.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [NotificationTemplate].
  Future<NotificationTemplate> deleteRow(
    _is.DatabaseSession session,
    NotificationTemplate row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<NotificationTemplate>(
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
  Future<List<NotificationTemplate>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<NotificationTemplateTable> where,
    _is.OrderByBuilder<NotificationTemplateTable>? orderBy,
    _is.OrderByListBuilder<NotificationTemplateTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<NotificationTemplate>(
      where: where(NotificationTemplate.t),
      orderBy: orderBy?.call(NotificationTemplate.t),
      orderByList: orderByList?.call(NotificationTemplate.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<NotificationTemplateTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<NotificationTemplate>(
      where: where?.call(NotificationTemplate.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [NotificationTemplate] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<NotificationTemplateTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<NotificationTemplate>(
      where: where(NotificationTemplate.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
