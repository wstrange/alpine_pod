import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/event_view.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({required this.event, super.key});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              GoRouter.of(context).push('/event-details', extra: event);
            },
          ),
        ],
      ),
      body: EventView(event: event),
    );
  }
}
