// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurriculumImpl _$$CurriculumImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CurriculumImpl',
      json,
      ($checkedConvert) {
        final val = _$CurriculumImpl(
          applicableUser: $checkedConvert(
              'applicable_user',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => ApplicableUser.fromJson(e as Map<String, dynamic>))
                  .toList()),
          code: $checkedConvert('code', (v) => v as String?),
          curriculumStudyPage:
              $checkedConvert('curriculum_study_page', (v) => v ?? 0),
          curriculumTotalPage:
              $checkedConvert('curriculum_total_page', (v) => v ?? 0),
          description: $checkedConvert('description', (v) => v ?? ""),
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          image: $checkedConvert('image', (v) => v as String?),
          lead: $checkedConvert('lead', (v) => v as String?),
          lessonTimeId:
              $checkedConvert('lesson_time_id', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
          isFtl: $checkedConvert('is_ftl',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          groupFlag: $checkedConvert('group_flag',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          oneToOneFlag: $checkedConvert('one_to_one_flag',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
        );
        return val;
      },
      fieldKeyMap: const {
        'applicableUser': 'applicable_user',
        'curriculumStudyPage': 'curriculum_study_page',
        'curriculumTotalPage': 'curriculum_total_page',
        'lessonTimeId': 'lesson_time_id',
        'isFtl': 'is_ftl',
        'groupFlag': 'group_flag',
        'oneToOneFlag': 'one_to_one_flag'
      },
    );

Map<String, dynamic> _$$CurriculumImplToJson(_$CurriculumImpl instance) =>
    <String, dynamic>{
      if (instance.applicableUser?.map((e) => e.toJson()).toList()
          case final value?)
        'applicable_user': value,
      if (instance.code case final value?) 'code': value,
      if (instance.curriculumStudyPage case final value?)
        'curriculum_study_page': value,
      if (instance.curriculumTotalPage case final value?)
        'curriculum_total_page': value,
      if (instance.description case final value?) 'description': value,
      'id': instance.id,
      if (instance.image case final value?) 'image': value,
      if (instance.lead case final value?) 'lead': value,
      if (instance.lessonTimeId case final value?) 'lesson_time_id': value,
      if (instance.name case final value?) 'name': value,
      if (const CTBoolConverter().toJson(instance.isFtl) case final value?)
        'is_ftl': value,
      if (const CTBoolConverter().toJson(instance.groupFlag) case final value?)
        'group_flag': value,
      if (const CTBoolConverter().toJson(instance.oneToOneFlag)
          case final value?)
        'one_to_one_flag': value,
    };
