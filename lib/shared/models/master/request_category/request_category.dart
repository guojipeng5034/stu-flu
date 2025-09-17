import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_category.freezed.dart';
part 'request_category.g.dart';

/// 请求类别数据模型
/// 
/// 对应Android项目中的RequestCategory配置
@freezed
class RequestCategoryBean with _$RequestCategoryBean {
  const factory RequestCategoryBean({
    int? id,
    int? mappingIndex,
    String? name,
  }) = _RequestCategoryBean;

  factory RequestCategoryBean.fromJson(Map<String, dynamic> json) =>
      _$RequestCategoryBeanFromJson(json);
}

/// 请求类别列表数据模型
@freezed
class RequestCategoryList with _$RequestCategoryList {
  const factory RequestCategoryList({
    List<RequestCategoryBean>? data,
  }) = _RequestCategoryList;

  factory RequestCategoryList.fromJson(Map<String, dynamic> json) =>
      _$RequestCategoryListFromJson(json);
}
