import 'package:flutter/material.dart';

import '../../../../../shared/ui/widgets/cards/cards.dart';
import 'section_header.dart';

/// 特色课模块组件
/// 
/// 展示特色课程网格，包含标题和课程卡片
class SpecialCurriculums extends StatelessWidget {
  const SpecialCurriculums({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 标题行
        SectionHeader(
          title: '特色课',
          actionText: '学习资源 >',
          onActionTap: () {
            // 处理学习资源点击
          },
        ),
        const SizedBox(height: 12),
        // 特色课网格
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.85,
          children: [
            SpecialCurriculumCard(
              title: '中国传统文化之旅中国传统文化之旅',
              lessons: '共6节',
              isFree: true,
              color: Colors.blue[300]!,
              onTap: () {
                // 处理特色课点击
              },
            ),
            SpecialCurriculumCard(
              title: '十万个为什么',
              lessons: '共6节',
              isFree: true,
              color: Colors.green[300]!,
              onTap: () {
                // 处理特色课点击
              },
            ),
            SpecialCurriculumCard(
              title: '用英文玩游戏',
              lessons: '共6节',
              isFree: true,
              color: Colors.orange[300]!,
              onTap: () {
                // 处理特色课点击
              },
            ),
            SpecialCurriculumCard(
              title: '英文学思维',
              lessons: '共6节',
              isFree: true,
              color: Colors.purple[300]!,
              onTap: () {
                // 处理特色课点击
              },
            ),
          ],
        ),
      ],
    );
  }
}
