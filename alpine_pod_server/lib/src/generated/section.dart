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

abstract class Section
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Section._({
    this.id,
    required this.name,
    required this.description,
    this.location,
    this.contactInfo,
  });

  factory Section({
    int? id,
    required String name,
    required String description,
    String? location,
    String? contactInfo,
  }) = _SectionImpl;

  factory Section.fromJson(Map<String, dynamic> jsonSerialization) {
    return Section(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      location: jsonSerialization['location'] as String?,
      contactInfo: jsonSerialization['contactInfo'] as String?,
    );
  }

  static final t = SectionTable();

  static const db = SectionRepository._();

  @override
  int? id;

  String name;

  String description;

  String? location;

  String? contactInfo;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Section]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Section copyWith({
    int? id,
    String? name,
    String? description,
    String? location,
    String? contactInfo,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      if (location != null) 'location': location,
      if (contactInfo != null) 'contactInfo': contactInfo,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      if (location != null) 'location': location,
      if (contactInfo != null) 'contactInfo': contactInfo,
    };
  }

  static SectionInclude include() {
    return SectionInclude._();
  }

  static SectionIncludeList includeList({
    _i1.WhereExpressionBuilder<SectionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SectionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SectionTable>? orderByList,
    SectionInclude? include,
  }) {
    return SectionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Section.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Section.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SectionImpl extends Section {
  _SectionImpl({
    int? id,
    required String name,
    required String description,
    String? location,
    String? contactInfo,
  }) : super._(
          id: id,
          name: name,
          description: description,
          location: location,
          contactInfo: contactInfo,
        );

  /// Returns a shallow copy of this [Section]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Section copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    Object? location = _Undefined,
    Object? contactInfo = _Undefined,
  }) {
    return Section(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      location: location is String? ? location : this.location,
      contactInfo: contactInfo is String? ? contactInfo : this.contactInfo,
    );
  }
}

class SectionTable extends _i1.Table<int?> {
  SectionTable({super.tableRelation}) : super(tableName: 'sections') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    location = _i1.ColumnString(
      'location',
      this,
    );
    contactInfo = _i1.ColumnString(
      'contactInfo',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnString location;

  late final _i1.ColumnString contactInfo;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        location,
        contactInfo,
      ];
}

class SectionInclude extends _i1.IncludeObject {
  SectionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Section.t;
}

class SectionIncludeList extends _i1.IncludeList {
  SectionIncludeList._({
    _i1.WhereExpressionBuilder<SectionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Section.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Section.t;
}

class SectionRepository {
  const SectionRepository._();

  /// Returns a list of [Section]s matching the given query parameters.
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
  Future<List<Section>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SectionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SectionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SectionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Section>(
      where: where?.call(Section.t),
      orderBy: orderBy?.call(Section.t),
      orderByList: orderByList?.call(Section.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Section] matching the given query parameters.
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
  Future<Section?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SectionTable>? where,
    int? offset,
    _i1.OrderByBuilder<SectionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SectionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Section>(
      where: where?.call(Section.t),
      orderBy: orderBy?.call(Section.t),
      orderByList: orderByList?.call(Section.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Section] by its [id] or null if no such row exists.
  Future<Section?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Section>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Section]s in the list and returns the inserted rows.
  ///
  /// The returned [Section]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Section>> insert(
    _i1.Session session,
    List<Section> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Section>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Section] and returns the inserted row.
  ///
  /// The returned [Section] will have its `id` field set.
  Future<Section> insertRow(
    _i1.Session session,
    Section row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Section>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Section]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Section>> update(
    _i1.Session session,
    List<Section> rows, {
    _i1.ColumnSelections<SectionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Section>(
      rows,
      columns: columns?.call(Section.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Section]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Section> updateRow(
    _i1.Session session,
    Section row, {
    _i1.ColumnSelections<SectionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Section>(
      row,
      columns: columns?.call(Section.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Section]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Section>> delete(
    _i1.Session session,
    List<Section> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Section>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Section].
  Future<Section> deleteRow(
    _i1.Session session,
    Section row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Section>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Section>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SectionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Section>(
      where: where(Section.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SectionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Section>(
      where: where?.call(Section.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
