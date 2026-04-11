import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../signals.dart';
import '../widgets/event_view.dart';

class EventDetailsScreen extends HookWidget {
  const EventDetailsScreen({required this.eventId, super.key});

  final int eventId;

  @override
  Widget build(BuildContext context) {
    // We create a memoized future signal for this specific event ID.
    final eventSignal = useMemoized(
      () => futureSignal(() => client.event.getEvent(eventId)),
      [eventId],
    );

    final eventValue = eventSignal.watch(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
        actions: eventValue.map(
          data: (event) => [
            IconButton(
              icon: const Icon(Icons.copy),
              tooltip: 'Copy Event',
              onPressed: () {
                final clonedEvent = event.copyWith(
                  id: null,
                  title: 'Copy of ${event.title}',
                );
                GoRouter.of(context).push('/create-event', extra: clonedEvent);
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                GoRouter.of(context).push('/event-edit/${event.id}');
              },
            ),
          ],
          error: (_, __) => [],
          loading: () => [],
        ),
      ),
      body: eventValue.map(
        data: (event) => EventView(event: event),
        error: (err, _) => Center(child: Text('Error loading event: $err')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
