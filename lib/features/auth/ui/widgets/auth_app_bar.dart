import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? titleStyle;
  final bool showBack;
  final String? backTo; // 跳转页面路由名
  final List<Widget>? actions;
  final Widget? customLeading;
  final double height;
  final Color? backgroundColor;
  final double? elevation;

  const AuthAppBar({
    super.key,
    required this.title,
    this.titleStyle,
    this.showBack = true,
    this.backTo,
    this.actions,
    this.customLeading,
    this.height = kToolbarHeight,
    this.backgroundColor,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation ?? 0,
      centerTitle: true,
      leading: showBack
          ? (customLeading ??
              IconButton(
                icon: Image.asset(
                  'assets/images/arrow_back.png',
                  width: 31,
                  height: 20,
                  color: const Color(0xFF101214),
                ),
                onPressed: () {
                  if (backTo != null) {
                    context.go(backTo!);
                  } else {
                    Navigator.of(context).maybePop();
                  }
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(
                  minWidth: 31,
                  minHeight: 20,
                  maxWidth: 31,
                  maxHeight: 20,
                ),
              ))
          : null,
      title: Text(
        title,
        style: titleStyle ??
            const TextStyle(
              color: Color(0xFF222222),
              fontSize: 16,
              height: 23 / 16,
              fontWeight: FontWeight.bold,
            ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
