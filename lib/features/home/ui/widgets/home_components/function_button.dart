import 'package:flutter/material.dart';

/// 功能按钮组件
/// 
/// 用于展示单个功能按钮，包含图标和标题
class FunctionButton extends StatelessWidget {
  /// 按钮图标
  final IconData icon;
  
  /// 按钮标题
  final String title;
  
  /// 点击回调
  final VoidCallback onTap;
  
  /// 按钮大小
  final double size;
  
  /// 图标大小
  final double iconSize;
  
  /// 标题字体大小
  final double titleFontSize;
  
  /// 背景颜色
  final Color? backgroundColor;
  
  /// 图标颜色
  final Color? iconColor;
  
  /// 标题颜色
  final Color? titleColor;

  const FunctionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.size = 60,
    this.iconSize = 30,
    this.titleFontSize = 12,
    this.backgroundColor,
    this.iconColor,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor ?? Colors.blue[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.w500,
              color: titleColor,
            ),
          ),
        ],
      ),
    );
  }
}
