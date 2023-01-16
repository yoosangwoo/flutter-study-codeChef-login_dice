import 'package:flutter/material.dart';
import 'dart:math'; //랜덤으로 숫자를 불러오려면 dart:math 임포트
import 'package:fluttertoast/fluttertoast.dart';


class Dice extends StatefulWidget {
  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {

  int leftDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent ,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Dice game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(32.0),
              child: Row(
                children: [
                  Expanded(
                      // flex: 2, //배수로 키운다
                      child: Image.asset('image/dice$leftDice.png')),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(child: Image.asset('image/dice$rightDice.png')),
                ],
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            ButtonTheme(
              minWidth: 100.0,
              height: 60.0,
              child: RaisedButton(
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50.0,
                ),
                  color: Colors.orangeAccent,
                  onPressed: (){
                  setState(() {
                    leftDice = Random().nextInt(6) + 1; //dart.math 를 임포트해 Random() 함수를 쓴다
                    rightDice = Random().nextInt(6) + 1;
                  });
                    showToast("Left dice: {$leftDice}, Right dice: {$rightDice}");
                  }),
            )
          ],
        ),
      ),
    );
  }
}

void showToast(String message){
  Fluttertoast.showToast(msg: message,
  backgroundColor: Colors.white, //토스트 메세지의 배경색
    toastLength: Toast.LENGTH_SHORT, //토스트 메세지의 지속시간 (짧,길)
    gravity: ToastGravity.BOTTOM, //토스트 메세지의 출력위치
  );
}