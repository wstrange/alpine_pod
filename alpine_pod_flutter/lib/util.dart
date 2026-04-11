import 'package:intl/intl.dart';

final eventDateFormat = DateFormat('EEEE, MMM d, h:mm a').format;

String formatEventRange(DateTime start, DateTime end) {
  final startDate = start.toLocal();
  final endDate = end.toLocal();

  final fullFormat = DateFormat('EEEE, MMM d, h:mm a');
  final timeFormat = DateFormat('h:mm a');

  if (startDate.year == endDate.year &&
      startDate.month == endDate.month &&
      startDate.day == endDate.day) {
    // Single day
    return '${fullFormat.format(startDate)} – ${timeFormat.format(endDate)}';
  } else {
    // Multi day
    return '${fullFormat.format(startDate)} • ${fullFormat.format(endDate)}';
  }
}
