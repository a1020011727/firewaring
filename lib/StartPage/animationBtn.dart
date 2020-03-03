import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class animationBtn extends StatefulWidget{
  final String title;
  AnimationController _controller ;
  Animation<double> _animation;

  void startAnimation(){
    if(_controller == null){
      return;
    }
    _controller.forward();
  }
  animationBtn({Key key,this.title}):super(key: key);

  @override
  animationBtnState createState() {
    // TODO: implement createState
    return new animationBtnState();
  }
}

class animationBtnState extends State<animationBtn> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    // TODO: implement initState
    widget._controller = new AnimationController(vsync: this,duration: Duration(seconds: 2));
    widget._animation = new Tween(begin: 0.0,end: 60.0).animate(widget._controller)..addListener((){
      setState(() {
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new OutlineButton(onPressed: intoLoginPage,child: Text(widget.title,style: TextStyle(fontSize: 28,color: Color.fromRGBO(245, 245, 245, widget._animation.value/60)),),);
  }

  void intoLoginPage() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('FirstRun', false);
    Navigator.pushNamedAndRemoveUntil(context, "login", (route) => route ==null);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    widget._controller.dispose();
    super.dispose();
  }
}

