import 'package:flutter/material.dart';

/// 课程信息卡片组件
/// 
/// 通用的课程信息展示卡片，包含课程封面、标题、等级、技能、时长和进度信息
class CurriculumCard extends StatelessWidget {
  /// 课程标题
  final String title;
  
  /// 课程等级
  final String level;
  
  /// 技能类型
  final String skill;
  
  /// 课程时长
  final String duration;
  
  /// 进度信息
  final String progress;
  
  /// 主题颜色
  final Color color;
  
  /// 是否正在学习
  final bool isInProgress;
  
  /// 点击回调
  final VoidCallback? onTap;

  const CurriculumCard({
    super.key,
    required this.title,
    required this.level,
    required this.skill,
    required this.duration,
    required this.progress,
    required this.color,
    required this.isInProgress,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
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
            // 课程封面
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    color.withValues(alpha: 0.8),
                    color.withValues(alpha: 0.6),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // 背景文字
                  Center(
                    child: Text(
                      'Basic\nEnglish\n${title.contains('2') ? '2' : '3'}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // 状态标签
                  if (isInProgress)
                    Positioned(
                      top: 6,
                      left: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          '正在学',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  // 底部标签
                  Positioned(
                    bottom: 6,
                    left: 6,
                    right: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        isInProgress ? '主修' : '辅修',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // 课程信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildTag(level),
                      const SizedBox(width: 12),
                      _buildTag(skill),
                      const SizedBox(width: 12),
                      _buildTag(duration),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    progress,
                    style: TextStyle(
                      fontSize: 14,
                      color: isInProgress ? Colors.blue[600] : Colors.grey[600],
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

  /// 构建标签组件
  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: Colors.blue[600],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
