import 'package:freezed_annotation/freezed_annotation.dart';

/// 通用布尔值转换器 - 支持从多种类型转换为布尔值
///
/// 支持从以下类型转换为布尔值:
/// - int: 1 为 true, 其他为 false
/// - String: "true", "1", "true", "t" 为 true, 其他为 false
/// - bool: 直接返回
/// - null: 返回默认值
///
/// 用法:
/// ```dart
/// @CTBoolConverter() @Default(false)
/// bool? isActive,
///
/// @CTBoolConverter(defaultValue: true)
/// bool isEnabled,
/// ```
class CTBoolConverter implements JsonConverter<bool, dynamic> {
  final bool defaultValue;

  const CTBoolConverter({this.defaultValue = false});

  @override
  bool fromJson(dynamic json) {
    if (json == null) return defaultValue;
    if (json is bool) return json;
    if (json is int) return json == 1;
    if (json is String) {
      final lowercased = json.toLowerCase().trim();
      return lowercased == "true" || lowercased == "1" || lowercased == "t";
    }
    return defaultValue;
  }

  @override
  dynamic toJson(bool object) => object ? true : false;
}

class CTStringConverter implements JsonConverter<String, dynamic> {
  final String defaultValue;

  const CTStringConverter({this.defaultValue = ""});

  @override
  String fromJson(dynamic value) {
    if (value == null) return defaultValue;
    if (value is int) return value.toString();
    if (value is String) return value;
    return defaultValue;
  }

  @override
  dynamic toJson(String object) => object;
}

