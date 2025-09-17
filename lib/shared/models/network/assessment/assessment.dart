import 'package:freezed_annotation/freezed_annotation.dart';

part 'assessment.freezed.dart';
part 'assessment.g.dart';

/// 评估数据模型
///
/// 用于课程评估和学习进度跟踪
@freezed
class Assessment with _$Assessment {
  const factory Assessment({
    @Default(0) int fairId,
    @Default('') String message,
    @Default('') String pagesSummary,
  }) = _Assessment;

  /// 从 JSON 创建 Assessment 实例
  factory Assessment.fromJson(Map<String, dynamic> json) => _$AssessmentFromJson(json);
}
