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

enum EventType implements _i1.SerializableModel {
  hike,
  climb,
  ski,
  social,
  training,
  meeting,
  other;

  static EventType fromJson(int index) {
    switch (index) {
      case 0:
        return EventType.hike;
      case 1:
        return EventType.climb;
      case 2:
        return EventType.ski;
      case 3:
        return EventType.social;
      case 4:
        return EventType.training;
      case 5:
        return EventType.meeting;
      case 6:
        return EventType.other;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "EventType"');
    }
  }

  @override
  int toJson() => index;
  @override
  String toString() => name;
}
