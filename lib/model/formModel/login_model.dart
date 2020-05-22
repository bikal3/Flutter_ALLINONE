import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
// part 'serializable/user_model.g.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  @JsonKey(name: "email")
  @required
  String email;
  @JsonKey(name: "password")
  @required
  String password;

  LoginModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  factory LoginModel.fromJson(Map<String, dynamic> item) =>
      _$LoginModelFromJson(item);
}
