import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_jankenapp/main.dart';
import 'package:flutter_jankenapp/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> loadJapaneseFont() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final binary = rootBundle.load('assets/NotoSansCJKjp-Regular.ttf');
  final loader = FontLoader('Roboto')..addFont(binary);
  await loader.load();
}

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
}
