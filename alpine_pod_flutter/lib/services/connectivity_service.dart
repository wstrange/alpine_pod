import 'dart:async';

import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:logging/logging.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../signals.dart';

final _log = Logger('ConnectivityService');

/// Reactive signal indicating whether the device is connected to the network.
final isNetworkConnectedSignal = signal<bool>(
  true,
  options: SignalOptions(name: 'isNetworkConnectedSignal'),
);

/// Reactive signal indicating whether the Serverpod server backend is reachable.
final isServerReachableSignal = signal<bool>(
  false,
  options: SignalOptions(name: 'isServerReachableSignal'),
);

/// Computed signal: true if the device is connected to the network AND the Serverpod server backend is reachable.
final isOnlineSignal = computed<bool>(() {
  return isNetworkConnectedSignal.value && isServerReachableSignal.value;
}, options: ComputedOptions(name: 'isOnlineSignal'));

/// Reactive signal holding the timestamp of the last successful data sync.
final lastSyncedAtSignal = signal<DateTime?>(
  null,
  options: SignalOptions(name: 'lastSyncedAtSignal'),
);

class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();
  factory ConnectivityService() => _instance;
  ConnectivityService._internal();

  ConnectivityMonitor? _monitor;
  Timer? _healthCheckTimer;
  bool _isCheckingReachability = false;

  /// Initializes connectivity tracking using Serverpod's [ConnectivityMonitor]
  /// and starts periodic server reachability checks.
  Future<void> initialize(ConnectivityMonitor? monitor) async {
    _monitor = monitor;
    if (_monitor != null) {
      _monitor!.addListener((bool isConnected) {
        isNetworkConnectedSignal.value = isConnected;
        if (isConnected) {
          checkServerReachability();
        } else {
          isServerReachableSignal.value = false;
        }
      });
    }

    // Periodically verify server reachability every 15 seconds
    _healthCheckTimer?.cancel();
    _healthCheckTimer = Timer.periodic(const Duration(seconds: 15), (_) {
      checkServerReachability();
    });

    // Listen to session changes to immediately update reachability upon login
    sessionManager.authInfoListenable.addListener(() {
      if (sessionManager.isAuthenticated) {
        checkServerReachability();
      }
    });

    // Initial check
    await checkServerReachability();
  }

  /// Pings the server to verify if the Serverpod backend is reachable.
  Future<bool> checkServerReachability() async {
    if (_isCheckingReachability) return isServerReachableSignal.value;
    _isCheckingReachability = true;

    try {
      if (!isNetworkConnectedSignal.value) {
        isServerReachableSignal.value = false;
        return false;
      }

      // Call the status endpoint to verify server reachability.
      // StatusEndpoint has requireLogin => false and returns 'OK'.
      final status = await client.status.getStatus().timeout(
        const Duration(seconds: 3),
      );
      if (status == 'OK') {
        if (!isServerReachableSignal.value) {
          _log.info('Server connection restored (status: $status)');
        }
        isServerReachableSignal.value = true;
        return true;
      } else {
        _log.warning('Server returned unexpected status: $status');
        isServerReachableSignal.value = false;
        return false;
      }
    } catch (e) {
      _log.warning('Server unreachable: $e');
      isServerReachableSignal.value = false;
      return false;
    } finally {
      _isCheckingReachability = false;
    }
  }

  /// Marks server as unreachable if the error indicates a network or server failure.
  void markServerUnreachable({Object? error}) {
    if (error != null) {
      // If server responded with an HTTP status code (e.g. 400, 401, 403, 404),
      // the server WAS reachable and responding.
      if (error is ServerpodClientHttpException) {
        // Status codes 502 (Bad Gateway), 503 (Service Unavailable), 504 (Gateway Timeout)
        // indicate that the upstream Serverpod server is down.
        if (error.statusCode != 502 &&
            error.statusCode != 503 &&
            error.statusCode != 504) {
          return;
        }
      }
    }
    isServerReachableSignal.value = false;
  }

  /// Marks server as reachable when any network call succeeds.
  void markServerReachable() {
    isServerReachableSignal.value = true;
  }

  /// Manually update the online / server reachable status (useful for testing and toggling offline mode).
  void setOnline(bool online) {
    isServerReachableSignal.value = online;
    isNetworkConnectedSignal.value = online;
    if (online) {
      checkServerReachability();
    }
  }

  /// Updates the last synced timestamp.
  void updateLastSynced(DateTime timestamp) {
    lastSyncedAtSignal.value = timestamp;
  }
}

final connectivityService = ConnectivityService();
