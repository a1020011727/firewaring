import 'package:firewaring/StartPage/animationBtn.dart';
import 'package:flutter/material.dart';

class animationPage extends StatefulWidget{
  animationBtn btn = new animationBtn(title: "开启旅程",);
  
  @override
  animationPageState createState() {
    // TODO: implement createState
    return animationPageState();
  }
}

class animationPageState extends State<animationPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Center(
          child: new Image.asset("images/page4.jpg",width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
        ),
        Positioned(
            bottom: 60,
            child: widget.btn
        ),
      ],
    );
  }
}