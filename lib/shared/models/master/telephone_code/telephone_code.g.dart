// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telephone_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TelephoneCodeBeanImpl _$$TelephoneCodeBeanImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TelephoneCodeBeanImpl',
      json,
      ($checkedConvert) {
        final val = _$TelephoneCodeBeanImpl(
          code: $checkedConvert('code', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          country: $checkedConvert('country', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$TelephoneCodeBeanImplToJson(
        _$TelephoneCodeBeanImpl instance) =>
    <String, dynamic>{
      if (instance.code case final value?) 'code': value,
      if (instance.name case final value?) 'name': value,
      if (instance.country case final value?) 'country': value,
    };

_$TelephoneCodeListImpl _$$TelephoneCodeListImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TelephoneCodeListImpl',
      json,
      ($checkedConvert) {
        final val = _$TelephoneCodeListImpl(
          data: $checkedConvert(
              'data',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      TelephoneCodeBean.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$TelephoneCodeListImplToJson(
        _$TelephoneCodeListImpl instance) =>
    <String, dynamic>{
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
    };
