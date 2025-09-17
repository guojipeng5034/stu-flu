import 'package:flutter/material.dart';

/// Shimmer主题配置
class ShimmerTheme {
  /// 基础颜色
  static Color get baseColor => Colors.grey[300]!;
  
  /// 高亮颜色
  static Color get highlightColor => Colors.grey[100]!;
  
  /// 暗色主题基础颜色
  static Color get darkBaseColor => Colors.grey[700]!;
  
  /// 暗色主题高亮颜色
  static Color get darkHighlightColor => Colors.grey[600]!;
  
  /// 默认动画周期
  static const Duration defaultPeriod = Duration(milliseconds: 1500);
  
  /// 快速动画周期
  static const Duration fastPeriod = Duration(milliseconds: 1000);
  
  /// 慢速动画周期
  static const Duration slowPeriod = Duration(milliseconds: 2000);
  
  /// 根据主题获取基础颜色
  static Color getBaseColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBaseColor
        : baseColor;
  }
  
  /// 根据主题获取高亮颜色
  static Color getHighlightColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkHighlightColor
        : highlightColor;
  }
  
  /// 卡片阴影颜色
  static Color getCardShadowColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.black.withValues(alpha: 0.3)
        : Colors.black.withValues(alpha: 0.05);
  }
  
  /// 卡片背景颜色
  static Color getCardBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[800]!
        : Colors.white;
  }
}

/// Shimmer配置枚举
enum ShimmerStyle {
  /// 默认样式
  normal,
  /// 紧凑样式
  compact,
  /// 详细样式
  detailed,
}

/// Shimmer动画速度
enum ShimmerSpeed {
  /// 慢速
  slow,
  /// 正常
  normal,
  /// 快速
  fast,
}

/// Shimmer配置扩展
extension ShimmerSpeedExtension on ShimmerSpeed {
  Duration get period {
    switch (this) {
      case ShimmerSpeed.slow:
        return ShimmerTheme.slowPeriod;
      case ShimmerSpeed.normal:
        return ShimmerTheme.defaultPeriod;
      case ShimmerSpeed.fast:
        return ShimmerTheme.fastPeriod;
    }
  }
}
