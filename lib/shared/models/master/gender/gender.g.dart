// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenderBeanImpl _$$GenderBeanImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$GenderBeanImpl',
      json,
      ($checkedConvert) {
        final val = _$GenderBeanImpl(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          label: $checkedConvert('label', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$GenderBeanImplToJson(_$GenderBeanImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.label case final value?) 'label': value,
      if (instance.name case final value?) 'name': value,
    };

_$GenderListImpl _$$GenderListImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$GenderListImpl',
      json,
      ($checkedConvert) {
        final val = _$GenderListImpl(
          data: $checkedConvert(
              'data',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => GenderBean.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$GenderListImplToJson(_$GenderListImpl instance) =>
    <String, dynamic>{
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
    };
