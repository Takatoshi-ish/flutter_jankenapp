import 'package:flutter_jankenapp/data/janken_data.dart';

class Logic {
  JankenData _jankenData = JankenData(
    win: 0,
    draw: 0,
    lose: 0,
    matchCount: 0,
  );

  get jankenData => _jankenData;

  void win() {
    _jankenData = _jankenData.copyWith(
      win: _jankenData.win + 1,
      matchCount: _jankenData.matchCount + 1,
    );
  }

  void draw() {
    _jankenData = _jankenData.copyWith(
      draw: _jankenData.draw + 1,
      matchCount: _jankenData.matchCount + 1,
    );
  }

  void lose() {
    _jankenData = _jankenData.copyWith(
      lose: _jankenData.lose + 1,
      matchCount: _jankenData.matchCount + 1,
    );
  }

  void reset() {
    _jankenData = JankenData(
      win: 0,
      draw: 0,
      lose: 0,
      matchCount: 0,
    );
  }
}
