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

abstract class EventTemplate
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  EventTemplate._({
    this.id,
    required this.name,
    required this.description,
    required this.content,
    String? language,
  }) : language = language ?? 'en';

  factory EventTemplate({
    int? id,
    required String name,
    required String description,
    required String content,
    String? language,
  }) = _EventTemplateImpl;

  factory EventTemplate.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventTemplate(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      content: jsonSerialization['content'] as String,
      language: jsonSerialization['language'] as String?,
    );
  }

  static final t = EventTemplateTable();

  static const db = EventTemplateRepository._();

  @override
  int? id;

  String name;

  String description;

  String content;

  String language;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [EventTemplate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EventTemplate copyWith({
    int? id,
    String? name,
    String? description,
    String? content,
    String? language,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventTemplate',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'content': content,
      'language': language,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EventTemplate',
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'content': content,
      'language': language,
    };
  }

  static EventTemplateInclude include() {
    return EventTemplateInclude._();
  }

  static EventTemplateIncludeList includeList({
    _i1.WhereExpressionBuilder<EventTemplateTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventTemplateTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTemplateTable>? orderByList,
    EventTemplateInclude? include,
  }) {
    return EventTemplateIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventTemplate.t),
      orderDescending: // ignore: deprecated_member_use_from_same_package
          orderDescending,
      orderByList: orderByList?.call(EventTemplate.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventTemplateImpl extends EventTemplate {
  _EventTemplateImpl({
    int? id,
    required String name,
    required String description,
    required String content,
    String? language,
  }) : super._(
         id: id,
         name: name,
         description: description,
         content: content,
         language: language,
       );

  /// Returns a shallow copy of this [EventTemplate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventTemplate copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    String? content,
    String? language,
  }) {
    return EventTemplate(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      content: content ?? this.content,
      language: language ?? this.language,
    );
  }
}

class EventTemplateUpdateTable extends _i1.UpdateTable<EventTemplateTable> {
  EventTemplateUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> content(String value) => _i1.ColumnValue(
    table.content,
    value,
  );

  _i1.ColumnValue<String, String> language(String value) => _i1.ColumnValue(
    table.language,
    value,
  );
}

class EventTemplateTable extends _i1.Table<int?> {
  EventTemplateTable({super.tableRelation})
    : super(tableName: 'event_templates') {
    updateTable = EventTemplateUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    language = _i1.ColumnString(
      'language',
      this,
      hasDefault: true,
    );
  }

  late final EventTemplateUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnString content;

  late final _i1.ColumnString language;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    description,
    content,
    language,
  ];
}

class EventTemplateInclude extends _i1.IncludeObject {
  EventTemplateInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => EventTemplate.t;
}

class EventTemplateIncludeList extends _i1.IncludeList {
  EventTemplateIncludeList._({
    _i1.WhereExpressionBuilder<EventTemplateTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EventTemplate.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => EventTemplate.t;
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
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<EventTemplateTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventTemplateTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTemplateTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<EventTemplate>(
      where: where?.call(EventTemplate.t),
      orderBy: orderBy?.call(EventTemplate.t),
      orderByList: orderByList?.call(EventTemplate.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
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
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<EventTemplateTable>? where,
    int? offset,
    _i1.OrderByBuilder<EventTemplateTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTemplateTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<EventTemplate>(
      where: where?.call(EventTemplate.t),
      orderBy: orderBy?.call(EventTemplate.t),
      orderByList: orderByList?.call(EventTemplate.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [EventTemplate] by its [id] or null if no such row exists.
  Future<EventTemplate?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
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
  Future<List<EventTemplate>> insert(
    _i1.DatabaseSession session,
    List<EventTemplate> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<EventTemplate>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [EventTemplate] and returns the inserted row.
  ///
  /// The returned [EventTemplate] will have its `id` field set.
  Future<EventTemplate> insertRow(
    _i1.DatabaseSession session,
    EventTemplate row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<EventTemplate>(
      row,
      transaction: transaction,
    );
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
  Future<List<EventTemplate>> upsert(
    _i1.DatabaseSession session,
    List<EventTemplate> rows, {
    required _i1.ColumnSelections<EventTemplateTable> conflictColumns,
    _i1.ColumnSelections<EventTemplateTable>? updateColumns,
    _i1.WhereExpressionBuilder<EventTemplateTable>? updateWhere,
    _i1.Transaction? transaction,
  }) async {
    return session.db.upsert<EventTemplate>(
      rows,
      conflictColumns: conflictColumns(EventTemplate.t),
      updateColumns: updateColumns?.call(EventTemplate.t),
      updateWhere: updateWhere?.call(EventTemplate.t),
      transaction: transaction,
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
    _i1.DatabaseSession session,
    EventTemplate row, {
    required _i1.ColumnSelections<EventTemplateTable> conflictColumns,
    _i1.ColumnSelections<EventTemplateTable>? updateColumns,
    _i1.WhereExpressionBuilder<EventTemplateTable>? updateWhere,
    _i1.Transaction? transaction,
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
  Future<List<EventTemplate>> update(
    _i1.DatabaseSession session,
    List<EventTemplate> rows, {
    _i1.ColumnSelections<EventTemplateTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<EventTemplate>(
      rows,
      columns: columns?.call(EventTemplate.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EventTemplate]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EventTemplate> updateRow(
    _i1.DatabaseSession session,
    EventTemplate row, {
    _i1.ColumnSelections<EventTemplateTable>? columns,
    _i1.Transaction? transaction,
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
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<EventTemplateUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<EventTemplate>(
      id,
      columnValues: columnValues(EventTemplate.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [EventTemplate]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<EventTemplate>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<EventTemplateUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<EventTemplateTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventTemplateTable>? orderBy,
    _i1.OrderByListBuilder<EventTemplateTable>? orderByList,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<EventTemplate>(
      columnValues: columnValues(EventTemplate.t.updateTable),
      where: where(EventTemplate.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventTemplate.t),
      orderByList: orderByList?.call(EventTemplate.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [EventTemplate]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<EventTemplate>> delete(
    _i1.DatabaseSession session,
    List<EventTemplate> rows, {
    _i1.OrderByBuilder<EventTemplateTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTemplateTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EventTemplate>(
      rows,
      orderBy: orderBy?.call(EventTemplate.t),
      orderByList: orderByList?.call(EventTemplate.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes a single [EventTemplate].
  Future<EventTemplate> deleteRow(
    _i1.DatabaseSession session,
    EventTemplate row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EventTemplate>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  Future<List<EventTemplate>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<EventTemplateTable> where,
    _i1.OrderByBuilder<EventTemplateTable>? orderBy,
    @Deprecated('Use desc() on the orderBy column instead.')
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventTemplateTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<EventTemplate>(
      where: where(EventTemplate.t),
      orderBy: orderBy?.call(EventTemplate.t),
      orderByList: orderByList?.call(EventTemplate.t),
      orderDescending: // ignore: deprecated_member_use
          orderDescending,
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<EventTemplateTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EventTemplate>(
      where: where?.call(EventTemplate.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [EventTemplate] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<EventTemplateTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<EventTemplate>(
      where: where(EventTemplate.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
