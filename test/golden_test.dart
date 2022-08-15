import 'dart:ui';

import 'package:flutter_jankenapp/main.dart';
import 'package:flutter_jankenapp/view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
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
