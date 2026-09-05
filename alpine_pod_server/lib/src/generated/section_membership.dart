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
import 'package:alpine_pod_server/src/generated/protocol.dart' as _i1rm9ghy;
import 'package:serverpod/serverpod.dart' as _is;
import 'member.dart' as _i7zhj6lg;
import 'section.dart' as _ibhmj7lb;

abstract class SectionMembership
    implements _is.TableRow<_is.UuidValue?>, _is.ProtocolSerialization {
  SectionMembership._({
    this.id,
    required this.memberId,
    this.member,
    required this.sectionId,
    this.section,
    this.externalUserId,
    DateTime? syncedAt,
    this.sourceSystem,
    required this.scopes,
    DateTime? updatedAt,
  }) : syncedAt = syncedAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory SectionMembership({
    _is.UuidValue? id,
    required _is.UuidValue memberId,
    _i7zhj6lg.Member? member,
    required _is.UuidValue sectionId,
    _ibhmj7lb.Section? section,
    String? externalUserId,
    DateTime? syncedAt,
    String? sourceSystem,
    required Set<String> scopes,
    DateTime? updatedAt,
  }) = _SectionMembershipImpl;

  factory SectionMembership.fromJson(Map<String, dynamic> jsonSerialization) {
    return SectionMembership(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      memberId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['memberId'],
      ),
      member: jsonSerialization['member'] == null
          ? null
          : _i1rm9ghy.Protocol().deserialize<_i7zhj6lg.Member>(
              jsonSerialization['member'],
            ),
      sectionId: _is.UuidValueJsonExtension.fromJson(
        jsonSerialization['sectionId'],
      ),
      section: jsonSerialization['section'] == null
          ? null
          : _i1rm9ghy.Protocol().deserialize<_ibhmj7lb.Section>(
              jsonSerialization['section'],
            ),
      externalUserId: jsonSerialization['externalUserId'] as String?,
      syncedAt: jsonSerialization['syncedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['syncedAt']),
      sourceSystem: jsonSerialization['sourceSystem'] as String?,
      scopes: _i1rm9ghy.Protocol().deserialize<Set<String>>(
        jsonSerialization['scopes'],
      ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = SectionMembershipTable();

  static const db = SectionMembershipRepository._();

  @override
  _is.UuidValue? id;

  _is.UuidValue memberId;

  _i7zhj6lg.Member? member;

  _is.UuidValue sectionId;

  _ibhmj7lb.Section? section;

  String? externalUserId;

  DateTime syncedAt;

  String? sourceSystem;

  Set<String> scopes;

  DateTime updatedAt;

  @override
  _is.Table<_is.UuidValue?> get table => t;

  /// Returns a shallow copy of this [SectionMembership]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  SectionMembership copyWith({
    _is.UuidValue? id,
    _is.UuidValue? memberId,
    _i7zhj6lg.Member? member,
    _is.UuidValue? sectionId,
    _ibhmj7lb.Section? section,
    String? externalUserId,
    DateTime? syncedAt,
    String? sourceSystem,
    Set<String>? scopes,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SectionMembership',
      if (id != null) 'id': id?.toJson(),
      'memberId': memberId.toJson(),
      if (member != null) 'member': member?.toJson(),
      'sectionId': sectionId.toJson(),
      if (section != null) 'section': section?.toJson(),
      if (externalUserId != null) 'externalUserId': externalUserId,
      'syncedAt': syncedAt.toJson(),
      if (sourceSystem != null) 'sourceSystem': sourceSystem,
      'scopes': scopes.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SectionMembership',
      if (id != null) 'id': id?.toJson(),
      'memberId': memberId.toJson(),
      if (member != null) 'member': member?.toJsonForProtocol(),
      'sectionId': sectionId.toJson(),
      if (section != null) 'section': section?.toJsonForProtocol(),
      if (externalUserId != null) 'externalUserId': externalUserId,
      'syncedAt': syncedAt.toJson(),
      if (sourceSystem != null) 'sourceSystem': sourceSystem,
      'scopes': scopes.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static SectionMembershipInclude include({
    _i7zhj6lg.MemberInclude? member,
    _ibhmj7lb.SectionInclude? section,
  }) {
    return SectionMembershipInclude._(member: member, section: section);
  }

  static SectionMembershipIncludeList includeList({
    _is.WhereExpressionBuilder<SectionMembershipTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SectionMembershipTable>? orderBy,
    _is.OrderByListBuilder<SectionMembershipTable>? orderByList,
    SectionMembershipInclude? include,
  }) {
    return SectionMembershipIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SectionMembership.t),
      orderByList: orderByList?.call(SectionMembership.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SectionMembershipImpl extends SectionMembership {
  _SectionMembershipImpl({
    _is.UuidValue? id,
    required _is.UuidValue memberId,
    _i7zhj6lg.Member? member,
    required _is.UuidValue sectionId,
    _ibhmj7lb.Section? section,
    String? externalUserId,
    DateTime? syncedAt,
    String? sourceSystem,
    required Set<String> scopes,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         memberId: memberId,
         member: member,
         sectionId: sectionId,
         section: section,
         externalUserId: externalUserId,
         syncedAt: syncedAt,
         sourceSystem: sourceSystem,
         scopes: scopes,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [SectionMembership]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  SectionMembership copyWith({
    Object? id = _Undefined,
    _is.UuidValue? memberId,
    Object? member = _Undefined,
    _is.UuidValue? sectionId,
    Object? section = _Undefined,
    Object? externalUserId = _Undefined,
    DateTime? syncedAt,
    Object? sourceSystem = _Undefined,
    Set<String>? scopes,
    DateTime? updatedAt,
  }) {
    return SectionMembership(
      id: id is _is.UuidValue? ? id : this.id,
      memberId: memberId ?? this.memberId,
      member: member is _i7zhj6lg.Member? ? member : this.member?.copyWith(),
      sectionId: sectionId ?? this.sectionId,
      section: section is _ibhmj7lb.Section?
          ? section
          : this.section?.copyWith(),
      externalUserId: externalUserId is String?
          ? externalUserId
          : this.externalUserId,
      syncedAt: syncedAt ?? this.syncedAt,
      sourceSystem: sourceSystem is String? ? sourceSystem : this.sourceSystem,
      scopes: scopes ?? this.scopes.map((e0) => e0).toSet(),
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class SectionMembershipUpdateTable
    extends _is.UpdateTable<SectionMembershipTable> {
  SectionMembershipUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> memberId(_is.UuidValue value) =>
      _is.ColumnValue(table.memberId, value);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> sectionId(
    _is.UuidValue value,
  ) => _is.ColumnValue(table.sectionId, value);

  _is.ColumnValue<String, String> externalUserId(String? value) =>
      _is.ColumnValue(table.externalUserId, value);

  _is.ColumnValue<DateTime, DateTime> syncedAt(DateTime value) =>
      _is.ColumnValue(table.syncedAt, value);

  _is.ColumnValue<String, String> sourceSystem(String? value) =>
      _is.ColumnValue(table.sourceSystem, value);

  _is.ColumnValue<Set<String>, Set<String>> scopes(Set<String> value) =>
      _is.ColumnValue(table.scopes, value);

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(table.updatedAt, value);
}

class SectionMembershipTable extends _is.Table<_is.UuidValue?> {
  SectionMembershipTable({super.tableRelation})
    : super(tableName: 'section_memberships') {
    updateTable = SectionMembershipUpdateTable(this);
    memberId = _is.ColumnUuid('memberId', this);
    sectionId = _is.ColumnUuid('sectionId', this);
    externalUserId = _is.ColumnString('externalUserId', this);
    syncedAt = _is.ColumnDateTime('syncedAt', this, hasDefault: true);
    sourceSystem = _is.ColumnString('sourceSystem', this);
    scopes = _is.ColumnSerializable<Set<String>>('scopes', this);
    updatedAt = _is.ColumnDateTime('updatedAt', this, hasDefault: true);
  }

  late final SectionMembershipUpdateTable updateTable;

  late final _is.ColumnUuid memberId;

  _i7zhj6lg.MemberTable? _member;

  late final _is.ColumnUuid sectionId;

  _ibhmj7lb.SectionTable? _section;

  late final _is.ColumnString externalUserId;

  late final _is.ColumnDateTime syncedAt;

  late final _is.ColumnString sourceSystem;

  late final _is.ColumnSerializable<Set<String>> scopes;

  late final _is.ColumnDateTime updatedAt;

  _i7zhj6lg.MemberTable get member {
    if (_member != null) return _member!;
    _member = _is.createRelationTable(
      relationFieldName: 'member',
      field: SectionMembership.t.memberId,
      foreignField: _i7zhj6lg.Member.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7zhj6lg.MemberTable(tableRelation: foreignTableRelation),
    );
    return _member!;
  }

  _ibhmj7lb.SectionTable get section {
    if (_section != null) return _section!;
    _section = _is.createRelationTable(
      relationFieldName: 'section',
      field: SectionMembership.t.sectionId,
      foreignField: _ibhmj7lb.Section.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ibhmj7lb.SectionTable(tableRelation: foreignTableRelation),
    );
    return _section!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    memberId,
    sectionId,
    externalUserId,
    syncedAt,
    sourceSystem,
    scopes,
    updatedAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'member') {
      return member;
    }
    if (relationField == 'section') {
      return section;
    }
    return null;
  }
}

class SectionMembershipInclude extends _is.IncludeObject {
  SectionMembershipInclude._({
    _i7zhj6lg.MemberInclude? member,
    _ibhmj7lb.SectionInclude? section,
  }) {
    _member = member;
    _section = section;
  }

  _i7zhj6lg.MemberInclude? _member;

  _ibhmj7lb.SectionInclude? _section;

  @override
  Map<String, _is.Include?> get includes => {
    'member': _member,
    'section': _section,
  };

  @override
  _is.Table<_is.UuidValue?> get table => SectionMembership.t;
}

class SectionMembershipIncludeList extends _is.IncludeList {
  SectionMembershipIncludeList._({
    _is.WhereExpressionBuilder<SectionMembershipTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SectionMembership.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue?> get table => SectionMembership.t;
}

class SectionMembershipRepository {
  const SectionMembershipRepository._();

  final attachRow = const SectionMembershipAttachRowRepository._();

  /// Returns a list of [SectionMembership]s matching the given query parameters.
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
  Future<List<SectionMembership>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SectionMembershipTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SectionMembershipTable>? orderBy,
    _is.OrderByListBuilder<SectionMembershipTable>? orderByList,
    _is.Transaction? transaction,
    SectionMembershipInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<SectionMembership>(
      where: where?.call(SectionMembership.t),
      orderBy: orderBy?.call(SectionMembership.t),
      orderByList: orderByList?.call(SectionMembership.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [SectionMembership] matching the given query parameters.
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
  Future<SectionMembership?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SectionMembershipTable>? where,
    int? offset,
    _is.OrderByBuilder<SectionMembershipTable>? orderBy,
    _is.OrderByListBuilder<SectionMembershipTable>? orderByList,
    _is.Transaction? transaction,
    SectionMembershipInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<SectionMembership>(
      where: where?.call(SectionMembership.t),
      orderBy: orderBy?.call(SectionMembership.t),
      orderByList: orderByList?.call(SectionMembership.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [SectionMembership] by its [id] or null if no such row exists.
  Future<SectionMembership?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    SectionMembershipInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<SectionMembership>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [SectionMembership]s in the list and returns the inserted rows.
  ///
  /// The returned [SectionMembership]s will have their `id` fields set.
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
  Future<List<SectionMembership>> insert(
    _is.DatabaseSession session,
    List<SectionMembership> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<SectionMembership>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [SectionMembership] and returns the inserted row.
  ///
  /// The returned [SectionMembership] will have its `id` field set.
  Future<SectionMembership> insertRow(
    _is.DatabaseSession session,
    SectionMembership row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<SectionMembership>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [SectionMembership]s in the list and returns the resulting rows.
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
  /// The returned [SectionMembership]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SectionMembership>> upsert(
    _is.DatabaseSession session,
    List<SectionMembership> rows, {
    required _is.ColumnSelections<SectionMembershipTable> conflictColumns,
    _is.ColumnSelections<SectionMembershipTable>? updateColumns,
    _is.WhereExpressionBuilder<SectionMembershipTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<SectionMembership>(
      rows,
      conflictColumns: conflictColumns(SectionMembership.t),
      updateColumns: updateColumns?.call(SectionMembership.t),
      updateWhere: updateWhere?.call(SectionMembership.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [SectionMembership] and returns the resulting row.
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
  /// The returned [SectionMembership] will have its `id` field set.
  Future<SectionMembership?> upsertRow(
    _is.DatabaseSession session,
    SectionMembership row, {
    required _is.ColumnSelections<SectionMembershipTable> conflictColumns,
    _is.ColumnSelections<SectionMembershipTable>? updateColumns,
    _is.WhereExpressionBuilder<SectionMembershipTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<SectionMembership>(
      row,
      conflictColumns: conflictColumns(SectionMembership.t),
      updateColumns: updateColumns?.call(SectionMembership.t),
      updateWhere: updateWhere?.call(SectionMembership.t),
      transaction: transaction,
    );
  }

  /// Updates all [SectionMembership]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SectionMembership>> update(
    _is.DatabaseSession session,
    List<SectionMembership> rows, {
    _is.ColumnSelections<SectionMembershipTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<SectionMembership>(
      rows,
      columns: columns?.call(SectionMembership.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [SectionMembership]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SectionMembership> updateRow(
    _is.DatabaseSession session,
    SectionMembership row, {
    _is.ColumnSelections<SectionMembershipTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<SectionMembership>(
      row,
      columns: columns?.call(SectionMembership.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SectionMembership] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SectionMembership?> updateById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<SectionMembershipUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<SectionMembership>(
      id,
      columnValues: columnValues(SectionMembership.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SectionMembership]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<SectionMembership>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<SectionMembershipUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<SectionMembershipTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<SectionMembershipTable>? orderBy,
    _is.OrderByListBuilder<SectionMembershipTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<SectionMembership>(
      columnValues: columnValues(SectionMembership.t.updateTable),
      where: where(SectionMembership.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SectionMembership.t),
      orderByList: orderByList?.call(SectionMembership.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [SectionMembership]s in the list and returns the deleted rows.
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
  Future<List<SectionMembership>> delete(
    _is.DatabaseSession session,
    List<SectionMembership> rows, {
    _is.OrderByBuilder<SectionMembershipTable>? orderBy,
    _is.OrderByListBuilder<SectionMembershipTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<SectionMembership>(
      rows,
      orderBy: orderBy?.call(SectionMembership.t),
      orderByList: orderByList?.call(SectionMembership.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [SectionMembership].
  Future<SectionMembership> deleteRow(
    _is.DatabaseSession session,
    SectionMembership row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SectionMembership>(
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
  Future<List<SectionMembership>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SectionMembershipTable> where,
    _is.OrderByBuilder<SectionMembershipTable>? orderBy,
    _is.OrderByListBuilder<SectionMembershipTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<SectionMembership>(
      where: where(SectionMembership.t),
      orderBy: orderBy?.call(SectionMembership.t),
      orderByList: orderByList?.call(SectionMembership.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<SectionMembershipTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<SectionMembership>(
      where: where?.call(SectionMembership.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SectionMembership] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<SectionMembershipTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<SectionMembership>(
      where: where(SectionMembership.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class SectionMembershipAttachRowRepository {
  const SectionMembershipAttachRowRepository._();

  /// Creates a relation between the given [SectionMembership] and [Member]
  /// by setting the [SectionMembership]'s foreign key `memberId` to refer to the [Member].
  Future<void> member(
    _is.DatabaseSession session,
    SectionMembership sectionMembership,
    _i7zhj6lg.Member member, {
    _is.Transaction? transaction,
  }) async {
    if (sectionMembership.id == null) {
      throw ArgumentError.notNull('sectionMembership.id');
    }
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    var $sectionMembership = sectionMembership.copyWith(memberId: member.id);
    await session.db.updateRow<SectionMembership>(
      $sectionMembership,
      columns: [SectionMembership.t.memberId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [SectionMembership] and [Section]
  /// by setting the [SectionMembership]'s foreign key `sectionId` to refer to the [Section].
  Future<void> section(
    _is.DatabaseSession session,
    SectionMembership sectionMembership,
    _ibhmj7lb.Section section, {
    _is.Transaction? transaction,
  }) async {
    if (sectionMembership.id == null) {
      throw ArgumentError.notNull('sectionMembership.id');
    }
    if (section.id == null) {
      throw ArgumentError.notNull('section.id');
    }

    var $sectionMembership = sectionMembership.copyWith(sectionId: section.id);
    await session.db.updateRow<SectionMembership>(
      $sectionMembership,
      columns: [SectionMembership.t.sectionId],
      transaction: transaction,
    );
  }
}
