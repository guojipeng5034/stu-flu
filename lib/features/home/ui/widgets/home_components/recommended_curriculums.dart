import 'package:flutter/material.dart';

import '../../../../../shared/ui/widgets/cards/cards.dart';
import 'section_header.dart';

/// 推荐课程模块组件
/// 
/// 展示推荐的课程列表，包含标题和课程卡片
class RecommendedCurriculums extends StatelessWidget {
  const RecommendedCurriculums({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 标题行
        SectionHeader(
          title: '推荐课程',
          actionText: '查看全部 >',
          onActionTap: () {
            // 处理查看全部点击
          },
        ),
        const SizedBox(height: 12),
        // 课程列表
        CurriculumCard(
          title: 'Basic English 2',
          level: 'Level 2',
          skill: '听力',
          duration: '25mins',
          progress: '已上课 0/80 节',
          color: Colors.purple,
          isInProgress: true,
          onTap: () {
            // 处理课程点击
          },
        ),
        const SizedBox(height: 12),
        CurriculumCard(
          title: 'Basic English 3',
          level: 'Level 3',
          skill: '口语',
          duration: '25mins',
          progress: '共 80 节',
          color: Colors.green,
          isInProgress: false,
          onTap: () {
            // 处理课程点击
          },
        ),
      ],
    );
  }
}
