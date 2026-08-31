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
import 'member.dart' as _i7zhj6lg;
import 'section.dart' as _ibhmj7lb;

abstract class SectionMembership
    implements _isd.TableRow<_isc.UuidValue?>, _isc.ProtocolSerialization {
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
    _isc.UuidValue? id,
    required _isc.UuidValue memberId,
    _i7zhj6lg.Member? member,
    required _isc.UuidValue sectionId,
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
          : _isc.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      memberId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['memberId'],
      ),
      member: jsonSerialization['member'] == null
          ? null
          : _iib3gdw5.Protocol().deserialize<_i7zhj6lg.Member>(
              jsonSerialization['member'],
            ),
      sectionId: _isc.UuidValueJsonExtension.fromJson(
        jsonSerialization['sectionId'],
      ),
      section: jsonSerialization['section'] == null
          ? null
          : _iib3gdw5.Protocol().deserialize<_ibhmj7lb.Section>(
              jsonSerialization['section'],
            ),
      externalUserId: jsonSerialization['externalUserId'] as String?,
      syncedAt: jsonSerialization['syncedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['syncedAt']),
      sourceSystem: jsonSerialization['sourceSystem'] as String?,
      scopes: _iib3gdw5.Protocol().deserialize<Set<String>>(
        jsonSerialization['scopes'],
      ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = SectionMembershipTable();

  static const db = SectionMembershipRepository._();

  @override
  _isc.UuidValue? id;

  _isc.UuidValue memberId;

  _i7zhj6lg.Member? member;

  _isc.UuidValue sectionId;

  _ibhmj7lb.Section? section;

  String? externalUserId;

  DateTime syncedAt;

  String? sourceSystem;

  Set<String> scopes;

  DateTime updatedAt;

  @override
  _isd.Table<_isc.UuidValue?> get table => t;

  /// Returns a shallow copy of this [SectionMembership]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  SectionMembership copyWith({
    _isc.UuidValue? id,
    _isc.UuidValue? memberId,
    _i7zhj6lg.Member? member,
    _isc.UuidValue? sectionId,
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
    _isd.WhereExpressionBuilder<SectionMembershipTable>? where,
    int? limit,
    int? offset,
    _isd.OrderByBuilder<SectionMembershipTable>? orderBy,
    _isd.OrderByListBuilder<SectionMembershipTable>? orderByList,
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
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SectionMembershipImpl extends SectionMembership {
  _SectionMembershipImpl({
    _isc.UuidValue? id,
    required _isc.UuidValue memberId,
    _i7zhj6lg.Member? member,
    required _isc.UuidValue sectionId,
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
  @_isc.useResult
  @override
  SectionMembership copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? memberId,
    Object? member = _Undefined,
    _isc.UuidValue? sectionId,
    Object? section = _Undefined,
    Object? externalUserId = _Undefined,
    DateTime? syncedAt,
    Object? sourceSystem = _Undefined,
    Set<String>? scopes,
    DateTime? updatedAt,
  }) {
    return SectionMembership(
      id: id is _isc.UuidValue? ? id : this.id,
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
    extends _isd.UpdateTable<SectionMembershipTable> {
  SectionMembershipUpdateTable(super.table);

  _isd.ColumnValue<_isc.UuidValue, _isc.UuidValue> memberId(
    _isc.UuidValue value,
  ) => _isd.ColumnValue(table.memberId, value);

  _isd.ColumnValue<_isc.UuidValue, _isc.UuidValue> sectionId(
    _isc.UuidValue value,
  ) => _isd.ColumnValue(table.sectionId, value);

  _isd.ColumnValue<String, String> externalUserId(String? value) =>
      _isd.ColumnValue(table.externalUserId, value);

  _isd.ColumnValue<DateTime, DateTime> syncedAt(DateTime value) =>
      _isd.ColumnValue(table.syncedAt, value);

  _isd.ColumnValue<String, String> sourceSystem(String? value) =>
      _isd.ColumnValue(table.sourceSystem, value);

  _isd.ColumnValue<Set<String>, Set<String>> scopes(Set<String> value) =>
      _isd.ColumnValue(table.scopes, value);

  _isd.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _isd.ColumnValue(table.updatedAt, value);
}

class SectionMembershipTable extends _isd.Table<_isc.UuidValue?> {
  SectionMembershipTable({super.tableRelation})
    : super(tableName: 'section_memberships') {
    updateTable = SectionMembershipUpdateTable(this);
    memberId = _isd.ColumnUuid('memberId', this);
    sectionId = _isd.ColumnUuid('sectionId', this);
    externalUserId = _isd.ColumnString('externalUserId', this);
    syncedAt = _isd.ColumnDateTime('syncedAt', this, hasDefault: true);
    sourceSystem = _isd.ColumnString('sourceSystem', this);
    scopes = _isd.ColumnSerializable<Set<String>>('scopes', this);
    updatedAt = _isd.ColumnDateTime('updatedAt', this, hasDefault: true);
  }

  late final SectionMembershipUpdateTable updateTable;

  late final _isd.ColumnUuid memberId;

  _i7zhj6lg.MemberTable? _member;

  late final _isd.ColumnUuid sectionId;

  _ibhmj7lb.SectionTable? _section;

  late final _isd.ColumnString externalUserId;

  late final _isd.ColumnDateTime syncedAt;

  late final _isd.ColumnString sourceSystem;

  late final _isd.ColumnSerializable<Set<String>> scopes;

  late final _isd.ColumnDateTime updatedAt;

  _i7zhj6lg.MemberTable get member {
    if (_member != null) return _member!;
    _member = _isd.createRelationTable(
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
    _section = _isd.createRelationTable(
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
  List<_isd.Column> get columns => [
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
  _isd.Table? getRelationTable(String relationField) {
    if (relationField == 'member') {
      return member;
    }
    if (relationField == 'section') {
      return section;
    }
    return null;
  }
}

class SectionMembershipInclude extends _isd.IncludeObject {
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
  Map<String, _isd.Include?> get includes => {
    'member': _member,
    'section': _section,
  };

  @override
  _isd.Table<_isc.UuidValue?> get table => SectionMembership.t;
}

class SectionMembershipIncludeList extends _isd.IncludeList {
  SectionMembershipIncludeList._({
    _isd.WhereExpressionBuilder<SectionMembershipTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SectionMembership.t);
  }

  @override
  Map<String, _isd.Include?> get includes => include?.includes ?? {};

  @override
  _isd.Table<_isc.UuidValue?> get table => SectionMembership.t;
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
    _isd.DatabaseSession session, {
    _isd.WhereExpressionBuilder<SectionMembershipTable>? where,
    int? limit,
    int? offset,
    _isd.OrderByBuilder<SectionMembershipTable>? orderBy,
    _isd.OrderByListBuilder<SectionMembershipTable>? orderByList,
    _isd.Transaction? transaction,
    SectionMembershipInclude? include,
    _isd.LockMode? lockMode,
    _isd.LockBehavior? lockBehavior,
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
    _isd.DatabaseSession session, {
    _isd.WhereExpressionBuilder<SectionMembershipTable>? where,
    int? offset,
    _isd.OrderByBuilder<SectionMembershipTable>? orderBy,
    _isd.OrderByListBuilder<SectionMembershipTable>? orderByList,
    _isd.Transaction? transaction,
    SectionMembershipInclude? include,
    _isd.LockMode? lockMode,
    _isd.LockBehavior? lockBehavior,
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
    _isd.DatabaseSession session,
    _isc.UuidValue id, {
    _isd.Transaction? transaction,
    SectionMembershipInclude? include,
    _isd.LockMode? lockMode,
    _isd.LockBehavior? lockBehavior,
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
    _isd.DatabaseSession session,
    List<SectionMembership> rows, {
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session,
    SectionMembership row, {
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session,
    List<SectionMembership> rows, {
    required _isd.ColumnSelections<SectionMembershipTable> conflictColumns,
    _isd.ColumnSelections<SectionMembershipTable>? updateColumns,
    _isd.WhereExpressionBuilder<SectionMembershipTable>? updateWhere,
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session,
    SectionMembership row, {
    required _isd.ColumnSelections<SectionMembershipTable> conflictColumns,
    _isd.ColumnSelections<SectionMembershipTable>? updateColumns,
    _isd.WhereExpressionBuilder<SectionMembershipTable>? updateWhere,
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session,
    List<SectionMembership> rows, {
    _isd.ColumnSelections<SectionMembershipTable>? columns,
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session,
    SectionMembership row, {
    _isd.ColumnSelections<SectionMembershipTable>? columns,
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session,
    _isc.UuidValue id, {
    required _isd.ColumnValueListBuilder<SectionMembershipUpdateTable>
    columnValues,
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session, {
    required _isd.ColumnValueListBuilder<SectionMembershipUpdateTable>
    columnValues,
    required _isd.WhereExpressionBuilder<SectionMembershipTable> where,
    int? limit,
    int? offset,
    _isd.OrderByBuilder<SectionMembershipTable>? orderBy,
    _isd.OrderByListBuilder<SectionMembershipTable>? orderByList,
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session,
    List<SectionMembership> rows, {
    _isd.OrderByBuilder<SectionMembershipTable>? orderBy,
    _isd.OrderByListBuilder<SectionMembershipTable>? orderByList,
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session,
    SectionMembership row, {
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session, {
    required _isd.WhereExpressionBuilder<SectionMembershipTable> where,
    _isd.OrderByBuilder<SectionMembershipTable>? orderBy,
    _isd.OrderByListBuilder<SectionMembershipTable>? orderByList,
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session, {
    _isd.WhereExpressionBuilder<SectionMembershipTable>? where,
    int? limit,
    _isd.Transaction? transaction,
  }) async {
    return session.db.count<SectionMembership>(
      where: where?.call(SectionMembership.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SectionMembership] rows matching the [where] expression.
  Future<void> lockRows(
    _isd.DatabaseSession session, {
    required _isd.WhereExpressionBuilder<SectionMembershipTable> where,
    required _isd.LockMode lockMode,
    required _isd.Transaction transaction,
    _isd.LockBehavior lockBehavior = _isd.LockBehavior.wait,
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
    _isd.DatabaseSession session,
    SectionMembership sectionMembership,
    _i7zhj6lg.Member member, {
    _isd.Transaction? transaction,
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
    _isd.DatabaseSession session,
    SectionMembership sectionMembership,
    _ibhmj7lb.Section section, {
    _isd.Transaction? transaction,
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
