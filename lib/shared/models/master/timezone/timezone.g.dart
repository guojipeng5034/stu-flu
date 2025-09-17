// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timezone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeZoneBeanImpl _$$TimeZoneBeanImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TimeZoneBeanImpl',
      json,
      ($checkedConvert) {
        final val = _$TimeZoneBeanImpl(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          label: $checkedConvert('label', (v) => v as String?),
          offset: $checkedConvert('offset', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$TimeZoneBeanImplToJson(_$TimeZoneBeanImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.label case final value?) 'label': value,
      if (instance.offset case final value?) 'offset': value,
      if (instance.name case final value?) 'name': value,
    };

_$TimeZoneListImpl _$$TimeZoneListImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TimeZoneListImpl',
      json,
      ($checkedConvert) {
        final val = _$TimeZoneListImpl(
          timeZone: $checkedConvert(
              'TimeZone',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => TimeZoneBean.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'timeZone': 'TimeZone'},
    );

Map<String, dynamic> _$$TimeZoneListImplToJson(_$TimeZoneListImpl instance) =>
    <String, dynamic>{
      if (instance.timeZone?.map((e) => e.toJson()).toList() case final value?)
        'TimeZone': value,
    };
