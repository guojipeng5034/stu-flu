# Core 基础设施层

Core 层是项目的基础设施层，提供纯技术性的组件和工具，不包含任何业务逻辑。这些组件可以被项目中的任何层使用，也可以在其他项目中复用。

## 📁 目录结构

```
lib/core/
├── README.md                              # 📚 本文件
├── index.dart                             # 🔗 统一导出
│
├── di/                                    # 💉 依赖注入
│   └── di.dart                            # Riverpod 依赖注入配置
│
├── error/                                 # ❌ 错误处理
│   ├── error_handler.dart                 # 全局错误处理器
│   ├── exceptions.dart                    # 自定义异常类
│   ├── failure.dart                       # 失败类定义
│   └── index.dart                         # 错误处理导出
│
├── mapping/                               # 🔄 数据映射
│   └── mappable_config.dart               # dart_mappable 全局配置
│
├── network/                               # 🌐 网络基础设施
│   ├── config/                            # 网络配置
│   ├── interceptors/                      # 网络拦截器
│   │   ├── auth_interceptor.dart          # 认证拦截器
│   │   └── logging_interceptor.dart       # 日志拦截器
│   ├── converters/                        # 数据转换器
│   ├── events/                            # 网络事件
│   │   └── auth_events.dart               # 认证相关事件
│   └── retrofit/                          # API 客户端
│       └── api_manager.dart               # API 管理器
│
├── storage/                               # 💾 存储基础设施
│   ├── storage_service.dart               # 存储服务接口
│   └── secure_storage.dart                # 安全存储实现
│
├── localization/                          # 🌍 本地化基础设施
│   ├── config/                            # 本地化配置
│   │   └── localization_config.dart       # 本地化配置类
│   ├── extensions/                        # 扩展方法
│   │   └── app_localizations_extension.dart # 本地化扩展
│   └── utils/                             # 本地化工具
│       └── localization_utils.dart        # 本地化工具类
│
├── logger/                                # 📝 日志系统
│   ├── app_logger.dart                    # 应用日志器
│   ├── log_interceptor.dart               # 日志拦截器
│   ├── log_examples.dart                  # 日志使用示例
│   ├── README.md                          # 日志系统说明
│   └── index.dart                         # 日志系统导出
│
├── time/                                  # ⏰ 时间工具
│   ├── time_util.dart                     # 时间工具类
│   ├── streaming_time_util.dart           # 流式时间工具
│   └── index.dart                         # 时间工具导出
│
├── extensions/                            # 🔧 扩展方法
│   ├── string_extensions.dart             # 字符串扩展方法
│   ├── datetime_extensions.dart           # 日期时间扩展方法
│   └── index.dart                         # 扩展方法导出
│
└── platform/                             # 📱 平台相关工具
    ├── device_info.dart                   # 设备信息工具
    └── index.dart                         # 平台工具导出
```

## 🎯 设计原则

### ✅ Core 层应该包含的内容
- **纯技术性组件** - 与框架、平台、基础设施相关
- **无业务依赖** - 不依赖任何业务模型或逻辑
- **高复用性** - 可以在其他项目中直接复用
- **基础功能** - 网络、存储、日志、错误处理等

### ❌ Core 层不应该包含的内容
- **业务逻辑** - 与特定业务相关的处理
- **业务模型** - 特定于业务领域的数据模型
- **UI 组件** - 用户界面相关的组件
- **页面逻辑** - 特定页面的处理逻辑

## 🔧 使用方法

### 统一导入 (推荐)
```dart
import 'package:cptop/core/index.dart';

// 使用日志
Log.i('This is an info message');

// 使用时间工具
final currentTime = await TimeUtil.getCurrentTime();

// 使用扩展方法
final email = 'test@example.com';
if (email.isValidEmail) {
  print('Valid email');
}

// 使用平台工具
if (DeviceInfo.isMobile) {
  print('Running on mobile');
}
```

### 分别导入
```dart
// 只导入日志系统
import 'package:cptop/core/logger/index.dart';

// 只导入时间工具
import 'package:cptop/core/time/index.dart';

// 只导入扩展方法
import 'package:cptop/core/extensions/index.dart';

// 只导入平台工具
import 'package:cptop/core/platform/index.dart';
```

## 📚 组件说明

### 💉 依赖注入 (di/)
- 基于 Riverpod 的依赖注入配置
- 提供全局的服务提供者
- 管理应用程序的依赖关系

### ❌ 错误处理 (error/)
- 全局错误处理器
- 自定义异常类型
- 错误日志记录

### 🔄 数据映射 (mapping/)
- dart_mappable 全局配置
- 数据序列化/反序列化设置
- JSON 转换配置

### 🌐 网络基础设施 (network/)
- HTTP 客户端配置
- 请求/响应拦截器
- API 管理器
- 网络事件处理

### 💾 存储基础设施 (storage/)
- 本地存储服务接口
- 安全存储实现
- 缓存管理

### 🌍 本地化基础设施 (localization/)
- 本地化配置管理
- 扩展方法
- 工具函数

### 📝 日志系统 (logger/)
- 统一的日志接口
- 多级别日志输出
- 日志格式化
- 网络请求日志

### ⏰ 时间工具 (time/)
- NTP 时间同步
- 实时时间流
- 时间格式化
- 时区处理

### 🔧 扩展方法 (extensions/)
- 字符串扩展 (验证、转换、格式化)
- 日期时间扩展 (计算、判断、格式化)
- 其他 Dart 类型扩展

### 📱 平台工具 (platform/)
- 设备信息获取
- 平台检测
- 环境变量访问
- 调试模式判断

## 🚀 添加新组件

### 1. 确定组件类型
确保新组件符合 Core 层的设计原则：
- 纯技术性
- 无业务依赖
- 高复用性

### 2. 创建组件目录
```bash
mkdir lib/core/new_component
```

### 3. 实现组件
```dart
// lib/core/new_component/new_component.dart
class NewComponent {
  // 实现组件功能
}
```

### 4. 创建导出文件
```dart
// lib/core/new_component/index.dart
export 'new_component.dart';
```

### 5. 更新统一导出
```dart
// lib/core/index.dart
export 'new_component/index.dart';
```

## 📝 注意事项

1. **保持纯净性** - 不要在 Core 层引入业务逻辑
2. **文档完善** - 为每个组件添加详细的文档注释
3. **测试覆盖** - 为组件编写单元测试
4. **性能考虑** - 注意组件的性能影响
5. **向后兼容** - 修改现有组件时要考虑向后兼容性

## 🔗 相关文档

- [业务工具层 (lib/utils/)](../utils/README.md)
- [API 数据访问层 (lib/api/)](../api/README.md)
- [项目架构文档](../../docs/architecture.md)
