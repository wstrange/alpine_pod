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

abstract class NotificationTemplate
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  NotificationTemplate._({
    this.id,
    required this.name,
    required this.titleTemplate,
    required this.bodyTemplate,
    this.htmlTemplate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationTemplate({
    int? id,
    required String name,
    required String titleTemplate,
    required String bodyTemplate,
    String? htmlTemplate,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _NotificationTemplateImpl;

  factory NotificationTemplate.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return NotificationTemplate(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      titleTemplate: jsonSerialization['titleTemplate'] as String,
      bodyTemplate: jsonSerialization['bodyTemplate'] as String,
      htmlTemplate: jsonSerialization['htmlTemplate'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['updatedAt'],
      ),
    );
  }

  static final t = NotificationTemplateTable();

  static const db = NotificationTemplateRepository._();

  @override
  int? id;

  String name;

  String titleTemplate;

  String bodyTemplate;

  String? htmlTemplate;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [NotificationTemplate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  NotificationTemplate copyWith({
    int? id,
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
      if (id != null) 'id': id,
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
      if (id != null) 'id': id,
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
    _i1.WhereExpressionBuilder<NotificationTemplateTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationTemplateTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTemplateTable>? orderByList,
    NotificationTemplateInclude? include,
  }) {
    return NotificationTemplateIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NotificationTemplate.t),
      orderDescending: // ignore: deprecated_member_use_from_same_package
          orderDescending,
      orderByList: orderByList?.call(NotificationTemplate.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NotificationTemplateImpl extends NotificationTemplate {
  _NotificationTemplateImpl({
    int? id,
    required String name,
    required String titleTemplate,
    required String bodyTemplate,
    String? htmlTemplate,
    required DateTime createdAt,
    required DateTime updatedAt,
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
  @_i1.useResult
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
      id: id is int? ? id : this.id,
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
    extends _i1.UpdateTable<NotificationTemplateTable> {
  NotificationTemplateUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> titleTemplate(String value) =>
      _i1.ColumnValue(
        table.titleTemplate,
        value,
      );

  _i1.ColumnValue<String, String> bodyTemplate(String value) => _i1.ColumnValue(
    table.bodyTemplate,
    value,
  );

  _i1.ColumnValue<String, String> htmlTemplate(String? value) =>
      _i1.ColumnValue(
        table.htmlTemplate,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class NotificationTemplateTable extends _i1.Table<int?> {
  NotificationTemplateTable({super.tableRelation})
    : super(tableName: 'notification_template') {
    updateTable = NotificationTemplateUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    titleTemplate = _i1.ColumnString(
      'titleTemplate',
      this,
    );
    bodyTemplate = _i1.ColumnString(
      'bodyTemplate',
      this,
    );
    htmlTemplate = _i1.ColumnString(
      'htmlTemplate',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final NotificationTemplateUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString titleTemplate;

  late final _i1.ColumnString bodyTemplate;

  late final _i1.ColumnString htmlTemplate;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    titleTemplate,
    bodyTemplate,
    htmlTemplate,
    createdAt,
    updatedAt,
  ];
}

class NotificationTemplateInclude extends _i1.IncludeObject {
  NotificationTemplateInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => NotificationTemplate.t;
}

class NotificationTemplateIncludeList extends _i1.IncludeList {
  NotificationTemplateIncludeList._({
    _i1.WhereExpressionBuilder<NotificationTemplateTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(NotificationTemplate.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => NotificationTemplate.t;
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
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<NotificationTemplateTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationTemplateTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTemplateTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<NotificationTemplate>(
      where: where?.call(NotificationTemplate.t),
      orderBy: orderBy?.call(NotificationTemplate.t),
      orderByList: orderByList?.call(NotificationTemplate.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
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
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<NotificationTemplateTable>? where,
    int? offset,
    _i1.OrderByBuilder<NotificationTemplateTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTemplateTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<NotificationTemplate>(
      where: where?.call(NotificationTemplate.t),
      orderBy: orderBy?.call(NotificationTemplate.t),
      orderByList: orderByList?.call(NotificationTemplate.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [NotificationTemplate] by its [id] or null if no such row exists.
  Future<NotificationTemplate?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
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
    _i1.DatabaseSession session,
    List<NotificationTemplate> rows, {
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session,
    NotificationTemplate row, {
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session,
    List<NotificationTemplate> rows, {
    required _i1.ColumnSelections<NotificationTemplateTable> conflictColumns,
    _i1.ColumnSelections<NotificationTemplateTable>? updateColumns,
    _i1.WhereExpressionBuilder<NotificationTemplateTable>? updateWhere,
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session,
    NotificationTemplate row, {
    required _i1.ColumnSelections<NotificationTemplateTable> conflictColumns,
    _i1.ColumnSelections<NotificationTemplateTable>? updateColumns,
    _i1.WhereExpressionBuilder<NotificationTemplateTable>? updateWhere,
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session,
    List<NotificationTemplate> rows, {
    _i1.ColumnSelections<NotificationTemplateTable>? columns,
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session,
    NotificationTemplate row, {
    _i1.ColumnSelections<NotificationTemplateTable>? columns,
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<NotificationTemplateUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<NotificationTemplateUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<NotificationTemplateTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NotificationTemplateTable>? orderBy,
    _i1.OrderByListBuilder<NotificationTemplateTable>? orderByList,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<NotificationTemplate>(
      columnValues: columnValues(NotificationTemplate.t.updateTable),
      where: where(NotificationTemplate.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NotificationTemplate.t),
      orderByList: orderByList?.call(NotificationTemplate.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
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
    _i1.DatabaseSession session,
    List<NotificationTemplate> rows, {
    _i1.OrderByBuilder<NotificationTemplateTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTemplateTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<NotificationTemplate>(
      rows,
      orderBy: orderBy?.call(NotificationTemplate.t),
      orderByList: orderByList?.call(NotificationTemplate.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [NotificationTemplate].
  Future<NotificationTemplate> deleteRow(
    _i1.DatabaseSession session,
    NotificationTemplate row, {
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<NotificationTemplateTable> where,
    _i1.OrderByBuilder<NotificationTemplateTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<NotificationTemplateTable>? orderByList,
    _i1.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<NotificationTemplate>(
      where: where(NotificationTemplate.t),
      orderBy: orderBy?.call(NotificationTemplate.t),
      orderByList: orderByList?.call(NotificationTemplate.t),
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
    _i1.WhereExpressionBuilder<NotificationTemplateTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<NotificationTemplate>(
      where: where?.call(NotificationTemplate.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [NotificationTemplate] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<NotificationTemplateTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<NotificationTemplate>(
      where: where(NotificationTemplate.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
