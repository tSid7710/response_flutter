import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  bool? _isSigningIn;

  GoogleSignInProvider() {
    _isSigningIn = false;
  }

  bool get isSigningIn => _isSigningIn!;

  set setSigningIn(bool value) {
    _isSigningIn = value;
    notifyListeners();
  }

  Future login() async {
    _isSigningIn = true;
    final user = await googleSignIn.signIn();
    if (user == null) {
      _isSigningIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      await _auth.signInWithCredential(credential);
      _isSigningIn = false;
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    await _auth.signOut();
  }
}
