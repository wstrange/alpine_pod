import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:signals_flutter/signals_flutter.dart';
import '../signals.dart';
import '../util.dart';
import 'event_participants_manager.dart';
import 'location_widget.dart';
import 'user_list_widget.dart';

class EventView extends HookWidget {
  const EventView({required this.event, super.key});

  final Event event;

  @override
  Widget build(BuildContext context) {
    // A single counter that drives re-fetches of the event details.
    // Incremented both by the onRefresh callback (local actions) and whenever
    // currentEventsSignal emits a new value (global list refresh).
    final refreshCount = useState(0);

    // Subscribe to currentEventsSignal: each time it emits a new value,
    // bump refreshCount so useMemoized picks it up on the next build.
    useEffect(() {
      final sub = currentEventsSignal.subscribe((_) {
        refreshCount.value++;
      });
      return sub; // dispose
    }, []);

    // Fetch full event details (registrations, managers)
    final detailsFuture = useMemoized(
      () => client.event.getEvent(event.id!),
      [event.id, refreshCount.value],
    );

    final snapshot = useFuture(detailsFuture);

    final memberState = currentMemberSignal.watch(context);
    final currentMember = memberState is AsyncData ? memberState.value : null;

    Future<void> register() async {
      try {
        final reg = await client.event.registerForEvent(event.id!);
        if (context.mounted) {
          final isWaitlisted =
              reg.registrationStatus == RegistrationStatus.waitlisted;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(isWaitlisted
                  ? 'Added to waitlist. A manager will review your registration.'
                  : 'Registration successful!'),
              backgroundColor: isWaitlisted ? Colors.orange.shade700 : null,
            ),
          );
          // Refresh global list; the useEffect subscription will bump refreshCount
          currentEventsSignal.refresh();
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error registering: $e')),
          );
        }
      }
    }

    Future<void> cancelRegistration(int registrationId) async {
      try {
        await client.registration.cancelRegistration(registrationId);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration cancelled.')),
          );
          // Refresh global list; the useEffect subscription will bump refreshCount
          currentEventsSignal.refresh();
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error cancelling registration: $e')),
          );
        }
      }
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Builder(builder: (context) {
            // Use the refreshed event when available so edits are reflected
            final displayEvent = snapshot.data ?? event;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(displayEvent.title,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    displayEvent.type,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(formatEventRange(displayEvent.startTime, displayEvent.endTime),
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Builder(
                  builder: (context) {
                    final style = Theme.of(context).textTheme.bodyMedium!;
                    final lineHeight = style.fontSize! * (style.height ?? 1.2);
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 15 * lineHeight,
                        minHeight: 3 * lineHeight,
                      ),
                      child: SingleChildScrollView(
                        child: Text(displayEvent.description),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                if (displayEvent.eventLocation != null &&
                    displayEvent.eventLocation!.isNotEmpty)
                  LocationWidget(location: displayEvent.eventLocation!),
                if (displayEvent.carpoolLocation != null &&
                    displayEvent.carpoolLocation!.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.directions_car_outlined,
                          size: 16,
                          color: Theme.of(context).colorScheme.secondary),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Carpool meet:',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary,
                                    fontWeight: FontWeight.w600)),
                            if (displayEvent.carpoolTime != null)
                              Text(
                                eventDateFormat(displayEvent.carpoolTime!),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                            LocationWidget(
                                location: displayEvent.carpoolLocation!),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            );
          }),
          const Divider(),
          if (snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasData)
            const Center(child: CircularProgressIndicator())
          else if (snapshot.hasError)
            Text('Error loading event details: ${snapshot.error}')
          else if (snapshot.hasData)
            Builder(builder: (context) {
              final detailedEvent = snapshot.data!;
              final confirmed = detailedEvent.eventRegistrations
                      ?.where((r) =>
                          r.registrationStatus == RegistrationStatus.confirmed)
                      .toList() ??
                  [];
              final waitlisted = detailedEvent.eventRegistrations
                      ?.where((r) =>
                          r.registrationStatus == RegistrationStatus.waitlisted)
                      .toList() ??
                  [];
              final managers = detailedEvent.eventManagers ?? [];

              final myRegistration = currentMember == null
                  ? null
                  : [...confirmed, ...waitlisted]
                      .where((r) => r.memberId == currentMember.id)
                      .firstOrNull;
              final isRegistered = myRegistration != null;

              // Owner check: current user appears in the event managers list
              final isOwner = currentMember != null &&
                  managers.any((m) => m.memberId == currentMember.id);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Registration Stats
                  Card(
                    color: Colors.blue.shade50,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Icon(Icons.people, color: Colors.blue),
                              const SizedBox(height: 4),
                              Text(
                                '${confirmed.length} / ${event.maxParticipants}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const Text('Registered',
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          if (event.requiresApproval)
                            Column(
                              children: [
                                const Icon(Icons.hourglass_empty,
                                    color: Colors.orange),
                                const SizedBox(height: 4),
                                Text(
                                  '${waitlisted.length}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const Text('Waitlisted',
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          if ((detailedEvent.eventRegistrations?.length ?? 0) >=
                              event.maxParticipants)
                            Column(
                              children: [
                                Icon(Icons.warning, color: Colors.red.shade400),
                                const SizedBox(height: 4),
                                Text(
                                  'FULL',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.red.shade700,
                                  ),
                                ),
                                const Text('Event Status',
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: isRegistered
                          ? ElevatedButton.icon(
                              onPressed: () =>
                                  cancelRegistration(myRegistration.id!),
                              icon: const Icon(Icons.cancel_outlined),
                              label: const Text('Cancel Registration'),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 50),
                                backgroundColor: Colors.red.shade600,
                                foregroundColor: Colors.white,
                              ),
                            )
                          : ElevatedButton.icon(
                              onPressed: register,
                              icon: const Icon(Icons.person_add),
                              label: const Text('Register'),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 50),
                              ),
                            ),
                    ),
                  ),
                  if (managers.isNotEmpty) ...[
                    Text('Event Managers',
                        style: Theme.of(context).textTheme.titleMedium),
                    UserListWidget(
                      members: managers.map((m) => m.member!).toList(),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                    const SizedBox(height: 8),
                  ],
                  // Owners see the management UI; others see read-only lists
                  if (isOwner)
                    EventParticipantsManager(
                      event: detailedEvent,
                      confirmed: confirmed,
                      waitlisted: waitlisted,
                      onRefresh: () => refreshCount.value++,
                    )
                  else ...[
                    if (confirmed.isNotEmpty) ...[
                      Text('Confirmed Participants (${confirmed.length})',
                          style: Theme.of(context).textTheme.titleMedium),
                      UserListWidget(
                        members: confirmed.map((r) => r.member!).toList(),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                      const SizedBox(height: 8),
                    ],
                    if (waitlisted.isNotEmpty) ...[
                      Text('Waitlist (${waitlisted.length})',
                          style: Theme.of(context).textTheme.titleMedium),
                      UserListWidget(
                        members: waitlisted.map((r) => r.member!).toList(),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                    ],
                    if (confirmed.isEmpty &&
                        waitlisted.isEmpty &&
                        managers.isEmpty)
                      const Text('No registrations or managers yet.'),
                  ],
                ],
              );
            })
          else
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
