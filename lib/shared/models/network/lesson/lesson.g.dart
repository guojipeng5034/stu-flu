// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonImpl _$$LessonImplFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$LessonImpl',
      json,
      ($checkedConvert) {
        final val = _$LessonImpl(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          incompleteNotes:
              $checkedConvert('incomplete_notes', (v) => v as String?),
          incompleteReasonId: $checkedConvert(
              'incomplete_reason_id', (v) => (v as num?)?.toInt() ?? 0),
          isReview: $checkedConvert('is_review',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          oneToOneOrGroup:
              $checkedConvert('one_to_one_or_group', (v) => v as String?),
          originalTeacherId: $checkedConvert(
              'original_teacher_id', (v) => (v as num?)?.toInt() ?? 0),
          request: $checkedConvert('request', (v) => v as String?),
          requested: $checkedConvert('requested', (v) => v ?? false),
          requestedTime: $checkedConvert('requested_time', (v) => v as String?),
          reservedById: $checkedConvert(
              'reserved_by_id', (v) => (v as num?)?.toInt() ?? 0),
          reservedTime: $checkedConvert('reserved_time', (v) => v as String?),
          resultId:
              $checkedConvert('result_id', (v) => (v as num?)?.toInt() ?? 0),
          sentReminder: $checkedConvert('sent_reminder', (v) => v ?? false),
          sentReminderTime:
              $checkedConvert('sent_reminder_time', (v) => v as String?),
          startDate: $checkedConvert('start_date', (v) => v as String?),
          startTime: $checkedConvert('start_time', (v) => v as String?),
          statusId:
              $checkedConvert('status_id', (v) => (v as num?)?.toInt() ?? 0),
          statusName: $checkedConvert('status_name', (v) => v as String?),
          studentId:
              $checkedConvert('student_id', (v) => (v as num?)?.toInt() ?? 0),
          substituted: $checkedConvert('substituted', (v) => v ?? false),
          substitutedTime:
              $checkedConvert('substituted_time', (v) => v as String?),
          teacher: $checkedConvert(
              'teacher',
              (v) => v == null
                  ? null
                  : Teacher.fromJson(v as Map<String, dynamic>)),
          teacherId:
              $checkedConvert('teacher_id', (v) => (v as num?)?.toInt() ?? 0),
          teacherReview: $checkedConvert(
              'teacher_review',
              (v) => v == null
                  ? null
                  : TeacherReview.fromJson(v as Map<String, dynamic>)),
          timeFrom: $checkedConvert('time_from', (v) => v as String?),
          timeId: $checkedConvert('time_id', (v) => (v as num?)?.toInt() ?? 0),
          timeTo: $checkedConvert('time_to', (v) => v as String?),
          requestCategoryIds: $checkedConvert(
              'request_category_ids',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => (e as num).toInt())
                      .toList() ??
                  const []),
          teacherAvailableCuriculums: $checkedConvert(
              'teacher_available_curiculums',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map(
                          (e) => Curriculum.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          patrolClassroomUrl:
              $checkedConvert('patrol_classroom_url', (v) => v as String?),
          crmMomentUrl: $checkedConvert('crm_moment_url', (v) => v as String?),
          canPreview: $checkedConvert('can_preview',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          reservedBy: $checkedConvert('reserved_by', (v) => v as String?),
          canCancel: $checkedConvert('can_cancel',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          paidBy: $checkedConvert('paid_by', (v) => v as String?),
          hasFtlReport: $checkedConvert('has_ftl_report',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          ftlReportUrl:
              $checkedConvert('ftl_report_url', (v) => v as String? ?? ''),
          exerciseData: $checkedConvert(
              'exercise_data',
              (v) => v == null
                  ? null
                  : LessonExerciseData.fromJson(v as Map<String, dynamic>)),
          xdyPlaypath: $checkedConvert(
              'xdy_playpath',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          XdyPlaypath.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          canPlayback: $checkedConvert('can_playback', (v) => v ?? false),
          talkPlaypath: $checkedConvert(
              'talk_playpath',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          TalkPlaypath.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          moments: $checkedConvert(
              'moments',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          LessonMoment.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          cancelReasonId:
              $checkedConvert('cancel_reason_id', (v) => v ?? false),
          canPostReview: $checkedConvert('can_post_review',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          endTime: $checkedConvert('end_time', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'incompleteNotes': 'incomplete_notes',
        'incompleteReasonId': 'incomplete_reason_id',
        'isReview': 'is_review',
        'oneToOneOrGroup': 'one_to_one_or_group',
        'originalTeacherId': 'original_teacher_id',
        'requestedTime': 'requested_time',
        'reservedById': 'reserved_by_id',
        'reservedTime': 'reserved_time',
        'resultId': 'result_id',
        'sentReminder': 'sent_reminder',
        'sentReminderTime': 'sent_reminder_time',
        'startDate': 'start_date',
        'startTime': 'start_time',
        'statusId': 'status_id',
        'statusName': 'status_name',
        'studentId': 'student_id',
        'substitutedTime': 'substituted_time',
        'teacherId': 'teacher_id',
        'teacherReview': 'teacher_review',
        'timeFrom': 'time_from',
        'timeId': 'time_id',
        'timeTo': 'time_to',
        'requestCategoryIds': 'request_category_ids',
        'teacherAvailableCuriculums': 'teacher_available_curiculums',
        'patrolClassroomUrl': 'patrol_classroom_url',
        'crmMomentUrl': 'crm_moment_url',
        'canPreview': 'can_preview',
        'reservedBy': 'reserved_by',
        'canCancel': 'can_cancel',
        'paidBy': 'paid_by',
        'hasFtlReport': 'has_ftl_report',
        'ftlReportUrl': 'ftl_report_url',
        'exerciseData': 'exercise_data',
        'xdyPlaypath': 'xdy_playpath',
        'canPlayback': 'can_playback',
        'talkPlaypath': 'talk_playpath',
        'cancelReasonId': 'cancel_reason_id',
        'canPostReview': 'can_post_review',
        'endTime': 'end_time'
      },
    );

Map<String, dynamic> _$$LessonImplToJson(_$LessonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (instance.incompleteNotes case final value?) 'incomplete_notes': value,
      'incomplete_reason_id': instance.incompleteReasonId,
      if (const CTBoolConverter().toJson(instance.isReview) case final value?)
        'is_review': value,
      if (instance.oneToOneOrGroup case final value?)
        'one_to_one_or_group': value,
      'original_teacher_id': instance.originalTeacherId,
      if (instance.request case final value?) 'request': value,
      if (instance.requested case final value?) 'requested': value,
      if (instance.requestedTime case final value?) 'requested_time': value,
      'reserved_by_id': instance.reservedById,
      if (instance.reservedTime case final value?) 'reserved_time': value,
      'result_id': instance.resultId,
      if (instance.sentReminder case final value?) 'sent_reminder': value,
      if (instance.sentReminderTime case final value?)
        'sent_reminder_time': value,
      if (instance.startDate case final value?) 'start_date': value,
      if (instance.startTime case final value?) 'start_time': value,
      'status_id': instance.statusId,
      if (instance.statusName case final value?) 'status_name': value,
      'student_id': instance.studentId,
      if (instance.substituted case final value?) 'substituted': value,
      if (instance.substitutedTime case final value?) 'substituted_time': value,
      if (instance.teacher?.toJson() case final value?) 'teacher': value,
      'teacher_id': instance.teacherId,
      if (instance.teacherReview?.toJson() case final value?)
        'teacher_review': value,
      if (instance.timeFrom case final value?) 'time_from': value,
      'time_id': instance.timeId,
      if (instance.timeTo case final value?) 'time_to': value,
      'request_category_ids': instance.requestCategoryIds,
      'teacher_available_curiculums':
          instance.teacherAvailableCuriculums.map((e) => e.toJson()).toList(),
      if (instance.patrolClassroomUrl case final value?)
        'patrol_classroom_url': value,
      if (instance.crmMomentUrl case final value?) 'crm_moment_url': value,
      if (const CTBoolConverter().toJson(instance.canPreview) case final value?)
        'can_preview': value,
      if (instance.reservedBy case final value?) 'reserved_by': value,
      if (const CTBoolConverter().toJson(instance.canCancel) case final value?)
        'can_cancel': value,
      if (instance.paidBy case final value?) 'paid_by': value,
      if (const CTBoolConverter().toJson(instance.hasFtlReport)
          case final value?)
        'has_ftl_report': value,
      'ftl_report_url': instance.ftlReportUrl,
      if (instance.exerciseData?.toJson() case final value?)
        'exercise_data': value,
      'xdy_playpath': instance.xdyPlaypath.map((e) => e.toJson()).toList(),
      if (instance.canPlayback case final value?) 'can_playback': value,
      'talk_playpath': instance.talkPlaypath.map((e) => e.toJson()).toList(),
      'moments': instance.moments.map((e) => e.toJson()).toList(),
      if (instance.cancelReasonId case final value?) 'cancel_reason_id': value,
      if (const CTBoolConverter().toJson(instance.canPostReview)
          case final value?)
        'can_post_review': value,
      if (instance.endTime case final value?) 'end_time': value,
    };

_$LessonExerciseDataImpl _$$LessonExerciseDataImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$LessonExerciseDataImpl',
      json,
      ($checkedConvert) {
        final val = _$LessonExerciseDataImpl(
          doneAllExercise: $checkedConvert('done_all_exercise',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          exercisePageCount: $checkedConvert(
              'exercise_page_count', (v) => (v as num?)?.toInt() ?? 0),
          exercisePages: $checkedConvert(
              'exercise_pages',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => LessonExercisePage.fromJson(
                          e as Map<String, dynamic>))
                      .toList() ??
                  const []),
        );
        return val;
      },
      fieldKeyMap: const {
        'doneAllExercise': 'done_all_exercise',
        'exercisePageCount': 'exercise_page_count',
        'exercisePages': 'exercise_pages'
      },
    );

Map<String, dynamic> _$$LessonExerciseDataImplToJson(
        _$LessonExerciseDataImpl instance) =>
    <String, dynamic>{
      if (const CTBoolConverter().toJson(instance.doneAllExercise)
          case final value?)
        'done_all_exercise': value,
      'exercise_page_count': instance.exercisePageCount,
      'exercise_pages': instance.exercisePages.map((e) => e.toJson()).toList(),
    };

_$LessonExercisePageImpl _$$LessonExercisePageImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$LessonExercisePageImpl',
      json,
      ($checkedConvert) {
        final val = _$LessonExercisePageImpl(
          page: $checkedConvert('page', (v) => (v as num?)?.toInt() ?? 0),
        );
        return val;
      },
    );

Map<String, dynamic> _$$LessonExercisePageImplToJson(
        _$LessonExercisePageImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
    };

_$LessonMomentImpl _$$LessonMomentImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$LessonMomentImpl',
      json,
      ($checkedConvert) {
        final val = _$LessonMomentImpl(
          imageFile: $checkedConvert('image_file', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'imageFile': 'image_file'},
    );

Map<String, dynamic> _$$LessonMomentImplToJson(_$LessonMomentImpl instance) =>
    <String, dynamic>{
      if (instance.imageFile case final value?) 'image_file': value,
    };
