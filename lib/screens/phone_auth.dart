import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:response_flutter/screens/otp_screen.dart';

class PhoneAuth extends StatefulWidget {
  static const String id = 'phone_auth';
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Response"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Mobile Authentication',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20,
                ),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      prefixIcon: const Icon(Icons.call, color: Colors.teal),
                      hintText: 'Enter phone number',
                      prefix: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text("+91"),
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Material(
                  color: Colors.teal,
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(8.0),
                  child: MaterialButton(
                    minWidth: 200,
                    height: 44.0,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OtpScreen(phone: phoneController.text)));
                    },
                    child: const Text(
                      'Send OTP',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
