# App 应用层

App 层是应用程序的最顶层，负责应用的启动、配置和全局设置。这一层定义了应用的整体结构和行为。

## 📁 目录结构

```
lib/app/
├── README.md                              # 📚 本文件
├── index.dart                             # 🔗 统一导出
│
├── bootstrap/                             # 🚀 应用启动
│   └── app.dart                           # 主应用类 (MyApp)
│
├── config/                                # ⚙️ 应用配置
│   ├── constants.dart                     # 应用常量
│   └── env/                               # 环境配置
│       ├── env_loader.dart                # 环境变量加载器
│       └── index.dart                     # 环境配置导出
│
└── theme/                                 # 🎨 应用主题
    └── app_theme.dart                     # 主题配置
```

## 🎯 设计原则

### ✅ App 层应该包含的内容
- **应用启动逻辑** - MyApp 类和应用初始化
- **全局配置** - 应用级别的配置和常量
- **主题定义** - 应用的视觉主题
- **环境设置** - 不同环境的配置

### ❌ App 层不应该包含的内容
- **业务逻辑** - 具体的业务处理逻辑
- **页面组件** - 具体的页面实现
- **数据模型** - 业务数据模型
- **API 调用** - 具体的网络请求

## 🔧 使用方法

### 统一导入
```dart
import 'package:cptop/app/index.dart';

// 使用应用类
runApp(const MyApp());

// 使用主题
MaterialApp(
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
);

// 使用常量
Text(AppConstants.appName);
```

### 分别导入
```dart
// 只导入应用启动
import 'package:cptop/app/bootstrap/app.dart';

// 只导入主题
import 'package:cptop/app/theme/app_theme.dart';

// 只导入配置
import 'package:cptop/app/config/constants.dart';
```

## 📚 组件说明

### 🚀 应用启动 (bootstrap/)
- **app.dart** - 主应用类 (MyApp)
  - 配置路由
  - 设置主题
  - 配置本地化
  - 处理应用级别的状态

### ⚙️ 应用配置 (config/)
- **constants.dart** - 应用常量
  - 应用名称
  - 版本信息
  - 默认配置值
- **env/** - 环境配置
  - 开发环境配置
  - 生产环境配置
  - 环境变量加载

### 🎨 应用主题 (theme/)
- **app_theme.dart** - 主题配置
  - 亮色主题
  - 暗色主题
  - 颜色定义
  - 字体配置

## 🔄 与其他层的关系

### 依赖关系
```
App 层
  ↓
Core 层 (基础设施)
  ↓
其他业务层
```

- **App 层** 依赖 Core 层的基础设施
- **App 层** 不直接依赖业务层
- **App 层** 通过路由间接使用页面层

### 职责边界
| 层级 | 职责 | 示例 |
|------|------|------|
| **App** | 应用级配置和启动 | 主题、路由、本地化配置 |
| **Core** | 基础设施和技术组件 | 网络、存储、日志 |
| **Business** | 业务逻辑和数据 | API、服务、模型 |
| **UI** | 用户界面 | 页面、组件、状态管理 |

## 🚀 添加新配置

### 1. 添加新的应用常量
```dart
// lib/app/config/constants.dart
class AppConstants {
  static const String appName = 'My App';
  static const String version = '1.0.0';
  static const int timeoutSeconds = 30;
  
  // 添加新常量
  static const String newConstant = 'value';
}
```

### 2. 添加新的主题配置
```dart
// lib/app/theme/app_theme.dart
class AppTheme {
  // 添加新的颜色
  static const Color primaryColor = Colors.blue;
  static const Color accentColor = Colors.orange;
  
  // 添加新的主题
  static ThemeData get customTheme {
    return ThemeData(
      // 自定义主题配置
    );
  }
}
```

### 3. 添加新的环境配置
```dart
// lib/app/config/env/staging_config.dart
class StagingConfig {
  static const String apiBaseUrl = 'https://staging-api.example.com';
  static const bool debugMode = true;
}
```

## 📝 注意事项

1. **保持简洁** - App 层应该保持简洁，只包含应用级别的配置
2. **避免业务逻辑** - 不要在 App 层添加具体的业务处理逻辑
3. **配置集中** - 将相关的配置集中在一起，便于管理
4. **环境隔离** - 不同环境的配置要明确分离
5. **主题一致** - 确保主题配置的一致性和可维护性

## 🔗 相关文档

- [Core 基础设施层 (lib/core/)](../core/README.md)
- [路由配置 (lib/router/)](../router/README.md)
- [项目架构文档](../../docs/architecture.md)

## 🎉 重构说明

### 为什么重命名 `core` 为 `bootstrap`？

1. **避免命名冲突** - 与 `lib/core/` 区分开来
2. **语义更明确** - bootstrap 明确表示"应用启动"
3. **符合惯例** - 许多框架使用 bootstrap 表示启动逻辑
4. **职责清晰** - 明确表达应用启动和引导的职责

### 重构前后对比

**重构前**:
```
lib/app/core/          # ❌ 与 lib/core/ 冲突
├── app.dart
└── theme.dart
```

**重构后**:
```
lib/app/bootstrap/     # ✅ 语义明确，无冲突
└── app.dart

lib/app/theme/         # ✅ 主题独立目录
└── app_theme.dart
```
