// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequest _$UpdateProfileRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'UpdateProfileRequest',
      json,
      ($checkedConvert) {
        final val = UpdateProfileRequest(
          fullName: $checkedConvert('full_name', (v) => v as String?),
          phone: $checkedConvert('phone', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'fullName': 'full_name'},
    );

Map<String, dynamic> _$UpdateProfileRequestToJson(
        UpdateProfileRequest instance) =>
    <String, dynamic>{
      if (instance.fullName case final value?) 'full_name': value,
      if (instance.phone case final value?) 'phone': value,
    };
