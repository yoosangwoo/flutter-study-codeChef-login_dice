import 'package:flutter/material.dart';
import 'dice.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){}
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){}
          )
        ],
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus(); //텍스트필드 외를 온탭했을때 unfocus 되도록함
            },
            child: SingleChildScrollView( //텍스트 자판 때문에 화면이 안보여질때 사용하면 스크린에 알아서 스크롤해줌
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 50)),
                  Center(
                    child: Image(
                      image: AssetImage('image/chef.gif'),
                      width: 170.0,
                      height: 190.0,
                    ),
                  ),
                  Form(
                      child: Theme(
                          data: ThemeData(
                              primaryColor: Colors.teal,
                              inputDecorationTheme: InputDecorationTheme(
                                  labelStyle: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 15.0,
                                  )
                              )
                          ),
                          child: Container(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              children: [
                                TextField(
                                  // autofocus: true, //사용자들의 입력을 우선적으로 유도할수있음
                                  controller: controller, //TextEditingController 와 TextField 연결
                                  decoration: InputDecoration(
                                      labelText: 'Enter "dice"'
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                TextField(
                                  controller: controller2, //TextEditingController 와 TextField 연결
                                  decoration: InputDecoration(
                                      labelText: 'Enter Password'
                                  ),
                                  keyboardType: TextInputType.text,
                                  obscureText: true, //보안을 위한 obscureText
                                ),
                                SizedBox(
                                  height: 40.0,
                                ),
                                ButtonTheme(
                                    minWidth: 100.0,
                                    height: 50.0,
                                    child: RaisedButton(
                                        color: Colors.orangeAccent,
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                        onPressed: (){

                                          if(controller.text == 'dice' && controller2.text == '1234') {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (BuildContext context)=>Dice()));
                                          } else if(controller.text == 'dice' && controller2.text != '1234') {
                                            showSnackBar2(context);
                                          } else if(controller.text != 'dice' && controller2.text == '1234') {
                                            showSnackBar3(context);
                                          } else {
                                            showSnackBar(context);
                                          }

                                        })),
                              ],
                            ),
                          ))
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// if, else if, else 각 마다 띄워줄 스낵바를 따로 만든다

void showSnackBar(BuildContext context) {
  
  Scaffold.of(context).showSnackBar(
      SnackBar(content:
      Text('로그인 정보를 다시 확인하세요',
      textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
  );
}

void showSnackBar2(BuildContext context) {

  Scaffold.of(context).showSnackBar(
    SnackBar(content:
    Text('비밀번호가 일치하지 않습니다',
      textAlign: TextAlign.center,),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}

void showSnackBar3(BuildContext context) {

  Scaffold.of(context).showSnackBar(
    SnackBar(content:
    Text('dice 의 철자를 확인하세요',
      textAlign: TextAlign.center,),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}