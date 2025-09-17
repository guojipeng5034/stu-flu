import 'package:flutter/material.dart';

/// 登录/认证相关页面通用背景图
class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        'assets/images/login_bg.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
