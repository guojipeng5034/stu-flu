# 演示路由模块

这个模块专门管理应用中所有演示和测试相关的路由，保持 `app_router.dart` 的简洁性。

## 📁 文件结构

```
lib/router/demo/
├── index.dart              # 统一导出文件
├── demo_router.dart        # 演示路由管理器
├── router_test_page.dart   # 路由测试页面
└── README.md              # 说明文档
```

## 🚀 使用方式

### 在 app_router.dart 中使用

```dart
import 'demo/index.dart';

// 在路由配置中添加演示路由
routes: [
  // ... 其他路由
  
  // 演示和测试路由
  ...DemoRouter.getRoutes(),
],
```

### 添加新的演示路由

1. 在 `lib/pages/examples/` 中创建新的演示页面
2. 在 `lib/pages/examples/example_routes.dart` 中添加路由配置
3. 在 `lib/pages/examples/index.dart` 中导出新页面
4. 演示路由会自动生效，无需修改 `demo_router.dart`

## 📋 功能特性

### DemoRouter 类

- **getRoutes()**: 获取所有演示相关的路由配置
- **getAllDemoRoutes()**: 获取所有演示路由的路径列表（用于调试）
- **isDemoRoute()**: 检查路径是否为演示路由
- **_buildNotFoundPage()**: 构建统一的404页面

### RouterTestPage 类

- 提供所有路由的可视化测试界面
- 支持快速导航到任意页面
- 显示路由调试信息
- 分组展示不同类型的路由

### 路由前缀

- `/examples/*` - 演示页面路由
- `/demo-list` - 演示列表页面
- `/router-test` - 路由测试页面

## 🔧 配置说明

### 路由守卫

演示路由被配置为公开路由，不需要登录即可访问：

```dart
// 在 route_guards.dart 中
final List<String> _publicPathPrefixes = [
  RouteNames.examplesPrefix,  // '/examples'
  // ...
];
```

### 错误处理

当访问不存在的演示路由时，会显示统一的404页面，并提供返回演示列表的按钮。

## 🎯 设计原则

1. **分离关注点**: 将演示路由与核心业务路由分离
2. **统一管理**: 所有演示相关的路由配置集中在一个模块中
3. **易于维护**: 添加新演示页面时无需修改核心路由文件
4. **开发友好**: 提供路由测试页面，方便开发和调试

## 📝 注意事项

- 演示路由主要用于开发和测试，生产环境可以通过配置禁用
- 路由测试页面包含了所有可用路由的快速访问入口
- 演示页面的具体实现在 `lib/pages/examples/` 目录中
- 路由配置遵循 GoRouter 的最佳实践

## 🔄 迁移说明

从旧的路由结构迁移到新结构：

1. **路由前缀变更**: `/demo` → `/examples`
2. **类名变更**: `DemoRoutes` → `ExampleRoutes`
3. **文件位置**: 演示路由配置从 `app_router.dart` 移至 `demo_router.dart`
4. **导入方式**: 使用 `import 'demo/index.dart'` 统一导入

这种设计使得路由系统更加模块化和可维护。
