// ignore_for_file: unnecessary_underscores

import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../repositories/event_repository.dart';
import '../signals.dart';
import '../widgets/event_view.dart';

class EventDetailsScreen extends HookWidget {
  final UuidValue eventId;
  const EventDetailsScreen({required this.eventId, super.key});

  @override
  Widget build(BuildContext context) {
    final isOnline = isOnlineSignal.value;
    final eventRefreshCount = useState(0);

    useEffect(() {
      final subscription = currentEventsSignal.subscribe((_) {
        eventRefreshCount.value++;
      });
      return subscription;
    }, []);

    // We create a memoized future signal for this specific event ID via eventRepository.
    final eventSignal = useMemoized(
      () => futureSignal(() => eventRepository.getEvent(eventId)),
      [eventId, eventRefreshCount.value],
    );

    Future<void> register(Event event) async {
      try {
        final registration = await eventRepository.registerForEvent(
          event.id,
          event.sectionId,
        );
        if (!context.mounted) return;
        final isWaitlisted =
            registration.registrationStatus == RegistrationStatus.waitlisted;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isWaitlisted
                  ? 'Added to waitlist. A manager will review your registration.'
                  : 'Registration successful!',
            ),
            backgroundColor: isWaitlisted ? Colors.orange.shade700 : null,
          ),
        );
        currentEventsSignal.refresh();
      } catch (error) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error registering: $error')));
        }
      }
    }

    Future<void> cancelRegistration(EventRegistration registration) async {
      try {
        await eventRepository.cancelRegistration(
          registration.id!,
          registration.memberId,
        );
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration cancelled.')),
        );
        currentEventsSignal.refresh();
      } catch (error) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error cancelling registration: $error')),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.home_outlined),
            tooltip: 'Home',
            onPressed: () => GoRouter.of(context).go('/'),
          ),
        ],
      ),
      body: SignalBuilder(
        builder: (context) => eventSignal.value.map(
          data: (event) => event == null
              ? const Center(child: Text('Event not found'))
              : EventView(event: event),
          error: (err, _) => Center(child: Text('Error loading event: $err')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
      bottomNavigationBar: SignalBuilder(
        builder: (context) {
          final eventValue = eventSignal.value;
          final canCreate = canCreateEventsSignal.value;

          return eventValue.map(
            data: (event) {
              if (event == null) return const SizedBox.shrink();
              final isPast = DateTime.now().isAfter(event.endTime.toLocal());
              final currentMember = currentMemberSignal.value;
              final isEventManager =
                  currentMember != null &&
                  event.eventManagers?.any(
                        (manager) => manager.memberId == currentMember.id,
                      ) ==
                      true;
              final canEdit =
                  !isPast &&
                  (isEventManager ||
                      isSectionManagerSignal.value ||
                      isGlobalAdminSignal.value);
              final myRegistration = currentMember == null
                  ? null
                  : (event.eventRegistrations ?? [])
                        .where(
                          (registration) =>
                              registration.memberId == currentMember.id &&
                              (registration.registrationStatus ==
                                      RegistrationStatus.confirmed ||
                                  registration.registrationStatus ==
                                      RegistrationStatus.waitlisted),
                        )
                        .firstOrNull;

              if (isPast && !canCreate) return const SizedBox.shrink();

              return SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      if (canCreate)
                        OutlinedButton.icon(
                          icon: const Icon(Icons.copy),
                          label: const Text('Copy Event'),
                          onPressed: isOnline
                              ? () {
                                  final copiedManagers = [
                                    ...?event.eventManagers,
                                    if (currentMember != null &&
                                        !(event.eventManagers?.any(
                                              (manager) =>
                                                  manager.memberId ==
                                                  currentMember.id,
                                            ) ??
                                            false))
                                      EventManager(
                                        eventId: event.id,
                                        memberId: currentMember.id,
                                        member: currentMember,
                                      ),
                                  ];
                                  final clonedEvent = event.copyWith(
                                    id: const Uuid().v7obj(),
                                    title: 'Copy of ${event.title}',
                                    published: false,
                                    eventManagers: copiedManagers,
                                  );
                                  GoRouter.of(
                                    context,
                                  ).push('/create-event', extra: clonedEvent);
                                }
                              : null,
                        ),
                      if (canEdit)
                        FilledButton.icon(
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit Event'),
                          onPressed: isOnline
                              ? () =>
                                    GoRouter.of(context)
                                        .push('/event-edit/${event.id}')
                              : null,
                        ),
                      if (!isPast)
                        FilledButton.icon(
                          icon: Icon(
                            myRegistration == null
                                ? Icons.person_add
                                : Icons.cancel_outlined,
                          ),
                          label: Text(
                            myRegistration == null
                                ? 'Register'
                                : 'Cancel Registration',
                          ),
                          style: myRegistration == null
                              ? null
                              : FilledButton.styleFrom(
                                  backgroundColor: Colors.red.shade600,
                                ),
                          onPressed: isOnline
                              ? () => myRegistration == null
                                    ? register(event)
                                    : cancelRegistration(myRegistration)
                              : null,
                        ),
                    ],
                  ),
                ),
              );
            },
            error: (_, __) => const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
