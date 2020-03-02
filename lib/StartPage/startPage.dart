import 'dart:async';
import 'package:firewaring/Login/loginpage.dart';
import 'package:flutter/material.dart';

class startPageWidget extends StatefulWidget {
  @override
  startPageState createState() {
    // TODO: implement createState
    return startPageState();
  }
}

class startPageState extends State<startPageWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;//AnimationController是Animation的一个子类，它可以控制Animation，可以控制动画的时间，类型，过渡3曲线
  Animation _animation;//动画类，创建动画实例
  Timer _timer;//timer计时器实例
  int count = 3;//倒计时计数器

  void _goMain() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return loginPageWidget();
    }), (route) => route == null);
  }//跳转Login页面并销毁启动页方法

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    //上面两行代码表示初始化一个Animation控制器， vsync垂直同步，动画执行时间3000毫秒,然后我们设置一个Animation动画，使用上面设置的控制器

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _goMain();
      }
    });//为动画添加监听事件，当动画完成时，跳转至login页面

    _animationController.forward();//播放动画


    _timer = new Timer.periodic(new Duration(seconds: 1), (Timer timer) {
      if (count == 0) {
        _timer.cancel();
      }
      count--;
      setState(() {
        count;
      });
    });//计时器，三秒完成时自动销毁，主要为启动页右下角按钮提供倒计时数字
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Stack(//层叠布局
      alignment: Alignment.bottomRight,//对齐方式右下角
      children: <Widget>[
        FadeTransition(//透明动画组件
            child: Image.asset(
              "images/image2.jpeg",
              fit: BoxFit.cover,//图片铺满
            ),
            opacity: _animation),//绑定动画
        Container(
            margin: const EdgeInsets.only(right: 10, bottom: 10),
            child: RaisedButton(
                child: Text(
                  "跳过 $count",
                  style: TextStyle(fontSize: 16, color: Colors.orange),
                ),
                color: Colors.grey[300],
                onPressed: _goMain))
      ],
    );
  }
}
