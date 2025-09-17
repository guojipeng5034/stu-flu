// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RatingBeanImpl _$$RatingBeanImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$RatingBeanImpl',
      json,
      ($checkedConvert) {
        final val = _$RatingBeanImpl(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          label: $checkedConvert('label', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          value: $checkedConvert('value', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$RatingBeanImplToJson(_$RatingBeanImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.label case final value?) 'label': value,
      if (instance.name case final value?) 'name': value,
      if (instance.description case final value?) 'description': value,
      if (instance.value case final value?) 'value': value,
    };

_$RatingListImpl _$$RatingListImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$RatingListImpl',
      json,
      ($checkedConvert) {
        final val = _$RatingListImpl(
          data: $checkedConvert(
              'data',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => RatingBean.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$RatingListImplToJson(_$RatingListImpl instance) =>
    <String, dynamic>{
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
    };
