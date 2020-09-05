import 'package:eugene_financas/models/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Challenge',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {

  // f45d27
  // f5851f

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BRANCO,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      VERDE_ESCURO,
                      VERDE_CLARO
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90),
                      bottomRight: Radius.circular(90)
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Align(
                    child: Image.asset("assets/images/eugene_transparent.png",
                      fit: BoxFit.fill
                    ),
                  ),
                  Spacer(),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 32,
                          right: 32
                      ),
                      child: Text('',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(50)
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.email,
                          color: Colors.grey,
                        ),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    margin: EdgeInsets.only(top: 32),
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(50)
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.vpn_key,
                          color: Colors.grey,
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16, right: 32
                      ),
                      child: Text('Esqueci minha senha',
                        style: TextStyle(
                            color: CINZA_2
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Spacer(),

                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            CINZA_1,
                            CINZA_2
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(50)
                        )
                    ),
                    child: Center(
                      child: Text('Entrar'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16, right: 0
                      ),
                      child: Text('Não possui conta? Cadastre-se',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: CINZA_2
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}