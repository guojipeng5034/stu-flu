// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LoginRequest',
      json,
      ($checkedConvert) {
        final val = LoginRequest(
          username: $checkedConvert('username', (v) => v as String),
          password: $checkedConvert('password', (v) => v as String),
          rememberMe:
              $checkedConvert('remember_me', (v) => v as bool? ?? false),
          scope: $checkedConvert('scope', (v) => v as String? ?? "server"),
          grantType:
              $checkedConvert('grant_type', (v) => v as String? ?? "password"),
        );
        return val;
      },
      fieldKeyMap: const {
        'rememberMe': 'remember_me',
        'grantType': 'grant_type'
      },
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'remember_me': instance.rememberMe,
      'scope': instance.scope,
      'grant_type': instance.grantType,
    };
