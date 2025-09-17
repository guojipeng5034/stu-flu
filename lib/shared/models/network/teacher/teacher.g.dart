// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeacherImpl _$$TeacherImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TeacherImpl',
      json,
      ($checkedConvert) {
        final val = _$TeacherImpl(
          bookmarked:
              $checkedConvert('bookmarked', (v) => (v as num?)?.toInt() ?? 0),
          bookmarkedLimitted: $checkedConvert('bookmarked_limitted',
              (v) => v == null ? '' : const CTStringConverter().fromJson(v)),
          collections:
              $checkedConvert('collections', (v) => (v as num?)?.toInt() ?? 0),
          reviewsTotal: $checkedConvert('reviews_total', (v) => v as String?),
          isCanFixed: $checkedConvert('is_can_fixed',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          teacherUid: $checkedConvert('teacher_uid', (v) => v as String? ?? ''),
          gender: $checkedConvert('gender', (v) => v as String?),
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          aboutMe: $checkedConvert('about_me', (v) => v as String? ?? ''),
          imageFile: $checkedConvert('image_file', (v) => v as String? ?? ''),
          name: $checkedConvert('name', (v) => v as String?),
          points: $checkedConvert('points', (v) => (v as num?)?.toInt() ?? 0),
          rating: $checkedConvert('rating', (v) => v as String? ?? "5.0"),
          availableCurriculumCodes: $checkedConvert(
              'available_curriculum_codes',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          fixedOk: $checkedConvert('fixed_ok', (v) => v ?? false),
          teacherStations: $checkedConvert(
              'teacher_stations',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          TeacherStation.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          detail: $checkedConvert(
              'detail',
              (v) => v == null
                  ? null
                  : TeacherDetail.fromJson(v as Map<String, dynamic>)),
          blocks: $checkedConvert(
              'blocks',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          TeacherBlock.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
        );
        return val;
      },
      fieldKeyMap: const {
        'bookmarkedLimitted': 'bookmarked_limitted',
        'reviewsTotal': 'reviews_total',
        'isCanFixed': 'is_can_fixed',
        'teacherUid': 'teacher_uid',
        'aboutMe': 'about_me',
        'imageFile': 'image_file',
        'availableCurriculumCodes': 'available_curriculum_codes',
        'fixedOk': 'fixed_ok',
        'teacherStations': 'teacher_stations'
      },
    );

Map<String, dynamic> _$$TeacherImplToJson(_$TeacherImpl instance) =>
    <String, dynamic>{
      'bookmarked': instance.bookmarked,
      if (const CTStringConverter().toJson(instance.bookmarkedLimitted)
          case final value?)
        'bookmarked_limitted': value,
      'collections': instance.collections,
      if (instance.reviewsTotal case final value?) 'reviews_total': value,
      if (const CTBoolConverter().toJson(instance.isCanFixed) case final value?)
        'is_can_fixed': value,
      'teacher_uid': instance.teacherUid,
      if (instance.gender case final value?) 'gender': value,
      'id': instance.id,
      'about_me': instance.aboutMe,
      'image_file': instance.imageFile,
      if (instance.name case final value?) 'name': value,
      'points': instance.points,
      'rating': instance.rating,
      'available_curriculum_codes': instance.availableCurriculumCodes,
      if (instance.fixedOk case final value?) 'fixed_ok': value,
      'teacher_stations':
          instance.teacherStations.map((e) => e.toJson()).toList(),
      if (instance.detail?.toJson() case final value?) 'detail': value,
      'blocks': instance.blocks.map((e) => e.toJson()).toList(),
    };

_$TeacherDetailImpl _$$TeacherDetailImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TeacherDetailImpl',
      json,
      ($checkedConvert) {
        final val = _$TeacherDetailImpl(
          aboutMe: $checkedConvert('about_me', (v) => v as String? ?? ''),
          bookmarkedX:
              $checkedConvert('bookmarked_x', (v) => (v as num?)?.toInt() ?? 0),
          bookmarkedLimitted: $checkedConvert('bookmarked_limitted',
              (v) => v == null ? '' : const CTStringConverter().fromJson(v)),
          career: $checkedConvert('career', (v) => v as String? ?? ''),
          certificationFile:
              $checkedConvert('certification_file', (v) => v as String? ?? ''),
          certificationType:
              $checkedConvert('certification_type', (v) => v as String? ?? ''),
          country: $checkedConvert('country', (v) => v as String? ?? ''),
          degree: $checkedConvert('degree', (v) => v as String? ?? ''),
          movieUrl: $checkedConvert('movie_url', (v) => v as String? ?? ''),
          schoolGraduated:
              $checkedConvert('school_graduated', (v) => v as String? ?? ''),
          teacherReference:
              $checkedConvert('teacher_reference', (v) => v as String? ?? ''),
          availableCurriculumCodes: $checkedConvert(
              'available_curriculum_codes',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          reviewsTotalOfGroup: $checkedConvert(
              'reviews_total_of_group',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      TeacherReviewGroup.fromJson(e as Map<String, dynamic>))
                  .toList()),
          reviewsTotal:
              $checkedConvert('reviews_total', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {
        'aboutMe': 'about_me',
        'bookmarkedX': 'bookmarked_x',
        'bookmarkedLimitted': 'bookmarked_limitted',
        'certificationFile': 'certification_file',
        'certificationType': 'certification_type',
        'movieUrl': 'movie_url',
        'schoolGraduated': 'school_graduated',
        'teacherReference': 'teacher_reference',
        'availableCurriculumCodes': 'available_curriculum_codes',
        'reviewsTotalOfGroup': 'reviews_total_of_group',
        'reviewsTotal': 'reviews_total'
      },
    );

Map<String, dynamic> _$$TeacherDetailImplToJson(_$TeacherDetailImpl instance) =>
    <String, dynamic>{
      'about_me': instance.aboutMe,
      'bookmarked_x': instance.bookmarkedX,
      if (const CTStringConverter().toJson(instance.bookmarkedLimitted)
          case final value?)
        'bookmarked_limitted': value,
      'career': instance.career,
      'certification_file': instance.certificationFile,
      'certification_type': instance.certificationType,
      'country': instance.country,
      'degree': instance.degree,
      'movie_url': instance.movieUrl,
      'school_graduated': instance.schoolGraduated,
      'teacher_reference': instance.teacherReference,
      if (instance.availableCurriculumCodes case final value?)
        'available_curriculum_codes': value,
      if (instance.reviewsTotalOfGroup?.map((e) => e.toJson()).toList()
          case final value?)
        'reviews_total_of_group': value,
      'reviews_total': instance.reviewsTotal,
    };

_$TeacherReviewGroupImpl _$$TeacherReviewGroupImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TeacherReviewGroupImpl',
      json,
      ($checkedConvert) {
        final val = _$TeacherReviewGroupImpl(
          icon: $checkedConvert('icon', (v) => v as String?),
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          label: $checkedConvert('label', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          total: $checkedConvert('total', (v) => v as String?),
          sites: $checkedConvert('sites',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$TeacherReviewGroupImplToJson(
        _$TeacherReviewGroupImpl instance) =>
    <String, dynamic>{
      if (instance.icon case final value?) 'icon': value,
      if (instance.id case final value?) 'id': value,
      if (instance.label case final value?) 'label': value,
      if (instance.name case final value?) 'name': value,
      if (instance.total case final value?) 'total': value,
      if (instance.sites case final value?) 'sites': value,
    };

_$TeacherBlockImpl _$$TeacherBlockImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TeacherBlockImpl',
      json,
      ($checkedConvert) {
        final val = _$TeacherBlockImpl(
          baseDate: $checkedConvert('base_date', (v) => v as String?),
          baseHeight:
              $checkedConvert('base_height', (v) => (v as num?)?.toInt() ?? 0),
          baseSize:
              $checkedConvert('base_size', (v) => (v as num?)?.toInt() ?? 0),
          baseTimeStamp: $checkedConvert(
              'base_time_stamp', (v) => (v as num?)?.toInt() ?? 0),
          companyContractGroupSchedule:
              $checkedConvert('company_contract_group_schedule', (v) => v),
          disabled: $checkedConvert('disabled', (v) => v),
          endTimeStamp: $checkedConvert(
              'end_time_stamp', (v) => (v as num?)?.toInt() ?? 0),
          groupLessonsSize: $checkedConvert(
              'group_lessons_size', (v) => (v as num?)?.toInt() ?? 0),
          isAlready: $checkedConvert('is_already', (v) => v as String?),
          isMine: $checkedConvert('is_mine', (v) => v),
          lesson: $checkedConvert('lesson', (v) => v),
          realDate: $checkedConvert('real_date', (v) => v as String?),
          realTimeFrom: $checkedConvert('real_time_from', (v) => v as String?),
          realTimeTo: $checkedConvert('real_time_to', (v) => v as String?),
          roomSchedule: $checkedConvert('room_schedule', (v) => v),
          startTimeStamp: $checkedConvert(
              'start_time_stamp', (v) => (v as num?)?.toInt() ?? 0),
          statusForStudent:
              $checkedConvert('status_for_student', (v) => v as String?),
          teacherSchedule: $checkedConvert(
              'teacher_schedule',
              (v) => v == null
                  ? null
                  : TeacherSchedule.fromJson(v as Map<String, dynamic>)),
          timeBase: $checkedConvert('time_base', (v) => v as String?),
          timeFrom: $checkedConvert('time_from', (v) => v as String?),
          timeTo: $checkedConvert('time_to', (v) => v as String?),
          trimmed: $checkedConvert('trimmed', (v) => v as String?),
          typeId: $checkedConvert('type_id', (v) => (v as num?)?.toInt() ?? 0),
        );
        return val;
      },
      fieldKeyMap: const {
        'baseDate': 'base_date',
        'baseHeight': 'base_height',
        'baseSize': 'base_size',
        'baseTimeStamp': 'base_time_stamp',
        'companyContractGroupSchedule': 'company_contract_group_schedule',
        'endTimeStamp': 'end_time_stamp',
        'groupLessonsSize': 'group_lessons_size',
        'isAlready': 'is_already',
        'isMine': 'is_mine',
        'realDate': 'real_date',
        'realTimeFrom': 'real_time_from',
        'realTimeTo': 'real_time_to',
        'roomSchedule': 'room_schedule',
        'startTimeStamp': 'start_time_stamp',
        'statusForStudent': 'status_for_student',
        'teacherSchedule': 'teacher_schedule',
        'timeBase': 'time_base',
        'timeFrom': 'time_from',
        'timeTo': 'time_to',
        'typeId': 'type_id'
      },
    );

Map<String, dynamic> _$$TeacherBlockImplToJson(_$TeacherBlockImpl instance) =>
    <String, dynamic>{
      if (instance.baseDate case final value?) 'base_date': value,
      'base_height': instance.baseHeight,
      'base_size': instance.baseSize,
      'base_time_stamp': instance.baseTimeStamp,
      if (instance.companyContractGroupSchedule case final value?)
        'company_contract_group_schedule': value,
      if (instance.disabled case final value?) 'disabled': value,
      'end_time_stamp': instance.endTimeStamp,
      'group_lessons_size': instance.groupLessonsSize,
      if (instance.isAlready case final value?) 'is_already': value,
      if (instance.isMine case final value?) 'is_mine': value,
      if (instance.lesson case final value?) 'lesson': value,
      if (instance.realDate case final value?) 'real_date': value,
      if (instance.realTimeFrom case final value?) 'real_time_from': value,
      if (instance.realTimeTo case final value?) 'real_time_to': value,
      if (instance.roomSchedule case final value?) 'room_schedule': value,
      'start_time_stamp': instance.startTimeStamp,
      if (instance.statusForStudent case final value?)
        'status_for_student': value,
      if (instance.teacherSchedule?.toJson() case final value?)
        'teacher_schedule': value,
      if (instance.timeBase case final value?) 'time_base': value,
      if (instance.timeFrom case final value?) 'time_from': value,
      if (instance.timeTo case final value?) 'time_to': value,
      if (instance.trimmed case final value?) 'trimmed': value,
      'type_id': instance.typeId,
    };

_$TeacherScheduleImpl _$$TeacherScheduleImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TeacherScheduleImpl',
      json,
      ($checkedConvert) {
        final val = _$TeacherScheduleImpl(
          curriculumCode: $checkedConvert('curriculum_code', (v) => v),
          endMin: $checkedConvert('end_min', (v) => v),
          endTime:
              $checkedConvert('end_time', (v) => (v as num?)?.toInt() ?? 0),
          lockedFlag: $checkedConvert('locked_flag',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          startMin: $checkedConvert('start_min', (v) => v),
          startTime:
              $checkedConvert('start_time', (v) => (v as num?)?.toInt() ?? 0),
          statusLabel: $checkedConvert('status_label', (v) => v as String?),
          studentsMaxSize: $checkedConvert(
              'students_max_size', (v) => (v as num?)?.toInt() ?? 0),
          teacherUid: $checkedConvert('teacher_uid', (v) => v as String?),
          uid: $checkedConvert('uid', (v) => v as String?),
          availableCurriculumCodes: $checkedConvert(
              'available_curriculum_codes', (v) => v as List<dynamic>?),
          availableSiteIds:
              $checkedConvert('available_site_ids', (v) => v as List<dynamic>?),
        );
        return val;
      },
      fieldKeyMap: const {
        'curriculumCode': 'curriculum_code',
        'endMin': 'end_min',
        'endTime': 'end_time',
        'lockedFlag': 'locked_flag',
        'startMin': 'start_min',
        'startTime': 'start_time',
        'statusLabel': 'status_label',
        'studentsMaxSize': 'students_max_size',
        'teacherUid': 'teacher_uid',
        'availableCurriculumCodes': 'available_curriculum_codes',
        'availableSiteIds': 'available_site_ids'
      },
    );

Map<String, dynamic> _$$TeacherScheduleImplToJson(
        _$TeacherScheduleImpl instance) =>
    <String, dynamic>{
      if (instance.curriculumCode case final value?) 'curriculum_code': value,
      if (instance.endMin case final value?) 'end_min': value,
      'end_time': instance.endTime,
      if (const CTBoolConverter().toJson(instance.lockedFlag) case final value?)
        'locked_flag': value,
      if (instance.startMin case final value?) 'start_min': value,
      'start_time': instance.startTime,
      if (instance.statusLabel case final value?) 'status_label': value,
      'students_max_size': instance.studentsMaxSize,
      if (instance.teacherUid case final value?) 'teacher_uid': value,
      if (instance.uid case final value?) 'uid': value,
      if (instance.availableCurriculumCodes case final value?)
        'available_curriculum_codes': value,
      if (instance.availableSiteIds case final value?)
        'available_site_ids': value,
    };
