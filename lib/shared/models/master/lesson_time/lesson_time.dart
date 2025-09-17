import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_time.freezed.dart';
part 'lesson_time.g.dart';

/// 课程时长数据模型
/// 
/// 对应Android项目中的LessonTime配置
@freezed
class LessonTimeBean with _$LessonTimeBean {
  const factory LessonTimeBean({
    int? id,
    String? label,
    String? name,
    String? abbr,
    String? mins,
    int? openRestriction,
    List<int>? unavailableLessonStart,
  }) = _LessonTimeBean;

  factory LessonTimeBean.fromJson(Map<String, dynamic> json) =>
      _$LessonTimeBeanFromJson(json);
}

/// 课程时长列表数据模型
@freezed
class LessonTimeList with _$LessonTimeList {
  const factory LessonTimeList({
    List<LessonTimeBean>? data,
  }) = _LessonTimeList;

  factory LessonTimeList.fromJson(Map<String, dynamic> json) =>
      _$LessonTimeListFromJson(json);
}
