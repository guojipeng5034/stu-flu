import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cptop/core/utils/json_converters.dart';
import '../teacher/teacher.dart';
import '../teacher_review/teacher_review.dart';
import '../curriculum/curriculum.dart';
import '../playpath/talk_playpath.dart';
import '../playpath/xdy_playpath.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

/// 课程数据模型
///
/// 用于课程信息管理和课程状态跟踪
@freezed
class Lesson with _$Lesson {
  const factory Lesson({
    @Default(0) int id,
    String? incompleteNotes,
    @Default(0) int incompleteReasonId,
    @CTBoolConverter() @Default(false) bool isReview,
    String? oneToOneOrGroup,
    @Default(0) int originalTeacherId,
    String? request,
    @CTBoolConverter() @Default(false) requested,
    String? requestedTime,
    @Default(0) int reservedById,
    String? reservedTime,
    @Default(0) int resultId,
    @CTBoolConverter() @Default(false) sentReminder,
    String? sentReminderTime,
    String? startDate,
    String? startTime,
    @Default(0) int statusId,
    String? statusName,
    @Default(0) int studentId,
    @CTBoolConverter() @Default(false) substituted,
    String? substitutedTime,
    Teacher? teacher,
    @Default(0) int teacherId,
    TeacherReview? teacherReview,
    String? timeFrom,
    @Default(0) int timeId,
    String? timeTo,
    @Default([]) List<int> requestCategoryIds,
    @Default([]) List<Curriculum> teacherAvailableCuriculums,
    String? patrolClassroomUrl,
    String? crmMomentUrl,
    @CTBoolConverter() @Default(false) bool canPreview,
    String? reservedBy,
    @CTBoolConverter() @Default(false) bool canCancel,
    String? paidBy,
    @CTBoolConverter() @Default(false) bool hasFtlReport,
    @Default('') String ftlReportUrl,
    LessonExerciseData? exerciseData,
    @Default([]) List<XdyPlaypath> xdyPlaypath,
    @CTBoolConverter() @Default(false) canPlayback,
    @Default([]) List<TalkPlaypath> talkPlaypath,
    @Default([]) List<LessonMoment> moments,
    @CTBoolConverter() @Default(false) cancelReasonId,
    @CTBoolConverter() @Default(false) bool canPostReview,
    String? endTime,
  }) = _Lesson;

  /// 从 JSON 创建 Lesson 实例
  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}

/// 课程练习数据
@freezed
class LessonExerciseData with _$LessonExerciseData {
  const factory LessonExerciseData({
    @CTBoolConverter() @Default(false) bool doneAllExercise,
    @Default(0) int exercisePageCount,
    @Default([]) List<LessonExercisePage> exercisePages,
  }) = _LessonExerciseData;

  /// 从 JSON 创建 LessonExerciseData 实例
  factory LessonExerciseData.fromJson(Map<String, dynamic> json) => _$LessonExerciseDataFromJson(json);
}

/// 课程练习页面
@freezed
class LessonExercisePage with _$LessonExercisePage {
  const factory LessonExercisePage({
    @Default(0) int page,
  }) = _LessonExercisePage;

  /// 从 JSON 创建 LessonExercisePage 实例
  factory LessonExercisePage.fromJson(Map<String, dynamic> json) => _$LessonExercisePageFromJson(json);
}

/// 课程时刻
@freezed
class LessonMoment with _$LessonMoment {
  const factory LessonMoment({
    String? imageFile,
  }) = _LessonMoment;

  /// 从 JSON 创建 LessonMoment 实例
  factory LessonMoment.fromJson(Map<String, dynamic> json) => _$LessonMomentFromJson(json);
}
