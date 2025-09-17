import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_review.freezed.dart';
part 'teacher_review.g.dart';

/// 教师评价数据模型
///
/// 用于学生对教师的评价信息
@freezed
class TeacherReview with _$TeacherReview {
  const factory TeacherReview({
    String? comment,
    String? createdTime,
    @Default(0) int id,
    @Default(0) int lessonId,
    @Default(0) int likesTotal,
    String? publicFlag,
    @Default(0) int ratingId,
    String? rejectedFlag,
    @Default('') String remark,
    TeacherReviewStudent? student,
    @Default(0) int studentId,
    @Default(0) int teacherId,
    @Default('') String tagIds,
  }) = _TeacherReview;

  /// 从 JSON 创建 TeacherReview 实例
  factory TeacherReview.fromJson(Map<String, dynamic> json) => _$TeacherReviewFromJson(json);
}

/// 教师评价中的学生信息
@freezed
class TeacherReviewStudent with _$TeacherReviewStudent {
  const factory TeacherReviewStudent({
    String? countryOrDefault,
    String? imageFile,
    String? nickname,
  }) = _TeacherReviewStudent;

  /// 从 JSON 创建 TeacherReviewStudent 实例
  factory TeacherReviewStudent.fromJson(Map<String, dynamic> json) => _$TeacherReviewStudentFromJson(json);
}
