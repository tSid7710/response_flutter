import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Response'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('This is Settings Page'),
      ),
    );
  }
}
