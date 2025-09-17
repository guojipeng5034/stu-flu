import 'curriculum.dart';

/// Curriculum类的扩展方法
extension CurriculumX on Curriculum {
  /// 检查是否为小组课程
  bool get isGroup {
    return groupFlag ?? false;
  }

  /// 检查是否为一对一课程
  bool get isOneToOne {
    return oneToOneFlag ?? false;
  }

  /// 获取课程进度百分比（仅适用于有学习进度的课程）
  double get progressPercentage {
    if (curriculumTotalPage == null || curriculumTotalPage == 0) return 0.0;
    final studyPage = curriculumStudyPage ?? 0;
    return (studyPage / curriculumTotalPage!) * 100;
  }

  /// 检查课程是否已完成（仅适用于有学习进度的课程）
  bool get isCompleted =>
      curriculumStudyPage != null &&
      curriculumTotalPage != null &&
      curriculumStudyPage! >= curriculumTotalPage!;
}
