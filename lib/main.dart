import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Input Screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String firstName = '';
  String middleName = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            textAlign: TextAlign.center,
            onChanged: (text) {
              firstName = text;
            },
            decoration: const InputDecoration(
              hintText: 'Enter your first name',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name!';
              }
              return null;
            },
          ),
          TextFormField(
            textAlign: TextAlign.center,
            onChanged: (text) {
              middleName = text;
            },
            decoration: const InputDecoration(
              hintText: 'Enter your middle name',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your middle name!';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HelloScreen(
                      middleName: middleName,
                      firstName: firstName,
                    )));
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}



// ignore: must_be_immutable
class HelloScreen extends StatelessWidget {
  String firstName;
  String middleName;
  HelloScreen({required this.firstName, required this.middleName, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
            'Welcome $firstName $middleName',
          )),
      appBar: AppBar(
        title: const Text('Hello Screen'),
      ),
    );
  }
}