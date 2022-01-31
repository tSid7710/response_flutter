import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

class ResultPage extends StatefulWidget {
  static const String id = "result_page";
  const ResultPage({Key? key}) : super(key: key);
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final snap = _firestore.collection("feedbacks").get();
    // for (var msg in snap) {
    //   String op = snap['option'];
    // }
    List<Responses> responses = [
      Responses("Option1", 21, Colors.green),
      Responses("Option2", 33, Colors.yellow),
      Responses("Option3", 10, Colors.blue),
      Responses("Option4", 36, Colors.orange),
    ];

    List<charts.Series<Responses, String>> series = [
      charts.Series(
        data: responses,
        id: "Responses Validation",
        domainFn: (Responses resp, _) => resp.option,
        measureFn: (Responses resp, _) => resp.count,
        colorFn: (Responses resp, _) =>
            charts.ColorUtil.fromDartColor(resp.barColor),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Responses Received'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: charts.BarChart(series),
          ),
        ),
      ),
    );
  }
}

class Responses {
  final String option;
  final int count;
  final Color barColor;
  Responses(this.option, this.count, this.barColor);
}
