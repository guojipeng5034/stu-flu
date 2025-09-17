import 'lesson_order.dart';

/// LessonOrder类的扩展方法
extension LessonOrderX on LessonOrder {
  /// 获取课程积分的整数值
  int getCurriculumPoints() {
    if (curriculumPoints == null || curriculumPoints!.isEmpty) {
      return 0;
    }
    return int.tryParse(curriculumPoints!) ?? 0;
  }

  /// 获取处理后的预约开始时间
  String getReservationStartTime() {
    if (reservationStartTime == null || reservationStartTime!.length < 19) {
      return '';
    }
    return reservationStartTime!.substring(0, 19);
  }

  /// 获取课程订单总积分描述
  String get lessonOrderPoints {
    final curriculumPts = getCurriculumPoints();
    final teacherPts = teacher?.points ?? 0;
    final totalPoints = curriculumPts + extraPoints + teacherPts;
    return '每节消费 ${totalPoints}pts'; // 可以从国际化配置中获取
  }

  /// 获取课程开始时间描述
  String get lessonStartTime {
    final weekStr = getWeekStr(dayOfWeek);
    return '$weekStr $timeFrom-$timeTo';
  }

  /// 根据星期数获取星期字符串
  String getWeekStr(int dayOfWeek) {
    switch (dayOfWeek) {
      case 1:
        return '周一';
      case 2:
        return '周二';
      case 3:
        return '周三';
      case 4:
        return '周四';
      case 5:
        return '周五';
      case 6:
        return '周六';
      case 7:
        return '周日';
      default:
        return '未知';
    }
  }

  /// 检查是否允许代课
  bool get allowsSubstitute => allowSubstituteFlag;

  /// 检查是否已删除
  bool get isDeleted => deletedFlag;

  /// 检查是否已停止
  bool get isStopped => stoppedFlag;

  /// 检查是否有教师信息
  bool get hasTeacher => teacher != null;

  /// 检查是否有额外积分
  bool get hasExtraPoints => extraPoints > 0;

  /// 检查是否有停止课程信息
  bool get hasStopLessons => lessonsForOrderStop.isNotEmpty;

  /// 获取总积分
  int get totalPoints {
    final curriculumPts = getCurriculumPoints();
    final teacherPts = teacher?.points ?? 0;
    return curriculumPts + extraPoints + teacherPts;
  }

  /// 获取时间范围描述
  String get timeRange => '$timeFrom-$timeTo';

  /// 检查是否为有效订单
  bool get isValidOrder => !isDeleted && !isStopped;
}
