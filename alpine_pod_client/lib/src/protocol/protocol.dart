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
import 'event_registration.dart' as _i4;
import 'notification.dart' as _i5;
import 'section.dart' as _i6;
import 'section_membership.dart' as _i7;
import 'user.dart' as _i8;
import 'user_role.dart' as _i9;
export 'greeting.dart';
export 'event.dart';
export 'event_registration.dart';
export 'notification.dart';
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
    if (t == _i4.EventRegistration) {
      return _i4.EventRegistration.fromJson(data) as T;
    }
    if (t == _i5.Notification) {
      return _i5.Notification.fromJson(data) as T;
    }
    if (t == _i6.Section) {
      return _i6.Section.fromJson(data) as T;
    }
    if (t == _i7.SectionMembership) {
      return _i7.SectionMembership.fromJson(data) as T;
    }
    if (t == _i8.User) {
      return _i8.User.fromJson(data) as T;
    }
    if (t == _i9.UserRole) {
      return _i9.UserRole.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Event?>()) {
      return (data != null ? _i3.Event.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.EventRegistration?>()) {
      return (data != null ? _i4.EventRegistration.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Notification?>()) {
      return (data != null ? _i5.Notification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Section?>()) {
      return (data != null ? _i6.Section.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.SectionMembership?>()) {
      return (data != null ? _i7.SectionMembership.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.User?>()) {
      return (data != null ? _i8.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.UserRole?>()) {
      return (data != null ? _i9.UserRole.fromJson(data) : null) as T;
    }
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
    if (data is _i4.EventRegistration) {
      return 'EventRegistration';
    }
    if (data is _i5.Notification) {
      return 'Notification';
    }
    if (data is _i6.Section) {
      return 'Section';
    }
    if (data is _i7.SectionMembership) {
      return 'SectionMembership';
    }
    if (data is _i8.User) {
      return 'User';
    }
    if (data is _i9.UserRole) {
      return 'UserRole';
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
    if (dataClassName == 'EventRegistration') {
      return deserialize<_i4.EventRegistration>(data['data']);
    }
    if (dataClassName == 'Notification') {
      return deserialize<_i5.Notification>(data['data']);
    }
    if (dataClassName == 'Section') {
      return deserialize<_i6.Section>(data['data']);
    }
    if (dataClassName == 'SectionMembership') {
      return deserialize<_i7.SectionMembership>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i8.User>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i9.UserRole>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
