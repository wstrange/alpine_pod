import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    final startDate = event.startTime.toLocal();
    final endDate = event.endTime.toLocal();

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.withValues(alpha: 0.15)),
      ),
      child: InkWell(
        onTap: () => GoRouter.of(context).push('/event-view', extra: event),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue.withValues(alpha: 0.1),
                    child: const Icon(Icons.campaign,
                        color: Colors.blue, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${DateFormat.jm().format(startDate)} • ${DateFormat.jm().format(endDate)}',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (event.location != null) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        event.location!,
                        style: const TextStyle(
                            fontSize: 13, color: Colors.blueGrey),
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 8),
              Text(
                event.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 13, color: Colors.black.withValues(alpha: 0.6)),
              ),
              const SizedBox(height: 10),
              _ParticipantSummary(event: event),
            ],
          ),
        ),
      ),
    );
  }
}

class _ParticipantSummary extends StatelessWidget {
  final Event event;

  const _ParticipantSummary({required this.event});

  @override
  Widget build(BuildContext context) {
    final registered = event.eventRegistrations!.length;
    final max = event.maxParticipants;
    final isFull = max > 0 && registered >= max;
    final isNearlyFull = max > 0 && registered / max >= 0.8;

    final color = isFull
        ? Colors.red
        : isNearlyFull
            ? Colors.amber[700]!
            : Colors.blue;

    final spotsLabel = max <= 0
        ? '$registered registered'
        : isFull
            ? 'Full • $registered/$max'
            : '$registered/$max spots filled';

    return Row(
      children: [
        Icon(Icons.people_alt_outlined, size: 14, color: color),
        const SizedBox(width: 4),
        Text(
          spotsLabel,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        if (max > 0 && !isFull) ...[
          const SizedBox(width: 6),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: registered / max,
                minHeight: 4,
                backgroundColor: Colors.grey.withValues(alpha: 0.2),
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
