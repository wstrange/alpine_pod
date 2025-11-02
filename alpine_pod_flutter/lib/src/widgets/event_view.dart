import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';

class EventView extends StatelessWidget {
  const EventView({required this.event, super.key});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(event.title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(event.description),
          const SizedBox(height: 8),
          Text('Starts: ${event.startTime}'),
          Text('Ends: ${event.endTime}'),
          const SizedBox(height: 8),
          Text('Location: ${event.location}'),
        ],
      ),
    );
  }
}
