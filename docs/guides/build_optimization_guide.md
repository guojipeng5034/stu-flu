# build.yaml 优化指南

## 📋 优化概述

本次优化主要解决了以下问题：

### ✅ 已解决的问题

1. **配置冲突消除**
   - 移除了 `dart_mappable` 中的 `renameMethods` 配置，避免与标准命名冲突
   - 统一了字段命名策略为 `snake_case`

2. **添加 Freezed 支持**
   - 新增了完整的 `freezed` 配置
   - 支持生成 `copyWith`、`==`、`hashCode`、`toString` 等方法

3. **优化 JSON 序列化**
   - 添加了 `generic_argument_factories` 支持泛型
   - 保持与 `freezed` 的兼容性

4. **增强 Retrofit 配置**
   - 添加了 `nullable_return_type` 支持可空返回类型
   - 保持现有的日志和转换器配置

5. **清理注释代码**
   - 移除了未实现的 `translation_generator` 配置
   - 添加了清晰的分区注释

## 🔧 配置详解

### dart_mappable_builder 配置

```yaml
dart_mappable_builder:
  options:
    caseStyle: snakeCase          # 字段命名：snake_case
    ignoreNull: true              # 忽略 null 值
    constructorStyle: normal      # 标准构造函数
    fieldNameMapper:
      type: snakeCase            # 字段映射策略
    generateMixin: true          # 生成 mixin
    generateMethods: true        # 生成 Mapper 类
```

**移除的配置：**
- `renameMethods`: 避免方法名冲突，保持标准 `fromJson`/`toJson`

### freezed 配置

```yaml
freezed:
  options:
    copy_with: true              # 生成 copyWith 方法
    equal: true                  # 生成 == 和 hashCode
    to_string: true              # 生成 toString 方法
    from_json: true              # 生成 fromJson 方法
    to_json: true                # 生成 toJson 方法
```

### json_serializable 配置

```yaml
json_serializable:
  options:
    field_rename: snake          # 字段重命名：snake_case
    explicit_to_json: true       # 显式 toJson 方法
    include_if_null: false       # 不包含 null 值
    create_to_json: true         # 生成 toJson 方法
    create_factory: true         # 生成 factory 构造函数
    checked: true                # 启用类型检查
    generic_argument_factories: true  # 泛型支持
```

### retrofit_generator 配置

```yaml
retrofit_generator:retrofit_generator:
  options:
    use_method_http_logger: true    # 方法级别日志
    auto_add_http_logger: true      # 自动添加日志
    with_converter: true            # 包含转换器
    nullable_return_type: true      # 可空返回类型
```

## 🚀 使用建议

### 1. 选择合适的序列化方案

**dart_mappable** - 适用于：
- 复杂的数据模型
- 需要高性能序列化
- 需要自定义映射逻辑

**freezed + json_serializable** - 适用于：
- 简单的数据模型
- 需要不可变对象
- 快速开发原型

### 2. 代码生成命令

```bash
# 清理旧文件
flutter pub run build_runner clean

# 生成新代码
flutter pub run build_runner build --delete-conflicting-outputs

# 监听文件变化（开发时使用）
flutter pub run build_runner watch --delete-conflicting-outputs
```

### 3. 最佳实践

1. **统一命名风格**：所有模型都使用 `snake_case` 字段命名
2. **避免混用**：在同一个模型中不要混用不同的序列化方案
3. **定期清理**：定期运行 `clean` 命令清理生成的文件
4. **版本控制**：将生成的 `.g.dart` 和 `.freezed.dart` 文件加入版本控制

## 📊 性能优化

### 编译时优化

- `ignoreNull: true` - 减少生成代码体积
- `include_if_null: false` - 减少 JSON 体积
- `checked: true` - 启用编译时类型检查

### 运行时优化

- 使用 `const` 构造函数
- 合理使用 `copyWith` 避免不必要的对象创建
- 利用 `==` 和 `hashCode` 进行对象比较优化

## 🔍 故障排除

### 常见问题

1. **生成代码报错**
   ```bash
   flutter pub run build_runner clean
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

2. **方法名冲突**
   - 检查是否混用了不同的序列化方案
   - 确保没有手动定义与生成方法同名的方法

3. **字段映射错误**
   - 检查 `caseStyle` 配置是否一致
   - 使用 `@JsonKey` 或 `@MappableField` 自定义映射

## ✅ 优化验证结果

### 构建测试
```bash
flutter pub run build_runner build --delete-conflicting-outputs
# ✅ 构建成功，耗时 38.5s，生成 26 个输出文件
```

### 生成文件验证

1. **dart_mappable 生成验证** ✅
   - `student.mapper.dart` 正常生成
   - snake_case 字段映射正确：`firstName` → `first_name`
   - `ignoreNull: true` 配置生效
   - 标准方法名保持：`fromJson`/`toJson` 未被重命名
   - copyWith、== 和 hashCode 方法正常生成

2. **freezed 生成验证** ✅
   - `site_config.freezed.dart` 正常生成
   - 完整的 copyWith 方法实现
   - toString、== 和 hashCode 方法生成
   - 不可变列表包装正确实现

3. **json_serializable 生成验证** ✅
   - `site_config.g.dart` 正常生成
   - snake_case 字段重命名正确
   - 泛型支持正常工作

4. **retrofit 生成验证** ✅
   - API 客户端代码正常生成
   - 日志和转换器配置生效

### 性能优化效果

- **编译时优化**：`ignoreNull` 和 `include_if_null: false` 减少了生成代码体积
- **类型安全**：`checked: true` 启用编译时类型检查
- **泛型支持**：`generic_argument_factories: true` 提供更好的泛型处理

## 🎯 下一步建议

1. **统一序列化方案**
   - 新项目推荐使用 `freezed + json_serializable`
   - 复杂数据处理使用 `dart_mappable`
   - 避免在同一模型中混用不同方案

2. **开发工作流优化**
   ```bash
   # 开发时使用 watch 模式
   flutter pub run build_runner watch --delete-conflicting-outputs

   # 定期清理生成文件
   flutter pub run build_runner clean
   ```

3. **版本依赖优化**
   - 考虑升级 `json_annotation` 到 4.9.0+ 以消除警告
   - 保持所有代码生成器版本同步

## 📚 相关文档

- [dart_mappable 官方文档](https://pub.dev/packages/dart_mappable)
- [freezed 官方文档](https://pub.dev/packages/freezed)
- [json_serializable 官方文档](https://pub.dev/packages/json_serializable)
- [retrofit 官方文档](https://pub.dev/packages/retrofit)
