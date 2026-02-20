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
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'event.dart' as _i2;
import 'event_details.dart' as _i3;
import 'event_document.dart' as _i4;
import 'event_manager.dart' as _i5;
import 'event_registration.dart' as _i6;
import 'event_type.dart' as _i7;
import 'member.dart' as _i8;
import 'notification.dart' as _i9;
import 'registration_status.dart' as _i10;
import 'section.dart' as _i11;
import 'section_membership.dart' as _i12;
import 'package:alpine_pod_client/src/protocol/section.dart' as _i13;
import 'package:alpine_pod_client/src/protocol/event.dart' as _i14;
import 'package:alpine_pod_client/src/protocol/event_manager.dart' as _i15;
import 'package:alpine_pod_client/src/protocol/member.dart' as _i16;
import 'package:alpine_pod_client/src/protocol/event_registration.dart' as _i17;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i18;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i19;
export 'event.dart';
export 'event_details.dart';
export 'event_document.dart';
export 'event_manager.dart';
export 'event_registration.dart';
export 'event_type.dart';
export 'member.dart';
export 'notification.dart';
export 'registration_status.dart';
export 'section.dart';
export 'section_membership.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.Event) {
      return _i2.Event.fromJson(data) as T;
    }
    if (t == _i3.EventDetails) {
      return _i3.EventDetails.fromJson(data) as T;
    }
    if (t == _i4.EventDocument) {
      return _i4.EventDocument.fromJson(data) as T;
    }
    if (t == _i5.EventManager) {
      return _i5.EventManager.fromJson(data) as T;
    }
    if (t == _i6.EventRegistration) {
      return _i6.EventRegistration.fromJson(data) as T;
    }
    if (t == _i7.EventType) {
      return _i7.EventType.fromJson(data) as T;
    }
    if (t == _i8.Member) {
      return _i8.Member.fromJson(data) as T;
    }
    if (t == _i9.Notification) {
      return _i9.Notification.fromJson(data) as T;
    }
    if (t == _i10.RegistrationStatus) {
      return _i10.RegistrationStatus.fromJson(data) as T;
    }
    if (t == _i11.Section) {
      return _i11.Section.fromJson(data) as T;
    }
    if (t == _i12.SectionMembership) {
      return _i12.SectionMembership.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Event?>()) {
      return (data != null ? _i2.Event.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.EventDetails?>()) {
      return (data != null ? _i3.EventDetails.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.EventDocument?>()) {
      return (data != null ? _i4.EventDocument.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.EventManager?>()) {
      return (data != null ? _i5.EventManager.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.EventRegistration?>()) {
      return (data != null ? _i6.EventRegistration.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.EventType?>()) {
      return (data != null ? _i7.EventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Member?>()) {
      return (data != null ? _i8.Member.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Notification?>()) {
      return (data != null ? _i9.Notification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.RegistrationStatus?>()) {
      return (data != null ? _i10.RegistrationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i11.Section?>()) {
      return (data != null ? _i11.Section.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.SectionMembership?>()) {
      return (data != null ? _i12.SectionMembership.fromJson(data) : null) as T;
    }
    if (t == List<_i6.EventRegistration>) {
      return (data as List)
              .map((e) => deserialize<_i6.EventRegistration>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i6.EventRegistration>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i6.EventRegistration>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i5.EventManager>) {
      return (data as List)
              .map((e) => deserialize<_i5.EventManager>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i5.EventManager>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i5.EventManager>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == Set<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toSet() as T;
    }
    if (t == List<_i13.Section>) {
      return (data as List).map((e) => deserialize<_i13.Section>(e)).toList()
          as T;
    }
    if (t == List<_i14.Event>) {
      return (data as List).map((e) => deserialize<_i14.Event>(e)).toList()
          as T;
    }
    if (t == List<_i15.EventManager>) {
      return (data as List)
              .map((e) => deserialize<_i15.EventManager>(e))
              .toList()
          as T;
    }
    if (t == List<_i16.Member>) {
      return (data as List).map((e) => deserialize<_i16.Member>(e)).toList()
          as T;
    }
    if (t == List<_i17.EventRegistration>) {
      return (data as List)
              .map((e) => deserialize<_i17.EventRegistration>(e))
              .toList()
          as T;
    }
    try {
      return _i18.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i19.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Event => 'Event',
      _i3.EventDetails => 'EventDetails',
      _i4.EventDocument => 'EventDocument',
      _i5.EventManager => 'EventManager',
      _i6.EventRegistration => 'EventRegistration',
      _i7.EventType => 'EventType',
      _i8.Member => 'Member',
      _i9.Notification => 'Notification',
      _i10.RegistrationStatus => 'RegistrationStatus',
      _i11.Section => 'Section',
      _i12.SectionMembership => 'SectionMembership',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('alpine_pod.', '');
    }

    switch (data) {
      case _i2.Event():
        return 'Event';
      case _i3.EventDetails():
        return 'EventDetails';
      case _i4.EventDocument():
        return 'EventDocument';
      case _i5.EventManager():
        return 'EventManager';
      case _i6.EventRegistration():
        return 'EventRegistration';
      case _i7.EventType():
        return 'EventType';
      case _i8.Member():
        return 'Member';
      case _i9.Notification():
        return 'Notification';
      case _i10.RegistrationStatus():
        return 'RegistrationStatus';
      case _i11.Section():
        return 'Section';
      case _i12.SectionMembership():
        return 'SectionMembership';
    }
    className = _i18.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i19.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Event') {
      return deserialize<_i2.Event>(data['data']);
    }
    if (dataClassName == 'EventDetails') {
      return deserialize<_i3.EventDetails>(data['data']);
    }
    if (dataClassName == 'EventDocument') {
      return deserialize<_i4.EventDocument>(data['data']);
    }
    if (dataClassName == 'EventManager') {
      return deserialize<_i5.EventManager>(data['data']);
    }
    if (dataClassName == 'EventRegistration') {
      return deserialize<_i6.EventRegistration>(data['data']);
    }
    if (dataClassName == 'EventType') {
      return deserialize<_i7.EventType>(data['data']);
    }
    if (dataClassName == 'Member') {
      return deserialize<_i8.Member>(data['data']);
    }
    if (dataClassName == 'Notification') {
      return deserialize<_i9.Notification>(data['data']);
    }
    if (dataClassName == 'RegistrationStatus') {
      return deserialize<_i10.RegistrationStatus>(data['data']);
    }
    if (dataClassName == 'Section') {
      return deserialize<_i11.Section>(data['data']);
    }
    if (dataClassName == 'SectionMembership') {
      return deserialize<_i12.SectionMembership>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i18.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i19.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i18.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i19.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
