import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:response_flutter/google_signin.dart';
import 'package:response_flutter/screens/home_screen.dart';
import 'package:response_flutter/screens/phone_auth.dart';

import 'login_screen.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

class RegisterPage extends StatefulWidget {
  static const String id = "register_screen";
  const RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;
  String? name;
  String? phone;
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  String? password;
  String? conpswd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Register in to Get Started',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Experience the all new App!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: TextField(
                      onChanged: (String? value) {
                        name = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Image(
                          image: AssetImage('assets/person-24px.png'),
                        ),
                      ),
                    ),
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
                      obscureText: _obscureText1,
                      onChanged: (String? value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Image(
                          image: AssetImage('assets/Icon ionic-ios-lock.png'),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText1 = !_obscureText1;
                            });
                          },
                          child: const Image(
                            image: AssetImage('assets/Icon awesome-eye.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: TextField(
                      obscureText: _obscureText2,
                      onChanged: (String? value) {
                        conpswd = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        prefixIcon: const Image(
                          image: AssetImage('assets/Icon ionic-ios-lock.png'),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText2 = !_obscureText2;
                            });
                          },
                          child: const Image(
                            image: AssetImage('assets/Icon awesome-eye.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Material(
                      color: Colors.teal,
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(8.0),
                      child: MaterialButton(
                        minWidth: 200,
                        height: 44.0,
                        onPressed: () {
                          try {
                            final newUser =
                                _auth.createUserWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );
                            if (newUser != null) {
                              Navigator.pushNamed(context, HomePage.id);
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: const Text(
                          'REGISTER',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an Account ?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginPage.id);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('or'),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Sign Up with'),
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
