// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talk_playpath.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TalkPlaypathImpl _$$TalkPlaypathImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TalkPlaypathImpl',
      json,
      ($checkedConvert) {
        final val = _$TalkPlaypathImpl(
          playpath: $checkedConvert('playpath', (v) => v as String?),
          serial: $checkedConvert('serial', (v) => v as String?),
          recordtitle: $checkedConvert('recordtitle', (v) => v as String?),
          recordpath: $checkedConvert('recordpath', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$TalkPlaypathImplToJson(_$TalkPlaypathImpl instance) =>
    <String, dynamic>{
      if (instance.playpath case final value?) 'playpath': value,
      if (instance.serial case final value?) 'serial': value,
      if (instance.recordtitle case final value?) 'recordtitle': value,
      if (instance.recordpath case final value?) 'recordpath': value,
    };
