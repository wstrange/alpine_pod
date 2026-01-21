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
import 'event_registration.dart' as _i3;
import 'event_manager.dart' as _i4;
import 'package:alpine_pod_client/src/protocol/protocol.dart' as _i5;

abstract class EventDetails implements _i1.SerializableModel {
  EventDetails._({
    required this.event,
    required this.registrants,
    required this.waitlist,
    required this.managers,
  });

  factory EventDetails({
    required _i2.Event event,
    required List<_i3.EventRegistration> registrants,
    required List<_i3.EventRegistration> waitlist,
    required List<_i4.EventManager> managers,
  }) = _EventDetailsImpl;

  factory EventDetails.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventDetails(
      event: _i5.Protocol().deserialize<_i2.Event>(jsonSerialization['event']),
      registrants: _i5.Protocol().deserialize<List<_i3.EventRegistration>>(
        jsonSerialization['registrants'],
      ),
      waitlist: _i5.Protocol().deserialize<List<_i3.EventRegistration>>(
        jsonSerialization['waitlist'],
      ),
      managers: _i5.Protocol().deserialize<List<_i4.EventManager>>(
        jsonSerialization['managers'],
      ),
    );
  }

  _i2.Event event;

  List<_i3.EventRegistration> registrants;

  List<_i3.EventRegistration> waitlist;

  List<_i4.EventManager> managers;

  /// Returns a shallow copy of this [EventDetails]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EventDetails copyWith({
    _i2.Event? event,
    List<_i3.EventRegistration>? registrants,
    List<_i3.EventRegistration>? waitlist,
    List<_i4.EventManager>? managers,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventDetails',
      'event': event.toJson(),
      'registrants': registrants.toJson(valueToJson: (v) => v.toJson()),
      'waitlist': waitlist.toJson(valueToJson: (v) => v.toJson()),
      'managers': managers.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _EventDetailsImpl extends EventDetails {
  _EventDetailsImpl({
    required _i2.Event event,
    required List<_i3.EventRegistration> registrants,
    required List<_i3.EventRegistration> waitlist,
    required List<_i4.EventManager> managers,
  }) : super._(
         event: event,
         registrants: registrants,
         waitlist: waitlist,
         managers: managers,
       );

  /// Returns a shallow copy of this [EventDetails]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventDetails copyWith({
    _i2.Event? event,
    List<_i3.EventRegistration>? registrants,
    List<_i3.EventRegistration>? waitlist,
    List<_i4.EventManager>? managers,
  }) {
    return EventDetails(
      event: event ?? this.event.copyWith(),
      registrants:
          registrants ?? this.registrants.map((e0) => e0.copyWith()).toList(),
      waitlist: waitlist ?? this.waitlist.map((e0) => e0.copyWith()).toList(),
      managers: managers ?? this.managers.map((e0) => e0.copyWith()).toList(),
    );
  }
}
