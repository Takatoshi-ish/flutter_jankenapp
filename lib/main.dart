import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'view_model.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
      home: JankenPage(ViewModel()),
    );
  }
}

class JankenPage extends ConsumerStatefulWidget {
  final ViewModel viewModel;
  const JankenPage(this.viewModel, {Key? key}) : super(key: key);

  @override
  ConsumerState<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends ConsumerState<JankenPage> {
  late ViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModel;
    _viewModel.setRef(ref);
  }

  String myHand = '✊';
  String computerHand = '✊';
  String result = '試合中';

  void resetGame() {
    result = '試合中';
    _viewModel.onReset();
  }

  void selectHand(String selectedHand) {
    if (_viewModel.matchCount == 5) {
      resetGame();
    }
    myHand = selectedHand;
    print(myHand);
    generateComputerHand();
    judge();
    if (_viewModel.matchCount == 5) {
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
      _viewModel.onDraw();
      print("自分：$myHand, 相手：$computerHand  引き分け");
    } else if (myHand == '✊' && computerHand == '✌️' ||
        myHand == '✌️' && computerHand == '🖐' ||
        myHand == '🖐' && computerHand == '✊') {
      _viewModel.onWin();
      print("自分：$myHand, 相手：$computerHand 勝ち");
    } else {
      _viewModel.onLose();
      print("自分：$myHand, 相手：$computerHand 負け");
    }
  }

  //５試合の結果を出力
  void winAndLose() {
    debugPrint("WinAndLose");
    if (_viewModel.winCount > _viewModel.loseCount!) {
      result = '勝ち';
    } else if (_viewModel.winCount == _viewModel.loseCount) {
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
            if (_viewModel.matchCount == 5) ...{
              Text(
                '勝ち:${_viewModel.winCount}回 負け:${_viewModel.loseCount} 引き分け:${_viewModel.drawCount}回',
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 15),
            },
            Text(
              '試合数：${_viewModel.matchCount}試合目',
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
                  key: const ValueKey('unit_one'),
                  onPressed: () {
                    selectHand('✊');
                  },
                  child: const Text('✊'),
                ),
                ElevatedButton(
                  key: const ValueKey('unit_two'),
                  onPressed: () {
                    selectHand('✌️');
                  },
                  child: const Text('✌️'),
                ),
                ElevatedButton(
                  key: const ValueKey('unit_three'),
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
