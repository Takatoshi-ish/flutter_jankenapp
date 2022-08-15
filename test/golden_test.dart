import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jankenapp/main.dart';
import 'package:flutter_jankenapp/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

Future<void> loadJapaneseFont() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final binary = rootBundle.load('assets/NotoSansCJKjp-Regular.ttf');
  final loader = FontLoader('Roboto')..addFont(binary);
  await loader.load();
}

class MockViewModel extends Mock implements ViewModel {}

void main() {
  setUpAll(() async {
    await loadJapaneseFont();
  });
  const iPhone55 =
      Device(name: 'iPhone55', size: Size(414, 736), devicePixelRatio: 3.0);
  List<Device> devices = [iPhone55];

  testGoldens('normal', (tester) async {
    ViewModel viewModel = ViewModel();

    await tester.pumpWidgetBuilder(
      ProviderScope(
        child: JankenPage(viewModel),
      ),
    );

    await multiScreenGolden(
      tester,
      'jankenPage_0init',
      devices: devices,
    );
  });

  testGoldens('viewModelTest', (tester) async {
    var mock = MockViewModel();
    when(() => mock.matchCount).thenReturn(0.toString());
    // when(() => mock.countUp).thenReturn(2123456789.toString());
    // when(() => mock.countDown).thenReturn(3123456789.toString());

    final mockTitleProvider = Provider<String>((ref) => 'mockTitle');

    await tester.pumpWidgetBuilder(
      ProviderScope(
        child: JankenPage(mock),
      ),
    );

    await multiScreenGolden(
      tester,
      'jankenPage_mock',
      devices: devices,
    );

    verifyNever((() => mock.onWin()));
    verifyNever((() => mock.onDraw()));
    verifyNever((() => mock.onLose()));
    verifyNever((() => mock.onReset()));

    await tester.tap(find.byKey(const ValueKey('unit_one')));
    await tester.tap(find.byKey(const ValueKey('unit_one')));
    await tester.tap(find.byKey(const ValueKey('unit_two')));
    await tester.tap(find.byKey(const ValueKey('unit_three')));
    await tester.tap(find.byKey(const ValueKey('unit_one')));
    // await tester.tap(find.byKey(const ValueKey('unit_one')));
    // verifyNever((() => mock.onWin()));
    // verifyNever((() => mock.onDraw()));
    // verifyNever((() => mock.onLose()));
    // verify(() => mock.onReset()).called(1);

    // await tester.tap(find.byIcon(CupertinoIcons.minus));
    // await tester.tap(find.byIcon(CupertinoIcons.minus));
    // verifyNever((() => mock.onIncrease()));
    // verify(() => mock.onDecrease()).called(2);
    // verifyNever((() => mock.onReset()));

    // await tester.tap(find.byIcon(Icons.refresh));
    // verifyNever((() => mock.onIncrease()));
    // verifyNever(() => mock.onDecrease());
    // verify(() => mock.onReset()).called(1);
  });
}
