import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'janken_data.freezed.dart';
part 'janken_data.g.dart';

@freezed
class JankenData with _$JankenData {
  const factory JankenData({
    required int win,
    required int draw,
    required int lose,
    required int matchCount,
  }) = _JankenData;

  factory JankenData.fromJson(Map<String, dynamic> json) =>
      _$JankenDataFromJson(json);
}
