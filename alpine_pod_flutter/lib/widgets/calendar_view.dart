import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../signals.dart';
import 'event_card.dart';

class CalendarView extends HookWidget {
  const CalendarView({super.key});

  static const double _itemWidth = 54.0;
  static const double _itemPadding = 8.0;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final selectedDate = selectedDateSignal.watch(context);

    final startDate = useMemoized(() {
      final now = selectedDateSignal.peek().copyWith(
            hour: 0,
            minute: 0,
            second: 0,
            millisecond: 0,
            microsecond: 0,
          );
      return now.subtract(const Duration(days: 14));
    });

    // Week starts on Monday
    DateTime getStartOfWeek(DateTime date) {
      final day = DateTime(date.year, date.month, date.day);
      return day.subtract(Duration(days: day.weekday - 1));
    }

    DateTime getEndOfWeek(DateTime date) {
      return getStartOfWeek(date).add(const Duration(days: 6));
    }

    void scrollToDate(DateTime date) {
      if (!scrollController.hasClients) return;

      final startOfWeek = getStartOfWeek(date);
      final sundayBefore = startOfWeek.subtract(const Duration(days: 1));
      final daysSinceStart = sundayBefore.difference(startDate).inDays;
      const totalItemWidth = _itemWidth + _itemPadding;
      final scrollPosition = 16.0 + (daysSinceStart * totalItemWidth);

      if ((scrollController.offset - scrollPosition).abs() > 10) {
        scrollController.animateTo(
          scrollPosition,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }

    void onScroll() {
      if (!scrollController.hasClients) return;

      final offset = scrollController.offset - 16.0;
      const totalItemWidth = _itemWidth + _itemPadding;
      var index = (offset / totalItemWidth).round() + 1;

      if (index < 0) index = 0;
      if (index >= 180) index = 179;

      final dateAtCenter = startDate.add(Duration(days: index));
      final startOfVisibleWeek = getStartOfWeek(dateAtCenter);

      if (!startOfVisibleWeek
          .isAtSameMomentAs(getStartOfWeek(selectedDateSignal.peek()))) {
        selectedDateSignal.value = startOfVisibleWeek;
      }
    }

    void updateSelectedDate(DateTime newDate) {
      final neutralized = DateTime(newDate.year, newDate.month, newDate.day);
      selectedDateSignal.value = neutralized;
      scrollToDate(neutralized);
    }

    useEffect(() {
      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    useEffect(() {
      // Initial scroll to selected date after first frame
      Future.microtask(() {
        scrollToDate(selectedDateSignal.peek());
      });
      return null;
    }, []);

    final startOfWeek = getStartOfWeek(selectedDate);
    final endOfWeek = getEndOfWeek(selectedDate);
    final eventsValue = currentEventsSignal.watch(context);

    return Column(
      children: [
        _buildWeekHeader(
          selectedDate: selectedDate,
          start: startOfWeek,
          end: endOfWeek,
          onUpdateDate: updateSelectedDate,
        ),
        _buildHorizontalDateStrip(
          scrollController: scrollController,
          startDate: startDate,
          startOfWeek: startOfWeek,
          endOfWeek: endOfWeek,
          onUpdateDate: updateSelectedDate,
        ),
        const SizedBox(height: 8),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Weekly Activities',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.blueGrey),
                      ),
                      Text(
                        _formatRange(startOfWeek, endOfWeek),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: eventsValue.map(
                    data: (value) =>
                        _buildWeeklyEventList(value, startOfWeek, endOfWeek),
                    error: (error, _) => Center(child: Text('Error: $error')),
                    loading: () {
                      final staleValue = currentEventsSignal.peek();
                      if (staleValue is AsyncData<List<Event>>) {
                        return _buildWeeklyEventList(
                            staleValue.value, startOfWeek, endOfWeek);
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

  String _formatRange(DateTime start, DateTime end) {
    return '${DateFormat('MMM d').format(start)} - ${DateFormat('MMM d').format(end)}';
  }

  Widget _buildWeekHeader({
    required DateTime selectedDate,
    required DateTime start,
    required DateTime end,
    required ValueChanged<DateTime> onUpdateDate,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.arrow_left_rounded, size: 28),
            onPressed: () => onUpdateDate(
              selectedDate.subtract(const Duration(days: 7)),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _formatRange(start, end),
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueGrey),
              ),
              const SizedBox(width: 8),
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () => onUpdateDate(DateTime.now()),
                icon: const Icon(Icons.today_rounded, size: 18),
                color: Colors.blue,
                tooltip: 'Go to today',
              ),
            ],
          ),
          IconButton(
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.arrow_right_rounded, size: 28),
            onPressed: () => onUpdateDate(
              selectedDate.add(const Duration(days: 7)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalDateStrip({
    required ScrollController scrollController,
    required DateTime startDate,
    required DateTime startOfWeek,
    required DateTime endOfWeek,
    required ValueChanged<DateTime> onUpdateDate,
  }) {
    return SizedBox(
      height: 72,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 180,
        itemBuilder: (context, index) {
          final date = startDate.add(Duration(days: index));
          final isInSelectedWeek = date.isAtSameMomentAs(startOfWeek) ||
              (date.isAfter(startOfWeek) &&
                  date.isBefore(endOfWeek.add(const Duration(seconds: 1))));

          final isToday = DateTime.now().year == date.year &&
              DateTime.now().month == date.month &&
              DateTime.now().day == date.day;

          final eventsValue = currentEventsSignal.peek();
          bool hasEvents = false;
          if (eventsValue is AsyncData<List<Event>>) {
            hasEvents = eventsValue.value.any((e) {
              final start = e.startTime.toLocal();
              return start.year == date.year &&
                  start.month == date.month &&
                  start.day == date.day;
            });
          }

          return GestureDetector(
            onTap: () => onUpdateDate(date),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _itemWidth,
              margin: const EdgeInsets.symmetric(
                  horizontal: _itemPadding / 2, vertical: 4),
              decoration: BoxDecoration(
                color: isInSelectedWeek
                    ? Colors.blue
                    : (isToday
                        ? Colors.blue.withValues(alpha: 0.05)
                        : Colors.white),
                borderRadius: BorderRadius.circular(12),
                boxShadow: isInSelectedWeek
                    ? [
                        BoxShadow(
                          color: Colors.blue.withValues(alpha: 0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        )
                      ]
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('E').format(date).toUpperCase(),
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                      color:
                          isInSelectedWeek ? Colors.white70 : Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    date.day.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: isInSelectedWeek ? Colors.white : Colors.black87,
                    ),
                  ),
                  if (hasEvents)
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                        color: isInSelectedWeek ? Colors.white70 : Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWeeklyEventList(
      List<Event> weeklyEvents, DateTime startOfWeek, DateTime endOfWeek) {
    if (weeklyEvents.isEmpty) {
      return const Center(
        child: Opacity(
          opacity: 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.event_available, size: 56),
              SizedBox(height: 12),
              Text('No events scheduled for this week',
                  style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      );
    }

    final Map<DateTime, List<Event>> groupedEvents = {};
    for (var event in weeklyEvents) {
      final start = event.startTime.toLocal();
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
