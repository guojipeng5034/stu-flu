import 'package:freezed_annotation/freezed_annotation.dart';

part 'points.freezed.dart';
part 'points.g.dart';

/// 积分数据模型
/// 
/// 对应Android项目中的Points配置
@freezed
class PointsBean with _$PointsBean {
  const factory PointsBean({
    int? id,
    String? name,
    int? points,
    String? perMin,
  }) = _PointsBean;

  factory PointsBean.fromJson(Map<String, dynamic> json) =>
      _$PointsBeanFromJson(json);
}

/// 积分列表数据模型
@freezed
class PointsList with _$PointsList {
  const factory PointsList({
    List<PointsBean>? data,
  }) = _PointsList;

  factory PointsList.fromJson(Map<String, dynamic> json) =>
      _$PointsListFromJson(json);
}
