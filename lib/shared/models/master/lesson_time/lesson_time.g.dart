// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonTimeBeanImpl _$$LessonTimeBeanImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$LessonTimeBeanImpl',
      json,
      ($checkedConvert) {
        final val = _$LessonTimeBeanImpl(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          label: $checkedConvert('label', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          abbr: $checkedConvert('abbr', (v) => v as String?),
          mins: $checkedConvert('mins', (v) => v as String?),
          openRestriction:
              $checkedConvert('open_restriction', (v) => (v as num?)?.toInt()),
          unavailableLessonStart: $checkedConvert(
              'unavailable_lesson_start',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => (e as num).toInt())
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'openRestriction': 'open_restriction',
        'unavailableLessonStart': 'unavailable_lesson_start'
      },
    );

Map<String, dynamic> _$$LessonTimeBeanImplToJson(
        _$LessonTimeBeanImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.label case final value?) 'label': value,
      if (instance.name case final value?) 'name': value,
      if (instance.abbr case final value?) 'abbr': value,
      if (instance.mins case final value?) 'mins': value,
      if (instance.openRestriction case final value?) 'open_restriction': value,
      if (instance.unavailableLessonStart case final value?)
        'unavailable_lesson_start': value,
    };

_$LessonTimeListImpl _$$LessonTimeListImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$LessonTimeListImpl',
      json,
      ($checkedConvert) {
        final val = _$LessonTimeListImpl(
          data: $checkedConvert(
              'data',
              (v) => (v as List<dynamic>?)
                  ?.map(
                      (e) => LessonTimeBean.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$LessonTimeListImplToJson(
        _$LessonTimeListImpl instance) =>
    <String, dynamic>{
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
    };
