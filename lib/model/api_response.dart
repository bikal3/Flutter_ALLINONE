import 'package:allinone/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'error_model.dart';
// part 'serializable/user_model.g.dart';
part 'api_response.g.dart';

@JsonSerializable()
class APIResponse<T> {
  T data;
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "error")
  ErrorModel error;
  @JsonKey(name: "user")
  UserModel user;
  @JsonKey(name: "income")
  UserModel income;
  @JsonKey(name: "authToken")
  String authToken;
  @JsonKey(name: "catchError")
  String catchError;

  APIResponse({
    this.data,
    this.success = true,
    this.error,
    this.user,
    this.authToken,
    this.catchError,
  });

  Map<String, dynamic> toJson() => _$APIResponseToJson(this);

  factory APIResponse.fromJson(Map<String, dynamic> item) =>
      _$APIResponseFromJson(item);
}
