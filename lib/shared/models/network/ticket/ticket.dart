import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

/// 票据数据模型
///
/// 用于课程票据和订阅管理
@freezed
class Ticket with _$Ticket {
  const factory Ticket({
    String? code,
    String? createdTime,
    String? description,
    dynamic invalid,
    @Default(0) int lessonSize,
    @Default('0') String name,
    @Default([]) List<TicketTimeRange> limitedTimeSpansJson,
    @Default('0') String lessonTimeId,
    @Default('0') String maxTeacherPoints,
    @Default(0) int statusId,
    @Default(0) int typeId,
    List<TicketAvailableCurriculum>? availableCurriculum,
    List<String>? availableCurriculumCodes,
  }) = _Ticket;

  /// 从 JSON 创建 Ticket 实例
  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}

/// 票据可用课程
@freezed
class TicketAvailableCurriculum with _$TicketAvailableCurriculum {
  const factory TicketAvailableCurriculum({
    @Default('') String code,
    @Default(0) int id,
    @Default('') String name,
  }) = _TicketAvailableCurriculum;

  /// 从 JSON 创建 TicketAvailableCurriculum 实例
  factory TicketAvailableCurriculum.fromJson(Map<String, dynamic> json) => _$TicketAvailableCurriculumFromJson(json);
}

/// 票据时间范围
@freezed
class TicketTimeRange with _$TicketTimeRange {
  const factory TicketTimeRange({
    @Default('') String timeFrom,
    @Default('') String timeTo,
  }) = _TicketTimeRange;

  /// 从 JSON 创建 TicketTimeRange 实例
  factory TicketTimeRange.fromJson(Map<String, dynamic> json) => _$TicketTimeRangeFromJson(json);
}
