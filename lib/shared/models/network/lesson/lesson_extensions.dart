import 'lesson.dart';

/// Lesson类的扩展方法
extension LessonX on Lesson {
  /// 检查是否可以预览
  bool canPreviewLesson() {
    if (!isTimeBefore15Min()) return false;
    return canPreview;
  }

  /// 检查课程详情界面是否可以预览（保留到课程开始前4分钟）
  bool canPreviewLessonDetail() {
    if (showTimeBefor4Mins().isNotEmpty) return false;
    return canPreview;
  }

  /// 检查是否在开始前15分钟内
  bool isTimeBefore15Min() {
    // 这里需要实现时间比较逻辑
    // 临时返回true
    return true;
  }

  /// 显示开始前4分钟的时间
  String showTimeBefor4Mins() {
    // 这里需要实现时间计算逻辑
    // 临时返回空字符串
    return '';
  }

  /// 检查学生是否可以离开
  bool canStudentLeave() {
    if (statusId == 4) return false; // 已完成
    if (statusId == 5) return false; // 未完成
    if (statusId == 9) return false; // 已取消
    if (statusId == 3) return false; // 无评估

    try {
      // 这里需要实现具体的时间计算逻辑
      // 临时返回false
      return false;
    } catch (e) {
      return false;
    }
  }

  /// 检查是否已取消
  bool isCancel() => statusId == 9;

  /// 检查是否未取消
  bool isNotCancel() => !isCancel();

  /// 检查是否为学生取消
  bool isStudentCancel() {
    if (!isCancel()) return false;
    // 这里需要从Master数据中获取取消原因信息
    // 临时返回false
    return false;
  }

  /// 检查是否无评估
  bool isNoAssessment() => statusId == 3;

  /// 检查是否已完成
  bool isCompleted() => statusId == 4;

  /// 检查是否未完成
  bool isIncomplete() => incompleteReasonId != 0;

  /// 检查是否学生缺席
  bool isStudentAbsent() => incompleteReasonId == 3;

  /// 获取取消或未完成的状态字符串
  String statusStringForCancelOrIncomplete() {
    if (!isIncompleteOrCancel()) return '';
    if (isCancel()) return '取消'; // 可以从国际化配置中获取
    if (isStudentAbsent()) return '缺席'; // 可以从国际化配置中获取
    return '其他'; // 可以从国际化配置中获取
  }

  /// 检查是否为未完成或取消状态
  bool isIncompleteOrCancel() => isIncomplete() || isCancel();

  /// 检查是否有教师评价
  bool hasTeacherReview() => teacherReview?.id != 0;

  /// 检查是否可以进行评价
  bool canGoReview() {
    // 最后一个条件是SCHOOL站点隐藏评论
    return noTeacherReview() &&
           canPostReview &&
           isNotCancel();
           // && !AppConfig.isSCHOOLSite(); // 需要从配置中获取
  }

  /// 检查是否没有教师评价
  bool noTeacherReview() => !hasTeacherReview();

  /// 获取结束时间
  String? getEndTime() {
    if (endTime != null) return endTime;
    
    // 如果没有结束时间，根据开始时间和课程时长计算
    if (startTime != null && timeId > 0) {
      // 这里需要实现时间计算逻辑
      // 临时返回开始时间
      return startTime;
    }
    
    return null;
  }

  /// 检查是否可以回放
  bool get canPlaybackLesson => canPlayback == '1';

  /// 检查是否有练习数据
  bool get hasExerciseData => exerciseData != null;

  /// 检查是否完成了所有练习
  bool get isDoneAllExercise => exerciseData?.doneAllExercise ?? false;

  /// 检查是否有XDY播放路径
  bool get hasXdyPlaypath => xdyPlaypath.isNotEmpty;

  /// 检查是否有Talk播放路径
  bool get hasTalkPlaypath => talkPlaypath.isNotEmpty;

  /// 检查是否有课程时刻
  bool get hasMoments => moments.isNotEmpty;

  /// 检查是否有FTL报告
  bool get hasFtlReportUrl => ftlReportUrl.isNotEmpty;

  /// 获取课程状态描述
  String get statusDescription {
    switch (statusId) {
      case 0:
        return '无状态';
      case 1:
        return '已预约';
      case 2:
        return '课程开始';
      case 3:
        return '无评估';
      case 4:
        return '已完成';
      case 5:
        return '未完成';
      case 8:
        return '15分钟';
      case 9:
        return '已取消';
      default:
        return '未知状态';
    }
  }

  /// 获取课程时间范围
  String get timeRange => '$timeFrom-$timeTo';

  /// 检查是否为一对一课程
  bool get isOneToOne => oneToOneOrGroup == 'one_to_one';

  /// 检查是否为小组课程
  bool get isGroup => oneToOneOrGroup == 'group';

  /// 检查是否有教师信息
  bool get hasTeacher => teacher != null;

  /// 检查是否有请求类别
  bool get hasRequestCategories => requestCategoryIds.isNotEmpty;

  /// 检查是否有可用课程
  bool get hasAvailableCuriculums => teacherAvailableCuriculums.isNotEmpty;

  /// 获取课程时长（分钟）
  int get lessonDurationMinutes {
    // 根据timeId计算课程时长
    // 这里需要从Master数据中获取具体时长
    return timeId; // 临时实现
  }

  /// 检查是否为复习课程
  bool get isReviewLesson => isReview;

  /// 检查是否有代课教师
  bool get hasSubstitute => substituted != null;

  /// 检查是否可以取消
  bool get canCancelLesson => canCancel;
}
