// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeacherReviewImpl _$$TeacherReviewImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TeacherReviewImpl',
      json,
      ($checkedConvert) {
        final val = _$TeacherReviewImpl(
          comment: $checkedConvert('comment', (v) => v as String?),
          createdTime: $checkedConvert('created_time', (v) => v as String?),
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          lessonId:
              $checkedConvert('lesson_id', (v) => (v as num?)?.toInt() ?? 0),
          likesTotal:
              $checkedConvert('likes_total', (v) => (v as num?)?.toInt() ?? 0),
          publicFlag: $checkedConvert('public_flag', (v) => v as String?),
          ratingId:
              $checkedConvert('rating_id', (v) => (v as num?)?.toInt() ?? 0),
          rejectedFlag: $checkedConvert('rejected_flag', (v) => v as String?),
          remark: $checkedConvert('remark', (v) => v as String? ?? ''),
          student: $checkedConvert(
              'student',
              (v) => v == null
                  ? null
                  : TeacherReviewStudent.fromJson(v as Map<String, dynamic>)),
          studentId:
              $checkedConvert('student_id', (v) => (v as num?)?.toInt() ?? 0),
          teacherId:
              $checkedConvert('teacher_id', (v) => (v as num?)?.toInt() ?? 0),
          tagIds: $checkedConvert('tag_ids', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {
        'createdTime': 'created_time',
        'lessonId': 'lesson_id',
        'likesTotal': 'likes_total',
        'publicFlag': 'public_flag',
        'ratingId': 'rating_id',
        'rejectedFlag': 'rejected_flag',
        'studentId': 'student_id',
        'teacherId': 'teacher_id',
        'tagIds': 'tag_ids'
      },
    );

Map<String, dynamic> _$$TeacherReviewImplToJson(_$TeacherReviewImpl instance) =>
    <String, dynamic>{
      if (instance.comment case final value?) 'comment': value,
      if (instance.createdTime case final value?) 'created_time': value,
      'id': instance.id,
      'lesson_id': instance.lessonId,
      'likes_total': instance.likesTotal,
      if (instance.publicFlag case final value?) 'public_flag': value,
      'rating_id': instance.ratingId,
      if (instance.rejectedFlag case final value?) 'rejected_flag': value,
      'remark': instance.remark,
      if (instance.student?.toJson() case final value?) 'student': value,
      'student_id': instance.studentId,
      'teacher_id': instance.teacherId,
      'tag_ids': instance.tagIds,
    };

_$TeacherReviewStudentImpl _$$TeacherReviewStudentImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TeacherReviewStudentImpl',
      json,
      ($checkedConvert) {
        final val = _$TeacherReviewStudentImpl(
          countryOrDefault:
              $checkedConvert('country_or_default', (v) => v as String?),
          imageFile: $checkedConvert('image_file', (v) => v as String?),
          nickname: $checkedConvert('nickname', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'countryOrDefault': 'country_or_default',
        'imageFile': 'image_file'
      },
    );

Map<String, dynamic> _$$TeacherReviewStudentImplToJson(
        _$TeacherReviewStudentImpl instance) =>
    <String, dynamic>{
      if (instance.countryOrDefault case final value?)
        'country_or_default': value,
      if (instance.imageFile case final value?) 'image_file': value,
      if (instance.nickname case final value?) 'nickname': value,
    };
