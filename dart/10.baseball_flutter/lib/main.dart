import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(BaseballGame());
}

class BaseballGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '숫자야구게임',
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Random random = Random();
  List<int> answerNumbers = [];
  String input = ''; // 사용자의 입력을 저장
  String message = ''; // 상태 메시지 저장
  bool showAnswer = false; // 정답 보여줄지 말지

  // 위젯이 초기화될때 호출됨. 초기화와 동시에 정답숫자 생성
  @override
  void initState() {
    super.initState();
    createAnswerNumbers();
  }

  // 답변을 만드는 함수
  void createAnswerNumbers() {
    answerNumbers.clear(); // 리스트를 비움
    Set<int> uniqueNumbers = Set<int>(); // Set은 중복값 불허

    while (uniqueNumbers.length < 3) {
      int number = random.nextInt(10); // 0~9
      uniqueNumbers.add(number);
    }
    answerNumbers = uniqueNumbers.toList();
  }

  void checkAnswer() {
    if (input.length != 3) {
      setState(() {
        message = '3개의 숫자를 입력해주세요.';
      });
      return;
    }

    // 숫자를 문자열에서 분리해서 정수리스트 userNumbers에 저장
    List<int> userNumbers = input.split('').map((e) => int.parse(e)).toList();

    if (duplicateNumbers(userNumbers)) {
      setState(() {
        message = '숫자가 중복되었습니다. 다시 입력해주세요.';
        input = '';
      });
      return;
    }

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

  // 중복확인
  bool duplicateNumbers(List<int> numbers) {
    Set<int> uniqueNumbers = Set<int>();

    for (int number in numbers) {
      if (uniqueNumbers.contains(number)) {
        // 리스트 숫자 중 이미 uniqueNumbers에 존재하는 숫자면 중복이니깐 true
        return true;
      }
      uniqueNumbers.add(number);
    }
    return false;
  }

  // 겜 초기화
  void resetGame() {
    setState(() {
      answerNumbers.clear();
      input = '';
      message = '';
      createAnswerNumbers();
      showAnswer = false;
    });
  }

  // 정답 보여주기
  void showAnswerNumbers() {
    setState(() {
      showAnswer = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('숫자 야구 게임'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '중복되지 않는 숫자를 3개 입력해주세요. (1~9)',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            TextField( // TextField를 이용해서 사용자의 입력을 받음. 입력 변경될때마다 onChanged
              onChanged: (value) {
                setState(() {
                  if (value.length == 1 && input.contains(value)) {
                    input = input.substring(0, input.length - 1);
                  } else {
                    input = value;
                  }
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
            ElevatedButton(
              onPressed: resetGame,
              child: Text('재시작'),
            ),
            SizedBox(height: 16.0),
            if (showAnswer)
              Text(
                '정답: ${answerNumbers.join()}',
                style: TextStyle(fontSize: 18.0),
              ),
            ElevatedButton(
              onPressed: showAnswerNumbers,
              child: Text('정답 보기'),
            ),
            SizedBox(height: 16.0),
            Text(
              message,
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
