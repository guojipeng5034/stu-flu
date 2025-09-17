import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/network/lesson/index.dart';
import '../../../../shared/models/network/page/index.dart';

part 'lesson_list_api.freezed.dart';
part 'lesson_list_api.g.dart';

/// 课程列表数据模型 (对应API响应中的data字段)
@freezed
class LessonListApi with _$LessonListApi {
  const factory LessonListApi({
    @Default(0) int ftlReportLessonId,
    @Default([]) List<Lesson> list,
    @Default(0) int nowTime,
    Page? pager,
  }) = _LessonListApi;

  /// 从 JSON 创建 LessonListApi 实例
  factory LessonListApi.fromJson(Map<String, dynamic> json) =>
      _$LessonListApiFromJson(json);
}
