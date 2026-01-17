// import 'package:flutter/material.dart';
// import 'package:logging/logging.dart';
// import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
// import 'package:serverpod_auth_google_flutter/serverpod_auth_google_flutter.dart';
// import '../provider.dart';

// final log = Logger('LoginScreen');

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   final _serverClientId = "465372895035-suuujrnk4gm211s8sd4craj58a6g1v79.apps.googleusercontent.com";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () async {
//                   var r = await signInWithEmail('test1@acc.ca', 'Passw0rd');
//                 },
//                 child: Text('Quick login')),
//             SignInWithEmailButton(caller: client.modules.auth),
//             const SizedBox(height: 16),
//             SignInWithGoogleButton(
//               caller: client.modules.auth,
//               serverClientId: _serverClientId,
//               redirectUri: Uri.parse('http://localhost:8082/googlesignin'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Future<void> signInWithEmail(String email, String password) async {
//   try {
//     final authResponse = await client.modules.auth.email.authenticate(
//       email,
//       password,
//     );

//     // Register the sign-in with the session manager to update the app state
//     if (authResponse.success) {
//       await sessionManager.registerSignedInUser(
//         authResponse.userInfo!,
//         authResponse.keyId!,
//         authResponse.key!,
//       );
//       log.info('Sign-in successful!');
//     } else {
//       // Handle login failure. The `authResponse` contains information on why
//       // the sign-in failed.
//       log.info('Sign-in failed: ${authResponse.failReason}');
//     }
//   } catch (e) {
//     // Handle network errors or other exceptions
//     log.info('An error occurred during sign-in: $e');
//   }
// }
