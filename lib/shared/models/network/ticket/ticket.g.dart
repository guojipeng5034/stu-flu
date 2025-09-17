// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketImpl _$$TicketImplFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$TicketImpl',
      json,
      ($checkedConvert) {
        final val = _$TicketImpl(
          code: $checkedConvert('code', (v) => v as String?),
          createdTime: $checkedConvert('created_time', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          invalid: $checkedConvert('invalid', (v) => v),
          lessonSize:
              $checkedConvert('lesson_size', (v) => (v as num?)?.toInt() ?? 0),
          name: $checkedConvert('name', (v) => v as String? ?? '0'),
          limitedTimeSpansJson: $checkedConvert(
              'limited_time_spans_json',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          TicketTimeRange.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          lessonTimeId:
              $checkedConvert('lesson_time_id', (v) => v as String? ?? '0'),
          maxTeacherPoints:
              $checkedConvert('max_teacher_points', (v) => v as String? ?? '0'),
          statusId:
              $checkedConvert('status_id', (v) => (v as num?)?.toInt() ?? 0),
          typeId: $checkedConvert('type_id', (v) => (v as num?)?.toInt() ?? 0),
          availableCurriculum: $checkedConvert(
              'available_curriculum',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => TicketAvailableCurriculum.fromJson(
                      e as Map<String, dynamic>))
                  .toList()),
          availableCurriculumCodes: $checkedConvert(
              'available_curriculum_codes',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'createdTime': 'created_time',
        'lessonSize': 'lesson_size',
        'limitedTimeSpansJson': 'limited_time_spans_json',
        'lessonTimeId': 'lesson_time_id',
        'maxTeacherPoints': 'max_teacher_points',
        'statusId': 'status_id',
        'typeId': 'type_id',
        'availableCurriculum': 'available_curriculum',
        'availableCurriculumCodes': 'available_curriculum_codes'
      },
    );

Map<String, dynamic> _$$TicketImplToJson(_$TicketImpl instance) =>
    <String, dynamic>{
      if (instance.code case final value?) 'code': value,
      if (instance.createdTime case final value?) 'created_time': value,
      if (instance.description case final value?) 'description': value,
      if (instance.invalid case final value?) 'invalid': value,
      'lesson_size': instance.lessonSize,
      'name': instance.name,
      'limited_time_spans_json':
          instance.limitedTimeSpansJson.map((e) => e.toJson()).toList(),
      'lesson_time_id': instance.lessonTimeId,
      'max_teacher_points': instance.maxTeacherPoints,
      'status_id': instance.statusId,
      'type_id': instance.typeId,
      if (instance.availableCurriculum?.map((e) => e.toJson()).toList()
          case final value?)
        'available_curriculum': value,
      if (instance.availableCurriculumCodes case final value?)
        'available_curriculum_codes': value,
    };

_$TicketAvailableCurriculumImpl _$$TicketAvailableCurriculumImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TicketAvailableCurriculumImpl',
      json,
      ($checkedConvert) {
        final val = _$TicketAvailableCurriculumImpl(
          code: $checkedConvert('code', (v) => v as String? ?? ''),
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          name: $checkedConvert('name', (v) => v as String? ?? ''),
        );
        return val;
      },
    );

Map<String, dynamic> _$$TicketAvailableCurriculumImplToJson(
        _$TicketAvailableCurriculumImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'name': instance.name,
    };

_$TicketTimeRangeImpl _$$TicketTimeRangeImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TicketTimeRangeImpl',
      json,
      ($checkedConvert) {
        final val = _$TicketTimeRangeImpl(
          timeFrom: $checkedConvert('time_from', (v) => v as String? ?? ''),
          timeTo: $checkedConvert('time_to', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {'timeFrom': 'time_from', 'timeTo': 'time_to'},
    );

Map<String, dynamic> _$$TicketTimeRangeImplToJson(
        _$TicketTimeRangeImpl instance) =>
    <String, dynamic>{
      'time_from': instance.timeFrom,
      'time_to': instance.timeTo,
    };
