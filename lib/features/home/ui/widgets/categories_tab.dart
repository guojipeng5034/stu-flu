import 'package:flutter/material.dart';

/// 分类Tab组件
class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('分类'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category, size: 64),
            SizedBox(height: 16),
            Text('分类页面', style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text('这里将显示各种分类内容'),
          ],
        ),
      ),
    );
  }
}
