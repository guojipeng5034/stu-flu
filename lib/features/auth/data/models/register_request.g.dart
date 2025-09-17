// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RegisterRequest',
      json,
      ($checkedConvert) {
        final val = RegisterRequest(
          username: $checkedConvert('username', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
          password: $checkedConvert('password', (v) => v as String),
          confirmPassword:
              $checkedConvert('confirm_password', (v) => v as String),
          phone: $checkedConvert('phone', (v) => v as String?),
          fullName: $checkedConvert('full_name', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'confirmPassword': 'confirm_password',
        'fullName': 'full_name'
      },
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'confirm_password': instance.confirmPassword,
      if (instance.phone case final value?) 'phone': value,
      if (instance.fullName case final value?) 'full_name': value,
    };
