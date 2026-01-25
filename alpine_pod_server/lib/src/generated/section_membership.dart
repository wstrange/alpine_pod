/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'member.dart' as _i2;
import 'package:alpine_pod_server/src/generated/protocol.dart' as _i3;

abstract class SectionMembership
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SectionMembership._({
    this.id,
    required this.memberId,
    this.member,
    required this.sectionId,
    this.externalUserId,
    DateTime? syncedAt,
    this.sourceSystem,
    required this.scopes,
  }) : syncedAt = syncedAt ?? DateTime.now();

  factory SectionMembership({
    int? id,
    required int memberId,
    _i2.Member? member,
    required int sectionId,
    String? externalUserId,
    DateTime? syncedAt,
    String? sourceSystem,
    required Set<String> scopes,
  }) = _SectionMembershipImpl;

  factory SectionMembership.fromJson(Map<String, dynamic> jsonSerialization) {
    return SectionMembership(
      id: jsonSerialization['id'] as int?,
      memberId: jsonSerialization['memberId'] as int,
      member: jsonSerialization['member'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Member>(jsonSerialization['member']),
      sectionId: jsonSerialization['sectionId'] as int,
      externalUserId: jsonSerialization['externalUserId'] as String?,
      syncedAt: jsonSerialization['syncedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['syncedAt']),
      sourceSystem: jsonSerialization['sourceSystem'] as String?,
      scopes: _i3.Protocol().deserialize<Set<String>>(
        jsonSerialization['scopes'],
      ),
    );
  }

  static final t = SectionMembershipTable();

  static const db = SectionMembershipRepository._();

  @override
  int? id;

  int memberId;

  _i2.Member? member;

  int sectionId;

  String? externalUserId;

  DateTime syncedAt;

  String? sourceSystem;

  Set<String> scopes;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [SectionMembership]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SectionMembership copyWith({
    int? id,
    int? memberId,
    _i2.Member? member,
    int? sectionId,
    String? externalUserId,
    DateTime? syncedAt,
    String? sourceSystem,
    Set<String>? scopes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SectionMembership',
      if (id != null) 'id': id,
      'memberId': memberId,
      if (member != null) 'member': member?.toJson(),
      'sectionId': sectionId,
      if (externalUserId != null) 'externalUserId': externalUserId,
      'syncedAt': syncedAt.toJson(),
      if (sourceSystem != null) 'sourceSystem': sourceSystem,
      'scopes': scopes.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SectionMembership',
      if (id != null) 'id': id,
      'memberId': memberId,
      if (member != null) 'member': member?.toJsonForProtocol(),
      'sectionId': sectionId,
      if (externalUserId != null) 'externalUserId': externalUserId,
      'syncedAt': syncedAt.toJson(),
      if (sourceSystem != null) 'sourceSystem': sourceSystem,
      'scopes': scopes.toJson(),
    };
  }

  static SectionMembershipInclude include({_i2.MemberInclude? member}) {
    return SectionMembershipInclude._(member: member);
  }

  static SectionMembershipIncludeList includeList({
    _i1.WhereExpressionBuilder<SectionMembershipTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SectionMembershipTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SectionMembershipTable>? orderByList,
    SectionMembershipInclude? include,
  }) {
    return SectionMembershipIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SectionMembership.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SectionMembership.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SectionMembershipImpl extends SectionMembership {
  _SectionMembershipImpl({
    int? id,
    required int memberId,
    _i2.Member? member,
    required int sectionId,
    String? externalUserId,
    DateTime? syncedAt,
    String? sourceSystem,
    required Set<String> scopes,
  }) : super._(
         id: id,
         memberId: memberId,
         member: member,
         sectionId: sectionId,
         externalUserId: externalUserId,
         syncedAt: syncedAt,
         sourceSystem: sourceSystem,
         scopes: scopes,
       );

  /// Returns a shallow copy of this [SectionMembership]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SectionMembership copyWith({
    Object? id = _Undefined,
    int? memberId,
    Object? member = _Undefined,
    int? sectionId,
    Object? externalUserId = _Undefined,
    DateTime? syncedAt,
    Object? sourceSystem = _Undefined,
    Set<String>? scopes,
  }) {
    return SectionMembership(
      id: id is int? ? id : this.id,
      memberId: memberId ?? this.memberId,
      member: member is _i2.Member? ? member : this.member?.copyWith(),
      sectionId: sectionId ?? this.sectionId,
      externalUserId: externalUserId is String?
          ? externalUserId
          : this.externalUserId,
      syncedAt: syncedAt ?? this.syncedAt,
      sourceSystem: sourceSystem is String? ? sourceSystem : this.sourceSystem,
      scopes: scopes ?? this.scopes.map((e0) => e0).toSet(),
    );
  }
}

class SectionMembershipUpdateTable
    extends _i1.UpdateTable<SectionMembershipTable> {
  SectionMembershipUpdateTable(super.table);

  _i1.ColumnValue<int, int> memberId(int value) => _i1.ColumnValue(
    table.memberId,
    value,
  );

  _i1.ColumnValue<int, int> sectionId(int value) => _i1.ColumnValue(
    table.sectionId,
    value,
  );

  _i1.ColumnValue<String, String> externalUserId(String? value) =>
      _i1.ColumnValue(
        table.externalUserId,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> syncedAt(DateTime value) =>
      _i1.ColumnValue(
        table.syncedAt,
        value,
      );

  _i1.ColumnValue<String, String> sourceSystem(String? value) =>
      _i1.ColumnValue(
        table.sourceSystem,
        value,
      );

  _i1.ColumnValue<Set<String>, Set<String>> scopes(Set<String> value) =>
      _i1.ColumnValue(
        table.scopes,
        value,
      );
}

class SectionMembershipTable extends _i1.Table<int?> {
  SectionMembershipTable({super.tableRelation})
    : super(tableName: 'section_memberships') {
    updateTable = SectionMembershipUpdateTable(this);
    memberId = _i1.ColumnInt(
      'memberId',
      this,
    );
    sectionId = _i1.ColumnInt(
      'sectionId',
      this,
    );
    externalUserId = _i1.ColumnString(
      'externalUserId',
      this,
    );
    syncedAt = _i1.ColumnDateTime(
      'syncedAt',
      this,
      hasDefault: true,
    );
    sourceSystem = _i1.ColumnString(
      'sourceSystem',
      this,
    );
    scopes = _i1.ColumnSerializable<Set<String>>(
      'scopes',
      this,
    );
  }

  late final SectionMembershipUpdateTable updateTable;

  late final _i1.ColumnInt memberId;

  _i2.MemberTable? _member;

  late final _i1.ColumnInt sectionId;

  late final _i1.ColumnString externalUserId;

  late final _i1.ColumnDateTime syncedAt;

  late final _i1.ColumnString sourceSystem;

  late final _i1.ColumnSerializable<Set<String>> scopes;

  _i2.MemberTable get member {
    if (_member != null) return _member!;
    _member = _i1.createRelationTable(
      relationFieldName: 'member',
      field: SectionMembership.t.memberId,
      foreignField: _i2.Member.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.MemberTable(tableRelation: foreignTableRelation),
    );
    return _member!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    memberId,
    sectionId,
    externalUserId,
    syncedAt,
    sourceSystem,
    scopes,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'member') {
      return member;
    }
    return null;
  }
}

class SectionMembershipInclude extends _i1.IncludeObject {
  SectionMembershipInclude._({_i2.MemberInclude? member}) {
    _member = member;
  }

  _i2.MemberInclude? _member;

  @override
  Map<String, _i1.Include?> get includes => {'member': _member};

  @override
  _i1.Table<int?> get table => SectionMembership.t;
}

class SectionMembershipIncludeList extends _i1.IncludeList {
  SectionMembershipIncludeList._({
    _i1.WhereExpressionBuilder<SectionMembershipTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SectionMembership.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SectionMembership.t;
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
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SectionMembershipTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SectionMembershipTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SectionMembershipTable>? orderByList,
    _i1.Transaction? transaction,
    SectionMembershipInclude? include,
  }) async {
    return session.db.find<SectionMembership>(
      where: where?.call(SectionMembership.t),
      orderBy: orderBy?.call(SectionMembership.t),
      orderByList: orderByList?.call(SectionMembership.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
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
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SectionMembershipTable>? where,
    int? offset,
    _i1.OrderByBuilder<SectionMembershipTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SectionMembershipTable>? orderByList,
    _i1.Transaction? transaction,
    SectionMembershipInclude? include,
  }) async {
    return session.db.findFirstRow<SectionMembership>(
      where: where?.call(SectionMembership.t),
      orderBy: orderBy?.call(SectionMembership.t),
      orderByList: orderByList?.call(SectionMembership.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [SectionMembership] by its [id] or null if no such row exists.
  Future<SectionMembership?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SectionMembershipInclude? include,
  }) async {
    return session.db.findById<SectionMembership>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [SectionMembership]s in the list and returns the inserted rows.
  ///
  /// The returned [SectionMembership]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SectionMembership>> insert(
    _i1.Session session,
    List<SectionMembership> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SectionMembership>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SectionMembership] and returns the inserted row.
  ///
  /// The returned [SectionMembership] will have its `id` field set.
  Future<SectionMembership> insertRow(
    _i1.Session session,
    SectionMembership row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SectionMembership>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SectionMembership]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SectionMembership>> update(
    _i1.Session session,
    List<SectionMembership> rows, {
    _i1.ColumnSelections<SectionMembershipTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SectionMembership>(
      rows,
      columns: columns?.call(SectionMembership.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SectionMembership]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SectionMembership> updateRow(
    _i1.Session session,
    SectionMembership row, {
    _i1.ColumnSelections<SectionMembershipTable>? columns,
    _i1.Transaction? transaction,
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
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<SectionMembershipUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<SectionMembership>(
      id,
      columnValues: columnValues(SectionMembership.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SectionMembership]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<SectionMembership>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<SectionMembershipUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<SectionMembershipTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SectionMembershipTable>? orderBy,
    _i1.OrderByListBuilder<SectionMembershipTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<SectionMembership>(
      columnValues: columnValues(SectionMembership.t.updateTable),
      where: where(SectionMembership.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SectionMembership.t),
      orderByList: orderByList?.call(SectionMembership.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [SectionMembership]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SectionMembership>> delete(
    _i1.Session session,
    List<SectionMembership> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SectionMembership>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SectionMembership].
  Future<SectionMembership> deleteRow(
    _i1.Session session,
    SectionMembership row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SectionMembership>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SectionMembership>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SectionMembershipTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SectionMembership>(
      where: where(SectionMembership.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SectionMembershipTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SectionMembership>(
      where: where?.call(SectionMembership.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SectionMembershipAttachRowRepository {
  const SectionMembershipAttachRowRepository._();

  /// Creates a relation between the given [SectionMembership] and [Member]
  /// by setting the [SectionMembership]'s foreign key `memberId` to refer to the [Member].
  Future<void> member(
    _i1.Session session,
    SectionMembership sectionMembership,
    _i2.Member member, {
    _i1.Transaction? transaction,
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
}
