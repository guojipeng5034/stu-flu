# 功能模块快速生成工具使用指南

## 🎯 概述

这个工具集可以帮助您快速创建符合项目架构的完整功能模块，避免重复的手动创建工作，提高开发效率。

## 🚀 快速开始

### 最简单的使用方式

```bash
# 使用 Dart 脚本（跨平台）
dart scripts/create_feature.dart profile
```

### 创建完整功能模块

```bash
# 包含 API、数据模型和状态管理的完整模块
dart scripts/create_feature.dart user_profile --all

# 或者分别指定需要的组件
dart scripts/create_feature.dart user_profile --api --models --provider
```

## 📁 生成的文件结构

### 基础模块（无额外选项）
```
lib/features/profile/
├── index.dart                    # 主导出文件
├── ui/
│   ├── pages/
│   │   ├── index.dart           # 页面导出
│   │   └── profile_page.dart    # 主页面
│   └── widgets/
│       └── index.dart           # 组件导出
```

### 完整模块（--all 选项）
```
lib/features/user_profile/
├── index.dart                    # 主导出文件
├── data/
│   ├── api/
│   │   ├── index.dart           # API 导出
│   │   └── user_profile_api.dart # API 接口
│   └── models/
│       ├── index.dart           # 模型导出
│       └── user_profile_model.dart # 数据模型
└── ui/
    ├── pages/
    │   ├── index.dart           # 页面导出
    │   └── user_profile_page.dart # 主页面
    ├── widgets/
    │   └── index.dart           # 组件导出
    └── providers/
        ├── index.dart           # Provider 导出
        └── user_profile_provider.dart # 状态管理
```

## 🛠️ 选项说明

| 选项 | 说明 | 生成的内容 |
|------|------|------------|
| `--api` | 创建 API 接口 | Retrofit API 类，支持代码生成 |
| `--models` | 创建数据模型 | JSON 序列化模型类 |
| `--provider` | 创建状态管理 | ChangeNotifier Provider 类 |
| `--all` | 创建所有组件 | 包含上述所有内容 |

## 📝 实际使用示例

### 示例 1: 用户设置页面
```bash
dart scripts/create_feature.dart user_settings --models --provider
```

**使用场景**: 需要本地数据存储和状态管理的设置页面
**生成内容**: 页面 + 数据模型 + 状态管理

### 示例 2: 产品列表功能
```bash
dart scripts/create_feature.dart product_list --api --models
```

**使用场景**: 需要从服务器获取数据的列表页面
**生成内容**: 页面 + API 接口 + 数据模型

### 示例 3: 聊天功能模块
```bash
dart scripts/create_feature.dart chat --all
```

**使用场景**: 复杂的功能模块，需要完整的架构支持
**生成内容**: 页面 + API 接口 + 数据模型 + 状态管理

### 示例 4: 简单的关于页面
```bash
dart scripts/create_feature.dart about
```

**使用场景**: 静态内容页面，不需要额外的架构组件
**生成内容**: 仅页面和基础结构

## 🔧 创建后的步骤

### 1. 添加路由配置
在 `lib/shared/router/` 中添加新页面的路由：

```dart
// 在路由配置中添加
GoRoute(
  path: '/profile',
  builder: (context, state) => const ProfilePage(),
),
```

### 2. 注册依赖（如果使用了 API 或 Provider）
在 `lib/core/di/` 中注册服务：

```dart
// 注册 API
getIt.registerLazySingleton<ProfileApi>(
  () => ProfileApi(getIt<Dio>()),
);

// 注册 Provider
getIt.registerFactory<ProfileProvider>(
  () => ProfileProvider(),
);
```

### 3. 生成代码（如果使用了 API 或 Models）
```bash
flutter packages pub run build_runner build
```

### 4. 完善业务逻辑
- 实现 API 接口方法
- 完善数据模型字段
- 添加 Provider 业务逻辑
- 设计页面 UI

## 💡 最佳实践

### 命名规范
- **功能名称**: 使用清晰的业务术语，如 `user_profile`, `product_list`
- **避免通用名称**: 不要使用 `common`, `utils`, `helper` 等
- **多单词**: 使用下划线分隔，如 `shopping_cart`, `order_history`

### 选项选择策略
- **静态页面**: 不使用任何选项
- **展示数据**: 使用 `--models`
- **网络请求**: 使用 `--api --models`
- **复杂交互**: 使用 `--all`

### 开发顺序建议
1. **先搭建 UI 结构**: 完成页面基本布局
2. **定义数据模型**: 确定数据结构
3. **实现 API 接口**: 连接后端服务
4. **添加状态管理**: 处理复杂的状态逻辑

## 🔍 故障排除

### 常见问题

1. **Dart 命令不可用**
   ```bash
   # 检查 Dart 安装
   dart --version
   
   # 如果未安装，通过 Flutter 安装
   flutter doctor
   ```

2. **权限问题**
   - 确保对项目目录有写入权限
   - Windows 用户可能需要以管理员身份运行

3. **目录已存在**
   - 工具会跳过已存在的目录
   - 不会覆盖已存在的文件

4. **代码生成失败**
   ```bash
   # 确保依赖已安装
   flutter pub get
   
   # 清理后重新生成
   flutter packages pub run build_runner clean
   flutter packages pub run build_runner build
   ```

## 🎨 自定义模板

如果需要修改生成的代码模板，可以编辑 `scripts/create_feature.dart` 文件中的模板字符串。

### 修改页面模板
```dart
final pageContent = '''
// 在这里修改页面模板
import 'package:flutter/material.dart';

class \${featureNameCamel}Page extends StatefulWidget {
  // 自定义页面结构
}
''';
```

### 添加新的选项
可以扩展工具添加新的组件类型，如：
- Repository 层
- UseCase 层
- 测试文件

## 📚 相关文档

- [项目架构说明](../README.md)
- [路由配置指南](./routing-guide.md)
- [状态管理最佳实践](./state-management-guide.md)
- [API 集成指南](./api-integration-guide.md)

通过使用这些工具，您可以显著提高开发效率，保持代码结构的一致性，并专注于业务逻辑的实现。
