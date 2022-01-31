import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:response_flutter/google_signin.dart';
import 'package:response_flutter/screens/home_screen.dart';
import 'package:response_flutter/screens/phone_auth.dart';

final _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  static const String id = "login_screen";
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'LogIn in to Get Started',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Experience the all new App!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: TextField(
                          onChanged: (String? value) {
                            email = value;
                          },
                          decoration: const InputDecoration(
                            labelText: 'E-Mail',
                            prefixIcon: Image(
                              image: AssetImage('assets/email-24px.png'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: TextField(
                          obscureText: _obscureText,
                          onChanged: (String? value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Image(
                              image:
                                  AssetImage('assets/Icon ionic-ios-lock.png'),
                            ),
                            suffixIcon: GestureDetector(
                              child: const Image(
                                image:
                                    AssetImage('assets/Icon awesome-eye.png'),
                              ),
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0),
                        child: Material(
                          color: Colors.teal,
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(10.0),
                          child: MaterialButton(
                            minWidth: 200,
                            height: 44,
                            onPressed: () async {
                              try {
                                final user =
                                    await _auth.signInWithEmailAndPassword(
                                  email: email!,
                                  password: password!,
                                );
                                if (user != null) {
                                  Navigator.pushNamed(context, HomePage.id);
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: const Text(
                              'LOGIN',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text('or'),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Login with'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  final provider =
                                      Provider.of<GoogleSignInProvider>(context,
                                          listen: false);
                                  await provider.login();
                                  Navigator.pushNamed(context, HomePage.id);
                                },
                                child: const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Image(
                                    image: AssetImage('assets/googl.png'),
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, PhoneAuth.id);
                                },
                                child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 30,
                                  child: Icon(
                                    Icons.call,
                                    size: 40.0,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
