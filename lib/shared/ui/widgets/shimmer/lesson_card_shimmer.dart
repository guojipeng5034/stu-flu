import 'package:flutter/material.dart';

import 'base_shimmer.dart';

/// 课程卡片的Shimmer占位符
class LessonCardShimmer extends StatelessWidget {
  const LessonCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerCard(
      child: BaseShimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 顶部状态和时间行
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 状态标签
                ShimmerBox(
                  width: 72,
                  height: 24,
                  borderRadius: 12,
                ),
                // 时间信息
                ShimmerBox(
                  width: 80,
                  height: 16,
                  borderRadius: 8,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 主要内容区域
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 老师头像
                ShimmerBox.circle(size: 48),
                SizedBox(width: 12),

                // 课程信息区域
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 老师名字
                      ShimmerBox.text(width: 80),
                      SizedBox(height: 8),
                      // 课程类型
                      ShimmerBox.text(width: 120, height: 14),
                      SizedBox(height: 8),
                      // 课程时间
                      ShimmerBox.text(width: 140, height: 14),
                    ],
                  ),
                ),

                SizedBox(width: 12),

                // 右侧按钮
                ShimmerBox.button(width: 64),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 课程列表的Shimmer占位符
class LessonListShimmer extends StatelessWidget {
  /// 显示的占位符数量
  final int itemCount;

  const LessonListShimmer({
    super.key,
    this.itemCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) => AnimatedLessonCardShimmer(
        delay: Duration(milliseconds: index * 100),
      ),
    );
  }
}

/// 带动画延迟的课程卡片Shimmer
class AnimatedLessonCardShimmer extends StatefulWidget {
  final Duration delay;

  const AnimatedLessonCardShimmer({
    super.key,
    this.delay = Duration.zero,
  });

  @override
  State<AnimatedLessonCardShimmer> createState() =>
      _AnimatedLessonCardShimmerState();
}

class _AnimatedLessonCardShimmerState extends State<AnimatedLessonCardShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // 延迟启动动画
    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: const LessonCardShimmer(),
    );
  }
}

/// 紧凑版课程卡片Shimmer（用于加载更多）
class CompactLessonCardShimmer extends StatelessWidget {
  const CompactLessonCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerCard(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: BaseShimmer(
        period: const Duration(milliseconds: 1200),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 头像
            ShimmerBox.circle(size: 40),
            SizedBox(width: 12),

            // 课程信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 老师名字
                  ShimmerBox.text(width: 100, height: 14),
                  SizedBox(height: 6),
                  // 课程类型
                  ShimmerBox.text(width: 140, height: 12),
                ],
              ),
            ),

            SizedBox(width: 12),

            // 状态标签
            ShimmerBox(
              width: 56,
              height: 20,
              borderRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
