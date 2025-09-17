import 'package:flutter/material.dart';

/// 通用的模块标题行组件
/// 
/// 用于展示模块标题和右侧操作按钮，支持自定义样式和点击事件
class SectionHeader extends StatelessWidget {
  /// 主标题文本
  final String title;
  
  /// 右侧操作文本（可选）
  final String? actionText;
  
  /// 右侧操作点击回调（可选）
  final VoidCallback? onActionTap;
  
  /// 主标题样式（可选）
  final TextStyle? titleStyle;
  
  /// 操作文本样式（可选）
  final TextStyle? actionStyle;
  
  /// 水平内边距
  final EdgeInsets padding;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.onActionTap,
    this.titleStyle,
    this.actionStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: titleStyle ?? const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (actionText != null)
            GestureDetector(
              onTap: onActionTap,
              child: Text(
                actionText!,
                style: actionStyle ?? TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
