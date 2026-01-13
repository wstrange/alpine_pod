import 'package:serverpod/serverpod.dart';
import 'package:alpine_pod_server/src/web/routes/root.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  auth.AuthConfig.set(auth.AuthConfig(
    sendValidationEmail: (session, email, validationCode) async {
      // Send the validation email to the user.
      // Return `true` if the email was successfully sent, otherwise `false`.
      session.log('Send validation email to $email with code $validationCode');
      return true;
    },
    sendPasswordResetEmail: (session, userInfo, validationCode) async {
      // Send the password reset email to the user.
      // Return `true` if the email was successfully sent, otherwise `false`.
      session.log(
          'Send password reset email to ${userInfo.email} with code $validationCode');
      return true;
    },
  ));

  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(args, Protocol(), Endpoints(),
      authenticationHandler: auth.authenticationHandler);

  // Setup a default page at the web root.
  // pod.webServer.addRoute(RouteRoot(), '/');
  // pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  // pod.webServer.addRoute(
  //   StaticDirectory(serverDirectory: 'static', basePath: '/'),
  //   '/*',
  // );

  // Start the server.
  await pod.start();
}
