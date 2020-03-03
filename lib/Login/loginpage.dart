import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class loginPageWidget extends StatefulWidget {
  @override
  loginPageState createState() {
    // TODO: implement createState
    return loginPageState();
  }
}
FocusNode usrNode = new FocusNode();
FocusNode passNode = new FocusNode();
class loginPageState extends State<loginPageWidget> {
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passWordController = new TextEditingController();
  bool _checkbox = true;

  @override
  void initState() {
    // TODO: implement initState
    _userNameController.addListener(() {});
    _passWordController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: h / 20, right: w / 15, left: w / 15),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 35),
                child:Icon(
                  Icons.backup,
                  size: 136,
                  color: Colors.green[300],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35),
                child: Text(
                  "首次注册用户可领取奖励！",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              createTextField(context, "请输入邮箱或者手机号", 1, false,
                  _userNameController, usrNode),
              createTextField(
                  context, "请输入密码", 2, true, _passWordController, passNode),
              Container(
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green[300]
                ),
                child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: (){
                      print("用户名："+_userNameController.text+"密码为："+_passWordController.text );
                      Navigator.of(context).pushNamedAndRemoveUntil("mainpage", (route) => route == null);
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(top: 35),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: _checkbox,
                        activeColor: Colors.red,
                        onChanged: (v){
                          setState(() {
                            _checkbox = v;
                          });
                    }),
                    Text("使用软件代表您同意软件准则和隐私条款")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

Widget createTextField(BuildContext context, String hintText, int type,
    autovalidate, TextEditingController _controller, FocusNode _focusNode) {
  return Theme(
    data: new ThemeData(primaryColor: Colors.red, hintColor: Color(0xffa8afc3)),
    child: new ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 54,
      ),
      child: new Padding(
        padding: EdgeInsets.only(left: 19, top: 15),
        child: new TextFormField(
          autofocus: 1 == type,
          obscureText: 2 == type,
          focusNode: _focusNode,
          controller: _controller,
          // 使用maxLength在有最大长度和当前输入长度的提示
          maxLength: 1 == type ? 11 : 18,
          inputFormatters: <TextInputFormatter>[
            LengthLimitingTextInputFormatter(1 == type ? 11 : 18)
          ],
          // 是否开启自动验证
          autovalidate: autovalidate,
          textInputAction: 1 == type ? TextInputAction.next : TextInputAction.done,
          onFieldSubmitted: (_){
            if (1 == type){
              usrNode.unfocus();
              FocusScope.of(context).requestFocus(passNode);
            } else{
              passNode.unfocus();
            }
          },
          validator: (value) {
            return value.length < 4 && value.length > 0 ? "密码长度不够4位" : null;
          },
          decoration: new InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xffa8afc3),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue)),
            border: UnderlineInputBorder(),
          ),
        ),
      ),
    ),
  );
}
