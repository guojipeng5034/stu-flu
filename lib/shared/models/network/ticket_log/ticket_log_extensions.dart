import 'ticket_log.dart';

/// TicketLog类的扩展方法
extension TicketLogX on TicketLog {
  /// 获取可用课程数量
  String getAvailableNum() {
    final lessonSize = ticket?.lessonSize ?? 0;
    final available = lessonSize - usedTotal;
    return available.toString();
  }

  /// 获取可用课程数量的整数值
  int get availableNumInt {
    final lessonSize = ticket?.lessonSize ?? 0;
    return lessonSize - usedTotal;
  }

  /// 获取支持的课程名称列表
  String getSupportCurriculumName() {
    final list = ticket?.availableCurriculum;
    if (list == null || list.isEmpty) {
      return '无限制'; // 可以从国际化配置中获取
    }
    final nameList = list.map((e) => e.name).toList();
    return nameList.join('、');
  }

  /// 获取积分限制字符串
  String getPointLimitString() {
    final points = ticket?.maxTeacherPoints;
    if (points == null || points == '0') {
      return '无限制'; // 可以从国际化配置中获取
    }
    return '${points}pts';
  }

  /// 获取时间段限制字符串
  String getTimeSpanLimitString() {
    final timeSpans = ticket?.limitedTimeSpansJson;
    if (timeSpans == null || timeSpans.isEmpty) {
      return '无限制'; // 可以从国际化配置中获取
    }
    final nameList = timeSpans.map((e) => '${e.timeFrom}-${e.timeTo}').toList();
    return nameList.join('、');
  }

  /// 获取时间限制字符串
  String getTimeLimitString() {
    final id = int.tryParse(ticket?.lessonTimeId ?? '0') ?? 0;
    if (id == 0) {
      return '无限制'; // 可以从国际化配置中获取
    }
    // 这里需要从Master数据中获取时间名称
    return '$id分钟'; // 临时实现
  }

  /// 获取限制课程字符串
  String getLimitLessonString() {
    return '限制课程：${getSupportCurriculumName()}';
  }

  /// 获取限制时间字符串
  String getLimitTimeString() {
    return '限制时间：${getTimeLimitString()}';
  }

  /// 获取限制积分字符串
  String getLimitPointString() {
    return '限制积分：${getPointLimitString()}';
  }

  /// 获取限制时间段字符串
  String getLimitTimeSpanString() {
    return '限制时间段：${getTimeSpanLimitString()}';
  }

  /// 获取处理后的可预约截止时间
  String get processedCanReserveToTime {
    final time = canReserveToTime;
    if (time == null || time.length < 3) {
      return '';
    }
    return time.substring(0, time.length - 3);
  }

  /// 检查是否有票据信息
  bool get hasTicket => ticket != null;

  /// 检查是否还有可用课程
  bool get hasAvailableLessons => availableNumInt > 0;
}
