import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../signals.dart';
import '../widgets/event_view.dart';

class EventDetailsScreen extends HookWidget {
  const EventDetailsScreen({required this.event, super.key});

  final Event event;

  @override
  Widget build(BuildContext context) {
    // Watch the global events signal so we get the refreshed event after edits
    final eventsValue = currentEventsSignal.watch(context);
    final freshEvent = useMemoized(() {
      if (eventsValue is AsyncData<List<Event>>) {
        return eventsValue.value.where((e) => e.id == event.id).firstOrNull;
      }
      return null;
    }, [eventsValue]);

    final displayEvent = freshEvent ?? event;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              GoRouter.of(context).push('/event-details', extra: displayEvent);
            },
          ),
        ],
      ),
      body: EventView(event: displayEvent),
    );
  }
}
