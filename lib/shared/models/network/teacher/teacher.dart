import 'package:cptop/core/utils/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'teacher_station.dart';

part 'teacher.freezed.dart';
part 'teacher.g.dart';

/// 教师数据模型
///
/// 用于教师信息管理和教师相关功能
@freezed
class Teacher with _$Teacher {
  const factory Teacher({
    @Default(0) int bookmarked,
    @CTStringConverter() @Default('') String bookmarkedLimitted,
    @Default(0) int collections,
    String? reviewsTotal,
    @CTBoolConverter() @Default(false) bool isCanFixed,
    @Default('') String teacherUid,
    String? gender,
    @Default(0) int id,
    @Default('') String aboutMe,
    @Default('') String imageFile,
    String? name,
    @Default(0) int points,
    @Default("5.0") String rating,
    @Default([]) List<String> availableCurriculumCodes,
    @CTBoolConverter() @Default(false) fixedOk,
    @Default([]) List<TeacherStation> teacherStations,
    TeacherDetail? detail,
    @Default([]) List<TeacherBlock> blocks,
  }) = _Teacher;

  /// 从 JSON 创建 Teacher 实例
  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
}

/// 教师详情
@freezed
class TeacherDetail with _$TeacherDetail {
  const factory TeacherDetail({
    @Default('') String aboutMe,
    @Default(0) int bookmarkedX,
    @CTStringConverter() @Default('') String bookmarkedLimitted,
    @Default('') String career,
    @Default('') String certificationFile,
    @Default('') String certificationType,
    @Default('') String country,
    @Default('') String degree,
    @Default('') String movieUrl,
    @Default('') String schoolGraduated,
    @Default('') String teacherReference,
    List<String>? availableCurriculumCodes,
    List<TeacherReviewGroup>? reviewsTotalOfGroup,
    @Default('') String reviewsTotal,
  }) = _TeacherDetail;

  /// 从 JSON 创建 TeacherDetail 实例
  factory TeacherDetail.fromJson(Map<String, dynamic> json) =>
      _$TeacherDetailFromJson(json);
}

/// 教师评价分组
@freezed
class TeacherReviewGroup with _$TeacherReviewGroup {
  const factory TeacherReviewGroup({
    String? icon,
    @Default(0) int? id,
    String? label,
    String? name,
    String? total,
    List<String>? sites,
  }) = _TeacherReviewGroup;

  /// 从 JSON 创建 TeacherReviewGroup 实例
  factory TeacherReviewGroup.fromJson(Map<String, dynamic> json) =>
      _$TeacherReviewGroupFromJson(json);
}

/// 教师时间块
@freezed
class TeacherBlock with _$TeacherBlock {
  const factory TeacherBlock({
    String? baseDate,
    @Default(0) int baseHeight,
    @Default(0) int baseSize,
    @Default(0) int baseTimeStamp,
    dynamic companyContractGroupSchedule,
    dynamic disabled,
    @Default(0) int endTimeStamp,
    @Default(0) int groupLessonsSize,
    String? isAlready,
    dynamic isMine,
    dynamic lesson,
    String? realDate,
    String? realTimeFrom,
    String? realTimeTo,
    dynamic roomSchedule,
    @Default(0) int startTimeStamp,
    String? statusForStudent,
    TeacherSchedule? teacherSchedule,
    String? timeBase,
    String? timeFrom,
    String? timeTo,
    String? trimmed,
    @Default(0) int typeId,
  }) = _TeacherBlock;

  /// 从 JSON 创建 TeacherBlock 实例
  factory TeacherBlock.fromJson(Map<String, dynamic> json) =>
      _$TeacherBlockFromJson(json);
}

/// 教师排课信息
@freezed
class TeacherSchedule with _$TeacherSchedule {
  const factory TeacherSchedule({
    dynamic curriculumCode,
    dynamic endMin,
    @Default(0) int endTime,
    @CTBoolConverter() @Default(false) bool lockedFlag,
    dynamic startMin,
    @Default(0) int startTime,
    String? statusLabel,
    @Default(0) int studentsMaxSize,
    String? teacherUid,
    String? uid,
    List<dynamic>? availableCurriculumCodes,
    List<dynamic>? availableSiteIds,
  }) = _TeacherSchedule;

  /// 从 JSON 创建 TeacherSchedule 实例
  factory TeacherSchedule.fromJson(Map<String, dynamic> json) =>
      _$TeacherScheduleFromJson(json);
}
