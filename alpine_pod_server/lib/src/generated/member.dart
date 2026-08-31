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

import 'package:alpine_pod_server/src/generated/protocol.dart' as _i1rm9ghy;
import 'package:serverpod/serverpod.dart' as _is;
import 'event_manager.dart' as _ich6ygep;
import 'event_registration.dart' as _i27uzliw;

abstract class Member
    implements _is.TableRow<_is.UuidValue>, _is.ProtocolSerialization {
  Member._({
    _is.UuidValue? id,
    required this.firstName,
    required this.lastName,
    this.displayName,
    this.bio,
    required this.email,
    required this.phoneNumber,
    String? membershipStatus,
    required this.emergencyContactName,
    required this.emergencyContactPhone,
    this.medicalConditions,
    this.profileImageUrl,
    DateTime? waiverSignedDate,
    this.certifications,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.registrations,
    this.managedEvents,
  }) : id = id ?? const _is.Uuid().v7obj(),
       membershipStatus = membershipStatus ?? 'active',
       waiverSignedDate =
           waiverSignedDate ?? DateTime.parse('1970-01-01T00:00:00.000Z'),
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Member({
    _is.UuidValue? id,
    required String firstName,
    required String lastName,
    String? displayName,
    String? bio,
    required String email,
    required String phoneNumber,
    String? membershipStatus,
    required String emergencyContactName,
    required String emergencyContactPhone,
    String? medicalConditions,
    String? profileImageUrl,
    DateTime? waiverSignedDate,
    String? certifications,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i27uzliw.EventRegistration>? registrations,
    List<_ich6ygep.EventManager>? managedEvents,
  }) = _MemberImpl;

  factory Member.fromJson(Map<String, dynamic> jsonSerialization) {
    return Member(
      id: jsonSerialization['id'] == null
          ? null
          : _is.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      displayName: jsonSerialization['displayName'] as String?,
      bio: jsonSerialization['bio'] as String?,
      email: jsonSerialization['email'] as String,
      phoneNumber: jsonSerialization['phoneNumber'] as String,
      membershipStatus: jsonSerialization['membershipStatus'] as String?,
      emergencyContactName: jsonSerialization['emergencyContactName'] as String,
      emergencyContactPhone:
          jsonSerialization['emergencyContactPhone'] as String,
      medicalConditions: jsonSerialization['medicalConditions'] as String?,
      profileImageUrl: jsonSerialization['profileImageUrl'] as String?,
      waiverSignedDate: jsonSerialization['waiverSignedDate'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(
              jsonSerialization['waiverSignedDate'],
            ),
      certifications: jsonSerialization['certifications'] as String?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      registrations: jsonSerialization['registrations'] == null
          ? null
          : _i1rm9ghy.Protocol().deserialize<List<_i27uzliw.EventRegistration>>(
              jsonSerialization['registrations'],
            ),
      managedEvents: jsonSerialization['managedEvents'] == null
          ? null
          : _i1rm9ghy.Protocol().deserialize<List<_ich6ygep.EventManager>>(
              jsonSerialization['managedEvents'],
            ),
    );
  }

  static final t = MemberTable();

  static const db = MemberRepository._();

  @override
  _is.UuidValue id;

  String firstName;

  String lastName;

  String? displayName;

  String? bio;

  String email;

  String phoneNumber;

  String membershipStatus;

  String emergencyContactName;

  String emergencyContactPhone;

  String? medicalConditions;

  String? profileImageUrl;

  DateTime waiverSignedDate;

  String? certifications;

  DateTime createdAt;

  DateTime updatedAt;

  List<_i27uzliw.EventRegistration>? registrations;

  List<_ich6ygep.EventManager>? managedEvents;

  @override
  _is.Table<_is.UuidValue> get table => t;

  /// Returns a shallow copy of this [Member]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  Member copyWith({
    _is.UuidValue? id,
    String? firstName,
    String? lastName,
    String? displayName,
    String? bio,
    String? email,
    String? phoneNumber,
    String? membershipStatus,
    String? emergencyContactName,
    String? emergencyContactPhone,
    String? medicalConditions,
    String? profileImageUrl,
    DateTime? waiverSignedDate,
    String? certifications,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i27uzliw.EventRegistration>? registrations,
    List<_ich6ygep.EventManager>? managedEvents,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Member',
      'id': id.toJson(),
      'firstName': firstName,
      'lastName': lastName,
      if (displayName != null) 'displayName': displayName,
      if (bio != null) 'bio': bio,
      'email': email,
      'phoneNumber': phoneNumber,
      'membershipStatus': membershipStatus,
      'emergencyContactName': emergencyContactName,
      'emergencyContactPhone': emergencyContactPhone,
      if (medicalConditions != null) 'medicalConditions': medicalConditions,
      if (profileImageUrl != null) 'profileImageUrl': profileImageUrl,
      'waiverSignedDate': waiverSignedDate.toJson(),
      if (certifications != null) 'certifications': certifications,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (registrations != null)
        'registrations': registrations?.toJson(valueToJson: (v) => v.toJson()),
      if (managedEvents != null)
        'managedEvents': managedEvents?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Member',
      'id': id.toJson(),
      'firstName': firstName,
      'lastName': lastName,
      if (displayName != null) 'displayName': displayName,
      if (bio != null) 'bio': bio,
      'email': email,
      'phoneNumber': phoneNumber,
      'membershipStatus': membershipStatus,
      'emergencyContactName': emergencyContactName,
      'emergencyContactPhone': emergencyContactPhone,
      if (medicalConditions != null) 'medicalConditions': medicalConditions,
      if (profileImageUrl != null) 'profileImageUrl': profileImageUrl,
      'waiverSignedDate': waiverSignedDate.toJson(),
      if (certifications != null) 'certifications': certifications,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (registrations != null)
        'registrations': registrations?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (managedEvents != null)
        'managedEvents': managedEvents?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static MemberInclude include({
    _i27uzliw.EventRegistrationIncludeList? registrations,
    _ich6ygep.EventManagerIncludeList? managedEvents,
  }) {
    return MemberInclude._(
      registrations: registrations,
      managedEvents: managedEvents,
    );
  }

  static MemberIncludeList includeList({
    _is.WhereExpressionBuilder<MemberTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MemberTable>? orderBy,
    _is.OrderByListBuilder<MemberTable>? orderByList,
    MemberInclude? include,
  }) {
    return MemberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MemberImpl extends Member {
  _MemberImpl({
    _is.UuidValue? id,
    required String firstName,
    required String lastName,
    String? displayName,
    String? bio,
    required String email,
    required String phoneNumber,
    String? membershipStatus,
    required String emergencyContactName,
    required String emergencyContactPhone,
    String? medicalConditions,
    String? profileImageUrl,
    DateTime? waiverSignedDate,
    String? certifications,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i27uzliw.EventRegistration>? registrations,
    List<_ich6ygep.EventManager>? managedEvents,
  }) : super._(
         id: id,
         firstName: firstName,
         lastName: lastName,
         displayName: displayName,
         bio: bio,
         email: email,
         phoneNumber: phoneNumber,
         membershipStatus: membershipStatus,
         emergencyContactName: emergencyContactName,
         emergencyContactPhone: emergencyContactPhone,
         medicalConditions: medicalConditions,
         profileImageUrl: profileImageUrl,
         waiverSignedDate: waiverSignedDate,
         certifications: certifications,
         createdAt: createdAt,
         updatedAt: updatedAt,
         registrations: registrations,
         managedEvents: managedEvents,
       );

  /// Returns a shallow copy of this [Member]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  Member copyWith({
    _is.UuidValue? id,
    String? firstName,
    String? lastName,
    Object? displayName = _Undefined,
    Object? bio = _Undefined,
    String? email,
    String? phoneNumber,
    String? membershipStatus,
    String? emergencyContactName,
    String? emergencyContactPhone,
    Object? medicalConditions = _Undefined,
    Object? profileImageUrl = _Undefined,
    DateTime? waiverSignedDate,
    Object? certifications = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? registrations = _Undefined,
    Object? managedEvents = _Undefined,
  }) {
    return Member(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      displayName: displayName is String? ? displayName : this.displayName,
      bio: bio is String? ? bio : this.bio,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      membershipStatus: membershipStatus ?? this.membershipStatus,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyContactPhone:
          emergencyContactPhone ?? this.emergencyContactPhone,
      medicalConditions: medicalConditions is String?
          ? medicalConditions
          : this.medicalConditions,
      profileImageUrl: profileImageUrl is String?
          ? profileImageUrl
          : this.profileImageUrl,
      waiverSignedDate: waiverSignedDate ?? this.waiverSignedDate,
      certifications: certifications is String?
          ? certifications
          : this.certifications,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      registrations: registrations is List<_i27uzliw.EventRegistration>?
          ? registrations
          : this.registrations?.map((e0) => e0.copyWith()).toList(),
      managedEvents: managedEvents is List<_ich6ygep.EventManager>?
          ? managedEvents
          : this.managedEvents?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class MemberUpdateTable extends _is.UpdateTable<MemberTable> {
  MemberUpdateTable(super.table);

  _is.ColumnValue<String, String> firstName(String value) =>
      _is.ColumnValue(table.firstName, value);

  _is.ColumnValue<String, String> lastName(String value) =>
      _is.ColumnValue(table.lastName, value);

  _is.ColumnValue<String, String> displayName(String? value) =>
      _is.ColumnValue(table.displayName, value);

  _is.ColumnValue<String, String> bio(String? value) =>
      _is.ColumnValue(table.bio, value);

  _is.ColumnValue<String, String> email(String value) =>
      _is.ColumnValue(table.email, value);

  _is.ColumnValue<String, String> phoneNumber(String value) =>
      _is.ColumnValue(table.phoneNumber, value);

  _is.ColumnValue<String, String> membershipStatus(String value) =>
      _is.ColumnValue(table.membershipStatus, value);

  _is.ColumnValue<String, String> emergencyContactName(String value) =>
      _is.ColumnValue(table.emergencyContactName, value);

  _is.ColumnValue<String, String> emergencyContactPhone(String value) =>
      _is.ColumnValue(table.emergencyContactPhone, value);

  _is.ColumnValue<String, String> medicalConditions(String? value) =>
      _is.ColumnValue(table.medicalConditions, value);

  _is.ColumnValue<String, String> profileImageUrl(String? value) =>
      _is.ColumnValue(table.profileImageUrl, value);

  _is.ColumnValue<DateTime, DateTime> waiverSignedDate(DateTime value) =>
      _is.ColumnValue(table.waiverSignedDate, value);

  _is.ColumnValue<String, String> certifications(String? value) =>
      _is.ColumnValue(table.certifications, value);

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(table.createdAt, value);

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(table.updatedAt, value);
}

class MemberTable extends _is.Table<_is.UuidValue> {
  MemberTable({super.tableRelation}) : super(tableName: 'members') {
    updateTable = MemberUpdateTable(this);
    firstName = _is.ColumnString('firstName', this);
    lastName = _is.ColumnString('lastName', this);
    displayName = _is.ColumnString('displayName', this);
    bio = _is.ColumnString('bio', this);
    email = _is.ColumnString('email', this);
    phoneNumber = _is.ColumnString('phoneNumber', this);
    membershipStatus = _is.ColumnString(
      'membershipStatus',
      this,
      hasDefault: true,
    );
    emergencyContactName = _is.ColumnString('emergencyContactName', this);
    emergencyContactPhone = _is.ColumnString('emergencyContactPhone', this);
    medicalConditions = _is.ColumnString('medicalConditions', this);
    profileImageUrl = _is.ColumnString('profileImageUrl', this);
    waiverSignedDate = _is.ColumnDateTime(
      'waiverSignedDate',
      this,
      hasDefault: true,
    );
    certifications = _is.ColumnString('certifications', this);
    createdAt = _is.ColumnDateTime('createdAt', this, hasDefault: true);
    updatedAt = _is.ColumnDateTime('updatedAt', this, hasDefault: true);
  }

  late final MemberUpdateTable updateTable;

  late final _is.ColumnString firstName;

  late final _is.ColumnString lastName;

  late final _is.ColumnString displayName;

  late final _is.ColumnString bio;

  late final _is.ColumnString email;

  late final _is.ColumnString phoneNumber;

  late final _is.ColumnString membershipStatus;

  late final _is.ColumnString emergencyContactName;

  late final _is.ColumnString emergencyContactPhone;

  late final _is.ColumnString medicalConditions;

  late final _is.ColumnString profileImageUrl;

  late final _is.ColumnDateTime waiverSignedDate;

  late final _is.ColumnString certifications;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime updatedAt;

  _i27uzliw.EventRegistrationTable? ___registrations;

  _is.ManyRelation<_i27uzliw.EventRegistrationTable>? _registrations;

  _ich6ygep.EventManagerTable? ___managedEvents;

  _is.ManyRelation<_ich6ygep.EventManagerTable>? _managedEvents;

  _i27uzliw.EventRegistrationTable get __registrations {
    if (___registrations != null) return ___registrations!;
    ___registrations = _is.createRelationTable(
      relationFieldName: '__registrations',
      field: Member.t.id,
      foreignField: _i27uzliw.EventRegistration.t.memberId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i27uzliw.EventRegistrationTable(tableRelation: foreignTableRelation),
    );
    return ___registrations!;
  }

  _ich6ygep.EventManagerTable get __managedEvents {
    if (___managedEvents != null) return ___managedEvents!;
    ___managedEvents = _is.createRelationTable(
      relationFieldName: '__managedEvents',
      field: Member.t.id,
      foreignField: _ich6ygep.EventManager.t.memberId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ich6ygep.EventManagerTable(tableRelation: foreignTableRelation),
    );
    return ___managedEvents!;
  }

  _is.ManyRelation<_i27uzliw.EventRegistrationTable> get registrations {
    if (_registrations != null) return _registrations!;
    var relationTable = _is.createRelationTable(
      relationFieldName: 'registrations',
      field: Member.t.id,
      foreignField: _i27uzliw.EventRegistration.t.memberId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i27uzliw.EventRegistrationTable(tableRelation: foreignTableRelation),
    );
    _registrations = _is.ManyRelation<_i27uzliw.EventRegistrationTable>(
      tableWithRelations: relationTable,
      table: _i27uzliw.EventRegistrationTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _registrations!;
  }

  _is.ManyRelation<_ich6ygep.EventManagerTable> get managedEvents {
    if (_managedEvents != null) return _managedEvents!;
    var relationTable = _is.createRelationTable(
      relationFieldName: 'managedEvents',
      field: Member.t.id,
      foreignField: _ich6ygep.EventManager.t.memberId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _ich6ygep.EventManagerTable(tableRelation: foreignTableRelation),
    );
    _managedEvents = _is.ManyRelation<_ich6ygep.EventManagerTable>(
      tableWithRelations: relationTable,
      table: _ich6ygep.EventManagerTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _managedEvents!;
  }

  @override
  List<_is.Column> get columns => [
    id,
    firstName,
    lastName,
    displayName,
    bio,
    email,
    phoneNumber,
    membershipStatus,
    emergencyContactName,
    emergencyContactPhone,
    medicalConditions,
    profileImageUrl,
    waiverSignedDate,
    certifications,
    createdAt,
    updatedAt,
  ];

  @override
  _is.Table? getRelationTable(String relationField) {
    if (relationField == 'registrations') {
      return __registrations;
    }
    if (relationField == 'managedEvents') {
      return __managedEvents;
    }
    return null;
  }
}

class MemberInclude extends _is.IncludeObject {
  MemberInclude._({
    _i27uzliw.EventRegistrationIncludeList? registrations,
    _ich6ygep.EventManagerIncludeList? managedEvents,
  }) {
    _registrations = registrations;
    _managedEvents = managedEvents;
  }

  _i27uzliw.EventRegistrationIncludeList? _registrations;

  _ich6ygep.EventManagerIncludeList? _managedEvents;

  @override
  Map<String, _is.Include?> get includes => {
    'registrations': _registrations,
    'managedEvents': _managedEvents,
  };

  @override
  _is.Table<_is.UuidValue> get table => Member.t;
}

class MemberIncludeList extends _is.IncludeList {
  MemberIncludeList._({
    _is.WhereExpressionBuilder<MemberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Member.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<_is.UuidValue> get table => Member.t;
}

class MemberRepository {
  const MemberRepository._();

  final attach = const MemberAttachRepository._();

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
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MemberTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MemberTable>? orderBy,
    _is.OrderByListBuilder<MemberTable>? orderByList,
    _is.Transaction? transaction,
    MemberInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Member>(
      where: where?.call(Member.t),
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
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
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MemberTable>? where,
    int? offset,
    _is.OrderByBuilder<MemberTable>? orderBy,
    _is.OrderByListBuilder<MemberTable>? orderByList,
    _is.Transaction? transaction,
    MemberInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Member>(
      where: where?.call(Member.t),
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      offset: offset,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Member] by its [id] or null if no such row exists.
  Future<Member?> findById(
    _is.DatabaseSession session,
    _is.UuidValue id, {
    _is.Transaction? transaction,
    MemberInclude? include,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Member>(
      id,
      transaction: transaction,
      include: include,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Member]s in the list and returns the inserted rows.
  ///
  /// The returned [Member]s will have their `id` fields set.
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
  Future<List<Member>> insert(
    _is.DatabaseSession session,
    List<Member> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Member>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Member] and returns the inserted row.
  ///
  /// The returned [Member] will have its `id` field set.
  Future<Member> insertRow(
    _is.DatabaseSession session,
    Member row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Member>(row, transaction: transaction);
  }

  /// Upserts all [Member]s in the list and returns the resulting rows.
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
  /// The returned [Member]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Member>> upsert(
    _is.DatabaseSession session,
    List<Member> rows, {
    required _is.ColumnSelections<MemberTable> conflictColumns,
    _is.ColumnSelections<MemberTable>? updateColumns,
    _is.WhereExpressionBuilder<MemberTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Member>(
      rows,
      conflictColumns: conflictColumns(Member.t),
      updateColumns: updateColumns?.call(Member.t),
      updateWhere: updateWhere?.call(Member.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Member] and returns the resulting row.
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
  /// The returned [Member] will have its `id` field set.
  Future<Member?> upsertRow(
    _is.DatabaseSession session,
    Member row, {
    required _is.ColumnSelections<MemberTable> conflictColumns,
    _is.ColumnSelections<MemberTable>? updateColumns,
    _is.WhereExpressionBuilder<MemberTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Member>(
      row,
      conflictColumns: conflictColumns(Member.t),
      updateColumns: updateColumns?.call(Member.t),
      updateWhere: updateWhere?.call(Member.t),
      transaction: transaction,
    );
  }

  /// Updates all [Member]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Member>> update(
    _is.DatabaseSession session,
    List<Member> rows, {
    _is.ColumnSelections<MemberTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Member>(
      rows,
      columns: columns?.call(Member.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Member]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Member> updateRow(
    _is.DatabaseSession session,
    Member row, {
    _is.ColumnSelections<MemberTable>? columns,
    _is.Transaction? transaction,
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
    _is.DatabaseSession session,
    _is.UuidValue id, {
    required _is.ColumnValueListBuilder<MemberUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Member>(
      id,
      columnValues: columnValues(Member.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Member]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Member>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<MemberUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<MemberTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<MemberTable>? orderBy,
    _is.OrderByListBuilder<MemberTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Member>(
      columnValues: columnValues(Member.t.updateTable),
      where: where(Member.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Member]s in the list and returns the deleted rows.
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
  Future<List<Member>> delete(
    _is.DatabaseSession session,
    List<Member> rows, {
    _is.OrderByBuilder<MemberTable>? orderBy,
    _is.OrderByListBuilder<MemberTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Member>(
      rows,
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Member].
  Future<Member> deleteRow(
    _is.DatabaseSession session,
    Member row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Member>(row, transaction: transaction);
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Member>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<MemberTable> where,
    _is.OrderByBuilder<MemberTable>? orderBy,
    _is.OrderByListBuilder<MemberTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Member>(
      where: where(Member.t),
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<MemberTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Member>(
      where: where?.call(Member.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Member] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<MemberTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Member>(
      where: where(Member.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}

class MemberAttachRepository {
  const MemberAttachRepository._();

  /// Creates a relation between this [Member] and the given [EventRegistration]s
  /// by setting each [EventRegistration]'s foreign key `memberId` to refer to this [Member].
  Future<void> registrations(
    _is.DatabaseSession session,
    Member member,
    List<_i27uzliw.EventRegistration> eventRegistration, {
    _is.Transaction? transaction,
  }) async {
    if (eventRegistration.any((e) => e.id == null)) {
      throw ArgumentError.notNull('eventRegistration.id');
    }
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    var $eventRegistration = eventRegistration
        .map((e) => e.copyWith(memberId: member.id))
        .toList();
    await session.db.update<_i27uzliw.EventRegistration>(
      $eventRegistration,
      columns: [_i27uzliw.EventRegistration.t.memberId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Member] and the given [EventManager]s
  /// by setting each [EventManager]'s foreign key `memberId` to refer to this [Member].
  Future<void> managedEvents(
    _is.DatabaseSession session,
    Member member,
    List<_ich6ygep.EventManager> eventManager, {
    _is.Transaction? transaction,
  }) async {
    if (eventManager.any((e) => e.id == null)) {
      throw ArgumentError.notNull('eventManager.id');
    }
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    var $eventManager = eventManager
        .map((e) => e.copyWith(memberId: member.id))
        .toList();
    await session.db.update<_ich6ygep.EventManager>(
      $eventManager,
      columns: [_ich6ygep.EventManager.t.memberId],
      transaction: transaction,
    );
  }
}

class MemberAttachRowRepository {
  const MemberAttachRowRepository._();

  /// Creates a relation between this [Member] and the given [EventRegistration]
  /// by setting the [EventRegistration]'s foreign key `memberId` to refer to this [Member].
  Future<void> registrations(
    _is.DatabaseSession session,
    Member member,
    _i27uzliw.EventRegistration eventRegistration, {
    _is.Transaction? transaction,
  }) async {
    if (eventRegistration.id == null) {
      throw ArgumentError.notNull('eventRegistration.id');
    }
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    var $eventRegistration = eventRegistration.copyWith(memberId: member.id);
    await session.db.updateRow<_i27uzliw.EventRegistration>(
      $eventRegistration,
      columns: [_i27uzliw.EventRegistration.t.memberId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Member] and the given [EventManager]
  /// by setting the [EventManager]'s foreign key `memberId` to refer to this [Member].
  Future<void> managedEvents(
    _is.DatabaseSession session,
    Member member,
    _ich6ygep.EventManager eventManager, {
    _is.Transaction? transaction,
  }) async {
    if (eventManager.id == null) {
      throw ArgumentError.notNull('eventManager.id');
    }
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    var $eventManager = eventManager.copyWith(memberId: member.id);
    await session.db.updateRow<_ich6ygep.EventManager>(
      $eventManager,
      columns: [_ich6ygep.EventManager.t.memberId],
      transaction: transaction,
    );
  }
}
