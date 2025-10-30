/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class SectionMembership
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SectionMembership._({
    this.id,
    required this.memberId,
    required this.sectionId,
    this.externalUserId,
    DateTime? syncedAt,
    this.sourceSystem,
    required this.scopes,
  }) : syncedAt = syncedAt ?? DateTime.now();

  factory SectionMembership({
    int? id,
    required int memberId,
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
      sectionId: jsonSerialization['sectionId'] as int,
      externalUserId: jsonSerialization['externalUserId'] as String?,
      syncedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['syncedAt']),
      sourceSystem: jsonSerialization['sourceSystem'] as String?,
      scopes: _i1.SetJsonExtension.fromJson(
          (jsonSerialization['scopes'] as List),
          itemFromJson: (e) => e as String)!,
    );
  }

  static final t = SectionMembershipTable();

  static const db = SectionMembershipRepository._();

  @override
  int? id;

  int memberId;

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
    int? sectionId,
    String? externalUserId,
    DateTime? syncedAt,
    String? sourceSystem,
    Set<String>? scopes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'memberId': memberId,
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
      if (id != null) 'id': id,
      'memberId': memberId,
      'sectionId': sectionId,
      if (externalUserId != null) 'externalUserId': externalUserId,
      'syncedAt': syncedAt.toJson(),
      if (sourceSystem != null) 'sourceSystem': sourceSystem,
      'scopes': scopes.toJson(),
    };
  }

  static SectionMembershipInclude include() {
    return SectionMembershipInclude._();
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
    required int sectionId,
    String? externalUserId,
    DateTime? syncedAt,
    String? sourceSystem,
    required Set<String> scopes,
  }) : super._(
          id: id,
          memberId: memberId,
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
    int? sectionId,
    Object? externalUserId = _Undefined,
    DateTime? syncedAt,
    Object? sourceSystem = _Undefined,
    Set<String>? scopes,
  }) {
    return SectionMembership(
      id: id is int? ? id : this.id,
      memberId: memberId ?? this.memberId,
      sectionId: sectionId ?? this.sectionId,
      externalUserId:
          externalUserId is String? ? externalUserId : this.externalUserId,
      syncedAt: syncedAt ?? this.syncedAt,
      sourceSystem: sourceSystem is String? ? sourceSystem : this.sourceSystem,
      scopes: scopes ?? this.scopes.map((e0) => e0).toSet(),
    );
  }
}

class SectionMembershipTable extends _i1.Table<int?> {
  SectionMembershipTable({super.tableRelation})
      : super(tableName: 'section_memberships') {
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
    scopes = _i1.ColumnSerializable(
      'scopes',
      this,
    );
  }

  late final _i1.ColumnInt memberId;

  late final _i1.ColumnInt sectionId;

  late final _i1.ColumnString externalUserId;

  late final _i1.ColumnDateTime syncedAt;

  late final _i1.ColumnString sourceSystem;

  late final _i1.ColumnSerializable scopes;

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
}

class SectionMembershipInclude extends _i1.IncludeObject {
  SectionMembershipInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

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
  }) async {
    return session.db.find<SectionMembership>(
      where: where?.call(SectionMembership.t),
      orderBy: orderBy?.call(SectionMembership.t),
      orderByList: orderByList?.call(SectionMembership.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
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
  }) async {
    return session.db.findFirstRow<SectionMembership>(
      where: where?.call(SectionMembership.t),
      orderBy: orderBy?.call(SectionMembership.t),
      orderByList: orderByList?.call(SectionMembership.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [SectionMembership] by its [id] or null if no such row exists.
  Future<SectionMembership?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<SectionMembership>(
      id,
      transaction: transaction,
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
