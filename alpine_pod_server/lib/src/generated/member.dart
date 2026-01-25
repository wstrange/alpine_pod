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
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i2;
import 'package:alpine_pod_server/src/generated/protocol.dart' as _i3;

abstract class Member implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Member._({
    this.id,
    required this.userId,
    this.user,
    required this.firstName,
    required this.lastName,
    this.displayName,
    this.bio,
    required this.email,
    required this.phoneNumber,
    String? membershipStatus,
    this.profilePictureUrl,
    required this.emergencyContactName,
    required this.emergencyContactPhone,
    this.medicalConditions,
    bool? isTripAdmin,
    this.certifications,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : membershipStatus = membershipStatus ?? 'active',
       isTripAdmin = isTripAdmin ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Member({
    int? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    required String firstName,
    required String lastName,
    String? displayName,
    String? bio,
    required String email,
    required String phoneNumber,
    String? membershipStatus,
    String? profilePictureUrl,
    required String emergencyContactName,
    required String emergencyContactPhone,
    String? medicalConditions,
    bool? isTripAdmin,
    String? certifications,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _MemberImpl;

  factory Member.fromJson(Map<String, dynamic> jsonSerialization) {
    return Member(
      id: jsonSerialization['id'] as int?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.AuthUser>(jsonSerialization['user']),
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      displayName: jsonSerialization['displayName'] as String?,
      bio: jsonSerialization['bio'] as String?,
      email: jsonSerialization['email'] as String,
      phoneNumber: jsonSerialization['phoneNumber'] as String,
      membershipStatus: jsonSerialization['membershipStatus'] as String?,
      profilePictureUrl: jsonSerialization['profilePictureUrl'] as String?,
      emergencyContactName: jsonSerialization['emergencyContactName'] as String,
      emergencyContactPhone:
          jsonSerialization['emergencyContactPhone'] as String,
      medicalConditions: jsonSerialization['medicalConditions'] as String?,
      isTripAdmin: jsonSerialization['isTripAdmin'] as bool?,
      certifications: jsonSerialization['certifications'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = MemberTable();

  static const db = MemberRepository._();

  @override
  int? id;

  _i1.UuidValue userId;

  _i2.AuthUser? user;

  String firstName;

  String lastName;

  String? displayName;

  String? bio;

  String email;

  String phoneNumber;

  String membershipStatus;

  String? profilePictureUrl;

  String emergencyContactName;

  String emergencyContactPhone;

  String? medicalConditions;

  bool isTripAdmin;

  String? certifications;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Member]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Member copyWith({
    int? id,
    _i1.UuidValue? userId,
    _i2.AuthUser? user,
    String? firstName,
    String? lastName,
    String? displayName,
    String? bio,
    String? email,
    String? phoneNumber,
    String? membershipStatus,
    String? profilePictureUrl,
    String? emergencyContactName,
    String? emergencyContactPhone,
    String? medicalConditions,
    bool? isTripAdmin,
    String? certifications,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Member',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'firstName': firstName,
      'lastName': lastName,
      if (displayName != null) 'displayName': displayName,
      if (bio != null) 'bio': bio,
      'email': email,
      'phoneNumber': phoneNumber,
      'membershipStatus': membershipStatus,
      if (profilePictureUrl != null) 'profilePictureUrl': profilePictureUrl,
      'emergencyContactName': emergencyContactName,
      'emergencyContactPhone': emergencyContactPhone,
      if (medicalConditions != null) 'medicalConditions': medicalConditions,
      'isTripAdmin': isTripAdmin,
      if (certifications != null) 'certifications': certifications,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Member',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'firstName': firstName,
      'lastName': lastName,
      if (displayName != null) 'displayName': displayName,
      if (bio != null) 'bio': bio,
      'email': email,
      'phoneNumber': phoneNumber,
      'membershipStatus': membershipStatus,
      if (profilePictureUrl != null) 'profilePictureUrl': profilePictureUrl,
      'emergencyContactName': emergencyContactName,
      'emergencyContactPhone': emergencyContactPhone,
      if (medicalConditions != null) 'medicalConditions': medicalConditions,
      'isTripAdmin': isTripAdmin,
      if (certifications != null) 'certifications': certifications,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static MemberInclude include({_i2.AuthUserInclude? user}) {
    return MemberInclude._(user: user);
  }

  static MemberIncludeList includeList({
    _i1.WhereExpressionBuilder<MemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemberTable>? orderByList,
    MemberInclude? include,
  }) {
    return MemberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Member.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Member.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MemberImpl extends Member {
  _MemberImpl({
    int? id,
    required _i1.UuidValue userId,
    _i2.AuthUser? user,
    required String firstName,
    required String lastName,
    String? displayName,
    String? bio,
    required String email,
    required String phoneNumber,
    String? membershipStatus,
    String? profilePictureUrl,
    required String emergencyContactName,
    required String emergencyContactPhone,
    String? medicalConditions,
    bool? isTripAdmin,
    String? certifications,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         firstName: firstName,
         lastName: lastName,
         displayName: displayName,
         bio: bio,
         email: email,
         phoneNumber: phoneNumber,
         membershipStatus: membershipStatus,
         profilePictureUrl: profilePictureUrl,
         emergencyContactName: emergencyContactName,
         emergencyContactPhone: emergencyContactPhone,
         medicalConditions: medicalConditions,
         isTripAdmin: isTripAdmin,
         certifications: certifications,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Member]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Member copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    String? firstName,
    String? lastName,
    Object? displayName = _Undefined,
    Object? bio = _Undefined,
    String? email,
    String? phoneNumber,
    String? membershipStatus,
    Object? profilePictureUrl = _Undefined,
    String? emergencyContactName,
    String? emergencyContactPhone,
    Object? medicalConditions = _Undefined,
    bool? isTripAdmin,
    Object? certifications = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Member(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.AuthUser? ? user : this.user?.copyWith(),
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      displayName: displayName is String? ? displayName : this.displayName,
      bio: bio is String? ? bio : this.bio,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      membershipStatus: membershipStatus ?? this.membershipStatus,
      profilePictureUrl: profilePictureUrl is String?
          ? profilePictureUrl
          : this.profilePictureUrl,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyContactPhone:
          emergencyContactPhone ?? this.emergencyContactPhone,
      medicalConditions: medicalConditions is String?
          ? medicalConditions
          : this.medicalConditions,
      isTripAdmin: isTripAdmin ?? this.isTripAdmin,
      certifications: certifications is String?
          ? certifications
          : this.certifications,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class MemberUpdateTable extends _i1.UpdateTable<MemberTable> {
  MemberUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<String, String> firstName(String value) => _i1.ColumnValue(
    table.firstName,
    value,
  );

  _i1.ColumnValue<String, String> lastName(String value) => _i1.ColumnValue(
    table.lastName,
    value,
  );

  _i1.ColumnValue<String, String> displayName(String? value) => _i1.ColumnValue(
    table.displayName,
    value,
  );

  _i1.ColumnValue<String, String> bio(String? value) => _i1.ColumnValue(
    table.bio,
    value,
  );

  _i1.ColumnValue<String, String> email(String value) => _i1.ColumnValue(
    table.email,
    value,
  );

  _i1.ColumnValue<String, String> phoneNumber(String value) => _i1.ColumnValue(
    table.phoneNumber,
    value,
  );

  _i1.ColumnValue<String, String> membershipStatus(String value) =>
      _i1.ColumnValue(
        table.membershipStatus,
        value,
      );

  _i1.ColumnValue<String, String> profilePictureUrl(String? value) =>
      _i1.ColumnValue(
        table.profilePictureUrl,
        value,
      );

  _i1.ColumnValue<String, String> emergencyContactName(String value) =>
      _i1.ColumnValue(
        table.emergencyContactName,
        value,
      );

  _i1.ColumnValue<String, String> emergencyContactPhone(String value) =>
      _i1.ColumnValue(
        table.emergencyContactPhone,
        value,
      );

  _i1.ColumnValue<String, String> medicalConditions(String? value) =>
      _i1.ColumnValue(
        table.medicalConditions,
        value,
      );

  _i1.ColumnValue<bool, bool> isTripAdmin(bool value) => _i1.ColumnValue(
    table.isTripAdmin,
    value,
  );

  _i1.ColumnValue<String, String> certifications(String? value) =>
      _i1.ColumnValue(
        table.certifications,
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

class MemberTable extends _i1.Table<int?> {
  MemberTable({super.tableRelation}) : super(tableName: 'members') {
    updateTable = MemberUpdateTable(this);
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    firstName = _i1.ColumnString(
      'firstName',
      this,
    );
    lastName = _i1.ColumnString(
      'lastName',
      this,
    );
    displayName = _i1.ColumnString(
      'displayName',
      this,
    );
    bio = _i1.ColumnString(
      'bio',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    phoneNumber = _i1.ColumnString(
      'phoneNumber',
      this,
    );
    membershipStatus = _i1.ColumnString(
      'membershipStatus',
      this,
      hasDefault: true,
    );
    profilePictureUrl = _i1.ColumnString(
      'profilePictureUrl',
      this,
    );
    emergencyContactName = _i1.ColumnString(
      'emergencyContactName',
      this,
    );
    emergencyContactPhone = _i1.ColumnString(
      'emergencyContactPhone',
      this,
    );
    medicalConditions = _i1.ColumnString(
      'medicalConditions',
      this,
    );
    isTripAdmin = _i1.ColumnBool(
      'isTripAdmin',
      this,
      hasDefault: true,
    );
    certifications = _i1.ColumnString(
      'certifications',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
  }

  late final MemberUpdateTable updateTable;

  late final _i1.ColumnUuid userId;

  _i2.AuthUserTable? _user;

  late final _i1.ColumnString firstName;

  late final _i1.ColumnString lastName;

  late final _i1.ColumnString displayName;

  late final _i1.ColumnString bio;

  late final _i1.ColumnString email;

  late final _i1.ColumnString phoneNumber;

  late final _i1.ColumnString membershipStatus;

  late final _i1.ColumnString profilePictureUrl;

  late final _i1.ColumnString emergencyContactName;

  late final _i1.ColumnString emergencyContactPhone;

  late final _i1.ColumnString medicalConditions;

  late final _i1.ColumnBool isTripAdmin;

  late final _i1.ColumnString certifications;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.AuthUserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: Member.t.userId,
      foreignField: _i2.AuthUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AuthUserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    firstName,
    lastName,
    displayName,
    bio,
    email,
    phoneNumber,
    membershipStatus,
    profilePictureUrl,
    emergencyContactName,
    emergencyContactPhone,
    medicalConditions,
    isTripAdmin,
    certifications,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class MemberInclude extends _i1.IncludeObject {
  MemberInclude._({_i2.AuthUserInclude? user}) {
    _user = user;
  }

  _i2.AuthUserInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table<int?> get table => Member.t;
}

class MemberIncludeList extends _i1.IncludeList {
  MemberIncludeList._({
    _i1.WhereExpressionBuilder<MemberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Member.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Member.t;
}

class MemberRepository {
  const MemberRepository._();

  final attachRow = const MemberAttachRowRepository._();

  /// Returns a list of [Member]s matching the given query parameters.
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
  Future<List<Member>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemberTable>? orderByList,
    _i1.Transaction? transaction,
    MemberInclude? include,
  }) async {
    return session.db.find<Member>(
      where: where?.call(Member.t),
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Member] matching the given query parameters.
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
  Future<Member?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemberTable>? where,
    int? offset,
    _i1.OrderByBuilder<MemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemberTable>? orderByList,
    _i1.Transaction? transaction,
    MemberInclude? include,
  }) async {
    return session.db.findFirstRow<Member>(
      where: where?.call(Member.t),
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Member] by its [id] or null if no such row exists.
  Future<Member?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MemberInclude? include,
  }) async {
    return session.db.findById<Member>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Member]s in the list and returns the inserted rows.
  ///
  /// The returned [Member]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Member>> insert(
    _i1.Session session,
    List<Member> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Member>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Member] and returns the inserted row.
  ///
  /// The returned [Member] will have its `id` field set.
  Future<Member> insertRow(
    _i1.Session session,
    Member row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Member>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Member]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Member>> update(
    _i1.Session session,
    List<Member> rows, {
    _i1.ColumnSelections<MemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Member>(
      rows,
      columns: columns?.call(Member.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Member]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Member> updateRow(
    _i1.Session session,
    Member row, {
    _i1.ColumnSelections<MemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Member>(
      row,
      columns: columns?.call(Member.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Member] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Member?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<MemberUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Member>(
      id,
      columnValues: columnValues(Member.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Member]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Member>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<MemberUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MemberTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MemberTable>? orderBy,
    _i1.OrderByListBuilder<MemberTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Member>(
      columnValues: columnValues(Member.t.updateTable),
      where: where(Member.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Member]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Member>> delete(
    _i1.Session session,
    List<Member> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Member>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Member].
  Future<Member> deleteRow(
    _i1.Session session,
    Member row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Member>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Member>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MemberTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Member>(
      where: where(Member.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemberTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Member>(
      where: where?.call(Member.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MemberAttachRowRepository {
  const MemberAttachRowRepository._();

  /// Creates a relation between the given [Member] and [AuthUser]
  /// by setting the [Member]'s foreign key `userId` to refer to the [AuthUser].
  Future<void> user(
    _i1.Session session,
    Member member,
    _i2.AuthUser user, {
    _i1.Transaction? transaction,
  }) async {
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $member = member.copyWith(userId: user.id);
    await session.db.updateRow<Member>(
      $member,
      columns: [Member.t.userId],
      transaction: transaction,
    );
  }
}
