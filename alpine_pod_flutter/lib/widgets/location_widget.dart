import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// A widget that displays a location string with a map icon.
///
/// If [location] is a Google Maps URL it is launched directly; otherwise the
/// text is used as a search query on maps.google.com.
///
/// Set [compact] to `true` for single-line display (e.g. in event cards),
/// or leave it `false` (default) for up to two lines (e.g. in event details).
class LocationWidget extends StatelessWidget {
  const LocationWidget({
    required this.location,
    this.compact = false,
    super.key,
  });

  final String location;

  /// When `true`, text is limited to one line.  When `false`, up to two lines.
  final bool compact;

  static const _googleMapsPrefixes = [
    'https://maps.google',
    'https://www.google.com/maps',
    'https://goo.gl/maps',
    'https://maps.app.goo.gl',
    'http://maps.google',
    'http://www.google.com/maps',
  ];

  bool _isGoogleMapsUrl(String s) {
    final lower = s.trim().toLowerCase();
    return _googleMapsPrefixes.any((prefix) => lower.startsWith(prefix));
  }

  Future<void> _launch() async {
    final Uri uri;
    if (_isGoogleMapsUrl(location)) {
      uri = Uri.parse(location.trim());
    } else {
      uri = Uri.https('maps.google.com', '/', {'q': location.trim()});
    }

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: _launch,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.map_outlined,
              size: compact ? 14 : 16,
              color: colorScheme.primary,
            ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                location,
                maxLines: compact ? 1 : 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: compact ? 13 : 14,
                  color: colorScheme.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: colorScheme.primary.withValues(alpha: 0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
