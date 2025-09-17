import 'request_category.dart';
import '../utils/master_translations.dart';

/// 请求类别扩展方法
extension RequestCategoryBeanExtensions on RequestCategoryBean {
  /// 获取映射索引
  int getMappingIndex() {
    return mappingIndex ?? 0;
  }

  /// 检查是否为慢速清晰请求
  bool get isSlowAndClearRequest {
    return getMappingIndex() == 0;
  }

  /// 检查是否为自然语速请求
  bool get isNaturalSpeedRequest {
    return getMappingIndex() == 1;
  }

  /// 检查是否为严格教学请求
  bool get isStrictTeachingRequest {
    return getMappingIndex() == 2;
  }

  /// 检查是否为自由对话请求
  bool get isFreeConversationRequest {
    return getMappingIndex() == 3;
  }

  /// 检查是否为严格按课程请求
  bool get isStrictCurriculumRequest {
    return getMappingIndex() == 4;
  }

  /// 获取请求类型
  String get requestType {
    return MasterTranslations.getRequestTypeText(getMappingIndex());
  }

  /// 获取简短描述（兼容旧版本）
  @Deprecated('Use requestType instead')
  String get shortDescription {
    return requestType;
  }

  /// 获取本地化描述（兼容旧版本）
  @Deprecated('Use requestType instead')
  String getLocalizedDescription(String locale) {
    return requestType;
  }

  /// 获取请求优先级（数字越小优先级越高）
  int get priority {
    return getMappingIndex();
  }

  /// 获取请求图标
  String get requestIcon {
    switch (getMappingIndex()) {
      case 0: return '🐌'; // 慢速
      case 1: return '💬'; // 自然对话
      case 2: return '📚'; // 严格教学
      case 3: return '🗣️'; // 自由对话
      case 4: return '📖'; // 严格课程
      default: return '❓';
    }
  }

  /// 获取请求颜色
  String get requestColor {
    switch (getMappingIndex()) {
      case 0: return '#28a745'; // 绿色 - 慢速清晰
      case 1: return '#17a2b8'; // 蓝色 - 自然语速
      case 2: return '#dc3545'; // 红色 - 严格教学
      case 3: return '#ffc107'; // 黄色 - 自由对话
      case 4: return '#6f42c1'; // 紫色 - 严格课程
      default: return '#6c757d'; // 灰色
    }
  }

  /// 检查是否为语速相关请求
  bool get isSpeedRelated {
    return isSlowAndClearRequest || isNaturalSpeedRequest;
  }

  /// 检查是否为教学方式相关请求
  bool get isTeachingStyleRelated {
    return isStrictTeachingRequest || isFreeConversationRequest || isStrictCurriculumRequest;
  }

  /// 获取适合的学生类型
  String get suitableStudentType {
    switch (getMappingIndex()) {
      case 0: return 'Beginner';
      case 1: return 'Intermediate';
      case 2: return 'Serious Learner';
      case 3: return 'Conversational';
      case 4: return 'Structured Learner';
      default: return 'Any';
    }
  }

  /// 获取建议的课程类型
  String get suggestedCourseType {
    switch (getMappingIndex()) {
      case 0: return 'Basic Conversation';
      case 1: return 'Daily Conversation';
      case 2: return 'Grammar Focus';
      case 3: return 'Free Talk';
      case 4: return 'Textbook Lesson';
      default: return 'General';
    }
  }
}
