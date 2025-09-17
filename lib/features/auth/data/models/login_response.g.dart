// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LoginResponse',
      json,
      ($checkedConvert) {
        final val = LoginResponse(
          accessToken: $checkedConvert('access_token', (v) => v as String),
          refreshToken: $checkedConvert('refresh_token', (v) => v as String),
          tokenType: $checkedConvert('token_type', (v) => v as String),
          expiresIn: $checkedConvert('expires_in', (v) => (v as num).toInt()),
          userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
          username: $checkedConvert('username', (v) => v as String),
          userInfo: $checkedConvert(
              'user_info', (v) => UserInfo.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'accessToken': 'access_token',
        'refreshToken': 'refresh_token',
        'tokenType': 'token_type',
        'expiresIn': 'expires_in',
        'userId': 'user_id',
        'userInfo': 'user_info'
      },
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'user_id': instance.userId,
      'username': instance.username,
      'user_info': instance.userInfo.toJson(),
    };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserInfo',
      json,
      ($checkedConvert) {
        final val = UserInfo(
          username: $checkedConvert('username', (v) => v as String),
          nickname: $checkedConvert('nickname', (v) => v as String),
          avatar: $checkedConvert('avatar', (v) => v as String),
          userType: $checkedConvert('userType', (v) => (v as num).toInt()),
          deptId: $checkedConvert('deptId', (v) => v as String),
          deptIds: $checkedConvert('deptIds', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'username': instance.username,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'userType': instance.userType,
      'deptId': instance.deptId,
      if (instance.deptIds case final value?) 'deptIds': value,
    };
