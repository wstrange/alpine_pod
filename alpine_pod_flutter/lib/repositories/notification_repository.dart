import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';

import '../services/connectivity_service.dart';
import '../signals.dart';

final _log = Logger('NotificationRepository');

final notificationRepository = NotificationRepository();

class NotificationRepository {
  List<UserNotification> _cachedFeed = [];
  UserNotificationPreference? _cachedPreferences;

  /// Gets notifications feed from server API (when online) or in-memory cache (when offline).
  Future<List<UserNotification>> getMyFeed({int limit = 30, int offset = 0}) async {
    if (!isOnlineSignal.value) {
      _log.info('Loaded ${_cachedFeed.length} notifications from cache (offline)');
      return _cachedFeed;
    }

    try {
      final n = await client.notification.getMyFeed(limit: limit, offset: offset);
      connectivityService.markServerReachable();
      _cachedFeed = n;
      _log.info('Loaded notifications from server: ${n.length}');
      return n;
    } catch (e) {
      _log.warning('Failed to load notifications from server, falling back to cache: $e');
      connectivityService.markServerUnreachable(error: e);
      return _cachedFeed;
    }
  }

  /// Gets user notification preferences from server or cache.
  Future<UserNotificationPreference?> getMyPreferences() async {
    if (!isOnlineSignal.value) {
      return _cachedPreferences;
    }

    try {
      final pref = await client.notification.getMyPreferences();
      connectivityService.markServerReachable();
      _cachedPreferences = pref;
      return pref;
    } catch (e) {
      _log.warning('Failed to get notification preferences from server: $e');
      connectivityService.markServerUnreachable(error: e);
      return _cachedPreferences;
    }
  }
}
