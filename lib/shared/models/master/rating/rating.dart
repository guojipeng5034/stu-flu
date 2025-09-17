import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating.freezed.dart';
part 'rating.g.dart';

/// 评分数据模型
/// 
/// 对应Android项目中的Rating配置
@freezed
class RatingBean with _$RatingBean {
  const factory RatingBean({
    int? id,
    String? label,
    String? name,
    String? description,
    int? value,
  }) = _RatingBean;

  factory RatingBean.fromJson(Map<String, dynamic> json) =>
      _$RatingBeanFromJson(json);
}

/// 评分列表数据模型
@freezed
class RatingList with _$RatingList {
  const factory RatingList({
    List<RatingBean>? data,
  }) = _RatingList;

  factory RatingList.fromJson(Map<String, dynamic> json) =>
      _$RatingListFromJson(json);
}
