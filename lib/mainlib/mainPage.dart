import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class mainPage extends StatefulWidget {
  @override
  mainPageState createState() {
    // TODO: implement createState
    return mainPageState();
  }
}

class mainPageState extends State<mainPage> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: new Text("传感监控"),
        ),
        body: Container(
          margin: const EdgeInsets.only(right: 15, left: 15, top: 15),
          child: Wrap(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        child:Container(
                          padding: const EdgeInsets.only(top: 10),
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              border: Border.all(width: 3,color: Colors.blue),
                              borderRadius: BorderRadius.all(Radius.circular(4.0))
                          ),
                          child:  Column(
                            children: <Widget>[
                              Image.asset("images/tempture.png",width: w/5,),
                              Text("温度：$value")
                            ],
                          ),
                        )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        child:Container(
                          padding: const EdgeInsets.only(top: 10),
                          margin: const EdgeInsets.only(right: 5,left: 5),
                          decoration: BoxDecoration(
                              border: Border.all(width: 3,color: Colors.blue),
                              borderRadius: BorderRadius.all(Radius.circular(4.0))
                          ),
                          child:  Column(
                            children: <Widget>[
                              Image.asset("images/humidity.png",width: w/5,),
                              Text("湿度：$value")
                            ],
                          ),
                        )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                        child:Container(
                          padding: const EdgeInsets.only(top: 10),
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              border: Border.all(width: 3,color: Colors.blue),
                              borderRadius: BorderRadius.all(Radius.circular(4.0))
                          ),
                          child:  Column(
                            children: <Widget>[
                              Image.asset("images/smoke.png",width: w/5,),
                              Text("烟雾：$value")
                            ],
                          ),
                        )
                    ),
                  ),

                ],
              ),
              RaisedButton(
                  child: Text("获取数据"),
                  onPressed: ()async{
                    Dio dio = new Dio();

                    var va = await dio.get("/flutter",);
                  }
              )
            ],
          ),
        ));
  }
}
