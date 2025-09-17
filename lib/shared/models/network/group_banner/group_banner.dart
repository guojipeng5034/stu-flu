import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_banner.freezed.dart';
part 'group_banner.g.dart';

/// 群组横幅数据模型
///
/// 用于群组页面的横幅展示
@freezed
class GroupBanner with _$GroupBanner {
  const factory GroupBanner({
    String? image,
    String? url,
  }) = _GroupBanner;

  /// 从 JSON 创建 GroupBanner 实例
  factory GroupBanner.fromJson(Map<String, dynamic> json) => _$GroupBannerFromJson(json);
}
