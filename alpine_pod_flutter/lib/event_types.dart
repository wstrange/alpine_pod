import 'package:flutter/material.dart';

/// Canonical list of event type strings used for the event type dropdown
/// and any future filtering.
const List<String> eventTypes = [
  'Hike',
  'Ski',
  'Social',
  'Training',
  'Rock Cragging',
  'Mountaineering',
  'Rock Multi-Pitch',
  'Ice Climbing',
  'Presentation',
  'Other',
];

// todo: show icons. Get better icons
const Map<String, IconData> eventIcons = {
  'Hike': Icons.hiking,
  'Ski': Icons.downhill_skiing,
  'Social': Icons.people,
  'Training': Icons.school,
  'Rock Cragging': Icons.hiking,
  'Mountaineering': Icons.terrain,
  'Rock Multi-Pitch': Icons.hiking,
  'Ice Climbing': Icons.ice_skating,
  'Presentation': Icons.slideshow,
  'Other': Icons.event,
};
