# 网络请求系统使用指南

## 目录

- [简介](#简介)
- [架构概述](#架构概述)
- [快速开始](#快速开始)
- [详细使用指南](#详细使用指南)
  - [创建API接口](#创建api接口)
  - [配置缓存策略](#配置缓存策略)
  - [错误处理](#错误处理)
  - [认证处理](#认证处理)
  - [性能监控](#性能监控)
- [最佳实践](#最佳实践)
- [常见问题](#常见问题)

## 简介

本项目的网络请求系统基于 Dio + Retrofit 构建，提供了高度可配置的网络请求功能，包括缓存管理、错误处理、认证管理和性能监控等特性。该系统设计目标是提供简洁易用的 API 接口，同时保持强大的扩展性和可维护性。

### 核心特性

- **统一接口定义**：基于 Retrofit 的声明式 API 接口
- **智能缓存系统**：支持多种缓存策略和缓存配置
- **统一错误处理**：集中式错误处理和转换
- **自动认证管理**：Token 注入和刷新机制
- **详细日志记录**：可配置的请求和响应日志
- **性能监控**：请求时间和缓存命中率统计

## 架构概述

网络请求系统采用分层架构设计：

```
┌─────────────────────────────────────┐
│            UI Layer                 │
├─────────────────────────────────────┤
│         Provider Layer              │
├─────────────────────────────────────┤
│        Service Layer               │  ← 业务逻辑处理
├─────────────────────────────────────┤
│         API Layer                  │  ← Retrofit 接口
├─────────────────────────────────────┤
│        Network Layer               │  ← Dio 客户端
├─────────────────────────────────────┤
│       Cache Layer                  │  ← 缓存系统
└─────────────────────────────────────┘
```

### 核心组件

- **DioClient**：负责创建和配置 Dio 实例
- **UnifiedNetworkInterceptor**：统一处理请求、响应和错误
- **UnifiedCacheManager**：管理缓存策略和缓存存储
- **ErrorHandlerInterceptor**：统一错误处理和转换
- **UnifiedNetworkLogger**：请求和响应日志记录

## 快速开始

### 1. 初始化网络系统

在应用启动时，需要初始化网络缓存系统：

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 初始化网络缓存
  await UnifiedCacheManager.initialize(
    maxSize: 100,
    maxEntrySize: 1024 * 1024, // 1MB
    defaultPolicy: CachePolicy.request,
    defaultMaxStale: const Duration(days: 7),
  );
  
  // 其他初始化代码...
  
  runApp(const MyApp());
}
```

### 2. 创建 API 接口

使用 Retrofit 创建 API 接口：

```dart
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/models/api_response.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio, {String? baseUrl}) = _UserApi;
  
  @GET("/users/me")
  Future<ApiResponse<UserProfile>> getCurrentUser();
  
  @POST("/users")
  Future<ApiResponse<UserProfile>> createUser(@Body() UserCreateRequest request);
}
```

### 3. 使用依赖注入获取 API 实例

```dart
// 创建 API Provider
final userApiProvider = DI.createApiProvider<UserApi>(
  (dio) => UserApi(dio),
);

// 在服务层使用 API
class UserService {
  final UserApi _userApi;
  
  UserService(this._userApi);
  
  Future<UserProfile?> getCurrentUser() async {
    try {
      final response = await _userApi.getCurrentUser();
      return response.data;
    } catch (e) {
      Log.e('获取用户信息失败', e);
      return null;
    }
  }
}

// 在 Provider 中使用服务
final userServiceProvider = Provider<UserService>((ref) {
  final userApi = ref.watch(userApiProvider);
  return UserService(userApi);
});
```

## 详细使用指南

### 创建API接口

#### 基本 API 定义

使用 Retrofit 注解定义 API 接口：

```dart
@RestApi()
abstract class LessonApi {
  factory LessonApi(Dio dio, {String? baseUrl}) = _LessonApi;
  
  @GET("/lessons")
  Future<ApiResponse<List<Lesson>>> getLessons();
  
  @GET("/lessons/{lessonId}")
  Future<ApiResponse<Lesson>> getLessonDetail(@Path("lessonId") int lessonId);
  
  @POST("/lessons")
  Future<ApiResponse<Lesson>> createLesson(@Body() LessonCreateRequest request);
  
  @PUT("/lessons/{lessonId}")
  Future<ApiResponse<Lesson>> updateLesson(
    @Path("lessonId") int lessonId,
    @Body() LessonUpdateRequest request
  );
  
  @DELETE("/lessons/{lessonId}")
  Future<ApiResponse<void>> deleteLesson(@Path("lessonId") int lessonId);
}
```

#### 请求参数

Retrofit 支持多种请求参数注解：

```dart
// URL 路径参数
@GET("/users/{userId}")
Future<ApiResponse<User>> getUser(@Path("userId") String userId);

// 查询参数
@GET("/users")
Future<ApiResponse<List<User>>> getUsers(
  @Query("page") int page,
  @Query("limit") int limit,
  @Query("sort") String sort
);

// 请求体
@POST("/users")
Future<ApiResponse<User>> createUser(@Body() UserCreateRequest request);

// 表单数据
@POST("/login")
@FormUrlEncoded()
Future<ApiResponse<LoginResponse>> login(
  @Field("username") String username,
  @Field("password") String password
);

// 文件上传
@POST("/users/avatar")
@MultiPart()
Future<ApiResponse<User>> uploadAvatar(@Part() File avatar);

// 请求头
@GET("/users/me")
Future<ApiResponse<User>> getCurrentUser(@Header("Authorization") String token);
```

### 配置缓存策略

系统支持多种缓存策略，可以通过 `@Extra` 注解配置：

```dart
// 使用预定义的缓存配置
@GET("/lessons")
@Extra({"cache_config": "list_data"})
Future<ApiResponse<List<Lesson>>> getLessons();

// 自定义缓存配置
@GET("/lessons/hot")
@Extra({
  "cache_time": "1h",           // 缓存时间
  "strategy": "cache_remote",    // 缓存策略
})
Future<ApiResponse<List<Lesson>>> getHotLessons();
```

#### 可用的缓存策略

| 策略名称 | 描述 |
|---------|------|
| `no_cache` | 不使用缓存，总是从网络获取 |
| `request` | 默认策略，优先使用缓存 |
| `refresh` | 强制刷新，忽略缓存 |
| `cache_first` | 优先使用缓存，缓存不存在时请求网络 |
| `cache_only` | 仅使用缓存，不进行网络请求 |
| `refresh_force_cache` | 刷新缓存并强制使用新数据 |

### 错误处理

系统提供了统一的错误处理机制，将 HTTP 错误转换为应用内的异常：

```dart
try {
  final response = await userApi.getCurrentUser();
  return response.data;
} catch (e) {
  if (e is NetworkException) {
    // 处理网络连接错误
  } else if (e is ServerException) {
    // 处理服务器错误
  } else {
    // 处理其他错误
  }
  return null;
}
```

### 认证处理

系统自动处理认证 Token 的注入和刷新：

```dart
// API 定义不需要手动添加认证头
@GET("/users/me")
Future<ApiResponse<UserProfile>> getCurrentUser();

// 认证拦截器会自动添加 Token
// 如果 Token 过期，会自动尝试刷新
```

### 性能监控

系统提供了性能监控功能，可以查看请求统计信息：

```dart
// 获取性能统计
final stats = InterceptorManager.getPerformanceStats();
print('总请求数: ${stats['total_requests']}');
print('缓存命中率: ${stats['hit_rate']}%');
print('平均响应时间: ${stats['avg_response_time']}ms');

// 打印性能报告
InterceptorManager.printPerformanceStats();

// 重置统计数据
InterceptorManager.resetPerformanceStats();
```

## 最佳实践

### 1. 分层架构

遵循分层架构设计，将网络请求分为 API、Service 和 Provider 三层：

```dart
// API 层 - 定义网络接口
@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;
  
  @GET("/users/me")
  Future<ApiResponse<UserProfile>> getCurrentUser();
}

// Service 层 - 处理业务逻辑
class UserService {
  final UserApi _userApi;
  
  UserService(this._userApi);
  
  Future<UserProfile?> getCurrentUser() async {
    try {
      final response = await _userApi.getCurrentUser();
      return response.data;
    } catch (e) {
      Log.e('获取用户信息失败', e);
      return null;
    }
  }
}

// Provider 层 - 提供状态管理
final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  final userService = ref.watch(userServiceProvider);
  return UserNotifier(userService);
});
```

### 2. 合理使用缓存策略

根据数据类型选择合适的缓存策略：

- **配置数据**：长时间缓存，使用 `cache_first`
- **列表数据**：中等时间缓存，使用 `request`
- **详情数据**：短时间缓存，使用 `request`
- **用户数据**：短时间缓存，使用 `refresh`
- **实时数据**：不缓存，使用 `no_cache`

### 3. 统一响应处理

使用 `ApiResponse` 统一处理响应：

```dart
Future<Result<UserProfile>> getCurrentUser() async {
  try {
    final response = await _userApi.getCurrentUser();
    
    if (response.status == ApiStatus.success && response.data != null) {
      return Result.success(response.data!);
    } else {
      return Result.failure(response.message ?? '获取用户信息失败');
    }
  } catch (e) {
    return Result.failure(_handleError(e));
  }
}
```

## 常见问题

### Q: 如何处理不同环境的 API 地址？

A: 使用环境配置管理 API 地址：

```dart
// 在 NetworkConfig 中配置
factory NetworkConfig.fromEnv() {
  final env = Env.instance;
  return NetworkConfig(
    baseUrl: env.apiBaseUrl,
    // 其他配置...
  );
}
```

### Q: 如何处理文件上传？

A: 使用 Retrofit 的 `@MultiPart` 注解：

```dart
@POST("/users/avatar")
@MultiPart()
Future<ApiResponse<User>> uploadAvatar(@Part() File avatar);
```

### Q: 如何自定义请求头？

A: 使用 `@Headers` 或 `@Header` 注解：

```dart
// 固定请求头
@Headers({
  "Accept": "application/json",
  "Content-Type": "application/json"
})
@GET("/users")
Future<ApiResponse<List<User>>> getUsers();

// 动态请求头
@GET("/users")
Future<ApiResponse<List<User>>> getUsers(@Header("Custom-Header") String value);
```

### Q: 如何处理分页请求？

A: 使用查询参数和分页模型：

```dart
@GET("/users")
Future<ApiResponse<PaginatedResponse<User>>> getUsers(
  @Query("page") int page,
  @Query("limit") int limit
);
```

### Q: 如何监控网络状态？

A: 使用性能监控功能：

```dart
// 获取性能统计
final stats = InterceptorManager.getPerformanceStats();
print('总请求数: ${stats['total_requests']}');
print('缓存命中率: ${stats['hit_rate']}%');
``` 