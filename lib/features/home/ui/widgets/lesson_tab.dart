import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/models/network/lesson/index.dart';
import '../../../../shared/ui/widgets/cards/lesson_card.dart';
import '../../../../shared/ui/widgets/shimmer/lesson_card_shimmer.dart';
import '../../../lesson/ui/providers/lesson_provider.dart';

/// 课程Tab组件
class LessonTab extends ConsumerStatefulWidget {
  const LessonTab({super.key});

  @override
  ConsumerState<LessonTab> createState() => _LessonTabState();
}

class _LessonTabState extends ConsumerState<LessonTab> {
  final ScrollController _scrollController = ScrollController();
  bool _hasTriggeredInitialLoad = false;

  @override
  void initState() {
    super.initState();
    // 监听滚动事件，实现上拉加载更多
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// 滚动监听，实现上拉加载更多
  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // 距离底部200像素时开始加载更多
      ref.read(lessonListProvider.notifier).loadMoreLessons();
    }
  }

  /// 下拉刷新
  Future<void> _onRefresh() async {
    await ref.read(lessonListProvider.notifier).refreshLessons();
  }

  @override
  Widget build(BuildContext context) {
    final lessonState = ref.watch(lessonListProvider);

    // 第一次显示时触发数据加载
    if (!_hasTriggeredInitialLoad) {
      _hasTriggeredInitialLoad = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // 检查API是否准备好
        final apiState = ref.read(lessonApiProvider);
        apiState.whenData((api) {
          // API准备好了，开始加载数据
          if (lessonState.lessons.isEmpty &&
              !lessonState.isLoading &&
              !lessonState.isRefreshing) {
            ref.read(lessonListProvider.notifier).loadLessons();
          }
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('课程'),
        automaticallyImplyLeading: false,
      ),
      body: _buildBody(lessonState),
    );
  }

  /// 构建主体内容
  Widget _buildBody(LessonListState state) {
    // 显示错误信息
    if (state.error != null && state.lessons.isEmpty) {
      return _buildErrorWidget(state.error!);
    }

    // 初始加载中
    if (state.isLoading && state.lessons.isEmpty) {
      return const LessonListShimmer(itemCount: 8);
    }

    // 空状态
    if (state.lessons.isEmpty) {
      return _buildEmptyWidget();
    }

    // 课程列表
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: state.lessons.length + (state.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          // 课程项
          if (index < state.lessons.length) {
            final lesson = state.lessons[index];
            return LessonCard(
              lesson: lesson,
              onTap: () {
                // TODO: 导航到课程详情页
                _showLessonDetail(lesson);
              },
            );
          }

          // 加载更多指示器
          if (state.isLoadingMore) {
            return const CompactLessonCardShimmer();
          }

          // 没有更多数据
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                '没有更多课程了',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }

  /// 构建错误状态
  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            '加载失败',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[500],
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ref.read(lessonListProvider.notifier).loadLessons();
            },
            child: const Text('重试'),
          ),
        ],
      ),
    );
  }

  /// 构建空状态
  Widget _buildEmptyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.school_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            '暂无课程',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 8),
          Text(
            '下拉刷新试试看',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[500],
                ),
          ),
        ],
      ),
    );
  }

  /// 显示课程详情
  void _showLessonDetail(Lesson lesson) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('课程详情 - ID: ${lesson.id}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (lesson.teacher?.name != null)
              Text('教师: ${lesson.teacher!.name}'),
            if (lesson.statusName != null) Text('状态: ${lesson.statusName}'),
            if (lesson.startDate != null) Text('日期: ${lesson.startDate}'),
            if (lesson.startTime != null) Text('时间: ${lesson.startTime}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }
}
