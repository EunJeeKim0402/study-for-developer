import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(BaseballGame());
}

// StatefulWidget : 동적인 UI때 주로 사용. 화면이 다시그려지는 등...
// StatelessWidget : 정적인 UI때 주로 사용. 한번 그려지면 변하지않음.
class BaseballGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '숫자야규게임',
      home: GameScreen(),
    );
  }
}

// createState() 메소드가 호출될 때 _GameScreenState클래스의 인스턴스 생성&반환
class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Random random = Random();
  List<int> answerNumbers = [];
  String input = '';
  String message = '';

  @override
  void initState() {
    super.initState();
    createAnswerNumbers();
  }

  void createAnswerNumbers() {
    while (answerNumbers.length < 3) {
      int number = random.nextInt(9) + 1; // 1~9
      // 중복제거
      if (!answerNumbers.contains(number)) {
        answerNumbers.add(number);
      }
    }
  }

  void checkAnswer() {
    if (input.length != 3) {
      setState(() {
        message = '3개의 숫자를 입력해주세요.';
      });
      return;
    }

    // int.parse로 문자 -> 정수. e는 매개변수? 임시변수
    List<int> userNumbers = input.split('').map((e) => int.parse(e)).toList();

    int success = 0;
    int fail = 0;

    for (int i = 0; i < userNumbers.length; i++) {
      if (userNumbers[i] == answerNumbers[i]) {
        success++;
      } else {
        for (int j = 0; j < answerNumbers.length; j++) {
          if (userNumbers[i] == answerNumbers[j]) {
            fail++;
            break;
          }
        }
      }
    }

    setState(() {
      message = '맞은 갯수: $success, 위치만 틀린 갯수: $fail';

      if (success == 3) {
        message += '\n정답입니다! 축하합니다!';
      }
    });
  }

  void resetGame() {
    setState(() {
      answerNumbers.clear();
      input = '';
      message = '';
      createAnswerNumbers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('숫자 야구 게임'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // 위젯의 여백 - 네방향 패딩값 지정.
        child: Column(
          children: [
            Text(
              '중복되지 않는 숫자를 3개 입력해주세요. (1~9)',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                input = value;
                });
              },
              keyboardType: TextInputType.number,
              maxLength: 3,
              decoration: InputDecoration(
                hintText: '숫자를 입력하세요',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: checkAnswer,
              child: Text('확인'),
            ),
            SizedBox(height: 16.0),
            Text(
              message,
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: resetGame,
              child: Text('재시작'),
            ),
          ],
        ),
      ),
    );
  }
}