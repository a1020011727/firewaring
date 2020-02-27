import 'package:flutter/material.dart';
import 'package:firewaring/Login/loginpage.dart';
void main() => runApp(new myApp());

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "FireWarning",
      theme: ThemeData(
        primaryColor: Colors.black45
      ),
      home: loginPageWidget() ,
    );
  }
}