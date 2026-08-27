import 'package:serverpod/serverpod.dart';

class StatusEndpoint extends Endpoint {
  @override
  bool get requireLogin => false;

  /// Returns the server status. Accessible without authentication.
  Future<String> getStatus(Session session) async {
    return 'OK';
  }
}
