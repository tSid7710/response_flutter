import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:response_flutter/screens/home_screen.dart';

final _auth = FirebaseAuth.instance;

class OtpScreen extends StatefulWidget {
  static const String id = "otp_screen";
  final String phone;
  const OtpScreen({Key? key, required this.phone}) : super(key: key);
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  final _pinPutController = TextEditingController();
  final _pinPutFocus = FocusNode();
  final pinputDecoration = BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(color: Colors.yellow),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('OTP Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Enter OTP',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            Expanded(
              child: PinPut(
                fieldsCount: 6,
                textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
                eachFieldWidth: 20,
                eachFieldHeight: 55,
                focusNode: _pinPutFocus,
                controller: _pinPutController,
                submittedFieldDecoration: pinputDecoration,
                followingFieldDecoration: pinputDecoration,
                pinAnimationType: PinAnimationType.none,
                onSubmit: (pin) async {
                  try {
                    final result = await _auth.signInWithCredential(
                        PhoneAuthProvider.credential(
                            verificationId: _verificationCode!, smsCode: pin));
                    final user = result.user;
                    if (user != null) {
                      Navigator.pushNamed(context, HomePage.id);
                    }
                  } catch (e) {
                    FocusScope.of(context).unfocus();
                    _scaffoldState.currentState!.showSnackBar(
                      const SnackBar(content: Text('Invalid OTP')),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91${widget.phone}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        final result = await _auth.signInWithCredential(credential);
        final user = result.user;
        if (user != null) {
          Navigator.pushNamed(context, HomePage.id);
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) async {
        setState(() {
          _verificationCode = verificationId;
        });
        PhoneAuthCredential credentials = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: _verificationCode!);
        await _auth.signInWithCredential(credentials);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationCode = verificationId;
        });
      },
      timeout: const Duration(seconds: 60),
    );
  }

  @override
  void initState() {
    super.initState();
    _verifyPhoneNumber();
  }
}
