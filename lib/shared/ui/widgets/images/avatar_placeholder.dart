import 'package:flutter/material.dart';

/// 头像占位符组件
class AvatarPlaceholder extends StatelessWidget {
  /// 头像大小
  final double size;
  
  /// 图标大小（默认为头像大小的0.6倍）
  final double? iconSize;
  
  /// 背景颜色
  final Color? backgroundColor;
  
  /// 图标颜色
  final Color? iconColor;
  
  /// 图标
  final IconData icon;

  const AvatarPlaceholder({
    super.key,
    required this.size,
    this.iconSize,
    this.backgroundColor,
    this.iconColor,
    this.icon = Icons.person,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: backgroundColor ?? Colors.grey[200],
      child: Icon(
        icon,
        color: iconColor ?? Colors.grey[400],
        size: iconSize ?? size * 0.6,
      ),
    );
  }
}

/// 圆形头像占位符组件
class CircleAvatarPlaceholder extends StatelessWidget {
  /// 头像大小
  final double size;
  
  /// 图标大小（默认为头像大小的0.6倍）
  final double? iconSize;
  
  /// 背景颜色
  final Color? backgroundColor;
  
  /// 图标颜色
  final Color? iconColor;
  
  /// 图标
  final IconData icon;

  const CircleAvatarPlaceholder({
    super.key,
    required this.size,
    this.iconSize,
    this.backgroundColor,
    this.iconColor,
    this.icon = Icons.person,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? Colors.grey[200],
      ),
      child: Icon(
        icon,
        color: iconColor ?? Colors.grey[400],
        size: iconSize ?? size * 0.6,
      ),
    );
  }
}

/// 头像占位符工厂类
class AvatarPlaceholderFactory {
  /// 创建教师头像占位符
  static Widget teacher({
    double size = 50,
    double? iconSize,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return AvatarPlaceholder(
      size: size,
      iconSize: iconSize ?? size * 0.6,
      backgroundColor: backgroundColor ?? Colors.grey[200],
      iconColor: iconColor ?? Colors.grey[400],
      icon: Icons.person,
    );
  }

  /// 创建圆形教师头像占位符
  static Widget circleTeacher({
    double size = 50,
    double? iconSize,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return CircleAvatarPlaceholder(
      size: size,
      iconSize: iconSize ?? size * 0.6,
      backgroundColor: backgroundColor ?? Colors.grey[200],
      iconColor: iconColor ?? Colors.grey[400],
      icon: Icons.person,
    );
  }

  /// 创建学生头像占位符
  static Widget student({
    double size = 50,
    double? iconSize,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return CircleAvatarPlaceholder(
      size: size,
      iconSize: iconSize ?? size * 0.6,
      backgroundColor: backgroundColor ?? Colors.blue[100],
      iconColor: iconColor ?? Colors.blue[400],
      icon: Icons.school,
    );
  }

  /// 创建通用头像占位符
  static Widget generic({
    double size = 50,
    double? iconSize,
    Color? backgroundColor,
    Color? iconColor,
    IconData icon = Icons.person,
    bool isCircle = true,
  }) {
    if (isCircle) {
      return CircleAvatarPlaceholder(
        size: size,
        iconSize: iconSize,
        backgroundColor: backgroundColor,
        iconColor: iconColor,
        icon: icon,
      );
    } else {
      return AvatarPlaceholder(
        size: size,
        iconSize: iconSize,
        backgroundColor: backgroundColor,
        iconColor: iconColor,
        icon: icon,
      );
    }
  }
}
