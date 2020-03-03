import 'package:firewaring/StartPage/animationpage.dart';
import 'package:flutter/material.dart';

class guidePage extends StatefulWidget{
  @override
  guidePageState createState() {
    // TODO: implement createState
    return guidePageState();
  }
}
class guidePageState extends State<guidePage>{
 animationPage _animationPage = new animationPage();

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new PageView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            new Image.asset("images/page1.jpg",fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
            new Image.asset("images/page2.jpg",fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
            new Image.asset("images/page3.jpg",fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
            _animationPage
          ],
            onPageChanged: startPagePaged,
        )
      ],
    );
  }

  void startPagePaged(int page){
   if(page == 3){
     _animationPage.btn.startAnimation();
   }
  }
}