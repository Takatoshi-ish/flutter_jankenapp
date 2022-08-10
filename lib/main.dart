import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Janken App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({Key? key}) : super(key: key);

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '✊';
  String computerHand = '✊';
  String result = '試合中';
  int matchCount = 0; //試合数を入れる変数
  Map<String, int> matchResult = {
    //試合結果を記録する変数
    'Win': 0,
    'Draw': 0,
    'Lose': 0,
  };

  void resetGame() {
    result = '試合中';
    matchCount = 0;
    matchResult = {
      //試合結果を記録する変数
      'Win': 0,
      'Draw': 0,
      'Lose': 0,
    };
  }

  void selectHand(String selectedHand) {
    if (matchCount == 5) {
      resetGame();
    }
    myHand = selectedHand;
    print(myHand);
    generateComputerHand();
    judge();
    matchCount++; //試合ごとにプラス１する
    print('試合数：${matchCount}');
    if (matchCount == 5) {
      winAndLose();
    }
    setState(() {});
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);

    computerHand = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✌️';
      case 2:
        return '🖐';
      default:
        return '✊';
    }
  }

  void judge() {
    if (myHand == computerHand) {
      matchResult['Draw'] = matchResult['Draw']! + 1;
      print("自分：${myHand}, 相手：${computerHand}  引き分け");
    } else if (myHand == '✊' && computerHand == '✌️' ||
        myHand == '✌️' && computerHand == '🖐' ||
        myHand == '🖐' && computerHand == '✊') {
      matchResult['Win'] = matchResult['Win']! + 1;
      print("自分：${myHand}, 相手：${computerHand} 勝ち");
    } else {
      matchResult['Lose'] = matchResult['Lose']! + 1;
      print("自分：${myHand}, 相手：${computerHand} 負け");
    }
  }

  //５試合の結果を出力
  void winAndLose() {
    if (matchResult['Win']! > matchResult['Lose']!) {
      result = '勝ち';
    } else if (matchResult['Win'] == matchResult['Lose']) {
      result = '引き分け';
    } else {
      result = '負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 15),
            if (matchCount == 5) ...{
              Text(
                '勝ち:${matchResult['Win']}回 負け:${matchResult['Lose']}回 引き分け:${matchResult['Draw']}回',
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 15),
            },
            Text(
              '試合数：${matchCount}試合目',
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 48),
            Text(
              computerHand,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 48),
            Text(
              myHand,
              style: const TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHand('✊');
                  },
                  child: const Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('✌️');
                  },
                  child: const Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('🖐');
                  },
                  child: const Text('🖐'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
