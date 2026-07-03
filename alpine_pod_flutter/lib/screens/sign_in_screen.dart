import 'package:alpine_pod_client/alpine_pod_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

class SignInScreen extends StatelessWidget {
  final Client client;

  const SignInScreen({required this.client, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    'assets/images/logo.webp', // The identical path declared in pubspec.yaml
                    width: 300, // Optional layout constraint
                    height: 150, // Optional layout constraint
                    fit: BoxFit.contain, // Optional: How the image fits the space
                  ),
                ),
                const SizedBox(height: 40),
                SignInWidget(
                  client: client,
                  onAuthenticated: () {
                    print('Authenticated');
                    // Do something when the user is authenticated.
                    //
                    // NOTE: You should not navigate to the home screen here, otherwise
                    // the user will have to sign in again every time they open the app.
                  },
                  onError: (error) {
                    // Handle errors
                    print('Auth Error:   $error');
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $error')));
                  },
                  emailSignInWidget: EmailSignInWidget(client: client, startScreen: EmailFlowScreen.login),
                  // googleSignInWidget: GoogleSignInWidget(
                  //   client: client,
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
