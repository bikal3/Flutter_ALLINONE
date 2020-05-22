// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncomeModel _$IncomeModelFromJson(Map<String, dynamic> json) {
  return IncomeModel(
    room: (json['room'] as num)?.toDouble(),
    out: (json['out'] as num)?.toDouble(),
    restaurant: (json['restaurant'] as num)?.toDouble(),
    total: (json['total'] as num)?.toDouble(),
    dates: json['dates'] as String,
    creator: (json['creator'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$IncomeModelToJson(IncomeModel instance) =>
    <String, dynamic>{
      'room': instance.room,
      'out': instance.out,
      'restaurant': instance.restaurant,
      'total': instance.total,
      'dates': instance.dates,
      'creator': instance.creator,
    };
