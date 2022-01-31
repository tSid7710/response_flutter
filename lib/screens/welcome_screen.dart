import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:response_flutter/google_signin.dart';
import 'package:response_flutter/screens/home_screen.dart';
import 'package:response_flutter/screens/welcome_page.dart';

final _auth = FirebaseAuth.instance;

class WelcomeScreen extends StatelessWidget {
  static const String id = "Welcome_screen";
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _auth.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          final provider = Provider.of<GoogleSignInProvider>(context);
          if (provider.isSigningIn) {
            return buildLoading();
          } else if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const WelcomePage();
          }
        },
      ),
    );
  }

  Center buildLoading() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.teal,
      ),
    );
  }
}
