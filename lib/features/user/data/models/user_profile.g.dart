// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserProfile',
      json,
      ($checkedConvert) {
        final val = UserProfile(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          fullName: $checkedConvert('name', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
          avatar: $checkedConvert('avatar', (v) => v as String?),
          phone: $checkedConvert('phone', (v) => v as String?),
          address: $checkedConvert('address', (v) => v as String?),
          createdAt: $checkedConvert('created_at', (v) => v as String?),
          updatedAt: $checkedConvert('updated_at', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'fullName': 'name',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at'
      },
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.fullName,
      'email': instance.email,
      if (instance.avatar case final value?) 'avatar': value,
      if (instance.phone case final value?) 'phone': value,
      if (instance.address case final value?) 'address': value,
      if (instance.createdAt case final value?) 'created_at': value,
      if (instance.updatedAt case final value?) 'updated_at': value,
    };
