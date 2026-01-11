import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import '../util.dart';

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
          const SizedBox(height: 8),
          Builder(
            builder: (context) {
              final style = Theme.of(context).textTheme.bodyMedium!;
              final lineHeight = style.fontSize! * (style.height ?? 1.2);
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 30 * lineHeight,
                  minHeight: 5 * lineHeight,
                ),
                child: SingleChildScrollView(
                  child: Text(event.description),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          Text('Starts: ${eventDateFormat(event.startTime)}'),
          Text('Ends: ${eventDateFormat(event.endTime)}'),
          const SizedBox(height: 8),
          Text('Location: ${event.location}'),
        ],
      ),
    );
  }
}
