import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:response_flutter/screens/login_screen.dart';
import 'package:response_flutter/screens/register_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  static const String id = "welcome_page";
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Response'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Material(
                      elevation: 10.0,
                      child: Image.asset('assets/img3.jpg'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Response',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 38.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18),
              child: Material(
                color: Colors.teal,
                elevation: 5.0,
                borderRadius: BorderRadius.circular(12.0),
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 44.0,
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.id);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.0),
              child: Material(
                color: Colors.teal,
                elevation: 5.0,
                borderRadius: BorderRadius.circular(12.0),
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 44.0,
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterPage.id);
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
