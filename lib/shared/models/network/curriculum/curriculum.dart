import 'package:cptop/shared/models/network/applicable_user/applicable_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cptop/core/utils/json_converters.dart';

part 'curriculum.freezed.dart';
part 'curriculum.g.dart';

/// 课程数据模型
///
/// 通用的课程模型，用于网络数据传输和API响应
/// 统一了 AigcCurriculum 和 CommonCurriculum 的字段
/// 支持不同类型的课程数据
@freezed
class Curriculum with _$Curriculum {
  const factory Curriculum({
    /// 适用用户列表
    List<ApplicableUser>? applicableUser,
    String? code,
    @Default(0)  curriculumStudyPage,
    @Default(0)  curriculumTotalPage,
    @Default("") description,
    @Default(0) int id,
    String? image,
    String? lead,
    int? lessonTimeId,
    String? name,
    @CTBoolConverter() @Default(false) bool isFtl,
    @CTBoolConverter() @Default(false) bool groupFlag,
    @CTBoolConverter() @Default(false) bool oneToOneFlag,
  }) = _Curriculum;

  /// 从 JSON 创建 Curriculum 实例
  factory Curriculum.fromJson(Map<String, dynamic> json) =>
      _$CurriculumFromJson(json);
}
