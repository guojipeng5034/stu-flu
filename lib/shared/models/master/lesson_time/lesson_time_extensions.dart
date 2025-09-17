import 'lesson_time.dart';
import '../utils/master_translations.dart';

/// 课程时长扩展方法
extension LessonTimeBeanExtensions on LessonTimeBean {
  /// 获取课程时长（分钟）
  int getMinutes() {
    return int.tryParse(mins ?? '0') ?? 0;
  }

  /// 获取缩写时长
  int getAbbreviatedMinutes() {
    return int.tryParse(abbr ?? '0') ?? 0;
  }

  /// 检查是否有开放限制
  bool get hasOpenRestriction {
    return openRestriction == 1;
  }

  /// 检查是否为标准课程时长（25分钟）
  bool get isStandardLesson {
    return getMinutes() == 25;
  }

  /// 检查是否为长课程（50分钟）
  bool get isLongLesson {
    return getMinutes() == 50;
  }

  /// 检查是否为超长课程（75分钟）
  bool get isExtraLongLesson {
    return getMinutes() == 75;
  }

  /// 检查是否为短课程（15-20分钟）
  bool get isShortLesson {
    final minutes = getMinutes();
    return minutes >= 15 && minutes <= 20;
  }

  /// 获取显示文本
  String get displayText {
    return name ?? '${getMinutes()}分钟';
  }

  /// 检查指定开始时间是否可用
  bool isStartTimeAvailable(int startTime) {
    return !(unavailableLessonStart?.contains(startTime) ?? false);
  }

  /// 获取不可用的开始时间列表
  List<int> getUnavailableStartTimes() {
    return unavailableLessonStart ?? [];
  }

  /// 获取课程时长类型
  String get lessonType {
    return MasterTranslations.getLessonTypeText(isShortLesson, isStandardLesson, isLongLesson, isExtraLongLesson);
  }

  /// 获取课程时长等级
  int get durationLevel {
    final minutes = getMinutes();
    if (minutes <= 20) return 1;
    if (minutes <= 30) return 2;
    if (minutes <= 60) return 3;
    if (minutes <= 90) return 4;
    return 5;
  }

  /// 检查是否为热门时长
  bool get isPopularDuration {
    final popularDurations = [25, 50];
    return popularDurations.contains(getMinutes());
  }

  /// 获取建议的课程类型
  String get suggestedCourseType {
    return MasterTranslations.getSuggestedCourseTypeText(getMinutes());
  }

  /// 计算课程费用倍数（基于25分钟标准）
  double get costMultiplier {
    final standardMinutes = 25;
    return getMinutes() / standardMinutes;
  }
}
