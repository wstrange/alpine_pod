import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:signals_flutter/signals_flutter.dart';


/// Reactive signal indicating whether the device is connected to the network.
final isOnlineSignal = signal<bool>(true, options: SignalOptions(name: 'isOnlineSignal'));

/// Reactive signal holding the timestamp of the last successful data sync.
final lastSyncedAtSignal = signal<DateTime?>(null, options: SignalOptions(name: 'lastSyncedAtSignal'));

class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();
  factory ConnectivityService() => _instance;
  ConnectivityService._internal();

  ConnectivityMonitor? _monitor;

  /// Initializes connectivity tracking using Serverpod's [ConnectivityMonitor].
  void initialize(ConnectivityMonitor? monitor) {
    _monitor = monitor;
    if (_monitor != null) {
      _monitor!.addListener((bool isConnected) {
        isOnlineSignal.value = isConnected;
      });
    }
  }

  /// Manually update the online status (useful for web or testing).
  void setOnline(bool online) {
    isOnlineSignal.value = online;
  }

  /// Updates the last synced timestamp.
  void updateLastSynced(DateTime timestamp) {
    lastSyncedAtSignal.value = timestamp;
  }
}

final connectivityService = ConnectivityService();
