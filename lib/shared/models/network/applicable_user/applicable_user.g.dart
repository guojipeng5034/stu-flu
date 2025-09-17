// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicable_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApplicableUserImpl _$$ApplicableUserImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ApplicableUserImpl',
      json,
      ($checkedConvert) {
        final val = _$ApplicableUserImpl(
          id: $checkedConvert('id', (v) => v as String?),
          label: $checkedConvert('label', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$ApplicableUserImplToJson(
        _$ApplicableUserImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.label case final value?) 'label': value,
      if (instance.name case final value?) 'name': value,
    };
