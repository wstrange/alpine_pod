import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';

import '../services/connectivity_service.dart';
import '../signals.dart';

final _log = Logger('NotificationRepository');

final notificationRepository = NotificationRepository();

class NotificationRepository {
  /// Gets notifications feed from server API.
  Future<List<UserNotification>> getMyFeed({int limit = 30, int offset = 0}) async {
    if (isOnlineSignal.value) {
      try {
        final n = await client.notification.getMyFeed(limit: limit, offset: offset);
        connectivityService.markServerReachable();
        _log.info('Loaded notifications: ${n.length}');
        return n;
      } catch (e) {
        _log.warning('Failed to load notifications from server: $e');
        connectivityService.markServerUnreachable();
      }
    }
    return [];
  }

  /// Gets user notification preferences from server.
  Future<UserNotificationPreference?> getMyPreferences() async {
    if (isOnlineSignal.value) {
      try {
        final pref = await client.notification.getMyPreferences();
        connectivityService.markServerReachable();
        return pref;
      } catch (e) {
        _log.warning('Failed to get notification preferences from server: $e');
        connectivityService.markServerUnreachable();
      }
    }
    return null;
  }
}
