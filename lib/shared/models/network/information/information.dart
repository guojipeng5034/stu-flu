import 'package:freezed_annotation/freezed_annotation.dart';

part 'information.freezed.dart';
part 'information.g.dart';

/// 信息数据模型
///
/// 用于应用内通知和信息展示
@freezed
class Information with _$Information {
  const factory Information({
    @Default('') String content,
    @Default('') String contentHtmlFlag,
    @Default(0) int id,
    @Default('') String postedTime,
    @Default('') String title,
    @Default([]) List<InformationLink> linksJson,
    @Default([]) List<InformationLink> links,
  }) = _Information;

  /// 从 JSON 创建 Information 实例
  factory Information.fromJson(Map<String, dynamic> json) => _$InformationFromJson(json);
}

/// 信息链接
@freezed
class InformationLink with _$InformationLink {
  const factory InformationLink({
    @Default('') String target,
    @Default('') String title,
    @Default('') String url,
  }) = _InformationLink;

  /// 从 JSON 创建 InformationLink 实例
  factory InformationLink.fromJson(Map<String, dynamic> json) => _$InformationLinkFromJson(json);
}
