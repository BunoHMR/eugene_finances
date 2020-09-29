import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]).then((_){
    runApp(EugeneApp());
  });
}

class EugeneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eugene Finanças',
      theme: ThemeData(
          brightness:Brightness.dark,
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF212121),
          accentColor: const Color(0xFF64ffda),
          canvasColor: const Color(0xFF303030),
        ),
      home: LoginPage(),
    );
  }
}