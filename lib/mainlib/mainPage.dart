import 'package:dio/dio.dart';
import 'package:firewaring/mainlib/chart/linechart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class mainPage extends StatefulWidget {
  @override
  mainPageState createState() {
    // TODO: implement createState
    return mainPageState();
  }
}

class mainPageState extends State<mainPage> {
  int value = 1;
  List<Linesales> dataline = [
    new Linesales(new DateTime(2019, 7, 2), 33),
    new Linesales(new DateTime(2019, 7, 3), 55),
    new Linesales(new DateTime(2019, 7, 4), 22),
    new Linesales(new DateTime(2019, 7, 5), 88),
    new Linesales(new DateTime(2019, 7, 6), 123),
    new Linesales(new DateTime(2019, 7, 7), 75),
  ];
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
//        appBar: AppBar(
//          title: new Text("传感监控"),
//        ),
        body: Container(
          margin: const EdgeInsets.only(right: 10, left: 10, top: 25),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 3,color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                child: Wrap(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("传感器状态",style: TextStyle(fontSize: 18),),

                      ],
                    ),
                    Divider(color: Colors.blue,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                              child:Container(
                                alignment: Alignment.center,
//                          padding: const EdgeInsets.only(top: 10),
                                margin: const EdgeInsets.only(right: 5,left: 5),
//                          decoration: BoxDecoration(
//                              border: Border.all(width: 3,color: Colors.blue),
//                              borderRadius: BorderRadius.all(Radius.circular(4.0))
//                          ),
                                child:  Column(
                                  children: <Widget>[
                                    Image.asset("images/tempture.png",width: w/6,),
//                              Text("温度：$value")
                                  ],
                                ),
                              )
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                              child:Container(
//                          padding: const EdgeInsets.only(top: 10),
                                margin: const EdgeInsets.only(right: 5,left: 5),
//                          decoration: BoxDecoration(
//                              border: Border.all(width: 3,color: Colors.blue),
//                              borderRadius: BorderRadius.all(Radius.circular(4.0))
//                          ),
                                child:  Column(
                                  children: <Widget>[
                                    Image.asset("images/humidity.png",width: w/6,),
//                              Text("湿度：$value")
                                  ],
                                ),
                              )
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                              child:Container(
//                          padding: const EdgeInsets.only(top: 10),
                                margin: const EdgeInsets.only(right: 5,left: 5),
//                          decoration: BoxDecoration(
//                              border: Border.all(width: 3,color: Colors.blue),
//                              borderRadius: BorderRadius.all(Radius.circular(4.0))
//                          ),
                                child:  Column(
                                  children: <Widget>[
                                    Image.asset("images/shake.png",width: w/6,),
//                              Text("湿度：$value")
                                  ],
                                ),
                              )
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                              child:Container(
                                //     padding: const EdgeInsets.only(top: 10),
                                margin: const EdgeInsets.only(right: 5,left: 5),
//                          decoration: BoxDecoration(
//                              border: Border.all(width: 3,color: Colors.blue),
//                              borderRadius: BorderRadius.all(Radius.circular(4.0))
//                          ),
                                child:  Column(
                                  children: <Widget>[
                                    Image.asset("images/electricity.png",width: w/6,),
//                              Text("湿度：$value")
                                  ],
                                ),
                              )
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                              child:Container(
                                //padding: const EdgeInsets.only(top: 10),
                                margin: const EdgeInsets.only(right: 5,left: 5),
//                          decoration: BoxDecoration(
//                              border: Border.all(width: 3,color: Colors.blue),
//                              borderRadius: BorderRadius.all(Radius.circular(4.0))
//                          ),
                                child:  Column(
                                  children: <Widget>[
                                    Image.asset("images/volte.png",width: w/6,),
//                              Text("湿度：$value")
                                  ],
                                ),
                              )
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                              child:Container(
                                // padding: const EdgeInsets.only(top: 10),
                                margin: const EdgeInsets.only(left: 5),
//                          decoration: BoxDecoration(
//                              border: Border.all(width: 3,color: Colors.blue),
//                              borderRadius: BorderRadius.all(Radius.circular(4.0))
//                          ),
                                child:  Column(
                                  children: <Widget>[
                                    Image.asset("images/smoke.png",width: w/6,),
//                              Text("烟雾：$value")
                                  ],
                                ),
                              )
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
              Container(
                height: 200,
                width: w,
                margin: const EdgeInsets.only(top:10),
                child:Swiper(
                  itemCount: 1,
                  itemBuilder: (BuildContext context,int index){
                    return ClipRRect(child:Image.asset("images/banner.jpg",fit: BoxFit.cover,),
                    borderRadius: BorderRadius.circular(20),
                    );
                  },
                ) ,
              ),
              Container(
                height: 300,
                child: getline(dataline),
              )
            ],
          )
        )
    );
  }
}
