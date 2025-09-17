import 'package:cptop/core/logger/app_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/di.dart';
import '../../../../core/network/models/api_response.dart';
import '../../../../shared/models/network/lesson/index.dart';
import '../../data/api/lesson_api.dart';
import '../../data/models/lesson_list_api.dart';
import '../../data/models/lesson_list_api_extensions.dart';

/// 课程列表状态
class LessonListState {
  final List<Lesson> lessons;
  final bool isLoading;
  final bool isRefreshing;
  final bool isLoadingMore;
  final String? error;
  final bool hasMore;
  final int currentPage;

  const LessonListState({
    this.lessons = const [],
    this.isLoading = false,
    this.isRefreshing = false,
    this.isLoadingMore = false,
    this.error,
    this.hasMore = true,
    this.currentPage = 1,
  });

  LessonListState copyWith({
    List<Lesson>? lessons,
    bool? isLoading,
    bool? isRefreshing,
    bool? isLoadingMore,
    String? error,
    bool? hasMore,
    int? currentPage,
  }) {
    return LessonListState(
      lessons: lessons ?? this.lessons,
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

/// 课程API Provider
final lessonApiProvider = DI.createApiProvider<LessonApi>(
  (dio) => LessonApi(dio),
);

/// 课程列表Provider
final lessonListProvider =
    StateNotifierProvider<LessonListNotifier, LessonListState>((ref) {
  final lessonApiAsync = ref.watch(lessonApiProvider);
  return lessonApiAsync.when(
    data: (lessonApi) => LessonListNotifier(lessonApi),
    loading: () => LessonListNotifier(),
    error: (error, stack) => LessonListNotifier(),
  );
});

/// 课程列表状态管理
class LessonListNotifier extends StateNotifier<LessonListState> {
  final LessonApi? _lessonApi;
  static const int _pageSize = 20;

  LessonListNotifier([this._lessonApi]) : super(const LessonListState()) {
    // 如果API可用，自动加载数据
    if (_lessonApi != null) {
      Future.microtask(() => loadLessons());
    }
  }

  /// 初始化加载课程列表
  Future<void> loadLessons() async {
    if (state.isLoading || _lessonApi == null) return;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _lessonApi!.getLessons(page: 1, limit: _pageSize);
      _handleApiResponse(response, isRefresh: false, isLoadMore: false);
    } catch (e) {
      Log.e('加载课程列表失败: $e');
      _handleError('加载课程失败: $e');
    }
  }

  /// 下拉刷新
  Future<void> refreshLessons() async {
    if (state.isRefreshing || _lessonApi == null) return;

    state = state.copyWith(isRefreshing: true, error: null);

    try {
      final response = await _lessonApi!.getLessons(page: 1, limit: _pageSize);
      _handleApiResponse(response, isRefresh: true, isLoadMore: false);
    } catch (e) {
      Log.e('刷新课程列表失败: $e');
      _handleError('刷新课程失败: $e');
    }
  }

  /// 加载更多课程
  Future<void> loadMoreLessons() async {
    if (state.isLoadingMore || !state.hasMore || _lessonApi == null) return;

    state = state.copyWith(isLoadingMore: true, error: null);

    try {
      final nextPage = state.currentPage + 1;
      final response = await _lessonApi!.getLessons(page: nextPage, limit: _pageSize);
      _handleApiResponse(response, isRefresh: false, isLoadMore: true);
    } catch (e) {
      Log.e('加载更多课程失败: $e');
      _handleError('加载更多课程失败: $e');
    }
  }

  /// 清除错误
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// 处理API响应的通用方法
  void _handleApiResponse(
    ApiResponse<LessonListApi> response, {
    required bool isRefresh,
    required bool isLoadMore,
  }) {
    if (response.isSuccess && response.data != null) {
      final lessonData = response.data!;
      final newLessons = isLoadMore
          ? [...state.lessons, ...lessonData.list]
          : lessonData.list;

      // 检查是否来自缓存并记录日志
      final fromCache = response.extra?['from_cache'] == true;
      if (fromCache) {
        final cacheReason = response.extra?['cache_reason'] as String?;
        Log.i('显示缓存数据: ${newLessons.length} 个课程，原因: $cacheReason');
      }

      state = state.copyWith(
        lessons: newLessons,
        hasMore: lessonData.hasNextPage,
        currentPage: lessonData.currentPage,
        isLoading: false,
        isRefreshing: false,
        isLoadingMore: false,
        error: null,
      );
    } else {
      _handleError(response.message ?? '请求失败');
    }
  }

  /// 处理错误的通用方法
  void _handleError(String error) {
    state = state.copyWith(
      error: error,
      isLoading: false,
      isRefreshing: false,
      isLoadingMore: false,
    );
  }
}
