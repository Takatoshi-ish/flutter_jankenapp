import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'logic.dart';
import 'provider.dart';

class ViewModel {
  Logic _logic = Logic();
  late WidgetRef _ref;

  void setRef(WidgetRef ref) {
    this._ref = ref;
  }

  get matchCount => _ref.watch(jankenDataProvider).matchCount;
  get winCount => _ref.watch(jankenDataProvider.select((value) => value.win));
  get drawCount => _ref.watch(jankenDataProvider.select((value) => value.draw));
  get loseCount => _ref.watch(jankenDataProvider.select((value) => value.lose));

  void onWin() {
    _logic.win();

    _ref.watch(jankenDataProvider.notifier).state = _logic.jankenData;
  }

  void onDraw() {
    _logic.draw();

    _ref.watch(jankenDataProvider.notifier).state = _logic.jankenData;
  }

  void onLose() {
    _logic.lose();

    _ref.watch(jankenDataProvider.notifier).state = _logic.jankenData;
  }

  void onReset() {
    _logic.reset();

    _ref.watch(jankenDataProvider.notifier).state = _logic.jankenData;
  }
}
