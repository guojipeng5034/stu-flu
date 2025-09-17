// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestCategoryBeanImpl _$$RequestCategoryBeanImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$RequestCategoryBeanImpl',
      json,
      ($checkedConvert) {
        final val = _$RequestCategoryBeanImpl(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          mappingIndex:
              $checkedConvert('mapping_index', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'mappingIndex': 'mapping_index'},
    );

Map<String, dynamic> _$$RequestCategoryBeanImplToJson(
        _$RequestCategoryBeanImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.mappingIndex case final value?) 'mapping_index': value,
      if (instance.name case final value?) 'name': value,
    };

_$RequestCategoryListImpl _$$RequestCategoryListImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$RequestCategoryListImpl',
      json,
      ($checkedConvert) {
        final val = _$RequestCategoryListImpl(
          data: $checkedConvert(
              'data',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      RequestCategoryBean.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$RequestCategoryListImplToJson(
        _$RequestCategoryListImpl instance) =>
    <String, dynamic>{
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
    };
