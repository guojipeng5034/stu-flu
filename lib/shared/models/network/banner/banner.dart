import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner.freezed.dart';
part 'banner.g.dart';

/// 横幅数据模型
///
/// 通用的横幅模型，用于网络数据传输和API响应
/// 可用于各种横幅展示场景
@freezed
class Banner with _$Banner {
  const factory Banner({
    String? image,
    String? url,
  }) = _Banner;

  /// 从 JSON 创建 Banner 实例
  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);
}
