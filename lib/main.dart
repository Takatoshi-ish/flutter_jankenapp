import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: JankenPage(),
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
    'Drow': 0,
    'Lose': 0,
  };

  void selectHand(String selectedHand) {
    if (matchCount == 5) {
      result = '試合中';
      matchCount = 0;
      matchResult = {
        //試合結果を記録する変数
        'Win': 0,
        'Drow': 0,
        'Lose': 0,
      };
    }
    myHand = selectedHand;
    print(myHand);
    generateComputerHand();
    judge();
    matchCount++; //試合ごとにプラス１する
    print("試合数：${matchCount}");
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

  // void judge() {
  //   if (myHand == computerHand) {
  //     result = '引き分け';
  //   } else if (myHand == '✊' && computerHand == '✌️' ||
  //       myHand == '✌️' && computerHand == '🖐' ||
  //       myHand == '🖐' && computerHand == '✊') {
  //     result = '勝ち';
  //   } else {
  //     result = '負け';
  //   }
  //   matchResult.add(result); //試合のたびに結果を記録する
  // }

  void judge() {
    if (myHand == computerHand) {
      matchResult['Drow'] = matchResult['Drow']! + 1;
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
    if (matchResult['Win']! > 3) {
      result = '勝ち';
    } else if (matchResult['Win']! == 2 && matchResult['Drow'] == 1) {
      result = '引き分け';
    } else {
      result = '負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: TextStyle(fontSize: 32),
            ),
            Text(
              "試合数：${matchCount}試合目",
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 48),
            Text(
              computerHand,
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 48),
            Text(
              myHand,
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHand('✊');
                  },
                  child: Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('✌️');
                  },
                  child: Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('🖐');
                  },
                  child: Text('🖐'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
