import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:signals_flutter/signals_flutter.dart';
import '../signals.dart';
import '../util.dart';
import 'user_list_widget.dart';

class EventView extends HookWidget {
  const EventView({required this.event, super.key});

  final Event event;

  @override
  Widget build(BuildContext context) {
    // Watch currentEventsSignal to trigger rebuilds when the list might have changed
    // (e.g., registrations count update, event edit)
    currentEventsSignal.watch(context);

    // Fetch full event details (registrations, managers)
    // We re-fetch whenever currentEventsSignal updates OR if the event id changes.
    final requestCount = useState(0);

    final detailsFuture = useMemoized(
      () => client.event.getEvent(event.id!),
      [event.id, requestCount.value, currentEventsSignal.value],
    );

    final snapshot = useFuture(detailsFuture);

    final memberState = currentMemberSignal.watch(context);
    final currentMember = memberState is AsyncData ? memberState.value : null;

    Future<void> register() async {
      try {
        await client.event.registerForEvent(event.id!);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration successful!')),
          );
          // Refresh global list and local details
          currentEventsSignal.refresh();
          requestCount.value++;
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
          // Refresh global list and local details
          currentEventsSignal.refresh();
          requestCount.value++;
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
          Text(event.title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text('Starts: ${eventDateFormat(event.startTime)}'),
          Text('Ends: ${eventDateFormat(event.endTime)}'),
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
                  child: Text(event.description),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Text('Location: ${event.location}'),
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
              );
            })
          else
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
