# 网络请求模块

## 架构说明

本模块采用分层架构，遵循单一职责原则，各组件职责明确，易于维护和扩展。

### 核心组件

#### 1. 拦截器 (Interceptors)

采用单一职责的拦截器设计，每个拦截器负责特定功能：

- **AuthInterceptor**: 处理认证相关功能
- **HeadersInterceptor**: 处理请求头部
- **LoggingInterceptor**: 处理日志记录
- **PerformanceInterceptor**: 处理性能监控
- **ErrorHandlerInterceptor**: 处理错误处理
- **CacheInterceptor**: 处理缓存配置

#### 2. 拦截器管理 (Interceptor Management)

- **InterceptorFactory**: 创建各种拦截器实例
- **InterceptorManager**: 管理拦截器集合
- **InterceptorChain**: 管理拦截器的顺序和优先级

#### 3. 客户端 (Client)

- **DioClient**: 管理Dio实例的创建和配置

#### 4. 缓存 (Cache)

- **UnifiedCacheManager**: 统一的缓存管理入口

#### 5. 配置 (Configuration)

- **NetworkConfig**: 网络配置信息

## 使用指南

### 基本用法

```dart
// 创建Dio实例
final dio = await DioClient.getInstance(
  storageService: storageService,
  authService: authService,
);

// 发起请求
final response = await dio.get('/api/users');
```

### 创建API服务

```dart
// 创建API服务
final userApi = DioClient.createApi(dio, (dio) => UserApi(dio));

// 使用API服务
final users = await userApi.getUsers();
```

### 配置缓存

```dart
// 使用自定义缓存配置
final dio = await DioClient.getInstance(
  storageService: storageService,
  authService: authService,
  enableCache: true,
  cacheOptions: CacheOptions(
    store: MemCacheStore(),
    policy: CachePolicy.request,
    maxStale: const Duration(days: 7),
  ),
);
```

### 添加自定义拦截器

```dart
// 创建自定义拦截器
class CustomInterceptor extends BaseInterceptor {
  @override
  String get name => 'CustomInterceptor';

  @override
  int get priority => 100;

  @override
  void handleRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 自定义处理逻辑
    handler.next(options);
  }
}

// 添加自定义拦截器
final dio = await DioClient.getInstance(
  storageService: storageService,
  authService: authService,
  additionalInterceptors: [CustomInterceptor()],
);
```

## 性能监控

可以通过以下方式获取性能统计信息：

```dart
// 打印性能报告
DioClient.printPerformanceReport();

// 获取性能统计数据
final stats = DioClient.getPerformanceStats();
```

## 健康检查

可以通过以下方式检查拦截器配置是否正确：

```dart
// 诊断拦截器配置
final issues = DioClient.diagnoseInterceptorConfiguration('default');
if (issues.isNotEmpty) {
  print('拦截器配置问题: ${issues.join(', ')}');
}
``` 