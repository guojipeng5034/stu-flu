# 🏗️ 模块化技术架构详解

## 📋 架构概述

本项目采用功能模块化的分层架构，每个功能模块都遵循清晰的三层架构：

```
┌─────────────────────────────────────────────────────────────┐
│                   UI Layer (Pages/Widgets)                  │
├─────────────────────────────────────────────────────────────┤
│              State Management (Providers)                   │
├─────────────────────────────────────────────────────────────┤
│               Business Service Layer                        │
├─────────────────────────────────────────────────────────────┤
│                    API Layer (Retrofit)                     │
├─────────────────────────────────────────────────────────────┤
│                 Infrastructure (Core)                       │
└─────────────────────────────────────────────────────────────┘
```

## 📁 详细项目结构

```
lib/
├── 📄 main.dart                           # 应用入口
│
├── 📁 app/                                # 应用配置
│   ├── config/                            # 环境配置、主题配置
│   └── theme/                             # 主题配置
│
├── 📁 core/                               # 🔧 基础设施层
│   ├── network/                           # 🌐 网络基础设施
│   │   ├── interceptors/                  # 拦截器
│   │   │   ├── auth_interceptor.dart      # 认证拦截器
│   │   │   └── logging_interceptor.dart   # 日志拦截器
│   │   └── retrofit/                      # API客户端
│   │       └── dio_client.dart            # Dio客户端配置
│   ├── storage/                           # 💾 存储服务
│   ├── logger/                            # 📝 日志系统
│   ├── auth/                              # 🔐 认证基础服务
│   └── di/                                # 🔧 依赖注入
│
├── 📁 features/                           # 🎯 功能模块层
│   ├── features.dart                      # 所有模块统一导出
│   ├── auth/                              # 🔐 认证模块
│   │   ├── auth.dart                      # 模块导出
│   │   ├── data/                          # 数据层
│   │   │   ├── api/                       # API接口
│   │   │   ├── models/                    # 数据模型
│   │   │   └── repositories/              # 数据仓库
│   │   ├── domain/                        # 业务层
│   │   │   ├── entities/                  # 业务实体
│   │   │   ├── services/                  # 业务服务
│   │   │   └── usecases/                  # 用例
│   │   └── presentation/                  # 表现层
│   │       ├── pages/                     # 页面
│   │       ├── widgets/                   # 组件
│   │       └── providers/                 # 状态管理
│   ├── student/                           # 🎓 学生模块
│   │   ├── student.dart                   # 模块导出
│   │   ├── data/                          # 数据层
│   │   ├── domain/                        # 业务层
│   │   └── presentation/                  # 表现层
│   ├── site/                              # 🏢 站点模块
│   │   ├── site.dart                      # 模块导出
│   │   ├── data/                          # 数据层
│   │   ├── domain/                        # 业务层
│   │   └── presentation/                  # 表现层
│   ├── user/                              # 👤 用户模块
│   │   ├── user.dart                      # 模块导出
│   │   ├── data/                          # 数据层
│   │   ├── domain/                        # 业务层
│   │   └── presentation/                  # 表现层
│   └── localization/                      # 🌐 本地化模块
│       ├── localization.dart              # 模块导出
│       ├── data/                          # 数据层
│       ├── domain/                        # 业务层
│       └── presentation/                  # 表现层
│
├── 📁 shared/                             # 🔄 共享组件层
│   ├── widgets/                           # 🧩 通用UI组件
│   ├── utils/                             # 🛠️ 业务工具
│   └── router/                            # 🛣️ 路由配置
│
├── 📁 pages/                              # 📱 独立页面层
│   ├── examples/                          # 组件演示页面
│   ├── home/                              # 应用主页
│   ├── public/                            # 公共页面
│   └── splash/                            # 启动页面
│
└── 📁 l10n/                               # 🌍 国际化文件
    ├── arb/                               # ARB翻译文件
    └── generated/                         # 生成的本地化代码
```

## 🏗️ 模块化架构特点

### 核心设计理念

本项目采用 **功能模块化 + 分层架构** 的设计，具有以下特点：

1. **功能模块化**：每个功能独立成模块，清晰的边界和职责
2. **三层架构**：Data、Domain、Presentation 分层，职责明确
3. **统一导入**：模块级导出，简化依赖管理
4. **共享组件**：通用功能统一管理，避免重复

### 📦 模块依赖关系

```
┌─────────────────────────────────────────────────────────────┐
│                   Presentation Layer                        │
│  ┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐│
│  │     Pages       │ │    Widgets      │ │   Providers     ││
│  └─────────────────┘ └─────────────────┘ └─────────────────┘│
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    Domain Layer                             │
│  ┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐│
│  │    Entities     │ │    Services     │ │    UseCases     ││
│  └─────────────────┘ └─────────────────┘ └─────────────────┘│
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                     Data Layer                              │
│  ┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐│
│  │      APIs       │ │     Models      │ │  Repositories   ││
│  └─────────────────┘ └─────────────────┘ └─────────────────┘│
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                 Infrastructure Layer                        │
│  ┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐│
│  │    Network      │ │    Storage      │ │      Core       ││
│  └─────────────────┘ └─────────────────┘ └─────────────────┘│
└─────────────────────────────────────────────────────────────┘
```

## 🔧 网络层配置

### 1. Dio 客户端配置

```dart
// lib/core/network/retrofit/dio_client.dart
class DioClient {
  static Dio getInstance({
    required StorageService storageService,
    required AuthService authService,
    required NetworkConfig config,
  }) {
    final dio = Dio(BaseOptions(
      baseUrl: config.baseUrl,
      connectTimeout: config.connectTimeout,
      receiveTimeout: config.receiveTimeout,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // 添加拦截器
    dio.interceptors.addAll([
      AuthInterceptor(storageService, authService),
      LoggingInterceptor(),
      ErrorInterceptor(),
    ]);

    return dio;
  }
}
```

### 2. 模块化导入方式

```dart
// 方式一：导入整个模块
import 'package:cptop/features/student/index.dart';

// 方式二：导入特定组件
import 'package:cptop/features/student/data/api/student_api.dart';
import 'package:cptop/features/student/data/services/student_service.dart';
import 'package:cptop/features/student/ui/providers/student_provider.dart';

// 方式三：导入共享组件
import 'package:cptop/shared/widgets/common_button.dart';
import 'package:cptop/shared/utils/date_utils.dart';
```

### 3. API 接口定义

```dart
// lib/features/student/data/api/student_api.dart
@RestApi()
abstract class StudentApi {
  factory StudentApi(Dio dio) = _StudentApi;

  @GET('/students/{id}')
  Future<ApiResponse<Student>> getStudent(@Path('id') int id);

  @GET('/students')
  Future<ApiResponse<List<Student>>> getStudents();

  @POST('/students')
  Future<ApiResponse<Student>> createStudent(@Body() Student student);
}
```

## 📱 核心特性

- ✅ **模块化架构**：功能模块独立，清晰的边界和职责
- ✅ **三层架构**：Data、Domain、Presentation 分层设计
- ✅ **统一导入**：模块级导出，简化依赖管理
- ✅ **响应式状态管理**：Riverpod StateNotifier
- ✅ **业务逻辑分离**：Service 层处理业务逻辑
- ✅ **共享组件管理**：通用功能统一管理
- ✅ **完整错误处理**：分层错误处理机制
- ✅ **架构演示系统**：完整的演示和文档

## 🎯 架构演示

本项目包含完整的架构演示，展示了简化分层架构的实际应用：

### 演示内容

1. **架构说明页面**：详细介绍分层架构设计
2. **学生信息演示**：完整的 CRUD 操作流程
3. **数据流转演示**：UI → Riverpod Provider → API 的完整链路
4. **错误处理演示**：网络错误、业务错误的处理方式
5. **缓存策略演示**：本地缓存和数据同步机制

### 访问方式

1. 启动应用
2. 进入 "组件演示" 页面
3. 点击 "🏗️ Flutter 架构演示"
4. 体验完整的架构流程

### 演示特点

- **真实数据流**：模拟真实的 API 调用和数据处理
- **完整错误处理**：展示各种错误场景的处理方式
- **响应式更新**：状态变化自动更新 UI
- **缓存机制**：智能的数据缓存和离线支持

---

**最后更新**: 2024年12月
**维护者**: 开发团队
