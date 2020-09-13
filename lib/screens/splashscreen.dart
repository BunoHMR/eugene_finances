
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/constants.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: VERDE_ESCURO, statusBarColor: VERDE_ESCURO));
    Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: VERDE_ESCURO,
        child: Center(
          child: Container(
            width: 240,
            height: 180,
            child: Image.asset("assets/images/eugene_transparent.png"),
          ),
        ));
  }
}
