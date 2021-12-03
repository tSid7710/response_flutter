import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewVoting extends StatefulWidget {
  static const String id = 'new_voting';
  const NewVoting({Key? key}) : super(key: key);

  @override
  _NewVotingState createState() => _NewVotingState();
}

class _NewVotingState extends State<NewVoting> {
  String? selectedOption;
  int favourite = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Voting'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Which is the best among these company to collaborate ? ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RadioListTile(
                value: 'Option1',
                activeColor: Colors.teal,
                groupValue: selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
                title: const Text('Google'),
              ),
              RadioListTile(
                value: 'Option2',
                activeColor: Colors.teal,
                groupValue: selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
                title: const Text('Yahoo'),
              ),
              RadioListTile(
                value: 'Option3',
                activeColor: Colors.teal,
                groupValue: selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
                title: const Text('Microsoft'),
              ),
              RadioListTile(
                value: 'Option4',
                activeColor: Colors.teal,
                groupValue: selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
                title: const Text('Twitter'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'How much do you think this collaboration would succeed',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '$favourite %',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Slider(
                min: 0,
                max: 100,
                value: favourite.toDouble(),
                activeColor: Colors.teal,
                onChanged: (double value) {
                  setState(() {
                    favourite = value.round();
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                maxLines: 5,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Write your feedback here'),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Submit Response',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
