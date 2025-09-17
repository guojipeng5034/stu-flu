// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonOrderImpl _$$LessonOrderImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$LessonOrderImpl',
      json,
      ($checkedConvert) {
        final val = _$LessonOrderImpl(
          allowSubstituteFlag: $checkedConvert('allow_substitute_flag',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          createdTime: $checkedConvert('created_time', (v) => v as String?),
          curriculumCode:
              $checkedConvert('curriculum_code', (v) => v as String?),
          curriculumId: $checkedConvert(
              'curriculum_id', (v) => (v as num?)?.toInt() ?? 0),
          curriculumName:
              $checkedConvert('curriculum_name', (v) => v as String?),
          dayOfWeek:
              $checkedConvert('day_of_week', (v) => (v as num?)?.toInt() ?? 0),
          deletedFlag: $checkedConvert('deleted_flag',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          endMin: $checkedConvert('end_min', (v) => (v as num?)?.toInt() ?? 0),
          extraPoints:
              $checkedConvert('extra_points', (v) => (v as num?)?.toInt() ?? 0),
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          lessonTimeId: $checkedConvert(
              'lesson_time_id', (v) => (v as num?)?.toInt() ?? 0),
          modifiedTime: $checkedConvert('modified_time', (v) => v as String?),
          orderedById: $checkedConvert(
              'ordered_by_id', (v) => (v as num?)?.toInt() ?? 0),
          orderedTime: $checkedConvert('ordered_time', (v) => v as String?),
          paidById:
              $checkedConvert('paid_by_id', (v) => (v as num?)?.toInt() ?? 0),
          remark: $checkedConvert('remark', (v) => v as String?),
          reservationStartTime:
              $checkedConvert('reservation_start_time', (v) => v as String?),
          reservationStopTime:
              $checkedConvert('reservation_stop_time', (v) => v as String?),
          siteId: $checkedConvert('site_id', (v) => (v as num?)?.toInt() ?? 0),
          startMin:
              $checkedConvert('start_min', (v) => (v as num?)?.toInt() ?? 0),
          stopReasonId: $checkedConvert('stop_reason_id', (v) => v as String?),
          stoppedFlag: $checkedConvert('stopped_flag',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          stoppedTime: $checkedConvert('stopped_time', (v) => v as String?),
          studentId:
              $checkedConvert('student_id', (v) => (v as num?)?.toInt() ?? 0),
          teacher: $checkedConvert(
              'teacher',
              (v) => v == null
                  ? null
                  : Teacher.fromJson(v as Map<String, dynamic>)),
          teacherId:
              $checkedConvert('teacher_id', (v) => (v as num?)?.toInt() ?? 0),
          timeFrom: $checkedConvert('time_from', (v) => v as String?),
          timeTo: $checkedConvert('time_to', (v) => v as String?),
          extraPointsJson: $checkedConvert(
              'extra_points_json',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => LessonOrderExtraPoints.fromJson(
                          e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          lessonsForOrderStop: $checkedConvert(
              'lessons_for_order_stop',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => LessonOrderStopInfo.fromJson(
                          e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          curriculumPoints:
              $checkedConvert('curriculum_points', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'allowSubstituteFlag': 'allow_substitute_flag',
        'createdTime': 'created_time',
        'curriculumCode': 'curriculum_code',
        'curriculumId': 'curriculum_id',
        'curriculumName': 'curriculum_name',
        'dayOfWeek': 'day_of_week',
        'deletedFlag': 'deleted_flag',
        'endMin': 'end_min',
        'extraPoints': 'extra_points',
        'lessonTimeId': 'lesson_time_id',
        'modifiedTime': 'modified_time',
        'orderedById': 'ordered_by_id',
        'orderedTime': 'ordered_time',
        'paidById': 'paid_by_id',
        'reservationStartTime': 'reservation_start_time',
        'reservationStopTime': 'reservation_stop_time',
        'siteId': 'site_id',
        'startMin': 'start_min',
        'stopReasonId': 'stop_reason_id',
        'stoppedFlag': 'stopped_flag',
        'stoppedTime': 'stopped_time',
        'studentId': 'student_id',
        'teacherId': 'teacher_id',
        'timeFrom': 'time_from',
        'timeTo': 'time_to',
        'extraPointsJson': 'extra_points_json',
        'lessonsForOrderStop': 'lessons_for_order_stop',
        'curriculumPoints': 'curriculum_points'
      },
    );

Map<String, dynamic> _$$LessonOrderImplToJson(_$LessonOrderImpl instance) =>
    <String, dynamic>{
      if (const CTBoolConverter().toJson(instance.allowSubstituteFlag)
          case final value?)
        'allow_substitute_flag': value,
      if (instance.createdTime case final value?) 'created_time': value,
      if (instance.curriculumCode case final value?) 'curriculum_code': value,
      'curriculum_id': instance.curriculumId,
      if (instance.curriculumName case final value?) 'curriculum_name': value,
      'day_of_week': instance.dayOfWeek,
      if (const CTBoolConverter().toJson(instance.deletedFlag)
          case final value?)
        'deleted_flag': value,
      'end_min': instance.endMin,
      'extra_points': instance.extraPoints,
      'id': instance.id,
      'lesson_time_id': instance.lessonTimeId,
      if (instance.modifiedTime case final value?) 'modified_time': value,
      'ordered_by_id': instance.orderedById,
      if (instance.orderedTime case final value?) 'ordered_time': value,
      'paid_by_id': instance.paidById,
      if (instance.remark case final value?) 'remark': value,
      if (instance.reservationStartTime case final value?)
        'reservation_start_time': value,
      if (instance.reservationStopTime case final value?)
        'reservation_stop_time': value,
      'site_id': instance.siteId,
      'start_min': instance.startMin,
      if (instance.stopReasonId case final value?) 'stop_reason_id': value,
      if (const CTBoolConverter().toJson(instance.stoppedFlag)
          case final value?)
        'stopped_flag': value,
      if (instance.stoppedTime case final value?) 'stopped_time': value,
      'student_id': instance.studentId,
      if (instance.teacher?.toJson() case final value?) 'teacher': value,
      'teacher_id': instance.teacherId,
      if (instance.timeFrom case final value?) 'time_from': value,
      if (instance.timeTo case final value?) 'time_to': value,
      'extra_points_json':
          instance.extraPointsJson.map((e) => e.toJson()).toList(),
      'lessons_for_order_stop':
          instance.lessonsForOrderStop.map((e) => e.toJson()).toList(),
      if (instance.curriculumPoints case final value?)
        'curriculum_points': value,
    };

_$LessonOrderExtraPointsImpl _$$LessonOrderExtraPointsImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$LessonOrderExtraPointsImpl',
      json,
      ($checkedConvert) {
        final val = _$LessonOrderExtraPointsImpl(
          extraPoints:
              $checkedConvert('extra_points', (v) => (v as num?)?.toInt() ?? 0),
          lessonId:
              $checkedConvert('lesson_id', (v) => (v as num?)?.toInt() ?? 0),
        );
        return val;
      },
      fieldKeyMap: const {
        'extraPoints': 'extra_points',
        'lessonId': 'lesson_id'
      },
    );

Map<String, dynamic> _$$LessonOrderExtraPointsImplToJson(
        _$LessonOrderExtraPointsImpl instance) =>
    <String, dynamic>{
      'extra_points': instance.extraPoints,
      'lesson_id': instance.lessonId,
    };

_$LessonOrderStopInfoImpl _$$LessonOrderStopInfoImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$LessonOrderStopInfoImpl',
      json,
      ($checkedConvert) {
        final val = _$LessonOrderStopInfoImpl(
          date: $checkedConvert('date', (v) => v as String?),
          dayOfWeek:
              $checkedConvert('day_of_week', (v) => (v as num?)?.toInt() ?? 0),
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          points: $checkedConvert('points', (v) => (v as num?)?.toInt() ?? 0),
        );
        return val;
      },
      fieldKeyMap: const {'dayOfWeek': 'day_of_week'},
    );

Map<String, dynamic> _$$LessonOrderStopInfoImplToJson(
        _$LessonOrderStopInfoImpl instance) =>
    <String, dynamic>{
      if (instance.date case final value?) 'date': value,
      'day_of_week': instance.dayOfWeek,
      'id': instance.id,
      'points': instance.points,
    };
