import 'rating.dart';
import '../utils/master_translations.dart';

/// 评分扩展方法
extension RatingBeanExtensions on RatingBean {
  /// 获取评分值
  int getRatingValue() {
    return value ?? 0;
  }

  /// 检查是否为最高评分
  bool get isHighestRating {
    return getRatingValue() == 5;
  }

  /// 检查是否为最低评分
  bool get isLowestRating {
    return getRatingValue() == 1;
  }

  /// 检查是否为正面评分（4-5星）
  bool get isPositiveRating {
    final rating = getRatingValue();
    return rating >= 4;
  }

  /// 检查是否为负面评分（1-2星）
  bool get isNegativeRating {
    final rating = getRatingValue();
    return rating <= 2;
  }

  /// 检查是否为中性评分（3星）
  bool get isNeutralRating {
    return getRatingValue() == 3;
  }

  /// 获取星级显示
  String get starDisplay {
    final rating = getRatingValue();
    return '★' * rating + '☆' * (5 - rating);
  }

  /// 获取评分颜色
  String get ratingColor {
    final rating = getRatingValue();
    switch (rating) {
      case 5: return '#28a745'; // 绿色
      case 4: return '#17a2b8'; // 蓝色
      case 3: return '#ffc107'; // 黄色
      case 2: return '#fd7e14'; // 橙色
      case 1: return '#dc3545'; // 红色
      default: return '#6c757d'; // 灰色
    }
  }

  /// 获取评分等级文本
  String get ratingLevelText {
    return MasterTranslations.getRatingLevelText(getRatingValue());
  }

  /// 获取本地化评分文本（兼容旧版本）
  @Deprecated('Use ratingLevelText instead')
  String getLocalizedRatingText(String locale) {
    return ratingLevelText;
  }

  /// 获取评分百分比
  double get ratingPercentage {
    return (getRatingValue() / 5.0) * 100;
  }

  /// 获取评分权重
  double get ratingWeight {
    final rating = getRatingValue();
    switch (rating) {
      case 5: return 1.0;
      case 4: return 0.8;
      case 3: return 0.6;
      case 2: return 0.4;
      case 1: return 0.2;
      default: return 0.0;
    }
  }

  /// 检查是否为满意评分（3星及以上）
  bool get isSatisfactory {
    return getRatingValue() >= 3;
  }

  /// 获取评分图标
  String get ratingIcon {
    final rating = getRatingValue();
    switch (rating) {
      case 5: return '😊';
      case 4: return '🙂';
      case 3: return '😐';
      case 2: return '🙁';
      case 1: return '😞';
      default: return '❓';
    }
  }

  /// 获取评分优先级（用于排序）
  int get ratingPriority {
    return getRatingValue();
  }
}
