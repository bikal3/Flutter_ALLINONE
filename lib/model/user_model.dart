import 'package:json_annotation/json_annotation.dart';
// part 'serializable/user_model.g.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "displayPicture")
  String displayPicture;
  @JsonKey(name: "firstName")
  String firstName;
  @JsonKey(name: "familyName")
  String familyName;
  @JsonKey(name: "email")
  String email;

  UserModel(
      {this.id,
      this.displayPicture,
      this.firstName,
      this.familyName,
      this.email});
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> item) =>
      _$UserModelFromJson(item);
}
