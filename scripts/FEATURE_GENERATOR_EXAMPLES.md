# 功能模块生成器使用示例

## 🚀 快速开始

### 基础使用
```bash
# 创建最简单的功能模块
dart scripts/create_feature.dart profile

# 查看帮助信息
dart scripts/create_feature.dart
```

## 📋 常用场景示例

### 1. 用户相关功能
```bash
# 用户资料页面（完整功能）
dart scripts/create_feature.dart user_profile --all

# 用户设置页面（本地数据 + 状态管理）
dart scripts/create_feature.dart user_settings --models --provider

# 登录页面（仅页面）
dart scripts/create_feature.dart login
```

### 2. 数据展示功能
```bash
# 产品列表（API + 数据模型）
dart scripts/create_feature.dart product_list --api --models

# 新闻列表（API + 数据模型）
dart scripts/create_feature.dart news_list --api --models

# 订单历史（完整功能）
dart scripts/create_feature.dart order_history --all
```

### 3. 交互功能
```bash
# 聊天功能（完整功能）
dart scripts/create_feature.dart chat --all

# 购物车（状态管理 + 数据模型）
dart scripts/create_feature.dart shopping_cart --models --provider

# 搜索功能（API + 数据模型 + 状态管理）
dart scripts/create_feature.dart search --all
```

### 4. 静态页面
```bash
# 关于页面
dart scripts/create_feature.dart about

# 帮助页面
dart scripts/create_feature.dart help

# 隐私政策页面
dart scripts/create_feature.dart privacy_policy
```

## 🎯 选项组合建议

| 功能类型 | 推荐选项 | 说明 |
|----------|----------|------|
| 静态页面 | 无选项 | 仅创建页面和基础结构 |
| 本地数据页面 | `--models` | 需要数据模型的页面 |
| 网络数据页面 | `--api --models` | 需要从服务器获取数据 |
| 复杂交互页面 | `--models --provider` | 需要状态管理的页面 |
| 完整功能模块 | `--all` | 包含所有架构组件 |

## 📁 生成结果预览

### 基础模块 (无选项)
```
lib/features/profile/
├── index.dart
├── ui/
│   ├── pages/
│   │   ├── index.dart
│   │   └── profile_page.dart
│   └── widgets/
│       └── index.dart
```

### 完整模块 (--all)
```
lib/features/user_profile/
├── index.dart
├── data/
│   ├── api/
│   │   ├── index.dart
│   │   └── user_profile_api.dart
│   └── models/
│       ├── index.dart
│       └── user_profile_model.dart
└── ui/
    ├── pages/
    │   ├── index.dart
    │   └── user_profile_page.dart
    ├── widgets/
    │   └── index.dart
    └── providers/
        ├── index.dart
        └── user_profile_provider.dart
```

## 🔧 创建后的步骤

### 1. 添加路由
```dart
// 在路由配置中添加
GoRoute(
  path: '/profile',
  builder: (context, state) => const ProfilePage(),
),
```

### 2. 注册依赖（如果使用了 API 或 Provider）
```dart
// 在 DI 容器中注册
getIt.registerLazySingleton<ProfileApi>(
  () => ProfileApi(getIt<Dio>()),
);

getIt.registerFactory<ProfileProvider>(
  () => ProfileProvider(),
);
```

### 3. 生成代码（如果使用了 API 或 Models）
```bash
flutter packages pub run build_runner build
```

## 💡 最佳实践

### 命名建议
- 使用清晰的业务术语：`user_profile`, `product_list`, `order_history`
- 避免技术术语：不要使用 `widget`, `page`, `screen` 等后缀
- 使用下划线分隔多个单词：`shopping_cart`, `payment_method`

### 开发流程建议
1. **先创建基础模块**：`dart scripts/create_feature.dart feature_name`
2. **完善页面 UI**：设计和实现用户界面
3. **添加数据层**：如果需要，重新生成包含 API 和 Models 的版本
4. **实现业务逻辑**：完善 Provider 和 API 调用
5. **集成到应用**：添加路由和依赖注入

### 团队协作
- 统一使用此工具创建新功能模块
- 保持项目结构的一致性
- 定期更新和维护模板内容

## 🔍 故障排除

### 常见错误
1. **目录已存在**：工具会跳过已存在的目录，不会覆盖文件
2. **权限问题**：确保对项目目录有写入权限
3. **Dart 环境**：确保 Dart SDK 已正确安装

### 验证安装
```bash
# 检查 Dart 版本
dart --version

# 检查 Flutter 环境
flutter doctor

# 测试脚本
dart scripts/create_feature.dart --help
```

通过这些示例，您可以快速上手功能模块生成器，提高开发效率！
