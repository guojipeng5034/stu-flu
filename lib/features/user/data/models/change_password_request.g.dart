// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequest _$ChangePasswordRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ChangePasswordRequest',
      json,
      ($checkedConvert) {
        final val = ChangePasswordRequest(
          currentPassword:
              $checkedConvert('current_password', (v) => v as String),
          newPassword: $checkedConvert('new_password', (v) => v as String),
          confirmNewPassword:
              $checkedConvert('confirm_new_password', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'currentPassword': 'current_password',
        'newPassword': 'new_password',
        'confirmNewPassword': 'confirm_new_password'
      },
    );

Map<String, dynamic> _$ChangePasswordRequestToJson(
        ChangePasswordRequest instance) =>
    <String, dynamic>{
      'current_password': instance.currentPassword,
      'new_password': instance.newPassword,
      'confirm_new_password': instance.confirmNewPassword,
    };
