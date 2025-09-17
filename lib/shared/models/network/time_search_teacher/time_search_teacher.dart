import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cptop/core/utils/json_converters.dart';
import '../teacher/teacher.dart';
import '../page/page.dart';

part 'time_search_teacher.freezed.dart';
part 'time_search_teacher.g.dart';

/// 时间搜索教师响应数据模型
///
/// 用于按时间搜索可用教师的API响应
@freezed
class TimeSearchTeacher with _$TimeSearchTeacher {
  const factory TimeSearchTeacher({
    TimeSearchTeacherData? data,
    @Default(0) int isSuccess,
    String? serviceName,
    @Default([]) List<dynamic> errors,
  }) = _TimeSearchTeacher;

  /// 从 JSON 创建 TimeSearchTeacher 实例
  factory TimeSearchTeacher.fromJson(Map<String, dynamic> json) => _$TimeSearchTeacherFromJson(json);
}

/// 时间搜索教师数据
@freezed
class TimeSearchTeacherData with _$TimeSearchTeacherData {
  const factory TimeSearchTeacherData({
    @CTBoolConverter() @Default(false) bool canReserve,
    @Default([]) List<Teacher> list,
    Page? pager,
    @CTBoolConverter() @Default(false) bool requireFtl,
    @CTBoolConverter() @Default(false) bool requireLogin,
    @CTBoolConverter() @Default(false) bool requireSubscription,
  }) = _TimeSearchTeacherData;

  /// 从 JSON 创建 TimeSearchTeacherData 实例
  factory TimeSearchTeacherData.fromJson(Map<String, dynamic> json) => _$TimeSearchTeacherDataFromJson(json);
}
