import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:serverpod_embedded_postgres/serverpod_embedded_postgres.dart';

void main() {
  logDatabaseCredentials();
}

Future<void> logDatabaseCredentials() async {
  // Pass the exact same directory your server initialized with
  final pg = await EmbeddedPostgres.attach(Directory('.serverpod/development/pgdata')); //

  // Now you have full access to the active ephemeral credentials
  print('Current Ephemeral Port: ${pg.endpoint.port}'); //
  print('Current Password: ${pg.endpoint.password}'); //
}
