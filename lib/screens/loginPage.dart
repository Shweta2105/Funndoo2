import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:funndoonotes2/screens/base_screen.dart';

class LoginPage extends BaseScreen {
  @override
  // ignore: unnecessary_new
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends BaseScreenState {
  TextEditingController emailController = TextEditingController();
  FocusNode passwordFocus = new FocusNode();
  FocusNode emailFocus = new FocusNode();
  TextEditingController passwordController = TextEditingController();
  bool emailValid = true;
  bool passwordValid = true;
  RegExp emailRegExp = new RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  _emailRequestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(emailFocus);
    });
  }

  _passwordRequestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(passwordFocus);
    });
  }

  Widget getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: HexColor('#446DFF'),
      title: Text(
        'Fundo_Notes',
        style: TextStyle(fontSize: 20.0, color: HexColor('#FFFFFF')),
      ),
      centerTitle: true,
    );
  }

  @override
  Widget getBody(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'FundoNotes Login',
                style: TextStyle(
                  color: HexColor('#96C3EB'),
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Card(
                color: HexColor('#FFFFFF'),
                elevation: 10,
                child: Container(
                  height: 100,
                  width: 135,
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset('assets/Images/fundooIcon.jpg'),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: emailController,
                focusNode: emailFocus,
                onTap: _emailRequestFocus,
                onChanged: (value) {
                  if (emailRegExp.hasMatch(value)) {
                    emailValid = true;
                  } else {
                    emailValid = false;
                  }
                  setState(() {});
                },
                style: new TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: HexColor('#606E74')),
                decoration: InputDecoration(
                    labelText: 'Email Id',
                    errorText: emailValid ? null : "Invalid email",
                    errorStyle: const TextStyle(fontSize: 15),
                    labelStyle: TextStyle(
                        color: emailFocus.hasFocus
                            ? emailValid
                                ? Colors.amberAccent
                                : Colors.red
                            : HexColor('#658292')),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor('#658292'))),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      borderSide: emailFocus.hasFocus
                          ? const BorderSide(color: Colors.amber, width: 1.2)
                          : BorderSide(color: HexColor('#658292')),
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                child: SizedBox(
                  child: TextField(
                    controller: passwordController,
                    focusNode: passwordFocus,
                    onTap: _passwordRequestFocus,
                    onChanged: (value) {
                      value.length >= 6
                          ? passwordValid = true
                          : passwordValid = false;
                      setState(() {});
                    },
                    style: new TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: HexColor('#606E74')),
                    decoration: InputDecoration(
                        labelText: 'Password',
                        errorText: passwordValid ? null : "Invalid password",
                        errorStyle: const TextStyle(fontSize: 15),
                        labelStyle: TextStyle(
                            color: passwordFocus.hasFocus
                                ? passwordValid
                                    ? Colors.amberAccent
                                    : Colors.red
                                : HexColor('#658292')),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: HexColor('#658292'))),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          borderSide: passwordFocus.hasFocus
                              ? const BorderSide(
                                  color: Colors.amber, width: 1.2)
                              : BorderSide(color: HexColor('#658292')),
                        )),
                  ),
                ),
              ),
            ),
            FlatButton(
                onPressed: () => {
                      Navigator.pushNamed(context, '/forgot_password')
                      //forgot password screen
                    },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const <Widget>[
                    // ignore: prefer_const_constructors
                    Text(
                      'Forgot Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Login'),
                  onPressed: () {
                    print(emailController.text);
                    print(passwordController.text);
                  },
                )),
            Container(
                child: Row(
              children: <Widget>[
                Text('Does not have account?'),
                FlatButton(
                  textColor: Colors.blue,
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup_page');
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
          ],
        ),
      ),
    );
  }
}
