// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointsBeanImpl _$$PointsBeanImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$PointsBeanImpl',
      json,
      ($checkedConvert) {
        final val = _$PointsBeanImpl(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
          points: $checkedConvert('points', (v) => (v as num?)?.toInt()),
          perMin: $checkedConvert('per_min', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'perMin': 'per_min'},
    );

Map<String, dynamic> _$$PointsBeanImplToJson(_$PointsBeanImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
      if (instance.points case final value?) 'points': value,
      if (instance.perMin case final value?) 'per_min': value,
    };

_$PointsListImpl _$$PointsListImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$PointsListImpl',
      json,
      ($checkedConvert) {
        final val = _$PointsListImpl(
          data: $checkedConvert(
              'data',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => PointsBean.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$PointsListImplToJson(_$PointsListImpl instance) =>
    <String, dynamic>{
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
    };
