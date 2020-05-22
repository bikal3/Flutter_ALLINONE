// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['_id'] as String,
    displayPicture: json['displayPicture'] as String,
    firstName: json['firstName'] as String,
    familyName: json['familyName'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      '_id': instance.id,
      'displayPicture': instance.displayPicture,
      'firstName': instance.firstName,
      'familyName': instance.familyName,
      'email': instance.email,
    };
