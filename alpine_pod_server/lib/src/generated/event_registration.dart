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

abstract class EventRegistration
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  EventRegistration._({
    this.id,
    this.userId,
    this.eventId,
    required this.registrationStatus,
    required this.registrationDate,
    this.carPoolPreference,
    this.numberOfPassengers,
    this.equipmentNotes,
    required this.waiverAccepted,
    this.waiverSignedDate,
    this.participantNotes,
    this.waitlistPosition,
    required this.checkedIn,
    this.checkedInTime,
    this.paymentStatus,
    this.paymentAmount,
    this.paymentDate,
    required this.modifiedAt,
  });

  factory EventRegistration({
    int? id,
    int? userId,
    int? eventId,
    required String registrationStatus,
    required DateTime registrationDate,
    String? carPoolPreference,
    int? numberOfPassengers,
    String? equipmentNotes,
    required bool waiverAccepted,
    DateTime? waiverSignedDate,
    String? participantNotes,
    int? waitlistPosition,
    required bool checkedIn,
    DateTime? checkedInTime,
    String? paymentStatus,
    double? paymentAmount,
    DateTime? paymentDate,
    required DateTime modifiedAt,
  }) = _EventRegistrationImpl;

  factory EventRegistration.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventRegistration(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int?,
      eventId: jsonSerialization['eventId'] as int?,
      registrationStatus: jsonSerialization['registrationStatus'] as String,
      registrationDate: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['registrationDate']),
      carPoolPreference: jsonSerialization['carPoolPreference'] as String?,
      numberOfPassengers: jsonSerialization['numberOfPassengers'] as int?,
      equipmentNotes: jsonSerialization['equipmentNotes'] as String?,
      waiverAccepted: jsonSerialization['waiverAccepted'] as bool,
      waiverSignedDate: jsonSerialization['waiverSignedDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['waiverSignedDate']),
      participantNotes: jsonSerialization['participantNotes'] as String?,
      waitlistPosition: jsonSerialization['waitlistPosition'] as int?,
      checkedIn: jsonSerialization['checkedIn'] as bool,
      checkedInTime: jsonSerialization['checkedInTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['checkedInTime']),
      paymentStatus: jsonSerialization['paymentStatus'] as String?,
      paymentAmount: (jsonSerialization['paymentAmount'] as num?)?.toDouble(),
      paymentDate: jsonSerialization['paymentDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['paymentDate']),
      modifiedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['modifiedAt']),
    );
  }

  static final t = EventRegistrationTable();

  static const db = EventRegistrationRepository._();

  @override
  int? id;

  int? userId;

  int? eventId;

  String registrationStatus;

  DateTime registrationDate;

  String? carPoolPreference;

  int? numberOfPassengers;

  String? equipmentNotes;

  bool waiverAccepted;

  DateTime? waiverSignedDate;

  String? participantNotes;

  int? waitlistPosition;

  bool checkedIn;

  DateTime? checkedInTime;

  String? paymentStatus;

  double? paymentAmount;

  DateTime? paymentDate;

  DateTime modifiedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [EventRegistration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EventRegistration copyWith({
    int? id,
    int? userId,
    int? eventId,
    String? registrationStatus,
    DateTime? registrationDate,
    String? carPoolPreference,
    int? numberOfPassengers,
    String? equipmentNotes,
    bool? waiverAccepted,
    DateTime? waiverSignedDate,
    String? participantNotes,
    int? waitlistPosition,
    bool? checkedIn,
    DateTime? checkedInTime,
    String? paymentStatus,
    double? paymentAmount,
    DateTime? paymentDate,
    DateTime? modifiedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      if (eventId != null) 'eventId': eventId,
      'registrationStatus': registrationStatus,
      'registrationDate': registrationDate.toJson(),
      if (carPoolPreference != null) 'carPoolPreference': carPoolPreference,
      if (numberOfPassengers != null) 'numberOfPassengers': numberOfPassengers,
      if (equipmentNotes != null) 'equipmentNotes': equipmentNotes,
      'waiverAccepted': waiverAccepted,
      if (waiverSignedDate != null)
        'waiverSignedDate': waiverSignedDate?.toJson(),
      if (participantNotes != null) 'participantNotes': participantNotes,
      if (waitlistPosition != null) 'waitlistPosition': waitlistPosition,
      'checkedIn': checkedIn,
      if (checkedInTime != null) 'checkedInTime': checkedInTime?.toJson(),
      if (paymentStatus != null) 'paymentStatus': paymentStatus,
      if (paymentAmount != null) 'paymentAmount': paymentAmount,
      if (paymentDate != null) 'paymentDate': paymentDate?.toJson(),
      'modifiedAt': modifiedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      if (eventId != null) 'eventId': eventId,
      'registrationStatus': registrationStatus,
      'registrationDate': registrationDate.toJson(),
      if (carPoolPreference != null) 'carPoolPreference': carPoolPreference,
      if (numberOfPassengers != null) 'numberOfPassengers': numberOfPassengers,
      if (equipmentNotes != null) 'equipmentNotes': equipmentNotes,
      'waiverAccepted': waiverAccepted,
      if (waiverSignedDate != null)
        'waiverSignedDate': waiverSignedDate?.toJson(),
      if (participantNotes != null) 'participantNotes': participantNotes,
      if (waitlistPosition != null) 'waitlistPosition': waitlistPosition,
      'checkedIn': checkedIn,
      if (checkedInTime != null) 'checkedInTime': checkedInTime?.toJson(),
      if (paymentStatus != null) 'paymentStatus': paymentStatus,
      if (paymentAmount != null) 'paymentAmount': paymentAmount,
      if (paymentDate != null) 'paymentDate': paymentDate?.toJson(),
      'modifiedAt': modifiedAt.toJson(),
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
    int? userId,
    int? eventId,
    required String registrationStatus,
    required DateTime registrationDate,
    String? carPoolPreference,
    int? numberOfPassengers,
    String? equipmentNotes,
    required bool waiverAccepted,
    DateTime? waiverSignedDate,
    String? participantNotes,
    int? waitlistPosition,
    required bool checkedIn,
    DateTime? checkedInTime,
    String? paymentStatus,
    double? paymentAmount,
    DateTime? paymentDate,
    required DateTime modifiedAt,
  }) : super._(
          id: id,
          userId: userId,
          eventId: eventId,
          registrationStatus: registrationStatus,
          registrationDate: registrationDate,
          carPoolPreference: carPoolPreference,
          numberOfPassengers: numberOfPassengers,
          equipmentNotes: equipmentNotes,
          waiverAccepted: waiverAccepted,
          waiverSignedDate: waiverSignedDate,
          participantNotes: participantNotes,
          waitlistPosition: waitlistPosition,
          checkedIn: checkedIn,
          checkedInTime: checkedInTime,
          paymentStatus: paymentStatus,
          paymentAmount: paymentAmount,
          paymentDate: paymentDate,
          modifiedAt: modifiedAt,
        );

  /// Returns a shallow copy of this [EventRegistration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventRegistration copyWith({
    Object? id = _Undefined,
    Object? userId = _Undefined,
    Object? eventId = _Undefined,
    String? registrationStatus,
    DateTime? registrationDate,
    Object? carPoolPreference = _Undefined,
    Object? numberOfPassengers = _Undefined,
    Object? equipmentNotes = _Undefined,
    bool? waiverAccepted,
    Object? waiverSignedDate = _Undefined,
    Object? participantNotes = _Undefined,
    Object? waitlistPosition = _Undefined,
    bool? checkedIn,
    Object? checkedInTime = _Undefined,
    Object? paymentStatus = _Undefined,
    Object? paymentAmount = _Undefined,
    Object? paymentDate = _Undefined,
    DateTime? modifiedAt,
  }) {
    return EventRegistration(
      id: id is int? ? id : this.id,
      userId: userId is int? ? userId : this.userId,
      eventId: eventId is int? ? eventId : this.eventId,
      registrationStatus: registrationStatus ?? this.registrationStatus,
      registrationDate: registrationDate ?? this.registrationDate,
      carPoolPreference: carPoolPreference is String?
          ? carPoolPreference
          : this.carPoolPreference,
      numberOfPassengers: numberOfPassengers is int?
          ? numberOfPassengers
          : this.numberOfPassengers,
      equipmentNotes:
          equipmentNotes is String? ? equipmentNotes : this.equipmentNotes,
      waiverAccepted: waiverAccepted ?? this.waiverAccepted,
      waiverSignedDate: waiverSignedDate is DateTime?
          ? waiverSignedDate
          : this.waiverSignedDate,
      participantNotes: participantNotes is String?
          ? participantNotes
          : this.participantNotes,
      waitlistPosition:
          waitlistPosition is int? ? waitlistPosition : this.waitlistPosition,
      checkedIn: checkedIn ?? this.checkedIn,
      checkedInTime:
          checkedInTime is DateTime? ? checkedInTime : this.checkedInTime,
      paymentStatus:
          paymentStatus is String? ? paymentStatus : this.paymentStatus,
      paymentAmount:
          paymentAmount is double? ? paymentAmount : this.paymentAmount,
      paymentDate: paymentDate is DateTime? ? paymentDate : this.paymentDate,
      modifiedAt: modifiedAt ?? this.modifiedAt,
    );
  }
}

class EventRegistrationTable extends _i1.Table<int?> {
  EventRegistrationTable({super.tableRelation})
      : super(tableName: 'event_registrations') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    eventId = _i1.ColumnInt(
      'eventId',
      this,
    );
    registrationStatus = _i1.ColumnString(
      'registrationStatus',
      this,
    );
    registrationDate = _i1.ColumnDateTime(
      'registrationDate',
      this,
    );
    carPoolPreference = _i1.ColumnString(
      'carPoolPreference',
      this,
    );
    numberOfPassengers = _i1.ColumnInt(
      'numberOfPassengers',
      this,
    );
    equipmentNotes = _i1.ColumnString(
      'equipmentNotes',
      this,
    );
    waiverAccepted = _i1.ColumnBool(
      'waiverAccepted',
      this,
    );
    waiverSignedDate = _i1.ColumnDateTime(
      'waiverSignedDate',
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
    checkedIn = _i1.ColumnBool(
      'checkedIn',
      this,
    );
    checkedInTime = _i1.ColumnDateTime(
      'checkedInTime',
      this,
    );
    paymentStatus = _i1.ColumnString(
      'paymentStatus',
      this,
    );
    paymentAmount = _i1.ColumnDouble(
      'paymentAmount',
      this,
    );
    paymentDate = _i1.ColumnDateTime(
      'paymentDate',
      this,
    );
    modifiedAt = _i1.ColumnDateTime(
      'modifiedAt',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  late final _i1.ColumnInt eventId;

  late final _i1.ColumnString registrationStatus;

  late final _i1.ColumnDateTime registrationDate;

  late final _i1.ColumnString carPoolPreference;

  late final _i1.ColumnInt numberOfPassengers;

  late final _i1.ColumnString equipmentNotes;

  late final _i1.ColumnBool waiverAccepted;

  late final _i1.ColumnDateTime waiverSignedDate;

  late final _i1.ColumnString participantNotes;

  late final _i1.ColumnInt waitlistPosition;

  late final _i1.ColumnBool checkedIn;

  late final _i1.ColumnDateTime checkedInTime;

  late final _i1.ColumnString paymentStatus;

  late final _i1.ColumnDouble paymentAmount;

  late final _i1.ColumnDateTime paymentDate;

  late final _i1.ColumnDateTime modifiedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        eventId,
        registrationStatus,
        registrationDate,
        carPoolPreference,
        numberOfPassengers,
        equipmentNotes,
        waiverAccepted,
        waiverSignedDate,
        participantNotes,
        waitlistPosition,
        checkedIn,
        checkedInTime,
        paymentStatus,
        paymentAmount,
        paymentDate,
        modifiedAt,
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
