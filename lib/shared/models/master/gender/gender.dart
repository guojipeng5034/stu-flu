import 'package:freezed_annotation/freezed_annotation.dart';

part 'gender.freezed.dart';
part 'gender.g.dart';

/// 性别数据模型
/// 
/// 对应Android项目中的Gender配置
@freezed
class GenderBean with _$GenderBean {
  const factory GenderBean({
    int? id,
    String? label,
    String? name,
  }) = _GenderBean;

  factory GenderBean.fromJson(Map<String, dynamic> json) =>
      _$GenderBeanFromJson(json);
}

/// 性别列表数据模型
@freezed
class GenderList with _$GenderList {
  const factory GenderList({
    List<GenderBean>? data,
  }) = _GenderList;

  factory GenderList.fromJson(Map<String, dynamic> json) =>
      _$GenderListFromJson(json);
}
