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
  true,
  options: SignalOptions(name: 'isServerReachableSignal'),
);

/// Computed signal: true only if network interface is up AND server is reachable.
/// Replaces legacy single isOnlineSignal behavior while keeping backwards compatibility.
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
  void initialize(ConnectivityMonitor? monitor) {
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
      if (isNetworkConnectedSignal.value) {
        checkServerReachability();
      }
    });

    // Initial check
    checkServerReachability();
  }

  /// Pings the server to verify if the Serverpod backend is reachable.
  Future<bool> checkServerReachability() async {
    if (!isNetworkConnectedSignal.value) {
      isServerReachableSignal.value = false;
      return false;
    }

    if (_isCheckingReachability) return isServerReachableSignal.value;
    _isCheckingReachability = true;

    try {
      // Lightweight call to test server connection
      await client.section.listSections().timeout(const Duration(seconds: 4));
      if (!isServerReachableSignal.value) {
        _log.info('Server connection restored');
      }
      isServerReachableSignal.value = true;
      return true;
    } catch (e) {
      _log.warning('Server unreachable: $e');
      isServerReachableSignal.value = false;
      return false;
    } finally {
      _isCheckingReachability = false;
    }
  }

  /// Marks server as unreachable immediately when a network failure occurs in any repository.
  void markServerUnreachable() {
    isServerReachableSignal.value = false;
  }

  /// Marks server as reachable when any network call succeeds.
  void markServerReachable() {
    isServerReachableSignal.value = true;
  }

  /// Manually update the network connected status (useful for testing).
  void setOnline(bool online) {
    isNetworkConnectedSignal.value = online;
    if (!online) {
      isServerReachableSignal.value = false;
    } else {
      checkServerReachability();
    }
  }

  /// Updates the last synced timestamp.
  void updateLastSynced(DateTime timestamp) {
    lastSyncedAtSignal.value = timestamp;
  }
}

final connectivityService = ConnectivityService();

