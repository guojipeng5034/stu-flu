import 'time_search_teacher.dart';
import '../teacher/teacher.dart';

/// TimeSearchTeacher类的扩展方法
extension TimeSearchTeacherX on TimeSearchTeacher {
  /// 检查请求是否成功
  bool get isRequestSuccess => isSuccess == 1;

  /// 检查是否有数据
  bool get hasData => data != null;

  /// 获取教师列表
  List<Teacher> get teacherList => data?.list ?? [];

  /// 检查是否有教师
  bool get hasTeachers => teacherList.isNotEmpty;

  /// 获取教师数量
  int get teacherCount => teacherList.length;
}

/// TimeSearchTeacherData类的扩展方法
extension TimeSearchTeacherDataX on TimeSearchTeacherData {
  /// 检查是否可以预约
  bool get canMakeReservation => canReserve;

  /// 检查是否需要FTL
  bool get needsFtl => requireFtl;

  /// 检查是否需要登录
  bool get needsLogin => requireLogin;

  /// 检查是否需要订阅
  bool get needsSubscription => requireSubscription;

  /// 检查是否有分页信息
  bool get hasPager => pager != null;

  /// 获取总页数
  int get totalPages => pager?.pagesTotal ?? 0;

  /// 获取当前页
  int get currentPage => pager?.page ?? 1;

  /// 检查是否有下一页
  bool get hasNextPage => pager?.next != null && (pager?.next ?? 0) > 0;

  /// 检查是否有上一页
  bool get hasPreviousPage => pager?.prev != null;

  /// 获取教师列表
  List<Teacher> getTeacherList() => list;

  /// 检查是否有教师
  bool get hasTeachers => list.isNotEmpty;

  /// 获取教师数量
  int get teacherCount => list.length;
}
