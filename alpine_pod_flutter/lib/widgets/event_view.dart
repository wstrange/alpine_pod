import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import '../beacon.dart';
import '../util.dart';

class EventView extends StatelessWidget {
  const EventView({required this.event, super.key});

  final Event event;

  @override
  Widget build(BuildContext context) {
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
          FutureBuilder<EventDetails>(
            future: client.event.getEventDetails(event.id!),
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

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (managers.isNotEmpty) ...[
                    Text('Event Managers',
                        style: Theme.of(context).textTheme.titleMedium),
                    ...managers.map((m) => ListTile(
                          leading: const Icon(Icons.stars, color: Colors.blue),
                          title: Text(m.member?.displayName ??
                              '${m.member?.firstName} ${m.member?.lastName}'),
                          dense: true,
                        )),
                    const SizedBox(height: 8),
                  ],
                  if (confirmed.isNotEmpty) ...[
                    Text('Confirmed Participants (${confirmed.length})',
                        style: Theme.of(context).textTheme.titleMedium),
                    ...confirmed.map((r) => ListTile(
                          title: Text(r.member?.displayName ??
                              '${r.member?.firstName} ${r.member?.lastName}'),
                          dense: true,
                        )),
                    const SizedBox(height: 8),
                  ],
                  if (waitlisted.isNotEmpty) ...[
                    Text('Waitlist (${waitlisted.length})',
                        style: Theme.of(context).textTheme.titleMedium),
                    ...waitlisted.map((r) => ListTile(
                          title: Text(r.member?.displayName ??
                              '${r.member?.firstName} ${r.member?.lastName}'),
                          subtitle: Text('Position: ${r.waitlistPosition}'),
                          dense: true,
                        )),
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
