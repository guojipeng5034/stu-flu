// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RegisterResponse',
      json,
      ($checkedConvert) {
        final val = RegisterResponse(
          userId: $checkedConvert('user_id', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
          requireEmailVerification:
              $checkedConvert('require_email_verification', (v) => v as bool),
          createdAt: $checkedConvert('created_at', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'userId': 'user_id',
        'requireEmailVerification': 'require_email_verification',
        'createdAt': 'created_at'
      },
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'require_email_verification': instance.requireEmailVerification,
      'created_at': instance.createdAt,
    };
