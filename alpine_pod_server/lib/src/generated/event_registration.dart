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
import 'registration_status.dart' as _i2;

abstract class EventRegistration
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  EventRegistration._({
    this.id,
    required this.userId,
    required this.eventId,
    required this.registrationStatus,
    required this.registrationDate,
    this.carPoolPreference,
    int? additionalGuests,
    required this.waiverAccepted,
    this.participantNotes,
    this.waitlistPosition,
    this.waitlistedAt,
    String? paymentStatus,
    double? paymentAmount,
    required this.modifiedAt,
    bool? noShow,
  }) : additionalGuests = additionalGuests ?? 0,
       paymentStatus = paymentStatus ?? 'N/A',
       paymentAmount = paymentAmount ?? 0.0,
       noShow = noShow ?? false;

  factory EventRegistration({
    int? id,
    required _i1.UuidValue userId,
    required int eventId,
    required _i2.RegistrationStatus registrationStatus,
    required DateTime registrationDate,
    String? carPoolPreference,
    int? additionalGuests,
    required bool waiverAccepted,
    String? participantNotes,
    int? waitlistPosition,
    DateTime? waitlistedAt,
    String? paymentStatus,
    double? paymentAmount,
    required DateTime modifiedAt,
    bool? noShow,
  }) = _EventRegistrationImpl;

  factory EventRegistration.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventRegistration(
      id: jsonSerialization['id'] as int?,
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      eventId: jsonSerialization['eventId'] as int,
      registrationStatus: _i2.RegistrationStatus.fromJson(
        (jsonSerialization['registrationStatus'] as String),
      ),
      registrationDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['registrationDate'],
      ),
      carPoolPreference: jsonSerialization['carPoolPreference'] as String?,
      additionalGuests: jsonSerialization['additionalGuests'] as int?,
      waiverAccepted: jsonSerialization['waiverAccepted'] as bool,
      participantNotes: jsonSerialization['participantNotes'] as String?,
      waitlistPosition: jsonSerialization['waitlistPosition'] as int?,
      waitlistedAt: jsonSerialization['waitlistedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['waitlistedAt'],
            ),
      paymentStatus: jsonSerialization['paymentStatus'] as String?,
      paymentAmount: (jsonSerialization['paymentAmount'] as num?)?.toDouble(),
      modifiedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['modifiedAt'],
      ),
      noShow: jsonSerialization['noShow'] as bool?,
    );
  }

  static final t = EventRegistrationTable();

  static const db = EventRegistrationRepository._();

  @override
  int? id;

  _i1.UuidValue userId;

  int eventId;

  _i2.RegistrationStatus registrationStatus;

  DateTime registrationDate;

  String? carPoolPreference;

  int additionalGuests;

  bool waiverAccepted;

  String? participantNotes;

  int? waitlistPosition;

  DateTime? waitlistedAt;

  String paymentStatus;

  double paymentAmount;

  DateTime modifiedAt;

  bool noShow;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [EventRegistration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EventRegistration copyWith({
    int? id,
    _i1.UuidValue? userId,
    int? eventId,
    _i2.RegistrationStatus? registrationStatus,
    DateTime? registrationDate,
    String? carPoolPreference,
    int? additionalGuests,
    bool? waiverAccepted,
    String? participantNotes,
    int? waitlistPosition,
    DateTime? waitlistedAt,
    String? paymentStatus,
    double? paymentAmount,
    DateTime? modifiedAt,
    bool? noShow,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventRegistration',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      'eventId': eventId,
      'registrationStatus': registrationStatus.toJson(),
      'registrationDate': registrationDate.toJson(),
      if (carPoolPreference != null) 'carPoolPreference': carPoolPreference,
      'additionalGuests': additionalGuests,
      'waiverAccepted': waiverAccepted,
      if (participantNotes != null) 'participantNotes': participantNotes,
      if (waitlistPosition != null) 'waitlistPosition': waitlistPosition,
      if (waitlistedAt != null) 'waitlistedAt': waitlistedAt?.toJson(),
      'paymentStatus': paymentStatus,
      'paymentAmount': paymentAmount,
      'modifiedAt': modifiedAt.toJson(),
      'noShow': noShow,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EventRegistration',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      'eventId': eventId,
      'registrationStatus': registrationStatus.toJson(),
      'registrationDate': registrationDate.toJson(),
      if (carPoolPreference != null) 'carPoolPreference': carPoolPreference,
      'additionalGuests': additionalGuests,
      'waiverAccepted': waiverAccepted,
      if (participantNotes != null) 'participantNotes': participantNotes,
      if (waitlistPosition != null) 'waitlistPosition': waitlistPosition,
      if (waitlistedAt != null) 'waitlistedAt': waitlistedAt?.toJson(),
      'paymentStatus': paymentStatus,
      'paymentAmount': paymentAmount,
      'modifiedAt': modifiedAt.toJson(),
      'noShow': noShow,
    };
  }

  static EventRegistrationInclude include() {
    return EventRegistrationInclude._();
  }

  static EventRegistrationIncludeList includeList({
    _i1.WhereExpressionBuilder<EventRegistrationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventRegistrationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventRegistrationTable>? orderByList,
    EventRegistrationInclude? include,
  }) {
    return EventRegistrationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventRegistration.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(EventRegistration.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventRegistrationImpl extends EventRegistration {
  _EventRegistrationImpl({
    int? id,
    required _i1.UuidValue userId,
    required int eventId,
    required _i2.RegistrationStatus registrationStatus,
    required DateTime registrationDate,
    String? carPoolPreference,
    int? additionalGuests,
    required bool waiverAccepted,
    String? participantNotes,
    int? waitlistPosition,
    DateTime? waitlistedAt,
    String? paymentStatus,
    double? paymentAmount,
    required DateTime modifiedAt,
    bool? noShow,
  }) : super._(
         id: id,
         userId: userId,
         eventId: eventId,
         registrationStatus: registrationStatus,
         registrationDate: registrationDate,
         carPoolPreference: carPoolPreference,
         additionalGuests: additionalGuests,
         waiverAccepted: waiverAccepted,
         participantNotes: participantNotes,
         waitlistPosition: waitlistPosition,
         waitlistedAt: waitlistedAt,
         paymentStatus: paymentStatus,
         paymentAmount: paymentAmount,
         modifiedAt: modifiedAt,
         noShow: noShow,
       );

  /// Returns a shallow copy of this [EventRegistration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventRegistration copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userId,
    int? eventId,
    _i2.RegistrationStatus? registrationStatus,
    DateTime? registrationDate,
    Object? carPoolPreference = _Undefined,
    int? additionalGuests,
    bool? waiverAccepted,
    Object? participantNotes = _Undefined,
    Object? waitlistPosition = _Undefined,
    Object? waitlistedAt = _Undefined,
    String? paymentStatus,
    double? paymentAmount,
    DateTime? modifiedAt,
    bool? noShow,
  }) {
    return EventRegistration(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      eventId: eventId ?? this.eventId,
      registrationStatus: registrationStatus ?? this.registrationStatus,
      registrationDate: registrationDate ?? this.registrationDate,
      carPoolPreference: carPoolPreference is String?
          ? carPoolPreference
          : this.carPoolPreference,
      additionalGuests: additionalGuests ?? this.additionalGuests,
      waiverAccepted: waiverAccepted ?? this.waiverAccepted,
      participantNotes: participantNotes is String?
          ? participantNotes
          : this.participantNotes,
      waitlistPosition: waitlistPosition is int?
          ? waitlistPosition
          : this.waitlistPosition,
      waitlistedAt: waitlistedAt is DateTime?
          ? waitlistedAt
          : this.waitlistedAt,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paymentAmount: paymentAmount ?? this.paymentAmount,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      noShow: noShow ?? this.noShow,
    );
  }
}

class EventRegistrationUpdateTable
    extends _i1.UpdateTable<EventRegistrationTable> {
  EventRegistrationUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<int, int> eventId(int value) => _i1.ColumnValue(
    table.eventId,
    value,
  );

  _i1.ColumnValue<_i2.RegistrationStatus, _i2.RegistrationStatus>
  registrationStatus(_i2.RegistrationStatus value) => _i1.ColumnValue(
    table.registrationStatus,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> registrationDate(DateTime value) =>
      _i1.ColumnValue(
        table.registrationDate,
        value,
      );

  _i1.ColumnValue<String, String> carPoolPreference(String? value) =>
      _i1.ColumnValue(
        table.carPoolPreference,
        value,
      );

  _i1.ColumnValue<int, int> additionalGuests(int value) => _i1.ColumnValue(
    table.additionalGuests,
    value,
  );

  _i1.ColumnValue<bool, bool> waiverAccepted(bool value) => _i1.ColumnValue(
    table.waiverAccepted,
    value,
  );

  _i1.ColumnValue<String, String> participantNotes(String? value) =>
      _i1.ColumnValue(
        table.participantNotes,
        value,
      );

  _i1.ColumnValue<int, int> waitlistPosition(int? value) => _i1.ColumnValue(
    table.waitlistPosition,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> waitlistedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.waitlistedAt,
        value,
      );

  _i1.ColumnValue<String, String> paymentStatus(String value) =>
      _i1.ColumnValue(
        table.paymentStatus,
        value,
      );

  _i1.ColumnValue<double, double> paymentAmount(double value) =>
      _i1.ColumnValue(
        table.paymentAmount,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> modifiedAt(DateTime value) =>
      _i1.ColumnValue(
        table.modifiedAt,
        value,
      );

  _i1.ColumnValue<bool, bool> noShow(bool value) => _i1.ColumnValue(
    table.noShow,
    value,
  );
}

class EventRegistrationTable extends _i1.Table<int?> {
  EventRegistrationTable({super.tableRelation})
    : super(tableName: 'event_registrations') {
    updateTable = EventRegistrationUpdateTable(this);
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    eventId = _i1.ColumnInt(
      'eventId',
      this,
    );
    registrationStatus = _i1.ColumnEnum(
      'registrationStatus',
      this,
      _i1.EnumSerialization.byName,
    );
    registrationDate = _i1.ColumnDateTime(
      'registrationDate',
      this,
    );
    carPoolPreference = _i1.ColumnString(
      'carPoolPreference',
      this,
    );
    additionalGuests = _i1.ColumnInt(
      'additionalGuests',
      this,
      hasDefault: true,
    );
    waiverAccepted = _i1.ColumnBool(
      'waiverAccepted',
      this,
    );
    participantNotes = _i1.ColumnString(
      'participantNotes',
      this,
    );
    waitlistPosition = _i1.ColumnInt(
      'waitlistPosition',
      this,
    );
    waitlistedAt = _i1.ColumnDateTime(
      'waitlistedAt',
      this,
    );
    paymentStatus = _i1.ColumnString(
      'paymentStatus',
      this,
      hasDefault: true,
    );
    paymentAmount = _i1.ColumnDouble(
      'paymentAmount',
      this,
      hasDefault: true,
    );
    modifiedAt = _i1.ColumnDateTime(
      'modifiedAt',
      this,
    );
    noShow = _i1.ColumnBool(
      'noShow',
      this,
      hasDefault: true,
    );
  }

  late final EventRegistrationUpdateTable updateTable;

  late final _i1.ColumnUuid userId;

  late final _i1.ColumnInt eventId;

  late final _i1.ColumnEnum<_i2.RegistrationStatus> registrationStatus;

  late final _i1.ColumnDateTime registrationDate;

  late final _i1.ColumnString carPoolPreference;

  late final _i1.ColumnInt additionalGuests;

  late final _i1.ColumnBool waiverAccepted;

  late final _i1.ColumnString participantNotes;

  late final _i1.ColumnInt waitlistPosition;

  late final _i1.ColumnDateTime waitlistedAt;

  late final _i1.ColumnString paymentStatus;

  late final _i1.ColumnDouble paymentAmount;

  late final _i1.ColumnDateTime modifiedAt;

  late final _i1.ColumnBool noShow;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    eventId,
    registrationStatus,
    registrationDate,
    carPoolPreference,
    additionalGuests,
    waiverAccepted,
    participantNotes,
    waitlistPosition,
    waitlistedAt,
    paymentStatus,
    paymentAmount,
    modifiedAt,
    noShow,
  ];
}

class EventRegistrationInclude extends _i1.IncludeObject {
  EventRegistrationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => EventRegistration.t;
}

class EventRegistrationIncludeList extends _i1.IncludeList {
  EventRegistrationIncludeList._({
    _i1.WhereExpressionBuilder<EventRegistrationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EventRegistration.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => EventRegistration.t;
}

class EventRegistrationRepository {
  const EventRegistrationRepository._();

  /// Returns a list of [EventRegistration]s matching the given query parameters.
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
  Future<List<EventRegistration>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventRegistrationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventRegistrationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventRegistrationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<EventRegistration>(
      where: where?.call(EventRegistration.t),
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [EventRegistration] matching the given query parameters.
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
  Future<EventRegistration?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventRegistrationTable>? where,
    int? offset,
    _i1.OrderByBuilder<EventRegistrationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventRegistrationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<EventRegistration>(
      where: where?.call(EventRegistration.t),
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [EventRegistration] by its [id] or null if no such row exists.
  Future<EventRegistration?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<EventRegistration>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [EventRegistration]s in the list and returns the inserted rows.
  ///
  /// The returned [EventRegistration]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<EventRegistration>> insert(
    _i1.Session session,
    List<EventRegistration> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<EventRegistration>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [EventRegistration] and returns the inserted row.
  ///
  /// The returned [EventRegistration] will have its `id` field set.
  Future<EventRegistration> insertRow(
    _i1.Session session,
    EventRegistration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<EventRegistration>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [EventRegistration]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<EventRegistration>> update(
    _i1.Session session,
    List<EventRegistration> rows, {
    _i1.ColumnSelections<EventRegistrationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<EventRegistration>(
      rows,
      columns: columns?.call(EventRegistration.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EventRegistration]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EventRegistration> updateRow(
    _i1.Session session,
    EventRegistration row, {
    _i1.ColumnSelections<EventRegistrationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<EventRegistration>(
      row,
      columns: columns?.call(EventRegistration.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EventRegistration] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<EventRegistration?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<EventRegistrationUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<EventRegistration>(
      id,
      columnValues: columnValues(EventRegistration.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [EventRegistration]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<EventRegistration>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<EventRegistrationUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<EventRegistrationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventRegistrationTable>? orderBy,
    _i1.OrderByListBuilder<EventRegistrationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<EventRegistration>(
      columnValues: columnValues(EventRegistration.t.updateTable),
      where: where(EventRegistration.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [EventRegistration]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<EventRegistration>> delete(
    _i1.Session session,
    List<EventRegistration> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EventRegistration>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [EventRegistration].
  Future<EventRegistration> deleteRow(
    _i1.Session session,
    EventRegistration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EventRegistration>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<EventRegistration>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EventRegistrationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<EventRegistration>(
      where: where(EventRegistration.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EventRegistrationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EventRegistration>(
      where: where?.call(EventRegistration.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
