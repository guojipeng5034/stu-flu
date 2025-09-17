import 'package:dart_mappable/dart_mappable.dart';

/// ================= 工具函数 =================

/// 安全解析，解析失败返回默认值
T parseOrDefault<T extends Object>(dynamic value, T Function(dynamic) parser, T defaultValue) {
  try {
    return parser(value);
  } catch (_) {
    return defaultValue;
  }
}

/// ================= 转换器基类 =================

abstract class BaseSimpleMapper<T extends Object> extends SimpleMapper<T> {
  final T defaultValue;
  const BaseSimpleMapper(this.defaultValue);

  @override
  dynamic encode(T? self) => self ?? defaultValue;
}

/// ================= 各类型转换器 =================

class IntConverter extends BaseSimpleMapper<int> {
  const IntConverter() : super(0);

  @override
  int decode(dynamic value) => parseOrDefault<int>(value, (v) {
        if (v == null) return 0;
        if (v is int) return v;
        if (v is num) return v.toInt();
        if (v is String) return int.tryParse(v) ?? 0;
        if (v is bool) return v ? 1 : 0;
        return 0;
      }, 0);
}

class StringConverter extends BaseSimpleMapper<String> {
  const StringConverter() : super('');

  @override
  String decode(dynamic value) => value?.toString() ?? '';
}

class BoolConverter extends BaseSimpleMapper<bool> {
  const BoolConverter() : super(false);

  @override
  bool decode(dynamic value) => parseOrDefault<bool>(value, (v) {
        if (v == null) return false;
        if (v is bool) return v;
        if (v is num) return v != 0;
        if (v is String) {
          final str = v.toLowerCase().trim();
          return ['true', '1', 'yes'].contains(str);
        }
        return false;
      }, false);
}

class DoubleConverter extends BaseSimpleMapper<double> {
  const DoubleConverter() : super(0.0);

  @override
  double decode(dynamic value) => parseOrDefault<double>(value, (v) {
        if (v == null) return 0.0;
        if (v is double) return v;
        if (v is num) return v.toDouble();
        if (v is String) return double.tryParse(v) ?? 0.0;
        if (v is bool) return v ? 1.0 : 0.0;
        return 0.0;
      }, 0.0);
}

/// ================= 初始化器 =================

class DartMappableInitializer {
  /// 私有构造函数，防止实例化
  DartMappableInitializer._();

  /// 是否已初始化
  static bool _initialized = false;

  /// 初始化 dart_mappable
  static void initialize() {
    if (_initialized) return;

    // 注册全局转换器
    MapperContainer.globals
      ..use(const IntConverter())
      ..use(const StringConverter())
      ..use(const BoolConverter())
      ..use(const DoubleConverter());

    _initialized = true;
    print('DartMappableInitializer: 全局转换器已注册');
  }
}
