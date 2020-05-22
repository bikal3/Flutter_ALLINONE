import 'package:json_annotation/json_annotation.dart';
// part 'serializable/user_model.g.dart';
part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  @JsonKey(name: "field")
  String field;
  @JsonKey(name: "message")
  String message;

  ErrorModel({
    this.field,
    this.message,
  });

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);

  factory ErrorModel.fromJson(Map<String, dynamic> item) =>
      _$ErrorModelFromJson(item);
}
