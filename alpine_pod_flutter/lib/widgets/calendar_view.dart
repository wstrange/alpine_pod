import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../signals.dart';
import 'event_card.dart';

class CalendarView extends HookWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedDate = selectedDateSignal.watch(context);

    // Month helpers
    DateTime getStartOfMonth(DateTime date) {
      return DateTime(date.year, date.month, 1);
    }

    DateTime getEndOfMonth(DateTime date) {
      final nextMonth = date.month == 12 ? 1 : date.month + 1;
      final nextMonthYear = date.month == 12 ? date.year + 1 : date.year;
      return DateTime(nextMonthYear, nextMonth, 0);
    }

    void updateSelectedDate(DateTime newDate) {
      final neutralized = DateTime(newDate.year, newDate.month, 1);
      selectedDateSignal.value = neutralized;
    }

    final startOfMonth = getStartOfMonth(selectedDate);
    final endOfMonth = getEndOfMonth(selectedDate);
    final eventsValue = currentEventsSignal.watch(context);

    return Column(
      children: [
        _buildCompactHeader(
          context: context,
          selectedDate: selectedDate,
          onUpdateDate: updateSelectedDate,
        ),
        const SizedBox(height: 4),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(32)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 32,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: eventsValue.map(
                    data: (value) =>
                        _buildEventList(value, startOfMonth, endOfMonth),
                    error: (error, _) => Center(child: Text('Error: $error')),
                    loading: () {
                      final staleValue = currentEventsSignal.peek();
                      if (staleValue is AsyncData<List<Event>>) {
                        return _buildEventList(
                            staleValue.value, startOfMonth, endOfMonth);
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCompactHeader({
    required BuildContext context,
    required DateTime selectedDate,
    required ValueChanged<DateTime> onUpdateDate,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 12, 4),
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.arrow_left_rounded, size: 28),
                onPressed: () => onUpdateDate(
                  DateTime(selectedDate.year, selectedDate.month - 1, 1),
                ),
              ),
              Text(
                DateFormat('MMM yyyy').format(selectedDate),
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueGrey),
              ),
              IconButton(
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.arrow_right_rounded, size: 28),
                onPressed: () => onUpdateDate(
                  DateTime(selectedDate.year, selectedDate.month + 1, 1),
                ),
              ),
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () => onUpdateDate(DateTime.now()),
                icon: const Icon(Icons.today_rounded, size: 18),
                color: Colors.blue.withValues(alpha: 0.7),
                tooltip: 'Go to today',
              ),
            ],
          ),
          const Spacer(),
          Watch((context) {
            final onlyMyEvents = showMyEventsOnlySignal.value;
            return SegmentedButton<bool>(
              segments: const [
                ButtonSegment(
                  value: false,
                  label: Text('All'),
                  icon: Icon(Icons.event, size: 16),
                ),
                ButtonSegment(
                  value: true,
                  label: Text('My Events'),
                  icon: Icon(Icons.person, size: 16),
                ),
              ],
              selected: {onlyMyEvents},
              onSelectionChanged: (newSelection) {
                showMyEventsOnlySignal.value = newSelection.first;
              },
              showSelectedIcon: false,
              style: SegmentedButton.styleFrom(
                visualDensity: VisualDensity.compact,
                textStyle: const TextStyle(fontSize: 11),
                padding: const EdgeInsets.symmetric(horizontal: 4),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildEventList(
      List<Event> events, DateTime startOfMonth, DateTime endOfMonth) {
    if (events.isEmpty) {
      return const Center(
        child: Opacity(
          opacity: 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.event_available, size: 56),
              SizedBox(height: 12),
              Text('No upcoming events scheduled',
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      );
    }

    final Map<DateTime, List<Event>> groupedEvents = {};
    for (var event in events) {
      var start = event.startTime.toLocal();
      // If the event started before this month, group it under the 1st of the month
      if (start.isBefore(startOfMonth)) {
        start = startOfMonth;
      }
      final day = DateTime(start.year, start.month, start.day);
      groupedEvents.putIfAbsent(day, () => []).add(event);
    }

    final sortedDays = groupedEvents.keys.toList()..sort();

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
      itemCount: sortedDays.length,
      itemBuilder: (context, index) {
        final day = sortedDays[index];
        final dayEvents = groupedEvents[day]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
              child: Text(
                DateFormat('EEEE, MMMM d').format(day),
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
            ),
            ...dayEvents.map((event) => EventCard(event: event)),
          ],
        );
      },
    );
  }
}
