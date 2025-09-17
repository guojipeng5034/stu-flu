# Flutter 开发脚本

## 🎯 概述

这个目录包含了 Flutter 项目的各种开发工具脚本，支持模块化的开发任务管理。

## 📁 脚本文件

### 🚀 主要脚本
- **`dev.js`** - 统一开发工具入口（推荐使用）
- **`dev-config.js`** - 开发脚本配置文件

### 🔧 功能模块
- **`modules/task-manager.js`** - 任务管理器
- **`modules/translation-watcher.js`** - 翻译文件监听器
- **`modules/build-runner.js`** - Build Runner 模块

### 🏗️ 功能模块生成工具（NEW!）
- **`create_feature.dart`** - 跨平台 Dart 脚本，快速创建功能模块

### 🔄 传统脚本（兼容性保留）
- **`watch_translations.js`** - 翻译监听脚本（已被 dev.js 替代）
- **`build_translations.js`** - 一次性构建脚本
- **`test_build.js`** - 测试构建脚本
- **`convert_imports.dart`** - 导入转换脚本

## 🚀 使用方法

### 推荐方式: 统一开发脚本

```bash
# 交互式选择（推荐）
node scripts/dev.js

# 显示帮助信息
node scripts/dev.js --help
```

### 快速创建功能模块

```bash
# 跨平台 Dart 脚本
dart scripts/create_feature.dart profile
dart scripts/create_feature.dart user_settings --api --models --provider
dart scripts/create_feature.dart chat --all
```

**功能特性：**
- 📝 翻译文件监听器 - 自动监听 ARB 文件变化并执行 `flutter gen-l10n`
- 🏗️ Build Runner - 支持监听模式和手动模式的代码生成
- 🎛️ 任务管理器 - 统一管理多个任务的生命周期
- 🔄 交互式控制 - 提供友好的交互界面和快捷键操作
- 📊 状态监控 - 实时显示任务运行状态

### 命令行参数

```bash
# 只启动翻译监听器
node scripts/dev.js --translation
node scripts/dev.js -t

# 只启动 Build Runner (手动模式)
node scripts/dev.js --build-runner
node scripts/dev.js -b

# 只启动 Build Runner (监听模式)
node scripts/dev.js --build-runner-watch
node scripts/dev.js -bw

# 启动翻译监听 + Build Runner 监听
node scripts/dev.js -t -bw

# 启动所有任务
node scripts/dev.js --all
node scripts/dev.js -a
```

### 交互式控制

启动任务后，可以使用以下快捷键：

- `r/R` - 手动刷新翻译系统
- `b/B` - 手动执行 build_runner
- `s/S` - 显示所有任务状态
- `h/H` - 显示帮助信息
- `q/Q` - 停止所有任务并退出

### 传统方式（兼容性保留）

```bash
# 翻译监听（旧方式）
node scripts/watch_translations.js

# 一次性构建
node scripts/build_translations.js

# 测试构建
node scripts/test_build.js
```

## 🔧 模块说明

### dev.js - 统一开发工具入口
模块化的开发脚本，支持多个开发任务的并发管理，任务间无耦合。

**架构优势：**
- 🔄 模块化设计 - 各功能模块独立，易于维护和扩展
- 🎛️ 统一管理 - 通过任务管理器统一控制所有开发任务
- 📊 状态监控 - 实时显示任务运行状态和性能指标
- 🔧 灵活配置 - 支持命令行参数和配置文件自定义
- 🛡️ 错误隔离 - 单个任务错误不影响其他任务运行

### modules/task-manager.js
任务管理器，负责：
- 管理多个任务的生命周期
- 提供任务状态监控
- 防止任务间相互干扰
- 支持任务的启动、停止、重启

### modules/translation-watcher.js
翻译文件监听器，负责：
- 监听 `lib/l10n/arb/` 目录下的 ARB 文件变化
- 自动执行 `flutter gen-l10n`
- 提供防抖处理，避免频繁触发
- 支持手动触发更新

### modules/build-runner.js
Build Runner 模块，负责：
- 执行 `flutter pub run build_runner build`
- 支持文件监听模式和手动模式
- 智能过滤生成的文件，避免无限循环
- 提供清理功能

## ⚙️ 配置

可以通过修改 `dev-config.js` 来自定义各个模块的配置：

```javascript
module.exports = {
    translation: {
        arbDir: 'lib/l10n/arb',
        debounceDelay: 1000
    },
    buildRunner: {
        watchDirs: ['lib'],
        debounceDelay: 2000,
        excludePatterns: ['**/*.g.dart', '**/*.freezed.dart']
    }
};
```

## 🔄 迁移指南

### 从旧的 watch_translations.js 迁移

旧方式：
```bash
node scripts/watch_translations.js
```

新方式：
```bash
# 只启动翻译监听
node scripts/dev.js -t

# 或者交互式选择
node scripts/dev.js
```

### 优势对比

| 特性 | 旧脚本 | 新脚本 |
|------|--------|--------|
| 功能耦合 | 高 | 无耦合 |
| 扩展性 | 差 | 优秀 |
| 任务管理 | 无 | 完整 |
| 交互控制 | 基础 | 丰富 |
| 状态监控 | 无 | 完整 |
| 错误处理 | 基础 | 完善 |

## 📋 前置条件

### 必需文件
- `lib/l10n/arb/` 目录存在
- `l10n.yaml` 配置文件存在

### 环境要求
- Flutter SDK
- Dart SDK
- Node.js

## 🎯 推荐工作流程

### 开发阶段
1. 启动开发脚本：`node scripts/dev.js`
2. 选择需要的任务组合
3. 编辑代码和翻译文件
4. 享受自动化的构建流程

### 构建阶段
1. 执行完整构建：`node scripts/dev.js --all`
2. 确保所有生成文件都是最新的

## 🔍 故障排除

### 常见问题

1. **Node.js未安装**
   - 下载安装Node.js：https://nodejs.org/

2. **Flutter命令不可用**
   - 确保Flutter SDK已正确安装并添加到PATH

3. **ARB目录不存在**
   - 创建 `lib/l10n/arb/` 目录
   - 添加至少一个ARB文件（如 `app_en.arb`）

### 调试模式

如果遇到问题，可以手动执行每个步骤来定位问题：

```bash
# 检查Flutter环境
flutter doctor

# 检查本地化配置
flutter gen-l10n --help

# 检查build_runner
flutter pub run build_runner --help


```

## 💡 最佳实践

1. **开发时推荐使用交互模式**：
   ```bash
   node scripts/dev.js
   ```

2. **CI/CD 中使用命令行参数**：
   ```bash
   node scripts/dev.js --build-runner
   ```

3. **根据需要选择合适的任务组合**：
   - 只修改翻译：使用 `-t`
   - 只修改代码生成：使用 `-bw`
   - 全功能开发：使用 `--all`

4. **利用配置文件自定义行为**：
   修改 `dev-config.js` 来适应项目需求

## 🚨 注意事项

- 确保项目根目录存在 `l10n.yaml` 配置文件
- 确保 `lib/l10n/arb/` 目录存在且包含 ARB 文件
- Build Runner 需要项目中有相关的代码生成依赖
- 使用 `Ctrl+C` 可以优雅地停止所有任务
- 新脚本完全向后兼容，旧脚本仍可正常使用

---

## 🏗️ 功能模块快速生成工具

### 概述

为了解决创建新功能模块时需要手动创建大量目录和文件的问题，我们提供了自动化的功能模块生成工具。这些工具可以快速创建符合项目架构的完整功能模块结构。

### 可用工具

#### Dart 脚本 (推荐)
- **文件**: `create_feature.dart`
- **适用**: 跨平台，需要 Dart 环境
- **功能**: 完整功能，与 Flutter 项目完美集成

### 使用方法

```bash
# 基础用法 - 创建最简单的功能模块
dart scripts/create_feature.dart profile

# 创建包含 API 的功能模块
dart scripts/create_feature.dart user_settings --api

# 创建包含数据模型的功能模块
dart scripts/create_feature.dart product --models

# 创建包含状态管理的功能模块
dart scripts/create_feature.dart chat --provider

# 创建完整功能模块（包含所有组件）
dart scripts/create_feature.dart order --all

# 创建包含特定组件的功能模块
dart scripts/create_feature.dart user_profile --api --models --provider
```

### 选项说明

| 选项 | 说明 | 创建的文件 |
|------|------|------------|
| `--api` | 创建 API 相关文件 | `data/api/` 目录和 API 类 |
| `--models` | 创建 Model 相关文件 | `data/models/` 目录和数据模型 |
| `--provider` | 创建 Provider 相关文件 | `ui/providers/` 目录和状态管理 |
| `--all` | 创建所有可选文件 | 包含上述所有文件 |

### 生成的目录结构

#### 基础结构 (无选项)
```
lib/features/[feature_name]/
├── index.dart                    # 主导出文件
├── ui/
│   ├── pages/
│   │   ├── index.dart           # 页面导出
│   │   └── [feature_name]_page.dart  # 主页面
│   └── widgets/
│       └── index.dart           # 组件导出
```

#### 完整结构 (所有选项)
```
lib/features/[feature_name]/
├── index.dart                    # 主导出文件
├── data/
│   ├── api/
│   │   ├── index.dart           # API 导出
│   │   └── [feature_name]_api.dart    # API 接口
│   └── models/
│       ├── index.dart           # 模型导出
│       └── [feature_name]_model.dart  # 数据模型
└── ui/
    ├── pages/
    │   ├── index.dart           # 页面导出
    │   └── [feature_name]_page.dart    # 主页面
    ├── widgets/
    │   └── index.dart           # 组件导出
    └── providers/
        ├── index.dart           # Provider 导出
        └── [feature_name]_provider.dart # 状态管理
```

### 创建后的步骤

1. **添加路由**: 在路由配置中添加新页面
2. **实现业务逻辑**: 根据需要完善各个文件
3. **生成代码** (如果使用了 API 或 Models):
   ```bash
   flutter packages pub run build_runner build
   ```
4. **添加依赖注入**: 在 DI 容器中注册新的服务和 Provider

### 实际使用示例

#### 示例 1: 创建用户资料功能模块
```bash
dart scripts/create_feature.dart user_profile --api --models --provider
```

这将创建:
- 用户资料页面 (`UserProfilePage`)
- API 接口定义 (`UserProfileApi`)
- 用户数据模型 (`UserProfileModel`)
- 状态管理 Provider (`UserProfileProvider`)
- 所有必要的导出文件

#### 示例 2: 创建简单的设置页面
```bash
dart scripts/create_feature.dart settings
```

这将创建:
- 设置页面 (`SettingsPage`)
- 基础的组件目录结构
- 导出文件

#### 示例 3: 创建产品列表功能（仅需要 API 和 Models）
```bash
dart scripts/create_feature.dart product_list --api --models
```

这将创建:
- 产品列表页面
- API 接口定义
- 产品数据模型
- 不包含 Provider（如果使用其他状态管理方案）

### 注意事项

1. **命名规范**:
   - 功能名称会自动转换为下划线格式的文件名 (`user_profile`)
   - 类名会转换为驼峰格式 (`UserProfile`)
   - 支持多单词输入，会自动处理空格和特殊字符

2. **目录冲突**:
   - 如果目录已存在，工具会跳过创建但仍会创建文件
   - 不会覆盖已存在的文件，确保安全性

3. **代码生成**:
   - 使用 API 或 Models 选项后，需要运行 `flutter packages pub run build_runner build`
   - 确保项目中已添加相关依赖 (`retrofit`, `json_annotation`, `build_runner` 等)

4. **路由配置**:
   - 创建页面后需要手动添加到路由配置中
   - 建议在 `lib/shared/router/` 中添加路由定义

5. **依赖注入**:
   - 如果创建了 API 或 Provider，需要在 DI 容器中注册
   - 通常在 `lib/core/di/` 中配置

### 自定义和扩展

您可以根据项目需要修改这些工具:

#### 修改模板内容
编辑脚本文件中的模板字符串来自定义生成的代码结构：
- 页面模板
- API 接口模板
- 数据模型模板
- Provider 模板

#### 调整目录结构
修改脚本中的目录路径来适应不同的项目结构：
```dart
// 在 Dart 脚本中修改
basePath = 'lib/features/$featureName';  // 可以改为其他路径
```

#### 添加新选项
可以扩展脚本添加新的选项，如：
- `--repository` - 创建 Repository 层
- `--usecase` - 创建 UseCase 层
- `--test` - 创建测试文件

#### 集成到 IDE
可以将这些脚本集成到 VS Code 或其他 IDE 中：
- 创建 VS Code 任务
- 添加到工具栏
- 设置快捷键

### 最佳实践

1. **功能模块命名**:
   - 使用清晰、描述性的名称
   - 避免过于通用的名称如 `common`, `utils`
   - 推荐使用业务领域相关的名称

2. **选项选择**:
   - 简单的静态页面：不使用任何选项
   - 需要网络请求的功能：使用 `--api` 和 `--models`
   - 复杂的状态管理：添加 `--provider`

3. **后续开发**:
   - 先完善页面 UI 结构
   - 再实现 API 接口和数据模型
   - 最后添加状态管理逻辑

4. **团队协作**:
   - 在团队中统一使用这些工具
   - 保持代码结构的一致性
   - 定期更新和维护模板

### 故障排除

#### 常见问题

1. **Dart 环境问题**:
   - 确保 Dart SDK 已正确安装
   - 检查 PATH 环境变量
   ```bash
   dart --version
   ```

2. **权限不足**:
   - 确保对项目目录有写入权限
   - 在 Unix 系统上可能需要调整文件权限

3. **路径问题**:
   - 确保在项目根目录执行脚本
   - 检查相对路径是否正确

4. **依赖问题**:
   - 确保项目中已添加必要的依赖包
   - 运行 `flutter pub get` 更新依赖

通过这些工具，您可以大大提高开发效率，减少重复的手动工作，并确保项目结构的一致性。
