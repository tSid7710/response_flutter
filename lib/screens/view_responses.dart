import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;

class ViewResponses extends StatelessWidget {
  const ViewResponses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Response'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('Hello'),
          ],
        ),
      ),
    );
  }
}
