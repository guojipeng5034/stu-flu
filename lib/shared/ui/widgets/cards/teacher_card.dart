import 'package:flutter/material.dart';

/// 老师卡片组件
/// 
/// 通用的老师信息展示卡片，包含头像、积分、评分、标签和收藏功能
class TeacherCard extends StatelessWidget {
  /// 老师姓名
  final String name;
  
  /// 积分显示文本
  final String points;
  
  /// 评分（1-5星）
  final double rating;
  
  /// 标签列表
  final List<String> tags;
  
  /// 收藏数量
  final int favoriteCount;
  
  /// 头像URL
  final String avatarUrl;
  
  /// 点击回调
  final VoidCallback? onTap;
  
  /// 收藏按钮点击回调
  final VoidCallback? onFavorite;

  const TeacherCard({
    super.key,
    required this.name,
    required this.points,
    required this.rating,
    required this.tags,
    required this.favoriteCount,
    required this.avatarUrl,
    this.onTap,
    this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // 老师头像
            Stack(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                // 积分标签
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      points,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            // 老师信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 姓名
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // 星级评分
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        size: 18,
                        color: index < rating ? Colors.amber : Colors.grey[300],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // 标签
                  Wrap(
                    spacing: 8,
                    children: tags
                        .map((tag) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                tag,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            // 收藏按钮
            GestureDetector(
              onTap: onFavorite,
              child: Column(
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Colors.grey[400],
                    size: 24,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    favoriteCount.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
