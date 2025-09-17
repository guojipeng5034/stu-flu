# Flutter 模块化架构演示

这是一个 Flutter 项目，演示了现代化的模块化架构设计，包括功能模块化、分层架构、网络请求、状态管理和 UI 组件的最佳实践。

## 📚 文档导航

- 📖 **[完整文档中心](docs/README.md)** - 所有项目文档的导航中心
- 📊 **[项目概览](docs/PROJECT_OVERVIEW.md)** - 全面的项目介绍和技术架构 ⭐
- 🛠️ **[完整开发指南](docs/guides/DEVELOPMENT_GUIDE.md)** - 从环境配置到部署的完整开发流程 ⭐
- 🏗️ **[项目架构说明](docs/architecture/Flutter项目架构升级说明.md)** - 详细的架构设计文档
- 🚀 **[网络缓存系统](lib/core/network/annotations/README.md)** - 强大的网络缓存使用指南

## 🚀 快速开始

### 环境要求
- Flutter SDK: >=3.0.0
- Dart SDK: >=3.0.0

### 安装和运行

1. **安装依赖**
   ```bash
   flutter pub get
   ```

2. **生成代码**
   ```bash
   dart run build_runner build
   ```

3. **运行应用**
   ```bash
   flutter run
   ```

4. **Web模式运行**
   ```bash
   flutter run -d chrome --web-port=8000
   ```

## 📁 项目结构

```
lib/
├── 📄 main.dart                           # 应用入口
├── 📁 app/                                # 应用配置
├── 📁 core/                               # 🔧 基础设施层
├── 📁 features/                           # 🎯 功能模块层
├── 📁 shared/                             # 🔄 共享组件层
├── 📁 pages/                              # 📱 独立页面层
└── 📁 l10n/                               # 🌍 国际化文件
```

## 🎯 核心特性

- ✅ **模块化架构**：功能模块独立，清晰的边界和职责
- ✅ **三层架构**：Data、Domain、Presentation 分层设计
- ✅ **统一导入**：模块级导出，简化依赖管理
- ✅ **响应式状态管理**：Riverpod StateNotifier
- ✅ **业务逻辑分离**：Service 层处理业务逻辑
- ✅ **共享组件管理**：通用功能统一管理
- ✅ **完整错误处理**：分层错误处理机制
- ✅ **架构演示系统**：完整的演示和文档

## 🧩 演示功能

本项目包含丰富的演示组件，展示了各种 Flutter 功能的使用方法：

### 核心演示
- 🏗️ **架构演示** - 完整的分层架构演示
- 🎓 **学生信息管理** - CRUD 操作演示

### UI 组件演示
- 🎠 **轮播图组件**
- 📅 **日期时间选择器**
- 🏙️ **城市选择器**
- 📐 **屏幕适配演示**

### 功能演示
- 🌐 **网络请求演示**
- 🔄 **状态管理演示**
- 💾 **本地存储演示**
- 🌍 **国际化演示**
- 📱 **权限处理演示**
- 🔗 **URL启动演示**

## 🔧 技术栈

- **架构模式**: 功能模块化 + 分层架构
- **状态管理**: Flutter Riverpod
- **网络请求**: Dio + Retrofit
- **数据模型**: dart_mappable + Extension
- **本地存储**: SharedPreferences
- **路由管理**: GoRouter (Navigator 2.0)
- **日志系统**: 自定义 AppLogger
- **依赖注入**: 自定义 DI 容器
- **错误处理**: 统一错误拦截器

## 📋 主要依赖

```yaml
dependencies:
  flutter_riverpod: ^2.4.10    # 状态管理
  dio: ^5.3.4                   # 网络请求
  retrofit: ^4.0.3              # API客户端生成
  shared_preferences: ^2.2.2    # 本地存储
  dart_mappable: ^4.2.0         # 数据映射
  ntp: ^2.0.0                   # 网络时间同步
  timezone: ^0.9.2              # 时区处理

dev_dependencies:
  build_runner: ^2.4.7          # 代码生成
  retrofit_generator: ^8.0.4    # Retrofit 代码生成
  dart_mappable_builder: ^4.2.0 # Mappable 代码生成
```


