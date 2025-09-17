import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cptop/core/utils/json_converters.dart';
import '../teacher/teacher.dart';

part 'lesson_order.freezed.dart';
part 'lesson_order.g.dart';

/// 课程订单数据模型
///
/// 用于课程预订和订单管理
@freezed
class LessonOrder with _$LessonOrder {
  const factory LessonOrder({
    @CTBoolConverter() @Default(false) bool allowSubstituteFlag,
    String? createdTime,
    String? curriculumCode,
    @Default(0) int curriculumId,
    String? curriculumName,
    @Default(0) int dayOfWeek,
    @CTBoolConverter() @Default(false) bool deletedFlag,
    @Default(0) int endMin,
    @Default(0) int extraPoints,
    @Default(0) int id,
    @Default(0) int lessonTimeId,
    String? modifiedTime,
    @Default(0) int orderedById,
    String? orderedTime,
    @Default(0) int paidById,
    String? remark,
    String? reservationStartTime,
    String? reservationStopTime,
    @Default(0) int siteId,
    @Default(0) int startMin,
    String? stopReasonId,
    @CTBoolConverter() @Default(false) bool stoppedFlag,
    String? stoppedTime,
    @Default(0) int studentId,
    Teacher? teacher,
    @Default(0) int teacherId,
    String? timeFrom,
    String? timeTo,
    @Default([]) List<LessonOrderExtraPoints> extraPointsJson,
    @Default([]) List<LessonOrderStopInfo> lessonsForOrderStop,
    String? curriculumPoints,
  }) = _LessonOrder;

  /// 从 JSON 创建 LessonOrder 实例
  factory LessonOrder.fromJson(Map<String, dynamic> json) => _$LessonOrderFromJson(json);
}

/// 课程订单额外积分
@freezed
class LessonOrderExtraPoints with _$LessonOrderExtraPoints {
  const factory LessonOrderExtraPoints({
    @Default(0) int extraPoints,
    @Default(0) int lessonId,
  }) = _LessonOrderExtraPoints;

  /// 从 JSON 创建 LessonOrderExtraPoints 实例
  factory LessonOrderExtraPoints.fromJson(Map<String, dynamic> json) => _$LessonOrderExtraPointsFromJson(json);
}

/// 课程订单停止信息
@freezed
class LessonOrderStopInfo with _$LessonOrderStopInfo {
  const factory LessonOrderStopInfo({
    String? date,
    @Default(0) int dayOfWeek,
    @Default(0) int id,
    @Default(0) int points,
  }) = _LessonOrderStopInfo;

  /// 从 JSON 创建 LessonOrderStopInfo 实例
  factory LessonOrderStopInfo.fromJson(Map<String, dynamic> json) => _$LessonOrderStopInfoFromJson(json);
}
