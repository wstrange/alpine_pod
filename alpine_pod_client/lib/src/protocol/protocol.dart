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
import 'event_document.dart' as _i3;
import 'event_manager.dart' as _i4;
import 'event_registration.dart' as _i5;
import 'member.dart' as _i6;
import 'notification.dart' as _i7;
import 'registration_status.dart' as _i8;
import 'section.dart' as _i9;
import 'section_membership.dart' as _i10;
import 'package:alpine_pod_client/src/protocol/section.dart' as _i11;
import 'package:alpine_pod_client/src/protocol/event.dart' as _i12;
import 'package:alpine_pod_client/src/protocol/event_manager.dart' as _i13;
import 'package:alpine_pod_client/src/protocol/member.dart' as _i14;
import 'package:alpine_pod_client/src/protocol/section_membership.dart' as _i15;
import 'package:alpine_pod_client/src/protocol/event_registration.dart' as _i16;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i17;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i18;
export 'event.dart';
export 'event_document.dart';
export 'event_manager.dart';
export 'event_registration.dart';
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
    if (t == _i3.EventDocument) {
      return _i3.EventDocument.fromJson(data) as T;
    }
    if (t == _i4.EventManager) {
      return _i4.EventManager.fromJson(data) as T;
    }
    if (t == _i5.EventRegistration) {
      return _i5.EventRegistration.fromJson(data) as T;
    }
    if (t == _i6.Member) {
      return _i6.Member.fromJson(data) as T;
    }
    if (t == _i7.Notification) {
      return _i7.Notification.fromJson(data) as T;
    }
    if (t == _i8.RegistrationStatus) {
      return _i8.RegistrationStatus.fromJson(data) as T;
    }
    if (t == _i9.Section) {
      return _i9.Section.fromJson(data) as T;
    }
    if (t == _i10.SectionMembership) {
      return _i10.SectionMembership.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Event?>()) {
      return (data != null ? _i2.Event.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.EventDocument?>()) {
      return (data != null ? _i3.EventDocument.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.EventManager?>()) {
      return (data != null ? _i4.EventManager.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.EventRegistration?>()) {
      return (data != null ? _i5.EventRegistration.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Member?>()) {
      return (data != null ? _i6.Member.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Notification?>()) {
      return (data != null ? _i7.Notification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.RegistrationStatus?>()) {
      return (data != null ? _i8.RegistrationStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Section?>()) {
      return (data != null ? _i9.Section.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.SectionMembership?>()) {
      return (data != null ? _i10.SectionMembership.fromJson(data) : null) as T;
    }
    if (t == List<_i5.EventRegistration>) {
      return (data as List)
              .map((e) => deserialize<_i5.EventRegistration>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i5.EventRegistration>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i5.EventRegistration>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i4.EventManager>) {
      return (data as List)
              .map((e) => deserialize<_i4.EventManager>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i4.EventManager>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i4.EventManager>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == Set<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toSet() as T;
    }
    if (t == List<_i11.Section>) {
      return (data as List).map((e) => deserialize<_i11.Section>(e)).toList()
          as T;
    }
    if (t == List<_i12.Event>) {
      return (data as List).map((e) => deserialize<_i12.Event>(e)).toList()
          as T;
    }
    if (t == List<_i13.EventManager>) {
      return (data as List)
              .map((e) => deserialize<_i13.EventManager>(e))
              .toList()
          as T;
    }
    if (t == List<_i14.Member>) {
      return (data as List).map((e) => deserialize<_i14.Member>(e)).toList()
          as T;
    }
    if (t == List<_i15.SectionMembership>) {
      return (data as List)
              .map((e) => deserialize<_i15.SectionMembership>(e))
              .toList()
          as T;
    }
    if (t == Set<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toSet() as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i16.EventRegistration>) {
      return (data as List)
              .map((e) => deserialize<_i16.EventRegistration>(e))
              .toList()
          as T;
    }
    try {
      return _i17.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i18.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Event => 'Event',
      _i3.EventDocument => 'EventDocument',
      _i4.EventManager => 'EventManager',
      _i5.EventRegistration => 'EventRegistration',
      _i6.Member => 'Member',
      _i7.Notification => 'Notification',
      _i8.RegistrationStatus => 'RegistrationStatus',
      _i9.Section => 'Section',
      _i10.SectionMembership => 'SectionMembership',
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
      case _i3.EventDocument():
        return 'EventDocument';
      case _i4.EventManager():
        return 'EventManager';
      case _i5.EventRegistration():
        return 'EventRegistration';
      case _i6.Member():
        return 'Member';
      case _i7.Notification():
        return 'Notification';
      case _i8.RegistrationStatus():
        return 'RegistrationStatus';
      case _i9.Section():
        return 'Section';
      case _i10.SectionMembership():
        return 'SectionMembership';
    }
    className = _i17.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i18.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'EventDocument') {
      return deserialize<_i3.EventDocument>(data['data']);
    }
    if (dataClassName == 'EventManager') {
      return deserialize<_i4.EventManager>(data['data']);
    }
    if (dataClassName == 'EventRegistration') {
      return deserialize<_i5.EventRegistration>(data['data']);
    }
    if (dataClassName == 'Member') {
      return deserialize<_i6.Member>(data['data']);
    }
    if (dataClassName == 'Notification') {
      return deserialize<_i7.Notification>(data['data']);
    }
    if (dataClassName == 'RegistrationStatus') {
      return deserialize<_i8.RegistrationStatus>(data['data']);
    }
    if (dataClassName == 'Section') {
      return deserialize<_i9.Section>(data['data']);
    }
    if (dataClassName == 'SectionMembership') {
      return deserialize<_i10.SectionMembership>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i17.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i18.Protocol().deserializeByClassName(data);
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
      return _i17.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i18.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
