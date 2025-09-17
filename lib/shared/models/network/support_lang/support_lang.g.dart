// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_lang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportLangImpl _$$SupportLangImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SupportLangImpl',
      json,
      ($checkedConvert) {
        final val = _$SupportLangImpl(
          key: $checkedConvert('key', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          showName: $checkedConvert('show_name', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'showName': 'show_name'},
    );

Map<String, dynamic> _$$SupportLangImplToJson(_$SupportLangImpl instance) =>
    <String, dynamic>{
      if (instance.key case final value?) 'key': value,
      if (instance.name case final value?) 'name': value,
      if (instance.showName case final value?) 'show_name': value,
    };
