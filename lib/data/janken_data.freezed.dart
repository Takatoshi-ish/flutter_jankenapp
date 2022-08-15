// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'janken_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JankenData _$JankenDataFromJson(Map<String, dynamic> json) {
  return _JankenData.fromJson(json);
}

/// @nodoc
mixin _$JankenData {
  int get win => throw _privateConstructorUsedError;
  int get draw => throw _privateConstructorUsedError;
  int get lose => throw _privateConstructorUsedError;
  int get matchCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JankenDataCopyWith<JankenData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JankenDataCopyWith<$Res> {
  factory $JankenDataCopyWith(
          JankenData value, $Res Function(JankenData) then) =
      _$JankenDataCopyWithImpl<$Res>;
  $Res call({int win, int draw, int lose, int matchCount});
}

/// @nodoc
class _$JankenDataCopyWithImpl<$Res> implements $JankenDataCopyWith<$Res> {
  _$JankenDataCopyWithImpl(this._value, this._then);

  final JankenData _value;
  // ignore: unused_field
  final $Res Function(JankenData) _then;

  @override
  $Res call({
    Object? win = freezed,
    Object? draw = freezed,
    Object? lose = freezed,
    Object? matchCount = freezed,
  }) {
    return _then(_value.copyWith(
      win: win == freezed
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as int,
      draw: draw == freezed
          ? _value.draw
          : draw // ignore: cast_nullable_to_non_nullable
              as int,
      lose: lose == freezed
          ? _value.lose
          : lose // ignore: cast_nullable_to_non_nullable
              as int,
      matchCount: matchCount == freezed
          ? _value.matchCount
          : matchCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_JankenDataCopyWith<$Res>
    implements $JankenDataCopyWith<$Res> {
  factory _$$_JankenDataCopyWith(
          _$_JankenData value, $Res Function(_$_JankenData) then) =
      __$$_JankenDataCopyWithImpl<$Res>;
  @override
  $Res call({int win, int draw, int lose, int matchCount});
}

/// @nodoc
class __$$_JankenDataCopyWithImpl<$Res> extends _$JankenDataCopyWithImpl<$Res>
    implements _$$_JankenDataCopyWith<$Res> {
  __$$_JankenDataCopyWithImpl(
      _$_JankenData _value, $Res Function(_$_JankenData) _then)
      : super(_value, (v) => _then(v as _$_JankenData));

  @override
  _$_JankenData get _value => super._value as _$_JankenData;

  @override
  $Res call({
    Object? win = freezed,
    Object? draw = freezed,
    Object? lose = freezed,
    Object? matchCount = freezed,
  }) {
    return _then(_$_JankenData(
      win: win == freezed
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as int,
      draw: draw == freezed
          ? _value.draw
          : draw // ignore: cast_nullable_to_non_nullable
              as int,
      lose: lose == freezed
          ? _value.lose
          : lose // ignore: cast_nullable_to_non_nullable
              as int,
      matchCount: matchCount == freezed
          ? _value.matchCount
          : matchCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JankenData with DiagnosticableTreeMixin implements _JankenData {
  const _$_JankenData(
      {required this.win,
      required this.draw,
      required this.lose,
      required this.matchCount});

  factory _$_JankenData.fromJson(Map<String, dynamic> json) =>
      _$$_JankenDataFromJson(json);

  @override
  final int win;
  @override
  final int draw;
  @override
  final int lose;
  @override
  final int matchCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'JankenData(win: $win, draw: $draw, lose: $lose, matchCount: $matchCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'JankenData'))
      ..add(DiagnosticsProperty('win', win))
      ..add(DiagnosticsProperty('draw', draw))
      ..add(DiagnosticsProperty('lose', lose))
      ..add(DiagnosticsProperty('matchCount', matchCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JankenData &&
            const DeepCollectionEquality().equals(other.win, win) &&
            const DeepCollectionEquality().equals(other.draw, draw) &&
            const DeepCollectionEquality().equals(other.lose, lose) &&
            const DeepCollectionEquality()
                .equals(other.matchCount, matchCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(win),
      const DeepCollectionEquality().hash(draw),
      const DeepCollectionEquality().hash(lose),
      const DeepCollectionEquality().hash(matchCount));

  @JsonKey(ignore: true)
  @override
  _$$_JankenDataCopyWith<_$_JankenData> get copyWith =>
      __$$_JankenDataCopyWithImpl<_$_JankenData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JankenDataToJson(
      this,
    );
  }
}

abstract class _JankenData implements JankenData {
  const factory _JankenData(
      {required final int win,
      required final int draw,
      required final int lose,
      required final int matchCount}) = _$_JankenData;

  factory _JankenData.fromJson(Map<String, dynamic> json) =
      _$_JankenData.fromJson;

  @override
  int get win;
  @override
  int get draw;
  @override
  int get lose;
  @override
  int get matchCount;
  @override
  @JsonKey(ignore: true)
  _$$_JankenDataCopyWith<_$_JankenData> get copyWith =>
      throw _privateConstructorUsedError;
}
