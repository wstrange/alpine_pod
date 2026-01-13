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

abstract class EventDocument
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  EventDocument._({
    this.id,
    this.eventId,
    required this.url,
    this.type,
    this.name,
    this.uploadedAt,
  });

  factory EventDocument({
    int? id,
    int? eventId,
    required String url,
    String? type,
    String? name,
    DateTime? uploadedAt,
  }) = _EventDocumentImpl;

  factory EventDocument.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventDocument(
      id: jsonSerialization['id'] as int?,
      eventId: jsonSerialization['eventId'] as int?,
      url: jsonSerialization['url'] as String,
      type: jsonSerialization['type'] as String?,
      name: jsonSerialization['name'] as String?,
      uploadedAt: jsonSerialization['uploadedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['uploadedAt']),
    );
  }

  static final t = EventDocumentTable();

  static const db = EventDocumentRepository._();

  @override
  int? id;

  int? eventId;

  String url;

  String? type;

  String? name;

  DateTime? uploadedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [EventDocument]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EventDocument copyWith({
    int? id,
    int? eventId,
    String? url,
    String? type,
    String? name,
    DateTime? uploadedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventDocument',
      if (id != null) 'id': id,
      if (eventId != null) 'eventId': eventId,
      'url': url,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (uploadedAt != null) 'uploadedAt': uploadedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EventDocument',
      if (id != null) 'id': id,
      if (eventId != null) 'eventId': eventId,
      'url': url,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (uploadedAt != null) 'uploadedAt': uploadedAt?.toJson(),
    };
  }

  static EventDocumentInclude include() {
    return EventDocumentInclude._();
  }

  static EventDocumentIncludeList includeList({
    _i1.WhereExpressionBuilder<EventDocumentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventDocumentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventDocumentTable>? orderByList,
    EventDocumentInclude? include,
  }) {
    return EventDocumentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventDocument.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(EventDocument.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventDocumentImpl extends EventDocument {
  _EventDocumentImpl({
    int? id,
    int? eventId,
    required String url,
    String? type,
    String? name,
    DateTime? uploadedAt,
  }) : super._(
         id: id,
         eventId: eventId,
         url: url,
         type: type,
         name: name,
         uploadedAt: uploadedAt,
       );

  /// Returns a shallow copy of this [EventDocument]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventDocument copyWith({
    Object? id = _Undefined,
    Object? eventId = _Undefined,
    String? url,
    Object? type = _Undefined,
    Object? name = _Undefined,
    Object? uploadedAt = _Undefined,
  }) {
    return EventDocument(
      id: id is int? ? id : this.id,
      eventId: eventId is int? ? eventId : this.eventId,
      url: url ?? this.url,
      type: type is String? ? type : this.type,
      name: name is String? ? name : this.name,
      uploadedAt: uploadedAt is DateTime? ? uploadedAt : this.uploadedAt,
    );
  }
}

class EventDocumentUpdateTable extends _i1.UpdateTable<EventDocumentTable> {
  EventDocumentUpdateTable(super.table);

  _i1.ColumnValue<int, int> eventId(int? value) => _i1.ColumnValue(
    table.eventId,
    value,
  );

  _i1.ColumnValue<String, String> url(String value) => _i1.ColumnValue(
    table.url,
    value,
  );

  _i1.ColumnValue<String, String> type(String? value) => _i1.ColumnValue(
    table.type,
    value,
  );

  _i1.ColumnValue<String, String> name(String? value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> uploadedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.uploadedAt,
        value,
      );
}

class EventDocumentTable extends _i1.Table<int?> {
  EventDocumentTable({super.tableRelation})
    : super(tableName: 'event_documents') {
    updateTable = EventDocumentUpdateTable(this);
    eventId = _i1.ColumnInt(
      'eventId',
      this,
    );
    url = _i1.ColumnString(
      'url',
      this,
    );
    type = _i1.ColumnString(
      'type',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    uploadedAt = _i1.ColumnDateTime(
      'uploadedAt',
      this,
    );
  }

  late final EventDocumentUpdateTable updateTable;

  late final _i1.ColumnInt eventId;

  late final _i1.ColumnString url;

  late final _i1.ColumnString type;

  late final _i1.ColumnString name;

  late final _i1.ColumnDateTime uploadedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    eventId,
    url,
    type,
    name,
    uploadedAt,
  ];
}

class EventDocumentInclude extends _i1.IncludeObject {
  EventDocumentInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => EventDocument.t;
}

class EventDocumentIncludeList extends _i1.IncludeList {
  EventDocumentIncludeList._({
    _i1.WhereExpressionBuilder<EventDocumentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EventDocument.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => EventDocument.t;
}

class EventDocumentRepository {
  const EventDocumentRepository._();

  /// Returns a list of [EventDocument]s matching the given query parameters.
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
  Future<List<EventDocument>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventDocumentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventDocumentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventDocumentTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EventDocument>(
      where: where?.call(EventDocument.t),
      orderBy: orderBy?.call(EventDocument.t),
      orderByList: orderByList?.call(EventDocument.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [EventDocument] matching the given query parameters.
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
  Future<EventDocument?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventDocumentTable>? where,
    int? offset,
    _i1.OrderByBuilder<EventDocumentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventDocumentTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<EventDocument>(
      where: where?.call(EventDocument.t),
      orderBy: orderBy?.call(EventDocument.t),
      orderByList: orderByList?.call(EventDocument.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [EventDocument] by its [id] or null if no such row exists.
  Future<EventDocument?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<EventDocument>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [EventDocument]s in the list and returns the inserted rows.
  ///
  /// The returned [EventDocument]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<EventDocument>> insert(
    _i1.Session session,
    List<EventDocument> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<EventDocument>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [EventDocument] and returns the inserted row.
  ///
  /// The returned [EventDocument] will have its `id` field set.
  Future<EventDocument> insertRow(
    _i1.Session session,
    EventDocument row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<EventDocument>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [EventDocument]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<EventDocument>> update(
    _i1.Session session,
    List<EventDocument> rows, {
    _i1.ColumnSelections<EventDocumentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<EventDocument>(
      rows,
      columns: columns?.call(EventDocument.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EventDocument]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EventDocument> updateRow(
    _i1.Session session,
    EventDocument row, {
    _i1.ColumnSelections<EventDocumentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<EventDocument>(
      row,
      columns: columns?.call(EventDocument.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EventDocument] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<EventDocument?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<EventDocumentUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<EventDocument>(
      id,
      columnValues: columnValues(EventDocument.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [EventDocument]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<EventDocument>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<EventDocumentUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<EventDocumentTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventDocumentTable>? orderBy,
    _i1.OrderByListBuilder<EventDocumentTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<EventDocument>(
      columnValues: columnValues(EventDocument.t.updateTable),
      where: where(EventDocument.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventDocument.t),
      orderByList: orderByList?.call(EventDocument.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [EventDocument]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<EventDocument>> delete(
    _i1.Session session,
    List<EventDocument> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EventDocument>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [EventDocument].
  Future<EventDocument> deleteRow(
    _i1.Session session,
    EventDocument row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EventDocument>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<EventDocument>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EventDocumentTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<EventDocument>(
      where: where(EventDocument.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventDocumentTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EventDocument>(
      where: where?.call(EventDocument.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
