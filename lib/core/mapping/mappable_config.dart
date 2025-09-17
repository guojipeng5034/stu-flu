import 'package:dart_mappable/dart_mappable.dart';

/// dart_mappable 全局配置
///
/// 这个文件定义了项目中所有使用 dart_mappable 的模型类的全局配置。
/// 在需要使用 dart_mappable 的文件中导入此文件，而不需要重复定义配置。
///
/// 使用方法：
/// ```dart
/// import 'package:cptop/core/mapping/mappable_config.dart';
/// import 'package:dart_mappable/dart_mappable.dart';
///
/// part 'your_model.mapper.dart';
///
/// @MappableClass()
/// class YourModel with YourModelMappable {
///   // 模型定义...
/// }
/// ```

/// 全局配置类
///
/// 配置说明：
/// - [GenerateMethods.copy]: 生成 copyWith 方法
/// - [GenerateMethods.equals]: 生成 == 和 hashCode 方法
/// - [CaseStyle.snakeCase]: 全局设置字段名为 snake_case 风格
@MappableLib(
  generateMethods: GenerateMethods.copy | GenerateMethods.equals,
  // caseStyle: CaseStyle.snakeCase,
)
class _GlobalMappableConfig {}
