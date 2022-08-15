import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/janken_data.dart';

final jankenDataProvider = StateProvider<JankenData>(
  (ref) => JankenData(
    win: 0,
    draw: 0,
    lose: 0,
    matchCount: 0,
  ),
);
