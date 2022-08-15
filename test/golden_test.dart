import 'dart:ui';

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
}
