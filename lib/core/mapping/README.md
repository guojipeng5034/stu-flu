# dart_mappable 全局配置使用指南

本目录包含了项目中 dart_mappable 的全局配置和相关工具。

## 📁 文件结构

```
lib/core/mapping/
├── index.dart              # 统一导出文件
├── mappable_config.dart    # 全局配置
├── global_mapping_hook.dart # 全局映射钩子
├── mappable_model_generator.dart # 模型生成器
└── README.md              # 本文档
```

## 🚀 快速开始

### 1. 导入全局配置

在需要使用 dart_mappable 的文件中，只需导入一个文件：

```dart
import 'package:cptop/core/mapping/index.dart';

part 'your_model.mapper.dart';

@MappableClass()
class YourModel with YourModelMappable {
  final int? id;
  final String? name;
  
  const YourModel({this.id, this.name});
  
  // 提供与 retrofit 兼容的静态方法
  static const fromJson = YourModelMapper.fromMap;
  static const toJson = YourModelMapper.toJson;
}
```

### 2. 自动应用的全局配置

通过导入全局配置，您的模型类将自动获得以下功能：

- ✅ **copyWith 方法**：深拷贝并修改部分字段
- ✅ **== 和 hashCode**：对象比较和哈希计算
- ✅ **snake_case 字段映射**：Dart 驼峰命名自动映射到 JSON 蛇形命名

### 3. 生成代码

运行以下命令生成 mapper 文件：

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 📖 使用示例

### 基本模型类

```dart
import 'package:cptop/core/mapping/index.dart';

part 'user.mapper.dart';

@MappableClass()
class User with UserMappable {
  final int? userId;        // JSON: user_id
  final String? userName;   // JSON: user_name
  final String? emailAddress; // JSON: email_address
  final bool? isActive;     // JSON: is_active
  final DateTime? createdAt; // JSON: created_at

  const User({
    this.userId,
    this.userName,
    this.emailAddress,
    this.isActive,
    this.createdAt,
  });

  static const fromJson = UserMapper.fromMap;
  static const toJson = UserMapper.toJson;
}
```

### 使用生成的方法

```dart
// 创建对象
final user = User(
  userId: 1,
  userName: 'john_doe',
  emailAddress: 'john@example.com',
  isActive: true,
  createdAt: DateTime.now(),
);

// 使用 copyWith（自动生成）
final updatedUser = user.copyWith(
  userName: 'jane_doe',
  emailAddress: 'jane@example.com',
);

// 对象比较（自动生成）
print(user == updatedUser); // false

// JSON 序列化
final json = user.toMap();
final jsonString = user.toJson();

// JSON 反序列化
final userFromJson = UserMapper.fromMap(json);
final userFromString = UserMapper.fromJson(jsonString);
```

## 🔧 高级配置

### 自定义字段映射

如果需要自定义特定字段的映射，可以使用 `@MappableField` 注解：

```dart
@MappableClass()
class CustomModel with CustomModelMappable {
  @MappableField(key: 'custom_field_name')
  final String? specialField;
  
  final String? normalField; // 使用全局 snake_case 映射
  
  const CustomModel({this.specialField, this.normalField});
}
```

### 忽略字段

```dart
@MappableClass()
class ModelWithIgnoredField with ModelWithIgnoredFieldMappable {
  final String? name;
  
  @MappableField(ignore: true)
  final String? internalField; // 不会序列化到 JSON
  
  const ModelWithIgnoredField({this.name, this.internalField});
}
```

## 🔄 迁移指南

### 从旧的本地配置迁移

**之前的写法：**
```dart
import 'package:dart_mappable/dart_mappable.dart';

part 'model.mapper.dart';

@MappableLib(
  generateMethods: GenerateMethods.copy | GenerateMethods.equals,
  caseStyle: CaseStyle.snakeCase,
)
class _GlobalConfig {}

@MappableClass()
class MyModel with MyModelMappable {
  // ...
}
```

**现在的写法：**
```dart
import 'package:cptop/core/mapping/index.dart';

part 'model.mapper.dart';

@MappableClass()
class MyModel with MyModelMappable {
  // ...
}
```

### 批量迁移步骤

1. **替换导入**：
   ```dart
   // 删除
   import 'package:dart_mappable/dart_mappable.dart';
   
   // 替换为
   import 'package:cptop/core/mapping/index.dart';
   ```

2. **删除本地配置**：
   ```dart
   // 删除这些行
   @MappableLib(
     generateMethods: GenerateMethods.copy | GenerateMethods.equals,
     caseStyle: CaseStyle.snakeCase,
   )
   class _GlobalConfig {}
   ```

3. **重新生成代码**：
   ```bash
   flutter pub run build_runner clean
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

## 🛠️ 故障排除

### 常见问题

1. **生成的代码报错**
   - 确保已导入 `package:cptop/core/mapping/index.dart`
   - 运行 `flutter pub run build_runner clean` 清理旧文件

2. **字段映射不正确**
   - 检查是否正确应用了全局配置
   - 使用 `@MappableField(key: 'custom_name')` 自定义映射

3. **缺少 copyWith 或 == 方法**
   - 确保导入了全局配置
   - 重新生成代码

## 📚 相关文档

- [dart_mappable 官方文档](https://pub.dev/packages/dart_mappable)
- [项目 build.yaml 配置](../../../build.yaml)
- [使用示例](../../examples/dart_mappable_example.dart)
