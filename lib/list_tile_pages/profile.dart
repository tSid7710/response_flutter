import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String id = "profile_page";
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Response'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('This is profile page'),
      ),
    );
  }
}
