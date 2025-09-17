import 'ticket.dart';

/// Ticket类的扩展方法
extension TicketX on Ticket {
  /// 获取课程时间ID的整数值
  int get lessonTimeIdInt => int.tryParse(lessonTimeId) ?? 0;

  /// 获取最大教师积分的整数值
  int get maxTeacherPointsInt => int.tryParse(maxTeacherPoints) ?? 0;

  /// 检查是否有可用课程
  bool get hasAvailableCurriculum => 
      availableCurriculum != null && availableCurriculum!.isNotEmpty;

  /// 检查是否有可用课程代码
  bool get hasAvailableCurriculumCodes => 
      availableCurriculumCodes != null && availableCurriculumCodes!.isNotEmpty;

  /// 检查是否有时间限制
  bool get hasTimeRestrictions => limitedTimeSpansJson.isNotEmpty;

  /// 获取状态描述
  String get statusDescription {
    switch (statusId) {
      case 1:
        return '有效';
      case 2:
        return '已使用';
      case 3:
        return '已过期';
      case 4:
        return '已取消';
      case 5:
        return '已激活';
      default:
        return '未知状态';
    }
  }
}

/// TicketTimeRange类的扩展方法
extension TicketTimeRangeX on TicketTimeRange {
  /// 获取时间范围描述
  String get timeRangeDescription => '$timeFrom-$timeTo';

  /// 检查是否为有效时间范围
  bool get isValidTimeRange => timeFrom.isNotEmpty && timeTo.isNotEmpty;
}
