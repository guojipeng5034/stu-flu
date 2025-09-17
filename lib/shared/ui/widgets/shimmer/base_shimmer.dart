import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// 基础Shimmer组件
class BaseShimmer extends StatelessWidget {
  /// 子组件
  final Widget child;
  
  /// 基础颜色
  final Color? baseColor;
  
  /// 高亮颜色
  final Color? highlightColor;
  
  /// 动画周期
  final Duration? period;
  
  /// 是否启用
  final bool enabled;

  const BaseShimmer({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
    this.period,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!enabled) {
      return child;
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Shimmer.fromColors(
      baseColor: baseColor ?? (isDark ? Colors.grey[700]! : Colors.grey[300]!),
      highlightColor: highlightColor ?? (isDark ? Colors.grey[600]! : Colors.grey[100]!),
      period: period ?? const Duration(milliseconds: 1500),
      child: child,
    );
  }
}

/// Shimmer占位框
class ShimmerBox extends StatelessWidget {
  /// 宽度
  final double width;
  
  /// 高度
  final double height;
  
  /// 圆角半径
  final double borderRadius;
  
  /// 背景颜色
  final Color? color;
  
  /// 外边距
  final EdgeInsetsGeometry? margin;

  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 4,
    this.color,
    this.margin,
  });

  /// 创建圆形占位框
  const ShimmerBox.circle({
    super.key,
    required double size,
    this.color,
    this.margin,
  }) : width = size,
       height = size,
       borderRadius = size / 2;

  /// 创建文本占位框
  const ShimmerBox.text({
    super.key,
    required this.width,
    this.height = 16,
    this.borderRadius = 8,
    this.color,
    this.margin,
  });

  /// 创建按钮占位框
  const ShimmerBox.button({
    super.key,
    this.width = 80,
    this.height = 32,
    this.borderRadius = 16,
    this.color,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    Widget box = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? (isDark ? Colors.grey[800] : Colors.white),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

    if (margin != null) {
      box = Padding(
        padding: margin!,
        child: box,
      );
    }

    return box;
  }
}

/// Shimmer卡片容器
class ShimmerCard extends StatelessWidget {
  /// 子组件
  final Widget child;
  
  /// 外边距
  final EdgeInsetsGeometry? margin;
  
  /// 内边距
  final EdgeInsetsGeometry? padding;
  
  /// 圆角半径
  final double borderRadius;
  
  /// 是否显示阴影
  final bool showShadow;

  const ShimmerCard({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.borderRadius = 12,
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: showShadow ? [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ] : null,
      ),
      child: child,
    );
  }
}
