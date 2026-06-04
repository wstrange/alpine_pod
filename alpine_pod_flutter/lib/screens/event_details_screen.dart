// ignore_for_file: unnecessary_underscores

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
    final eventSignal = useMemoized(() => futureSignal(() => client.event.getEvent(eventId)), [eventId]);

    return Scaffold(
      appBar: AppBar(
        // title: const Text('${eventValue.}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home_outlined),
            tooltip: 'Home',
            onPressed: () => GoRouter.of(context).go('/'),
          ),
          // Use SignalBuilder to reactively read all needed signals
          SignalBuilder(
            builder: (context) {
              final eventValue = eventSignal.value;
              final canCreate = canCreateEventsSignal.value;

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...eventValue.map(
                    data: (event) {
                      final isPast = DateTime.now().isAfter(event.endTime.toLocal());
                      final currentMember = currentMemberSignal.value;

                      final isEventManager =
                          currentMember != null &&
                          event.eventManagers?.any((m) => m.memberId == currentMember.id) == true;

                      final isSectionManager = isSectionManagerSignal.value;
                      final isGlobalAdmin = isGlobalAdminSignal.value;

                      final canEdit = !isPast && (isEventManager || isSectionManager || isGlobalAdmin);

                      return [
                        if (canCreate)
                          IconButton(
                            icon: const Icon(Icons.copy),
                            tooltip: 'Copy Event',
                            onPressed: () {
                              final clonedEvent = event.copyWith(
                                id: null,
                                title: 'Copy of ${event.title}',
                                published: false,
                              );
                              GoRouter.of(context).push('/create-event', extra: clonedEvent);
                            },
                          ),
                        if (canEdit)
                          IconButton(
                            icon: const Icon(Icons.edit),
                            tooltip: 'Edit Event',
                            onPressed: () {
                              GoRouter.of(context).push('/event-edit/${event.id}');
                            },
                          ),
                      ];
                    },
                    error: (_, __) => [],
                    loading: () => [],
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: SignalBuilder(
        builder: (context) => eventSignal.value.map(
          data: (event) => EventView(event: event),
          error: (err, _) => Center(child: Text('Error loading event: $err')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
