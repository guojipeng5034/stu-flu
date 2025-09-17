import 'package:dart_mappable/dart_mappable.dart';

import 'global_mapping_hook.dart';

/// Dart Mappable 注解生成帮助类
///
/// 提供统一的模型类注解配置，确保所有模型都使用相同的配置
class MappableAnnotations {
  /// 不能实例化
  MappableAnnotations._();

  /// 基础配置，使用蛇形命名和全局钩子
  static const base = MappableClass(
    hook: GlobalMappingHook.instance,
    caseStyle: CaseStyle.snakeCase,
  );

  /// 带调试日志的配置
  static const debug = MappableClass(
    hook: GlobalMappingHook.debug,
    caseStyle: CaseStyle.snakeCase,
  );

  /// 精简配置，只使用蛇形命名
  static const minimal = MappableClass(
    caseStyle: CaseStyle.snakeCase,
  );

  /// 带前缀配置，用于特殊命名约定的API
  static MappableClass withPrefix(String prefix) => MappableClass(
        hook: GlobalMappingHook.instance,
        caseStyle: CaseStyle.snakeCase,
        discriminatorKey: prefix,
      );
}

/// 基础可映射模型，所有模型类都可以继承这个类
///
/// 提供通用的辅助方法和属性，减少模板代码
mixin BaseMappableModel {
  /// 转换为JSON Map
  Map<String, dynamic> toJson() {
    final mapper = (this as dynamic).mapper;
    return mapper.toMap(this);
  }

  /// 对象拷贝（需要子类实现具体的copyWith方法）
  dynamic copyWith();

  @override
  String toString() {
    final mapper = (this as dynamic).mapper;
    return mapper.stringify(this);
  }
}
