import 'package:firewaring/Login/loginpage.dart';
import 'package:firewaring/StartPage/startPage.dart';
import 'package:firewaring/mainlib/mainPage.dart';
import 'package:flutter/material.dart';
void main() => runApp(new myApp());

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
        "login":(context) => loginPageWidget(),
        "mainpage":(context) => mainPage(),
      },

      home: startPageWidget(),
    );
  }
}