import 'package:flutter/material.dart';
import 'function_button.dart';

/// 功能按钮网格组件
/// 
/// 展示一行功能按钮，用于首页的快捷功能入口
class FunctionGrid extends StatelessWidget {
  const FunctionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FunctionButton(
            icon: Icons.people,
            title: '认识我们',
            onTap: () {
              // 处理认识我们点击
            },
          ),
          FunctionButton(
            icon: Icons.book,
            title: '课程介绍',
            onTap: () {
              // 处理课程介绍点击
            },
          ),
          FunctionButton(
            icon: Icons.quiz,
            title: '定级测试',
            onTap: () {
              // 处理定级测试点击
            },
          ),
          FunctionButton(
            icon: Icons.text_fields,
            title: '标题文字',
            onTap: () {
              // 处理标题文字点击
            },
          ),
        ],
      ),
    );
  }
}
