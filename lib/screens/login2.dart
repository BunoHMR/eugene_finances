import 'package:eugene_financas/models/constants.dart';
import 'package:eugene_financas/screens/home.dart';
import 'package:eugene_financas/utils/authentication.dart';
import 'package:flutter/material.dart';

class AuthDialog extends StatefulWidget {
  @override
  _AuthDialogState createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> {
  TextEditingController textControllerEmail;
  FocusNode textFocusNodeEmail;
  bool _isEditingEmail = false;

  TextEditingController textControllerPassword;
  FocusNode textFocusNodePassword;
  bool _isEditingPassword = false;

  bool _isRegistering = false;
  bool _isLoggingIn = false;

  String loginStatus;
  Color loginStringColor = Colors.green;

  String _validateEmail(String value) {
    value = value.trim();

    if (textControllerEmail.text != null) {
      if (value.isEmpty) {
        return 'Insira um Email válido';
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return 'Insira um Email válido';
      }
    }

    return null;
  }

  String _validatePassword(String value) {
    value = value.trim();

    if (textControllerEmail.text != null) {
      if (value.isEmpty) {
        return 'Insira uma Senha válida';
      } else if (value.length < 6) {
        return 'Tamanho da senha deve possuir mais de 6 caracteres';
      }
    }

    return null;
  }

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerEmail.text = null;
    textControllerPassword.text = null;
    textFocusNodeEmail = FocusNode();
    textFocusNodePassword = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BRANCO,
      body: Container(
        child: SingleChildScrollView(
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
                            bottomRight: Radius.circular(90)
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Spacer(),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image:  DecorationImage(
                              image: AssetImage("assets/images/eugene_transparent.png"),
                              fit: BoxFit.cover
                          ),
                        ),
                      ),
                      ),

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


                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      bottom: 8,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                    ),
                    child: TextField(
                      focusNode: textFocusNodeEmail,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: textControllerEmail,
                      autofocus: false,
                      onChanged: (value) {
                        setState(() {
                          _isEditingEmail = true;
                        });
                      },
                      onSubmitted: (value) {
                        textFocusNodeEmail.unfocus();
                        FocusScope.of(context)
                            .requestFocus(textFocusNodePassword);
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blueGrey[800],
                            width: 3,
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                          color: Colors.blueGrey[300],
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.grey[400]),
                        hintText: "Email",
                        fillColor: Colors.white,
                        errorText: _isEditingEmail
                            ? _validateEmail(textControllerEmail.text)
                            : null,
                        errorStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      bottom: 8,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                    ),
                    child: TextField(
                      focusNode: textFocusNodePassword,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      controller: textControllerPassword,
                      obscureText: true,
                      autofocus: false,
                      onChanged: (value) {
                        setState(() {
                          _isEditingPassword = true;
                        });
                      },
                      onSubmitted: (value) {
                        textFocusNodePassword.unfocus();
                        FocusScope.of(context)
                            .requestFocus(textFocusNodePassword);
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blueGrey[800],
                            width: 3,
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(
                          color: Colors.blueGrey[300],
                        ),
                        prefixIcon: Icon(Icons.vpn_key, color: Colors.grey[400]),
                        hintText: "Senha",
                        fillColor: Colors.white,
                        errorText: _isEditingPassword
                            ? _validatePassword(textControllerPassword.text)
                            : null,
                        errorStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: double.maxFinite,
                            child: FlatButton(
                              color: Colors.blueGrey[800],
                              hoverColor: Colors.blueGrey[900],
                              highlightColor: Colors.black,
                              onPressed: () async {
                                setState(() {
                                  _isLoggingIn = true;
                                  textFocusNodeEmail.unfocus();
                                  textFocusNodePassword.unfocus();
                                });
                                if (_validateEmail(textControllerEmail.text) ==
                                    null &&
                                    _validatePassword(
                                        textControllerPassword.text) ==
                                        null) {
                                  await signInWithEmailPassword(
                                      textControllerEmail.text,
                                      textControllerPassword.text)
                                      .then((result) {
                                    if (result != null) {
                                      print(result);
                                      setState(() {
                                        loginStatus =
                                        'Você fez Login com sucesso!';
                                        loginStringColor = Colors.green;
                                      });
                                      Future.delayed(Duration(milliseconds: 500),
                                              () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context)
                                                .pushReplacement(MaterialPageRoute(
                                              fullscreenDialog: true,
                                              builder: (context) => Home(),
                                            ));
                                          });
                                    }
                                  }).catchError((error) {
                                    print('Erro de Login: $error');
                                    setState(() {
                                      loginStatus =
                                      'Ocorreu um erro ao tentar realizar Login';
                                      loginStringColor = Colors.red;
                                    });
                                  });
                                } else {
                                  setState(() {
                                    loginStatus = 'Por favor insira o Email e a Senha';
                                    loginStringColor = Colors.red;
                                  });
                                }
                                setState(() {
                                  _isLoggingIn = false;
                                  textControllerEmail.text = '';
                                  textControllerPassword.text = '';
                                  _isEditingEmail = false;
                                  _isEditingPassword = false;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 15.0,
                                  bottom: 15.0,
                                ),
                                child: _isLoggingIn
                                    ? SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor:
                                    new AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                                    : Text(
                                  'Entrar',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: double.maxFinite,
                            child: FlatButton(
                              color: Colors.blueGrey[800],
                              hoverColor: Colors.blueGrey[900],
                              highlightColor: Colors.black,
                              onPressed: () async {
                                setState(() {
                                  textFocusNodeEmail.unfocus();
                                  textFocusNodePassword.unfocus();
                                });
                                if (_validateEmail(textControllerEmail.text) ==
                                    null &&
                                    _validatePassword(
                                        textControllerPassword.text) ==
                                        null) {
                                  setState(() {
                                    _isRegistering = true;
                                  });
                                  await registerWithEmailPassword(
                                      textControllerEmail.text,
                                      textControllerPassword.text)
                                      .then((result) {
                                    if (result != null) {
                                      setState(() {
                                        loginStatus =
                                        'Você se cadastrou com sucesso!';
                                        loginStringColor = Colors.green;
                                      });
                                      print(result);
                                    }
                                  }).catchError((error) {
                                    print('Erro de cadastro: $error');
                                    setState(() {
                                      loginStatus =
                                      'Ocorreu um erro ao tentar realizar cadastro';
                                      loginStringColor = Colors.red;
                                    });
                                  });
                                } else {
                                  setState(() {
                                    loginStatus = 'Por favor insira o Email e a Senha';
                                    loginStringColor = Colors.red;
                                  });
                                }
                                setState(() {
                                  _isRegistering = false;

                                  textControllerEmail.text = '';
                                  textControllerPassword.text = '';
                                  _isEditingEmail = false;
                                  _isEditingPassword = false;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 15.0,
                                  bottom: 15.0,
                                ),
                                child: _isRegistering
                                    ? SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor:
                                    new AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                                    : Text(
                                  'Cadastrar',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  loginStatus != null
                      ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20.0,
                      ),
                      child: Text(
                        loginStatus,
                        style: TextStyle(
                          color: loginStringColor,
                          fontSize: 14,
                          // letterSpacing: 3,
                        ),
                      ),
                    ),
                  )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40.0,
                      right: 40.0,
                    ),
                    child: Container(
                      height: 1,
                      width: double.maxFinite,
                      color: Colors.blueGrey[200],
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(child: _signInButton()),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return Home();
                },
              ),
            );
          }
        });
      },

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/images/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Entrar com o Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}