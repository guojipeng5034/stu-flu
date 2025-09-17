import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/network/lesson/index.dart';
import '../images/avatar_placeholder.dart';

/// 课程卡片组件
class LessonCard extends StatelessWidget {
  final Lesson lesson;
  final VoidCallback? onTap;

  const LessonCard({
    super.key,
    required this.lesson,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 时间标题
              Row(
                children: [
                  Text(
                    _formatDateTimeTitle(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const Spacer(),
                  // 进入教室按钮（仅在即将上课时显示）
                  if (_shouldShowEnterButton())
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF5252),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '进入教室',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),

              // 教师信息和课程详情
              Row(
                children: [
                  // 教师头像
                  ClipOval(
                    child: lesson.teacher?.imageFile.isNotEmpty == true
                        ? CachedNetworkImage(
                            imageUrl: lesson.teacher!.imageFile,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                AvatarPlaceholderFactory.teacher(size: 50),
                            errorWidget: (context, url, error) =>
                                AvatarPlaceholderFactory.teacher(size: 50),
                            fadeInDuration: const Duration(milliseconds: 200),
                            cacheKey: lesson.teacher!.imageFile,
                          )
                        : AvatarPlaceholderFactory.teacher(size: 50),
                  ),
                  const SizedBox(width: 12),

                  // 教师名字和课程信息
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson.teacher?.name ?? 'Senegal',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Basic English',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        // 课程标签
                        Row(
                          children: [
                            _buildCourseTag(),
                            const SizedBox(width: 8),
                            _buildDurationTag(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 状态和操作按钮
              Row(
                children: [
                  // 状态标签
                  _buildStatusTag(),
                  const Spacer(),
                  // 操作按钮
                  ..._buildActionButtons(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 格式化时间标题（如：今天 12:00、明天 12:00）
  String _formatDateTimeTitle() {
    final date = lesson.startDate ?? '';
    final time = lesson.startTime ?? '';

    if (date.isNotEmpty && time.isNotEmpty) {
      // 这里可以根据日期判断是今天、明天等
      return '$date $time';
    } else if (time.isNotEmpty) {
      return '今天 $time';
    }

    return '今天 12:00';
  }

  /// 是否显示进入教室按钮
  bool _shouldShowEnterButton() {
    // 根据课程状态和时间判断是否显示进入教室按钮
    // 这里简化处理，可以根据实际业务逻辑调整
    return lesson.statusId == 2; // 假设状态ID为2表示即将上课
  }

  /// 构建课程标签
  Widget _buildCourseTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF2196F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        lesson.oneToOneOrGroup == '1对1' ? '主修课' : 'AI定制课',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// 构建时长标签
  Widget _buildDurationTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        '25mins',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// 构建状态标签
  Widget _buildStatusTag() {
    String statusText;
    Color statusColor;

    switch (lesson.statusId) {
      case 1:
        statusText = '已完成';
        statusColor = Colors.green;
        break;
      case 2:
        statusText = '即将上课';
        statusColor = const Color(0xFFFF9800);
        break;
      case 3:
        statusText = '已取消';
        statusColor = Colors.red;
        break;
      default:
        statusText = '尚未开课';
        statusColor = const Color(0xFFFF9800);
    }

    return Row(
      children: [
        Icon(
          Icons.access_time,
          size: 16,
          color: statusColor,
        ),
        const SizedBox(width: 4),
        Text(
          statusText,
          style: TextStyle(
            color: statusColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (lesson.statusId == 2) ...[
          const SizedBox(width: 4),
          const Text(
            '0分15秒',
            style: TextStyle(
              color: Color(0xFFFF9800),
              fontSize: 14,
            ),
          ),
        ],
      ],
    );
  }

  /// 构建操作按钮
  List<Widget> _buildActionButtons() {
    List<Widget> buttons = [];

    // 预习按钮
    if (lesson.canPreview) {
      buttons.add(
        _buildActionButton(
          icon: Icons.book_outlined,
          label: '预习',
          onTap: () {
            // TODO: 实现预习功能
          },
        ),
      );
    }

    // 课件按钮
    buttons.add(
      _buildActionButton(
        icon: Icons.description_outlined,
        label: '课件',
        onTap: () {
          // TODO: 实现课件功能
        },
      ),
    );

    return buttons;
  }

  /// 构建单个操作按钮
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: Colors.grey[600],
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
