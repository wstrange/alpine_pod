import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
// import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // auth.AuthConfig.set(auth.AuthConfig(
  //   sendValidationEmail: (session, email, validationCode) async {
  //     // Send the validation email to the user.
  //     // Return `true` if the email was successfully sent, otherwise `false`.
  //     session.log('Send validation email to $email with code $validationCode');
  //     return true;
  //   },
  //   sendPasswordResetEmail: (session, userInfo, validationCode) async {
  //     // Send the password reset email to the user.
  //     // Return `true` if the email was successfully sent, otherwise `false`.
  //     session.log(
  //         'Send password reset email to ${userInfo.email} with code $validationCode');
  //     return true;
  //   },
  // ));

  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    // authenticationHandler: auth.authenticationHandler,
  );

  pod.initializeAuthServices(identityProviderBuilders: [
    EmailIdpConfig(
      secretHashPepper: pod.getPassword('emailSecretHashPepper')!,
      // Callback to send the registration verification code to the user.
      sendRegistrationVerificationCode: _sendRegistrationCode,
      // Callback to send the password reset verification code to the user.
      sendPasswordResetVerificationCode: _sendPasswordResetCode,
    )
  ], tokenManagerBuilders: [
    JwtConfig(
        // Pepper used to hash the refresh token secret.
        refreshTokenHashPepper: pod.getPassword('jwtRefreshTokenHashPepper')!,
        // Algorithm used to sign the tokens (`hmacSha512` or `ecdsaSha512`).
        algorithm: JwtAlgorithm.hmacSha512(
          // Private key to sign the tokens. Must be a valid HMAC SHA-512 key.
          SecretKey(pod.getPassword('jwtHmacSha512PrivateKey')!),
        )),
  ]);

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

void _sendRegistrationCode(
  Session session, {
  required String email,
  required UuidValue accountRequestId,
  required String verificationCode,
  required Transaction? transaction,
}) {
  // NOTE: Here you call your mail service to send the verification code to
  // the user. For testing, we will just log the verification code.
  session.log('[EmailIDP] Registration code ($email): $verificationCode');
}

void _sendPasswordResetCode(
  Session session, {
  required String email,
  required UuidValue passwordResetRequestId,
  required String verificationCode,
  required Transaction? transaction,
}) {
  // NOTE: Here you call your mail service to send the verification code to
  // the user. For testing, we will just log the verification code.
  session.log('[EmailIDP] Password reset code ($email): $verificationCode');
}
