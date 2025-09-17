/// Master配置翻译工具类
///
/// 提供Master配置相关的多语言支持
///
/// 注意：此类目前使用回退文本，等ARB文件重新生成后将启用完整的翻译功能
class MasterTranslations {
  // ========== 性别翻译 ==========

  /// 获取性别的本地化名称
  static String getGenderName(String? genderLabel) {
    // TODO: 等ARB文件重新生成后启用翻译功能
    // 目前使用回退文本
    return _getGenderFallback(genderLabel);
  }

  /// 获取性别的回退文本
  static String _getGenderFallback(String? genderLabel) {
    switch (genderLabel) {
      case 'male':
        return 'Male';
      case 'female':
        return 'Female';
      case 'default':
      default:
        return 'Unspecified';
    }
  }

  // ========== 评分翻译 ==========

  /// 获取评分等级的本地化文本
  static String getRatingLevelText(int? ratingValue) {
    // TODO: 等ARB文件重新生成后启用翻译功能
    return _getRatingFallback(ratingValue);
  }

  /// 获取评分的回退文本
  static String _getRatingFallback(int? ratingValue) {
    switch (ratingValue) {
      case 5:
        return 'Excellent';
      case 4:
        return 'Good';
      case 3:
        return 'Average';
      case 2:
        return 'Poor';
      case 1:
        return 'Very Poor';
      default:
        return 'No Rating';
    }
  }

  // ========== 请求类别翻译 ==========

  /// 获取请求类型的本地化文本
  static String getRequestTypeText(int? mappingIndex) {
    // TODO: 等ARB文件重新生成后启用翻译功能
    return _getRequestTypeFallback(mappingIndex);
  }

  /// 获取请求类型的回退文本
  static String _getRequestTypeFallback(int? mappingIndex) {
    switch (mappingIndex) {
      case 0:
        return 'Slow & Clear';
      case 1:
        return 'Natural Speed';
      case 2:
        return 'Strict Teaching';
      case 3:
        return 'Free Conversation';
      case 4:
        return 'Strict Curriculum';
      default:
        return 'Unknown';
    }
  }

  // ========== 取消原因翻译 ==========

  /// 获取取消类型的本地化描述
  static String getCancelTypeDescription(String? cancelBy) {
    // TODO: 等ARB文件重新生成后启用翻译功能
    return _getCancelTypeFallback(cancelBy);
  }

  /// 获取取消类型的回退文本
  static String _getCancelTypeFallback(String? cancelBy) {
    switch (cancelBy) {
      case 'student':
        return 'Student Cancellation';
      case 'teacher':
        return 'Teacher Cancellation';
      case 'system':
        return 'System Cancellation';
      default:
        return 'Unknown';
    }
  }

  /// 获取退款描述的本地化文本
  static String getRefundDisplayText(int percentage) {
    // TODO: 等ARB文件重新生成后启用翻译功能
    return _getRefundFallback(percentage);
  }

  /// 获取退款描述的回退文本
  static String _getRefundFallback(int percentage) {
    if (percentage == 100) {
      return 'Full Refund';
    } else if (percentage > 0) {
      return '$percentage% Refund';
    } else {
      return 'No Refund';
    }
  }

  // ========== 积分翻译 ==========

  /// 获取积分描述的本地化文本
  static String getPointsDescription(
      bool isFree, bool isLowPoints, bool isMediumPoints, bool isHighPoints) {
    // TODO: 等ARB文件重新生成后启用翻译功能
    return _getPointsFallback(
        isFree, isLowPoints, isMediumPoints, isHighPoints);
  }

  /// 获取积分描述的回退文本
  static String _getPointsFallback(
      bool isFree, bool isLowPoints, bool isMediumPoints, bool isHighPoints) {
    if (isFree) return 'Free Course';
    if (isLowPoints) return 'Economical';
    if (isMediumPoints) return 'Standard Price';
    if (isHighPoints) return 'Premium Course';
    return 'Unknown';
  }

  // ========== 课程时长翻译 ==========

  /// 获取课程类型的本地化文本
  static String getLessonTypeText(bool isShortLesson, bool isStandardLesson,
      bool isLongLesson, bool isExtraLongLesson) {
    // TODO: 等ARB文件重新生成后启用翻译功能
    return _getLessonTypeFallback(
        isShortLesson, isStandardLesson, isLongLesson, isExtraLongLesson);
  }

  /// 获取课程类型的回退文本
  static String _getLessonTypeFallback(bool isShortLesson,
      bool isStandardLesson, bool isLongLesson, bool isExtraLongLesson) {
    if (isShortLesson) return 'Short Lesson';
    if (isStandardLesson) return 'Standard Lesson';
    if (isLongLesson) return 'Long Lesson';
    if (isExtraLongLesson) return 'Extra Long Lesson';
    return 'Custom';
  }

  /// 获取建议课程类型的本地化文本
  static String getSuggestedCourseTypeText(int minutes) {
    // TODO: 等ARB文件重新生成后启用翻译功能
    return _getSuggestedCourseTypeFallback(minutes);
  }

  /// 获取建议课程类型的回退文本
  static String _getSuggestedCourseTypeFallback(int minutes) {
    if (minutes <= 20) return 'Quick Review';
    if (minutes == 25) return 'Standard Lesson';
    if (minutes == 50) return 'Intensive Lesson';
    if (minutes >= 75) return 'Extended Session';
    return 'Custom Session';
  }

  // ========== 通用工具方法 ==========

  /// 检查翻译系统是否已初始化
  ///
  /// 注意：目前暂时返回false，等ARB文件重新生成后启用
  static bool get isTranslationAvailable {
    // TODO: 等ARB文件重新生成后启用翻译检查
    return false;
  }
}
