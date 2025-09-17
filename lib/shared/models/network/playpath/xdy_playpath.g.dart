// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xdy_playpath.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$XdyPlaypathImpl _$$XdyPlaypathImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$XdyPlaypathImpl',
      json,
      ($checkedConvert) {
        final val = _$XdyPlaypathImpl(
          playpath: $checkedConvert('playpath', (v) => v as String?),
          defaultVideoToolProvider: $checkedConvert(
              'default_video_tool_provider', (v) => v as String?),
          lessonId: $checkedConvert('lesson_id', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'defaultVideoToolProvider': 'default_video_tool_provider',
        'lessonId': 'lesson_id'
      },
    );

Map<String, dynamic> _$$XdyPlaypathImplToJson(_$XdyPlaypathImpl instance) =>
    <String, dynamic>{
      if (instance.playpath case final value?) 'playpath': value,
      if (instance.defaultVideoToolProvider case final value?)
        'default_video_tool_provider': value,
      if (instance.lessonId case final value?) 'lesson_id': value,
    };
