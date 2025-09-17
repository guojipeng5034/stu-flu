# 📖 开发最佳实践指南

> **注意**: 本文档已整合到 [完整开发指南](DEVELOPMENT_GUIDE.md) 中，建议查看最新的开发指南。

## 🏗️ 功能开发最佳实践

### 1. 数据模型设计

使用 dart_mappable 创建类型安全的数据模型：

```dart
// lib/features/feature/data/models/feature_model.dart
@MappableClass()
class FeatureModel with FeatureModelMappable {
  final String? id;
  final String? name;
  final String? description;

  const FeatureModel({this.id, this.name, this.description});

  static const fromJson = FeatureModelMapper.fromJson;
}

// lib/features/feature/data/models/feature_extensions.dart
extension FeatureModelBusinessLogic on FeatureModel {
  String get displayName => name ?? 'Unknown Feature';
  bool get isValid => id?.isNotEmpty == true;
}
```

### 2. 创建 API 接口 (`lib/api/`)

```dart
// lib/api/feature/feature_api.dart
@RestApi()
abstract class FeatureApi {
  factory FeatureApi(Dio dio) = _FeatureApi;

  @GET('/features')
  Future<List<FeatureModel>> getFeatures();

  @GET('/features/{id}')
  Future<FeatureModel> getFeature(@Path('id') String id);

  @POST('/features')
  Future<FeatureModel> createFeature(@Body() FeatureModel feature);
}
```

### 3. 创建 Riverpod Provider 状态管理 (`lib/providers/`)

```dart
// lib/providers/feature_provider.dart
class FeatureState {
  final List<FeatureModel> features;
  final bool isLoading;
  final String? error;

  const FeatureState({
    this.features = const [],
    this.isLoading = false,
    this.error,
  });

  FeatureState copyWith({
    List<FeatureModel>? features,
    bool? isLoading,
    String? error,
  }) {
    return FeatureState(
      features: features ?? this.features,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class FeatureNotifier extends StateNotifier<FeatureState> {
  final FeatureApi _api;
  final StorageService _storage;
  final AppLogger _logger;

  FeatureNotifier({
    required FeatureApi api,
    required StorageService storage,
    required AppLogger logger,
  }) : _api = api, _storage = storage, _logger = logger, super(const FeatureState());

  // 加载功能列表
  Future<void> loadFeatures() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final features = await _api.getFeatures();
      state = state.copyWith(features: features, isLoading: false);
      _logger.info('加载功能列表成功，共 ${features.length} 项');
    } catch (e) {
      final error = '加载功能列表失败: $e';
      state = state.copyWith(error: error, isLoading: false);
      _logger.error(error);
    }
  }

  // 业务逻辑方法
  List<FeatureModel> getValidFeatures() {
    return state.features.where((f) => f.isValid).toList();
  }
}
```

## 🔧 代码规范

### 1. 命名规范

- **文件名**：`snake_case.dart`
- **类名**：`PascalCase`
- **变量名**：`camelCase`
- **常量**：`UPPER_SNAKE_CASE`

### 2. 导入顺序

```dart
// 1. Dart 核心库
import 'dart:async';

// 2. Flutter 库
import 'package:flutter/material.dart';

// 3. 第三方包
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

// 4. 项目内部导入 - API
import 'package:cptop/api/feature/feature_api.dart';

// 5. 项目内部导入 - 模型
import 'package:cptop/api/feature/models/index.dart';

// 6. 项目内部导入 - 核心服务
import 'package:cptop/core/storage/storage_service.dart';
import 'package:cptop/core/logger/app_logger.dart';
```

### 3. 文件组织

- 每个文件只包含一个主要类
- 相关的小类可以放在同一文件
- 使用 `part` 和 `part of` 分割大文件

## 🌐 网络请求最佳实践

### 1. 错误处理

```dart
Future<void> loadData() async {
  try {
    final data = await _api.getData();
    // 处理成功数据
  } on DioException catch (e) {
    // 处理网络错误
    if (e.type == DioExceptionType.connectionTimeout) {
      _error = '连接超时，请检查网络';
    } else if (e.type == DioExceptionType.receiveTimeout) {
      _error = '响应超时，请重试';
    } else {
      _error = '网络错误: ${e.message}';
    }
  } catch (e) {
    // 处理其他错误
    _error = '未知错误: $e';
  }
}
```

### 2. 缓存策略

```dart
Future<Student?> getStudent(int id) async {
  // 1. 先从缓存获取
  final cached = await _getFromCache(id);
  if (cached != null) {
    return cached;
  }

  // 2. 从 API 获取
  final student = await _api.getStudent(id);

  // 3. 保存到缓存
  await _saveToCache(student);

  return student;
}
```

### 3. 加载状态管理

```dart
class DataState {
  final bool isLoading;
  final bool isRefreshing;

  const DataState({
    this.isLoading = false,
    this.isRefreshing = false,
  });

  DataState copyWith({
    bool? isLoading,
    bool? isRefreshing,
  }) {
    return DataState(
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}

class DataNotifier extends StateNotifier<DataState> {
  DataNotifier() : super(const DataState());

  Future<void> loadData({bool isRefresh = false}) async {
    if (isRefresh) {
      state = state.copyWith(isRefreshing: true);
    } else {
      state = state.copyWith(isLoading: true);
    }

    try {
      // 加载数据...
    } finally {
      state = state.copyWith(isLoading: false, isRefreshing: false);
    }
  }
}
```

## 📝 开发说明

### 代码生成

修改模型后需要重新生成代码：

```bash
# 监听文件变化并自动生成
dart run build_runner watch

# 一次性生成
dart run build_runner build
```

### 使用 watch 模式（推荐开发时使用）

在开发过程中，可以使用 watch 模式自动监听文件变化并重新生成代码：

```bash
# 启动 watch 模式
flutter pub run build_runner watch

# 如果遇到冲突，可以使用 --delete-conflicting-outputs 参数
flutter pub run build_runner watch --delete-conflicting-outputs
```

使用 watch 模式的好处：
- 自动监听文件变化并实时生成代码
- 减少手动操作，提高开发效率
- 避免忘记运行生成命令导致的错误

### 添加新的功能模块

1. 在 `lib/features/` 下创建新模块目录
2. 按照三层架构创建子目录：`data/`、`domain/`、`presentation/`
3. 在 `data/` 下创建 API 接口和数据模型
4. 在 `domain/` 下创建业务服务和用例
5. 在 `presentation/` 下创建页面、组件和状态管理
6. 创建模块导出文件 `module_name.dart`

### 添加新的 API 模型

1. 在 `lib/features/*/data/models/` 下创建模型文件
2. 使用 `@MappableClass()` 注解
3. 运行代码生成
4. 创建对应的 `*_extensions.dart` 文件添加业务逻辑

### 添加新的业务服务

1. 在 `lib/features/*/data/services/` 下创建服务文件
2. 注入需要的 API 和基础服务依赖
3. 实现业务逻辑和数据处理
4. 返回统一的 `ServiceResult` 结果

### 添加新的 Provider

1. 在 `lib/features/*/ui/providers/` 下创建 Provider 文件
2. 继承 `StateNotifier<T>` 或使用其他 Riverpod Provider
3. 注入对应的业务服务
4. 实现状态管理和 UI 交互逻辑

## 🧪 测试指南

```bash
# 运行所有测试
flutter test

# 运行特定测试文件
flutter test test/services/auth_service_test.dart

# 运行集成测试
flutter drive --target=test_driver/app.dart
```

## 📝 提交规范

使用 [Conventional Commits](https://www.conventionalcommits.org/) 规范：

```
feat: 添加用户认证功能
fix: 修复登录页面布局问题
docs: 更新README文档
style: 格式化代码
refactor: 重构网络请求模块
test: 添加用户服务测试
chore: 更新依赖版本
```

---

**最后更新**: 2024年12月
**维护者**: 开发团队
