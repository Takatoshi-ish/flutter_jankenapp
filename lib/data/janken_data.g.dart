// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'janken_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_JankenData _$$_JankenDataFromJson(Map<String, dynamic> json) =>
    _$_JankenData(
      win: json['win'] as int,
      draw: json['draw'] as int,
      lose: json['lose'] as int,
      matchCount: json['matchCount'] as int,
    );

Map<String, dynamic> _$$_JankenDataToJson(_$_JankenData instance) =>
    <String, dynamic>{
      'win': instance.win,
      'draw': instance.draw,
      'lose': instance.lose,
      'matchCount': instance.matchCount,
    };
