import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:response_flutter/google_signin.dart';
import 'package:response_flutter/list_tile_pages/new_voting.dart';
import 'package:response_flutter/list_tile_pages/results.dart';
import 'package:response_flutter/screens/home_screen.dart';
import 'package:response_flutter/screens/login_screen.dart';
import 'package:response_flutter/screens/phone_auth.dart';
import 'package:response_flutter/screens/register_screen.dart';
import 'package:response_flutter/screens/welcome_page.dart';
import 'package:response_flutter/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => GoogleSignInProvider(),
      child: MaterialApp(
        initialRoute: WelcomeScreen.id,
        debugShowCheckedModeBanner: false,
        routes: {
          WelcomeScreen.id: (context) => const WelcomeScreen(),
          WelcomePage.id: (context) => const WelcomePage(),
          LoginPage.id: (context) => const LoginPage(),
          RegisterPage.id: (context) => const RegisterPage(),
          HomePage.id: (context) => const HomePage(),
          PhoneAuth.id: (context) => const PhoneAuth(),
          NewVoting.id: (context) => const NewVoting(),
          ResultPage.id: (context) => const ResultPage(),
        },
      ),
    );
  }
}
