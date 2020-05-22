// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIResponse _$APIResponseFromJson(Map<String, dynamic> json) {
  return APIResponse(
    success: json['success'] as bool,
    error: json['error'] == null
        ? null
        : ErrorModel.fromJson(json['error'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    authToken: json['authToken'] as String,
    catchError: json['catchError'] as String,
  );
}

Map<String, dynamic> _$APIResponseToJson(APIResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'user': instance.user,
      'authToken': instance.authToken,
      'catchError': instance.catchError,
    };
