import 'lesson_list_api.dart';

/// LessonListApi类的扩展方法
extension LessonListApiX on LessonListApi {
  /// 检查是否有课程
  bool get hasLessons => list.isNotEmpty;

  /// 获取课程数量
  int get lessonCount => list.length;

  /// 获取当前页码
  int get currentPage => pager?.page ?? 1;

  /// 获取总页数
  int get totalPages => pager?.pagesTotal ?? 0;

  /// 检查是否有下一页
  bool get hasNextPage => (pager?.next ?? 0) > 0;

  /// 检查是否有上一页
  bool get hasPreviousPage => pager?.prev != null;

  /// 获取总数
  int get totalCount => int.tryParse(pager?.total ?? '0') ?? 0;

  /// 获取每页数量
  int get pageSize => int.tryParse(pager?.limit ?? '20') ?? 20;
}
