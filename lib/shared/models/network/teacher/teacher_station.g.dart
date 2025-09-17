// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeacherStationImpl _$$TeacherStationImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TeacherStationImpl',
      json,
      ($checkedConvert) {
        final val = _$TeacherStationImpl(
          storey: $checkedConvert('storey', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$TeacherStationImplToJson(
        _$TeacherStationImpl instance) =>
    <String, dynamic>{
      if (instance.storey case final value?) 'storey': value,
      if (instance.name case final value?) 'name': value,
    };
