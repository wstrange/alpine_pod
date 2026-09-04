import 'dart:io';

import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:alpine_pod_flutter/services/connectivity_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ConnectivityService & isOnlineSignal tests', () {
    setUp(() {
      // Reset signals to baseline
      isNetworkConnectedSignal.value = true;
      isServerReachableSignal.value = true;
    });

    test('isOnlineSignal is true only when both network and server are reachable', () {
      isNetworkConnectedSignal.value = true;
      isServerReachableSignal.value = true;
      expect(isOnlineSignal.value, isTrue);

      // Server down -> isOnlineSignal must be false
      isServerReachableSignal.value = false;
      expect(isOnlineSignal.value, isFalse);

      // Network down, server reachable -> isOnlineSignal must be false
      isServerReachableSignal.value = true;
      isNetworkConnectedSignal.value = false;
      expect(isOnlineSignal.value, isFalse);

      // Both down -> isOnlineSignal must be false
      isServerReachableSignal.value = false;
      isNetworkConnectedSignal.value = false;
      expect(isOnlineSignal.value, isFalse);
    });

    test('markServerUnreachable marks unreachable on network errors', () {
      isServerReachableSignal.value = true;

      // ServerpodClientNetworkException should mark server as unreachable
      connectivityService.markServerUnreachable(
        error: const ServerpodClientNetworkException('Connection refused'),
      );
      expect(isServerReachableSignal.value, isFalse);
      expect(isOnlineSignal.value, isFalse);
    });

    test('markServerUnreachable marks unreachable on SocketException and 504 status', () {
      isServerReachableSignal.value = true;
      connectivityService.markServerUnreachable(
        error: const SocketException('Connection failed'),
      );
      expect(isServerReachableSignal.value, isFalse);

      isServerReachableSignal.value = true;
      connectivityService.markServerUnreachable(
        error: ServerpodClientUnknownHttpException('Gateway timeout', 504),
      );
      expect(isServerReachableSignal.value, isFalse);
    });

    test('markServerUnreachable without error marks unreachable', () {
      isServerReachableSignal.value = true;
      connectivityService.markServerUnreachable();
      expect(isServerReachableSignal.value, isFalse);
    });

    test('markServerUnreachable ignores normal HTTP/auth errors because server responded', () {
      isServerReachableSignal.value = true;

      // 401 Unauthorized means server is reached and responding
      connectivityService.markServerUnreachable(
        error: ServerpodClientUnauthorized(),
      );
      expect(isServerReachableSignal.value, isTrue);

      // 403 Forbidden means server is reached
      connectivityService.markServerUnreachable(
        error: ServerpodClientForbidden(),
      );
      expect(isServerReachableSignal.value, isTrue);

      // 404 Not Found means server is reached
      connectivityService.markServerUnreachable(
        error: ServerpodClientNotFound(),
      );
      expect(isServerReachableSignal.value, isTrue);
    });

    test('markServerReachable restores reachable signal', () {
      isServerReachableSignal.value = false;
      connectivityService.markServerReachable();
      expect(isServerReachableSignal.value, isTrue);
      expect(isOnlineSignal.value, isTrue);
    });
  });
}
