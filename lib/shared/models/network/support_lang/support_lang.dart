import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_lang.freezed.dart';
part 'support_lang.g.dart';

/// 支持语言数据模型
///
/// 用于多语言支持配置
@freezed
class SupportLang with _$SupportLang {
  const factory SupportLang({
    String? key,
    String? name,
    String? showName,
  }) = _SupportLang;

  /// 从 JSON 创建 SupportLang 实例
  factory SupportLang.fromJson(Map<String, dynamic> json) => _$SupportLangFromJson(json);
}
