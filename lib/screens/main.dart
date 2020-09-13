import 'package:flutter/material.dart';

import 'login.dart';

void main() => runApp(EugeneApp());

class EugeneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eugene Finanças',
      theme: ThemeData(
          primarySwatch: Colors.lightGreen
      ),
      home: LoginPage(),
    );
  }
}