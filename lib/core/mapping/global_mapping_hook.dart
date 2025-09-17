import 'package:dart_mappable/dart_mappable.dart';

/// 全局通用的类型转换钩子
///
/// 处理常见的类型转换问题:
/// 1. 整数/布尔值字符串转换
/// 2. 数字与布尔值互转 (1/0 <-> true/false)
/// 3. 空字符串处理
/// 4. JSON字段名与Dart字段名转换
class GlobalMappingHook extends MappingHook {
  /// 是否启用调试日志
  final bool enableDebugLog;

  const GlobalMappingHook({this.enableDebugLog = false});

  /// 默认单例实例
  static const instance = GlobalMappingHook();

  /// 调试实例
  static const debug = GlobalMappingHook(enableDebugLog: true);

  // 私有常量
  static const _trueValues = {'true', '1', 'yes', 'y', 'on', 't'};
  static const _falseValues = {'false', '0', 'no', 'n', 'off', 'f'};

  // 正则表达式常量
  static final _intRegex = RegExp(r'^-?\d+$');
  static final _doubleRegex = RegExp(r'^-?\d+\.\d+$');

  @override
  Object? beforeDecode(Object? value) {
    if (value == null) return null;

    // 处理数字转布尔值
    if (value is int && (value == 0 || value == 1)) {
      if (enableDebugLog) {
        print('GlobalMappingHook: int($value) -> bool(${value != 0})');
      }
      return value != 0;
    }

    // 处理字符串类型
    if (value is String) {
      final trimmed = value.trim();

      // 空字符串处理
      if (trimmed.isEmpty) return value;

      // 布尔值字符串转换
      final lowerValue = trimmed.toLowerCase();
      if (_trueValues.contains(lowerValue)) {
        if (enableDebugLog) {
          print('GlobalMappingHook: String("$value") -> bool(true)');
        }
        return true;
      }

      if (_falseValues.contains(lowerValue)) {
        if (enableDebugLog) {
          print('GlobalMappingHook: String("$value") -> bool(false)');
        }
        return false;
      }

      // 数字字符串转换
      if (_intRegex.hasMatch(trimmed)) {
        final intValue = int.tryParse(trimmed);
        if (intValue != null) {
          if (enableDebugLog) {
            print('GlobalMappingHook: String("$value") -> int($intValue)');
          }
          return intValue;
        }
      } else if (_doubleRegex.hasMatch(trimmed)) {
        final doubleValue = double.tryParse(trimmed);
        if (doubleValue != null) {
          if (enableDebugLog) {
            print(
                'GlobalMappingHook: String("$value") -> double($doubleValue)');
          }
          return doubleValue;
        }
      } else if (enableDebugLog) {
        print('GlobalMappingHook: String("$value") -> 无法识别为数字');
      }
    }

    return value;
  }
}
