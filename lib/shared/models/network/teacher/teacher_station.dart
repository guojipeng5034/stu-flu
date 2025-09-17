import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_station.freezed.dart';
part 'teacher_station.g.dart';

/// 教师站点数据模型
///
/// 用于教师所在站点信息
@freezed
class TeacherStation with _$TeacherStation {
  const factory TeacherStation({
    String? storey,
    String? name,
  }) = _TeacherStation;

  /// 从 JSON 创建 TeacherStation 实例
  factory TeacherStation.fromJson(Map<String, dynamic> json) => _$TeacherStationFromJson(json);
}