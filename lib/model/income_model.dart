import 'package:json_annotation/json_annotation.dart';
// part 'serializable/user_model.g.dart';
part 'income_model.g.dart';

@JsonSerializable()
class IncomeModel {
  @JsonKey(name: "room")
  double room;
  @JsonKey(name: "out")
  double out;
  @JsonKey(name: "restaurant")
  double restaurant;
  @JsonKey(name: "total")
  double total;
  @JsonKey(name: "dates")
  String dates;
  @JsonKey(name: "creator")
  double creator;

  IncomeModel({
    this.room,
    this.out,
    this.restaurant,
    this.total,
    this.dates,
    this.creator,
  });

  Map<String, dynamic> toJson() => _$IncomeModelToJson(this);

  factory IncomeModel.fromJson(Map<String, dynamic> item) =>
      _$IncomeModelFromJson(item);
}
