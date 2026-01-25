import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:state_beacon/state_beacon.dart';
import '../beacon.dart';
import '../util.dart';
import 'user_list_widget.dart';

class EventView extends StatefulWidget {
  const EventView({required this.event, super.key});

  final Event event;

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  late Future<EventDetails> _detailsFuture;

  @override
  void initState() {
    super.initState();
    _refreshDetails();
  }

  void _refreshDetails() {
    setState(() {
      _detailsFuture = client.event.getEventDetails(widget.event.id!);
    });
  }

  Future<void> _register() async {
    try {
      await client.event.registerForEvent(widget.event.id!);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful!')),
        );
        _refreshDetails();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error registering: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentMember = currentMemberBeacon.watch(context).unwrapOrNull();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.event.title,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text('Starts: ${eventDateFormat(widget.event.startTime)}'),
          Text('Ends: ${eventDateFormat(widget.event.endTime)}'),
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
                  child: Text(widget.event.description),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Text('Location: ${widget.event.location}'),
          const Divider(),
          FutureBuilder<EventDetails>(
            future: _detailsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text('Error loading event details: ${snapshot.error}');
              }
              final details = snapshot.data!;
              final confirmed = details.registrants;
              final waitlisted = details.waitlist;
              final managers = details.managers;

              final isRegistered = currentMember != null &&
                  ([...confirmed, ...waitlisted]
                      .any((r) => r.memberId == currentMember.id));

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
                                '${details.registrants.length} / ${widget.event.maxParticipants}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const Text('Registered',
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          if (widget.event.requiresApproval)
                            Column(
                              children: [
                                const Icon(Icons.hourglass_empty,
                                    color: Colors.orange),
                                const SizedBox(height: 4),
                                Text(
                                  '${details.waitlist.length}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const Text('Waitlisted',
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          if (details.registrants.length >=
                              widget.event.maxParticipants)
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
                      child: ElevatedButton.icon(
                        onPressed: isRegistered ? null : _register,
                        icon: Icon(isRegistered
                            ? Icons.check_circle
                            : Icons.person_add),
                        label: Text(
                            isRegistered ? 'Already Registered' : 'Register'),
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
                    // Note: UserListWidget doesn't currently show waitlist position.
                    // Ideally we should update it or use a custom builder,
                    // but for now we simply list them.
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
            },
          ),
        ],
      ),
    );
  }
}
