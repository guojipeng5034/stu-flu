import 'package:flutter/material.dart';

import '../../../../../shared/ui/widgets/cards/cards.dart';
import 'section_header.dart';

/// 推荐老师模块组件
/// 
/// 展示推荐的老师列表，包含标题和老师卡片
class RecommendedTeachers extends StatelessWidget {
  const RecommendedTeachers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 标题行
        SectionHeader(
          title: '推荐老师',
          actionText: '查看全部 >',
          onActionTap: () {
            // 处理查看全部点击
          },
        ),
        const SizedBox(height: 12),
        // 老师列表
        Column(
          children: [
            TeacherCard(
              name: 'Senegal',
              points: '50pts',
              rating: 5.0,
              tags: ['耐心鼓励', '善于引导', '生动有趣'],
              favoriteCount: 100,
              avatarUrl:
                  'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
              onTap: () {
                // 处理老师点击
              },
              onFavorite: () {
                // 处理收藏点击
              },
            ),
            const SizedBox(height: 12),
            TeacherCard(
              name: 'Senegal',
              points: '50pts',
              rating: 5.0,
              tags: ['耐心鼓励', '善于引导', '生动有趣'],
              favoriteCount: 100,
              avatarUrl:
                  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
              onTap: () {
                // 处理老师点击
              },
              onFavorite: () {
                // 处理收藏点击
              },
            ),
            const SizedBox(height: 12),
            TeacherCard(
              name: 'Senegal',
              points: '50pts',
              rating: 5.0,
              tags: ['耐心鼓励', '善于引导', '生动有趣'],
              favoriteCount: 100,
              avatarUrl:
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
              onTap: () {
                // 处理老师点击
              },
              onFavorite: () {
                // 处理收藏点击
              },
            ),
          ],
        ),
      ],
    );
  }
}
