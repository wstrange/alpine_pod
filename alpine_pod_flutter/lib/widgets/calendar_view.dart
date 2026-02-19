import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:state_beacon/state_beacon.dart';
import '../beacon.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late ScrollController _scrollController;
  final double _itemWidth = 54.0;
  final double _itemPadding = 8.0;
  late final DateTime _startDate;

  String _formatRange(DateTime start, DateTime end) {
    return '${DateFormat('MMM d').format(start)} - ${DateFormat('MMM d').format(end)}';
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    // Calculate which date is at the start of the visible area
    final offset = _scrollController.offset - 16.0; // padding
    final totalItemWidth = _itemWidth + _itemPadding;
    var index =
        (offset / totalItemWidth).round() + 1; // +1 to get the Monday-ish area

    // Clamp index to valid items
    if (index < 0) index = 0;
    if (index >= 180) index = 179;

    final dateAtCenter = _startDate.add(Duration(days: index));
    final startOfVisibleWeek = _getStartOfWeek(dateAtCenter);

    if (!startOfVisibleWeek
        .isAtSameMomentAs(_getStartOfWeek(selectedDateBeacon.peek()))) {
      // Use peek() and then update
      selectedDateBeacon.value = startOfVisibleWeek;
    }
  }

  @override
  void initState() {
    super.initState();
    final now = selectedDateBeacon.value.copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    );
    // Start strip 2 weeks before current selected day
    _startDate = now.subtract(const Duration(days: 14));
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _scrollToDate(selectedDateBeacon.value);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  // Week starts on Monday
  DateTime _getStartOfWeek(DateTime date) {
    // Neutralize to midnight for safe subtraction
    final day = DateTime(date.year, date.month, date.day);
    return day.subtract(Duration(days: day.weekday - 1));
  }

  DateTime _getEndOfWeek(DateTime date) {
    return _getStartOfWeek(date).add(const Duration(days: 6));
  }

  void _scrollToDate(DateTime date) {
    if (!_scrollController.hasClients) return;

    // To show one day of the previous week on the left,
    // we scroll to the Sunday before the start of the week.
    final startOfWeek = _getStartOfWeek(date);
    final sundayBefore = startOfWeek.subtract(const Duration(days: 1));

    // difference().inDays is safe because we neutralized to midnight
    final daysSinceStart = sundayBefore.difference(_startDate).inDays;
    final totalItemWidth = _itemWidth + _itemPadding;

    // Aligns the Sunday to the left corner, accounting for the 16px ListView padding
    final scrollPosition = 16.0 + (daysSinceStart * totalItemWidth);

    // Only scroll if we are not already close (prevents scroll fighting with listener)
    if ((_scrollController.offset - scrollPosition).abs() > 10) {
      _scrollController.animateTo(
        scrollPosition,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _updateSelectedDate(DateTime newDate) {
    if (!mounted) return;
    // Neutralize incoming date
    final neutralized = DateTime(newDate.year, newDate.month, newDate.day);
    selectedDateBeacon.value = neutralized;
    _scrollToDate(neutralized);
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = selectedDateBeacon.watch(context);
    final startOfWeek = _getStartOfWeek(selectedDate);
    final endOfWeek = _getEndOfWeek(selectedDate);
    final eventsValue = currentEventsBeacon.watch(context);

    return Column(
      children: [
        _buildWeekHeader(selectedDate, startOfWeek, endOfWeek),
        _buildHorizontalDateStrip(startOfWeek, endOfWeek),
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
                  child: switch (eventsValue) {
                    AsyncData(:final value) =>
                      _buildWeeklyEventList(value, startOfWeek, endOfWeek),
                    AsyncError(:final error) =>
                      Center(child: Text('Error: $error')),
                    AsyncLoading() =>
                      const Center(child: CircularProgressIndicator()),
                    AsyncIdle() =>
                      const Center(child: Text('Select a section')),
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWeekHeader(DateTime selectedDate, DateTime start, DateTime end) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.arrow_left_rounded, size: 28),
            onPressed: () => _updateSelectedDate(
                selectedDate.subtract(const Duration(days: 7))),
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
                onPressed: () => _updateSelectedDate(DateTime.now()),
                icon: const Icon(Icons.today_rounded, size: 18),
                color: Colors.blue,
                tooltip: 'Go to today',
              ),
            ],
          ),
          IconButton(
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.arrow_right_rounded, size: 28),
            onPressed: () =>
                _updateSelectedDate(selectedDate.add(const Duration(days: 7))),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalDateStrip(DateTime startOfWeek, DateTime endOfWeek) {
    // Note: We don't watch events here to avoid rebuilds of the strip when only events change
    // but the strip should show event indicators. We can watch a simplified version or just accept a re-render.
    return SizedBox(
      height: 72,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 180,
        itemBuilder: (context, index) {
          final date = _startDate.add(Duration(days: index));
          final isInSelectedWeek = date.isAtSameMomentAs(startOfWeek) ||
              (date.isAfter(startOfWeek) &&
                  date.isBefore(endOfWeek.add(const Duration(seconds: 1))));

          final isToday = DateTime.now().year == date.year &&
              DateTime.now().month == date.month &&
              DateTime.now().day == date.day;

          // Optimization: We could pass events here if needed, but for now let's keep it simple
          // and let it re-render since it's only 180 items.
          final eventsValue = currentEventsBeacon.value;
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
            onTap: () => _updateSelectedDate(date),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _itemWidth,
              margin: EdgeInsets.symmetric(
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

    // Group events by day
    final Map<DateTime, List<Event>> groupedEvents = {};
    for (var event in weeklyEvents) {
      final start = event.startTime.toLocal();
      final day = DateTime(start.year, start.month, start.day);
      groupedEvents.putIfAbsent(day, () => []).add(event);
    }

    // Sort days
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
            ...dayEvents.map((event) => _buildEventCard(event)),
          ],
        );
      },
    );
  }

  Widget _buildEventCard(Event event) {
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
        onTap: () => _showEventDetails(context, event),
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
              _buildParticipantSummary(event),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParticipantSummary(Event event) {
    final registered = event.currentRegistrationCount;
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

  void _showEventDetails(BuildContext context, Event event) {
    context.push('/event-view', extra: event);
  }
}
