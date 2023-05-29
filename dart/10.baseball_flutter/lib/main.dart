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
  bool trueInput = true; // 숫자인지 아닌지 유효성검사

  @override
  void initState() {
    super.initState();
    createAnswerNumbers(); // 위젯 초기화 시 정답 숫자 생성
  }

  void createAnswerNumbers() {
    answerNumbers.clear(); // 리스트 비우기
    Set<int> uniqueNumbers = Set<int>(); // Set은 중복값 불허

    while (uniqueNumbers.length < 3) {
      int number = random.nextInt(10); // 0~9 사이의 난수 생성
      uniqueNumbers.add(number);
    }
    answerNumbers = uniqueNumbers.toList(); // 리스트로 변환하여 저장
  }

  void checkAnswer() {
    if (input.length != 3) {
      setState(() {
        message = '3개의 숫자를 입력해주세요.'; // 입력이 3개가 아닐 경우 에러 메시지 설정
      });
      return;
    }

    List<int> userNumbers = input.split('').map((e) => int.parse(e)).toList(); // 문자열에서 숫자 분리하여 리스트로 저장

    if (duplicateNumbers(userNumbers)) {
      setState(() {
        message = '숫자가 중복되었습니다. 다시 입력해주세요.'; // 중복된 숫자일 경우 에러 메시지 설정
        input = '';
      });
      return;
    }

    int success = 0; // 정답과 일치하는 숫자와 위치의 개수
    int fail = 0; // 정답과 일치하지 않는 숫자의 개수

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

  bool duplicateNumbers(List<int> numbers) {
    Set<int> uniqueNumbers = Set<int>();

    for (int number in numbers) {
      if (uniqueNumbers.contains(number)) {
        return true; // 중복된 숫자가 있을 경우 true 반환
      }
      uniqueNumbers.add(number);
    }
    return false; // 중복된 숫자가 없을 경우 false 반환
  }

  void resetGame() {
    setState(() {
      answerNumbers.clear();
      input = '';
      message = '';
      createAnswerNumbers();
      showAnswer = false;
      trueInput = true;
    });
  }

  void showAnswerNumbers() {
    setState(() {
      showAnswer = true; // 정답 보기 버튼을 누를 경우 정답 숫자 표시
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
              '중복되지 않는 숫자를 3개 입력해주세요. (0~9)',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    input = '';
                    message = '';
                    trueInput = true; // 입력값이 공란 -> 유효
                  } else if (int.tryParse(value) != null && value.length <= 3) {
                    if (value.length == 1 && input.contains(value)) {
                      input = input.substring(0, input.length - 1);
                    } else {
                      input = value;
                    }
                    message = '';
                    trueInput = true; // 숫자 -> 유효
                  } else {
                    message = '정수만 입력 가능합니다.';
                    trueInput = false; // 숫자가 아님 -> 유효하지 않음
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
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: trueInput ? checkAnswer : null, // 입력값이 유효한 경우에만 버튼 활성화
                child: Text('확인'),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity, // 가로 전체차지
              child: ElevatedButton(
                onPressed: resetGame,
                child: Text('재시작'),
              ),
            ),
            SizedBox(height: 16.0),
            if (showAnswer)
              Text(
                '정답: ${answerNumbers.join()}',
                style: TextStyle(fontSize: 18.0),
              ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: showAnswerNumbers,
                child: Text('정답 보기'),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              child: Text(
                message,
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
