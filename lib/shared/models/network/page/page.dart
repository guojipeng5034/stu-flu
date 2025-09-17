import 'package:freezed_annotation/freezed_annotation.dart';

part 'page.freezed.dart';
part 'page.g.dart';

/// 分页数据模型
///
/// 用于API响应的分页信息
@freezed
class Page with _$Page {
  const factory Page({
    String? counts,
    @Default(0) int end,
    String? limit,
    @Default(0) int next,
    String? offset,
    @Default(0) int page,
    @Default(0) int pagesTotal,
    dynamic prev,
    @Default(0) int start,
    String? total,
  }) = _Page;

  /// 从 JSON 创建 Page 实例
  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
}
