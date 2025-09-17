import 'package:flutter/material.dart';

import 'avatar_placeholder.dart';

/// 头像占位符演示页面
class AvatarPlaceholderDemo extends StatelessWidget {
  const AvatarPlaceholderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('头像占位符演示'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('教师头像占位符:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Row(
              children: [
                AvatarPlaceholder(size: 40),
                SizedBox(width: 16),
                AvatarPlaceholder(size: 50),
                SizedBox(width: 16),
                AvatarPlaceholder(size: 60),
              ],
            ),
            const SizedBox(height: 32),

            const Text('圆形头像占位符:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Row(
              children: [
                CircleAvatarPlaceholder(size: 40),
                SizedBox(width: 16),
                CircleAvatarPlaceholder(size: 50),
                SizedBox(width: 16),
                CircleAvatarPlaceholder(size: 60),
              ],
            ),
            const SizedBox(height: 32),

            const Text('工厂方法创建:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                AvatarPlaceholderFactory.teacher(size: 50),
                AvatarPlaceholderFactory.circleTeacher(size: 50),
                AvatarPlaceholderFactory.student(size: 50),
                AvatarPlaceholderFactory.generic(size: 50, icon: Icons.admin_panel_settings),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
