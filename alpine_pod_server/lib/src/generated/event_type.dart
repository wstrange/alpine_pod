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

enum EventType implements _i1.SerializableModel {
  hike,
  ski,
  social,
  training,
  rock_cragging,
  mountaineering,
  rock_multi_pitch,
  ice_climbing,
  presentation,
  other;

  static EventType fromJson(String name) {
    switch (name) {
      case 'hike':
        return EventType.hike;
      case 'ski':
        return EventType.ski;
      case 'social':
        return EventType.social;
      case 'training':
        return EventType.training;
      case 'rock_cragging':
        return EventType.rock_cragging;
      case 'mountaineering':
        return EventType.mountaineering;
      case 'rock_multi_pitch':
        return EventType.rock_multi_pitch;
      case 'ice_climbing':
        return EventType.ice_climbing;
      case 'presentation':
        return EventType.presentation;
      case 'other':
        return EventType.other;
      default:
        throw ArgumentError('Value "$name" cannot be converted to "EventType"');
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
