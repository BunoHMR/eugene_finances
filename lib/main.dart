import 'package:eugene_financas/screens/login2.dart';
import 'package:flutter/material.dart';

import 'screens/login.dart';

void main() => runApp(EugeneApp());

class EugeneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eugene Finanças',
      theme: ThemeData(
          primarySwatch: Colors.lightGreen
      ),
      home: AuthDialog(),
    );
  }
}