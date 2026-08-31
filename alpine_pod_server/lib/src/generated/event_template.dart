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

abstract class EventTemplate
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  EventTemplate._({
    this.id,
    required this.name,
    required this.description,
    required this.content,
    String? language,
    DateTime? updatedAt,
  }) : language = language ?? 'en',
       updatedAt = updatedAt ?? DateTime.now();

  factory EventTemplate({
    _is.UuidValue? id,
    required String name,
    required String description,
    required String content,
    String? language,
    DateTime? updatedAt,
  }) = _EventTemplateImpl;

  factory EventTemplate.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventTemplate(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      content: jsonSerialization['content'] as String,
      language: jsonSerialization['language'] as String?,
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = EventTemplateTable();

  static const db = EventTemplateRepository._();

  @override
  _is.UuidValue? id;

  String name;

  String description;

  String content;

  String language;

  DateTime updatedAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [EventTemplate]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  EventTemplate copyWith({
    _is.UuidValue? id,
    String? name,
    String? description,
    String? content,
    String? language,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventTemplate',
      if (id != null) 'id': id?.toJson(),
      'name': name,
      'description': description,
      'content': content,
      'language': language,
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EventTemplate',
      if (id != null) 'id': id?.toJson(),
      'name': name,
      'description': description,
      'content': content,
      'language': language,
      'updatedAt': updatedAt.toJson(),
    };
  }

  static EventTemplateInclude include() {
    return EventTemplateInclude._();
  }

  static EventTemplateIncludeList includeList({
    _is.WhereExpressionBuilder<EventTemplateTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EventTemplateTable>? orderBy,
    _is.OrderByListBuilder<EventTemplateTable>? orderByList,
    EventTemplateInclude? include,
  }) {
    return EventTemplateIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventTemplate.t),
      orderByList: orderByList?.call(EventTemplate.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventTemplateImpl extends EventTemplate {
  _EventTemplateImpl({
    _is.UuidValue? id,
    required String name,
    required String description,
    required String content,
    String? language,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         name: name,
         description: description,
         content: content,
         language: language,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [EventTemplate]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  EventTemplate copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    String? content,
    String? language,
    DateTime? updatedAt,
  }) {
    return EventTemplate(
      id: id is _is.UuidValue? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      content: content ?? this.content,
      language: language ?? this.language,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class EventTemplateUpdateTable extends _is.UpdateTable<EventTemplateTable> {
  EventTemplateUpdateTable(super.table);

  _is.ColumnValue<String, String> name(String value) =>
      _is.ColumnValue(table.name, value);

  _is.ColumnValue<String, String> description(String value) =>
      _is.ColumnValue(table.description, value);

  _is.ColumnValue<String, String> content(String value) =>
      _is.ColumnValue(table.content, value);

  _is.ColumnValue<String, String> language(String value) =>
      _is.ColumnValue(table.language, value);

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(table.updatedAt, value);
}

class EventTemplateTable extends _is.Table<_is.UuidValue?> {
  EventTemplateTable({super.tableRelation})
    : super(tableName: 'event_templates') {
    updateTable = EventTemplateUpdateTable(this);
    name = _is.ColumnString('name', this);
    description = _is.ColumnString('description', this);
    content = _is.ColumnString('content', this);
    language = _is.ColumnString('language', this, hasDefault: true);
    updatedAt = _is.ColumnDateTime('updatedAt', this, hasDefault: true);
  }

  late final EventTemplateUpdateTable updateTable;

  late final _is.ColumnString name;

  late final _is.ColumnString description;

  late final _is.ColumnString content;

  late final _is.ColumnString language;

  late final _is.ColumnDateTime updatedAt;

  @override
  List<_is.Column> get columns => [
    id,
    name,
    description,
    content,
    language,
    updatedAt,
  ];
}

class EventTemplateInclude extends _is.IncludeObject {
  EventTemplateInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<_is.UuidValue?> get table => EventTemplate.t;
}

class EventTemplateIncludeList extends _is.IncludeList {
  EventTemplateIncludeList._({
    _is.WhereExpressionBuilder<EventTemplateTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EventTemplate.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => EventTemplate.t;
}

class EventTemplateRepository {
  const EventTemplateRepository._();

  /// Returns a list of [EventTemplate]s matching the given query parameters.
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
  Future<List<EventTemplate>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EventTemplateTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EventTemplateTable>? orderBy,
    _is.OrderByListBuilder<EventTemplateTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<EventTemplate>(
      where: where?.call(EventTemplate.t),
      orderBy: orderBy?.call(EventTemplate.t),
      orderByList: orderByList?.call(EventTemplate.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [EventTemplate] matching the given query parameters.
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
  Future<EventTemplate?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EventTemplateTable>? where,
    int? offset,
    _is.OrderByBuilder<EventTemplateTable>? orderBy,
    _is.OrderByListBuilder<EventTemplateTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<EventTemplate>(
      where: where?.call(EventTemplate.t),
      orderBy: orderBy?.call(EventTemplate.t),
      orderByList: orderByList?.call(EventTemplate.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [EventTemplate] by its [id] or null if no such row exists.
  Future<EventTemplate?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<EventTemplate>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [EventTemplate]s in the list and returns the inserted rows.
  ///
  /// The returned [EventTemplate]s will have their `id` fields set.
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
  Future<List<EventTemplate>> insert(
    _is.DatabaseSession session,
    List<EventTemplate> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<EventTemplate>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [EventTemplate] and returns the inserted row.
  ///
  /// The returned [EventTemplate] will have its `id` field set.
  Future<EventTemplate> insertRow(
    _is.DatabaseSession session,
    EventTemplate row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<EventTemplate>(row, transaction: transaction);
  }

  /// Upserts all [EventTemplate]s in the list and returns the resulting rows.
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
  /// The returned [EventTemplate]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EventTemplate>> upsert(
    _is.DatabaseSession session,
    List<EventTemplate> rows, {
    required _is.ColumnSelections<EventTemplateTable> conflictColumns,
    _is.ColumnSelections<EventTemplateTable>? updateColumns,
    _is.WhereExpressionBuilder<EventTemplateTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<EventTemplate>(
      rows,
      conflictColumns: conflictColumns(EventTemplate.t),
      updateColumns: updateColumns?.call(EventTemplate.t),
      updateWhere: updateWhere?.call(EventTemplate.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [EventTemplate] and returns the resulting row.
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
  /// The returned [EventTemplate] will have its `id` field set.
  Future<EventTemplate?> upsertRow(
    _is.DatabaseSession session,
    EventTemplate row, {
    required _is.ColumnSelections<EventTemplateTable> conflictColumns,
    _is.ColumnSelections<EventTemplateTable>? updateColumns,
    _is.WhereExpressionBuilder<EventTemplateTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<EventTemplate>(
      row,
      conflictColumns: conflictColumns(EventTemplate.t),
      updateColumns: updateColumns?.call(EventTemplate.t),
      updateWhere: updateWhere?.call(EventTemplate.t),
      transaction: transaction,
    );
  }

  /// Updates all [EventTemplate]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EventTemplate>> update(
    _is.DatabaseSession session,
    List<EventTemplate> rows, {
    _is.ColumnSelections<EventTemplateTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<EventTemplate>(
      rows,
      columns: columns?.call(EventTemplate.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [EventTemplate]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EventTemplate> updateRow(
    _is.DatabaseSession session,
    EventTemplate row, {
    _is.ColumnSelections<EventTemplateTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<EventTemplate>(
      row,
      columns: columns?.call(EventTemplate.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EventTemplate] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<EventTemplate?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<EventTemplateUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<EventTemplate>(
      id,
      columnValues: columnValues(EventTemplate.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [EventTemplate]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EventTemplate>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<EventTemplateUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<EventTemplateTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<EventTemplateTable>? orderBy,
    _is.OrderByListBuilder<EventTemplateTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<EventTemplate>(
      columnValues: columnValues(EventTemplate.t.updateTable),
      where: where(EventTemplate.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventTemplate.t),
      orderByList: orderByList?.call(EventTemplate.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [EventTemplate]s in the list and returns the deleted rows.
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
  Future<List<EventTemplate>> delete(
    _is.DatabaseSession session,
    List<EventTemplate> rows, {
    _is.OrderByBuilder<EventTemplateTable>? orderBy,
    _is.OrderByListBuilder<EventTemplateTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<EventTemplate>(
      rows,
      orderBy: orderBy?.call(EventTemplate.t),
      orderByList: orderByList?.call(EventTemplate.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [EventTemplate].
  Future<EventTemplate> deleteRow(
    _is.DatabaseSession session,
    EventTemplate row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EventTemplate>(row, transaction: transaction);
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<EventTemplate>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<EventTemplateTable> where,
    _is.OrderByBuilder<EventTemplateTable>? orderBy,
    _is.OrderByListBuilder<EventTemplateTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<EventTemplate>(
      where: where(EventTemplate.t),
      orderBy: orderBy?.call(EventTemplate.t),
      orderByList: orderByList?.call(EventTemplate.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<EventTemplateTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<EventTemplate>(
      where: where?.call(EventTemplate.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [EventTemplate] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<EventTemplateTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<EventTemplate>(
      where: where(EventTemplate.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
