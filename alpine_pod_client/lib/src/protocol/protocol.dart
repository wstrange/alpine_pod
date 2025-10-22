/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'greeting.dart' as _i2;
import 'event.dart' as _i3;
import 'event_document.dart' as _i4;
import 'event_registration.dart' as _i5;
import 'event_trip_leader.dart' as _i6;
import 'event_type.dart' as _i7;
import 'notification.dart' as _i8;
import 'registration_status.dart' as _i9;
import 'section.dart' as _i10;
import 'section_membership.dart' as _i11;
import 'user.dart' as _i12;
import 'user_role.dart' as _i13;
import 'package:alpine_pod_client/src/protocol/event.dart' as _i14;
import 'package:alpine_pod_client/src/protocol/event_trip_leader.dart' as _i15;
import 'package:alpine_pod_client/src/protocol/section_membership.dart' as _i16;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i17;
export 'greeting.dart';
export 'event.dart';
export 'event_document.dart';
export 'event_registration.dart';
export 'event_trip_leader.dart';
export 'event_type.dart';
export 'notification.dart';
export 'registration_status.dart';
export 'section.dart';
export 'section_membership.dart';
export 'user.dart';
export 'user_role.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Greeting) {
      return _i2.Greeting.fromJson(data) as T;
    }
    if (t == _i3.Event) {
      return _i3.Event.fromJson(data) as T;
    }
    if (t == _i4.EventDocument) {
      return _i4.EventDocument.fromJson(data) as T;
    }
    if (t == _i5.EventRegistration) {
      return _i5.EventRegistration.fromJson(data) as T;
    }
    if (t == _i6.EventTripLeader) {
      return _i6.EventTripLeader.fromJson(data) as T;
    }
    if (t == _i7.EventType) {
      return _i7.EventType.fromJson(data) as T;
    }
    if (t == _i8.Notification) {
      return _i8.Notification.fromJson(data) as T;
    }
    if (t == _i9.RegistrationStatus) {
      return _i9.RegistrationStatus.fromJson(data) as T;
    }
    if (t == _i10.Section) {
      return _i10.Section.fromJson(data) as T;
    }
    if (t == _i11.SectionMembership) {
      return _i11.SectionMembership.fromJson(data) as T;
    }
    if (t == _i12.User) {
      return _i12.User.fromJson(data) as T;
    }
    if (t == _i13.UserRole) {
      return _i13.UserRole.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Event?>()) {
      return (data != null ? _i3.Event.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.EventDocument?>()) {
      return (data != null ? _i4.EventDocument.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.EventRegistration?>()) {
      return (data != null ? _i5.EventRegistration.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.EventTripLeader?>()) {
      return (data != null ? _i6.EventTripLeader.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.EventType?>()) {
      return (data != null ? _i7.EventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Notification?>()) {
      return (data != null ? _i8.Notification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.RegistrationStatus?>()) {
      return (data != null ? _i9.RegistrationStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Section?>()) {
      return (data != null ? _i10.Section.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.SectionMembership?>()) {
      return (data != null ? _i11.SectionMembership.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.User?>()) {
      return (data != null ? _i12.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.UserRole?>()) {
      return (data != null ? _i13.UserRole.fromJson(data) : null) as T;
    }
    if (t == List<_i14.Event>) {
      return (data as List).map((e) => deserialize<_i14.Event>(e)).toList()
          as T;
    }
    if (t == List<_i15.EventTripLeader>) {
      return (data as List)
          .map((e) => deserialize<_i15.EventTripLeader>(e))
          .toList() as T;
    }
    if (t == List<_i16.SectionMembership>) {
      return (data as List)
          .map((e) => deserialize<_i16.SectionMembership>(e))
          .toList() as T;
    }
    try {
      return _i17.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Greeting) {
      return 'Greeting';
    }
    if (data is _i3.Event) {
      return 'Event';
    }
    if (data is _i4.EventDocument) {
      return 'EventDocument';
    }
    if (data is _i5.EventRegistration) {
      return 'EventRegistration';
    }
    if (data is _i6.EventTripLeader) {
      return 'EventTripLeader';
    }
    if (data is _i7.EventType) {
      return 'EventType';
    }
    if (data is _i8.Notification) {
      return 'Notification';
    }
    if (data is _i9.RegistrationStatus) {
      return 'RegistrationStatus';
    }
    if (data is _i10.Section) {
      return 'Section';
    }
    if (data is _i11.SectionMembership) {
      return 'SectionMembership';
    }
    if (data is _i12.User) {
      return 'User';
    }
    if (data is _i13.UserRole) {
      return 'UserRole';
    }
    className = _i17.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i2.Greeting>(data['data']);
    }
    if (dataClassName == 'Event') {
      return deserialize<_i3.Event>(data['data']);
    }
    if (dataClassName == 'EventDocument') {
      return deserialize<_i4.EventDocument>(data['data']);
    }
    if (dataClassName == 'EventRegistration') {
      return deserialize<_i5.EventRegistration>(data['data']);
    }
    if (dataClassName == 'EventTripLeader') {
      return deserialize<_i6.EventTripLeader>(data['data']);
    }
    if (dataClassName == 'EventType') {
      return deserialize<_i7.EventType>(data['data']);
    }
    if (dataClassName == 'Notification') {
      return deserialize<_i8.Notification>(data['data']);
    }
    if (dataClassName == 'RegistrationStatus') {
      return deserialize<_i9.RegistrationStatus>(data['data']);
    }
    if (dataClassName == 'Section') {
      return deserialize<_i10.Section>(data['data']);
    }
    if (dataClassName == 'SectionMembership') {
      return deserialize<_i11.SectionMembership>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i12.User>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i13.UserRole>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i17.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
