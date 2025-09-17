// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_list_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonListApiImpl _$$LessonListApiImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$LessonListApiImpl',
      json,
      ($checkedConvert) {
        final val = _$LessonListApiImpl(
          ftlReportLessonId: $checkedConvert(
              'ftl_report_lesson_id', (v) => (v as num?)?.toInt() ?? 0),
          list: $checkedConvert(
              'list',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          nowTime:
              $checkedConvert('now_time', (v) => (v as num?)?.toInt() ?? 0),
          pager: $checkedConvert(
              'pager',
              (v) =>
                  v == null ? null : Page.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'ftlReportLessonId': 'ftl_report_lesson_id',
        'nowTime': 'now_time'
      },
    );

Map<String, dynamic> _$$LessonListApiImplToJson(_$LessonListApiImpl instance) =>
    <String, dynamic>{
      'ftl_report_lesson_id': instance.ftlReportLessonId,
      'list': instance.list.map((e) => e.toJson()).toList(),
      'now_time': instance.nowTime,
      if (instance.pager?.toJson() case final value?) 'pager': value,
    };
