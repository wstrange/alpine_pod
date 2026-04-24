import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'location_widget.dart';
import '../util.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    final isPast = DateTime.now().isAfter(event.endTime.toLocal());
    final primaryColor = isPast ? Colors.grey : Colors.blue;

    return Opacity(
      opacity: isPast ? 0.6 : 1.0,
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.withValues(alpha: 0.15)),
        ),
        child: InkWell(
          onTap: () => GoRouter.of(context).push('/event-view/${event.id}'),
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
                      backgroundColor: primaryColor.withValues(alpha: 0.1),
                      child: Icon(Icons.campaign, color: primaryColor, size: 20),
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
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Text(
                                formatEventRange(event.startTime, event.endTime),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  event.type,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                              if (isPast) ...[
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    'PAST',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (event.eventLocation != null) ...[
                  const SizedBox(height: 8),
                  LocationWidget(location: event.eventLocation!, compact: true),
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
                _ParticipantSummary(event: event, isPast: isPast),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ParticipantSummary extends StatelessWidget {
  final Event event;
  final bool isPast;

  const _ParticipantSummary({required this.event, this.isPast = false});

  @override
  Widget build(BuildContext context) {
    final registered = event.eventRegistrations!.length;
    final max = event.maxParticipants;
    final isFull = max > 0 && registered >= max;
    final isNearlyFull = max > 0 && registered / max >= 0.8;

    final color = isPast
        ? Colors.grey
        : isFull
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
