import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';
import '../services/connectivity_service.dart';
import '../services/sync_service.dart';
import '../signals.dart';

final _log = Logger('NotificationRepository');

class NotificationRepository {
  static final NotificationRepository _instance = NotificationRepository._internal();
  factory NotificationRepository() => _instance;
  NotificationRepository._internal();

  /// Gets notifications feed from server API.
  Future<List<UserNotification>> getMyFeed({int limit = 30, int offset = 0}) async {
    if (isOnlineSignal.value) {
      try {
        return await client.notification.getMyFeed(limit: limit, offset: offset);
      } catch (e) {
        _log.warning('Failed to load notifications from server: $e');
      }
    }
    return [];
  }

  /// Gets user notification preferences from local cache or server.
  Future<UserNotificationPreference?> getMyPreferences() async {
    try {
      final cached = await UserNotificationPreference.db.find(dbSession, limit: 1);
      if (cached.isNotEmpty || !isOnlineSignal.value) {
        return cached.first;
      }
    } catch (e) {
      _log.warning('Failed to load notification preferences from local cache: $e');
    }

    if (isOnlineSignal.value) {
      await syncService.syncNotificationPreferences();
      final cached = await UserNotificationPreference.db.find(dbSession, limit: 1);
      if (cached.isNotEmpty) return cached.first;
    }
    return null;
  }
}

final notificationRepository = NotificationRepository();
