# 📡 API 文档

## 📋 概述

本文档详细说明了项目中的 API 设计、使用方法和最佳实践。项目采用 Retrofit + Dio 的网络架构，支持强大的缓存系统。

## 🏗️ API 架构

### 架构层次

```
┌─────────────────────────────────────┐
│            UI Layer                 │
├─────────────────────────────────────┤
│         Provider Layer              │
├─────────────────────────────────────┤
│        Service Layer               │
├─────────────────────────────────────┤
│         API Layer                  │  ← Retrofit 接口
├─────────────────────────────────────┤
│        Network Layer               │  ← Dio 客户端
├─────────────────────────────────────┤
│       Cache Layer                  │  ← 缓存系统
└─────────────────────────────────────┘
```

### 核心组件

- **Retrofit**: API 接口定义和代码生成
- **Dio**: HTTP 客户端和拦截器
- **Cache System**: 智能缓存管理
- **Error Handling**: 统一错误处理
- **Authentication**: 自动认证管理

## 🔧 API 接口定义

### 基础 API 接口

```dart
// lib/features/auth/data/api/auth_api.dart
@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST("/auth/login")
  Future<ApiResponse<LoginResponse>> login(
    @Body() LoginRequest request,
  );

  @POST("/auth/logout")
  @Extra({"cache_config": "no_cache"})
  Future<ApiResponse<void>> logout();

  @GET("/auth/profile")
  @Extra({"cache_config": "user_data"})
  Future<ApiResponse<UserProfile>> getProfile();

  @PUT("/auth/profile")
  @Extra({"cache_config": "no_cache"})
  Future<ApiResponse<UserProfile>> updateProfile(
    @Body() UpdateProfileRequest request,
  );
}
```

### 学生管理 API

```dart
// lib/features/student/data/api/student_api.dart
@RestApi()
abstract class StudentApi {
  factory StudentApi(Dio dio) = _StudentApi;

  @GET("/students")
  @Extra({"cache_config": "list_data"})
  Future<ApiResponse<List<Student>>> getStudents(
    @Query("page") int page,
    @Query("limit") int limit,
    @Query("search") String? search,
  );

  @GET("/students/{id}")
  @Extra({"cache_config": "detail_data"})
  Future<ApiResponse<Student>> getStudent(
    @Path("id") String id,
  );

  @POST("/students")
  @Extra({"cache_config": "no_cache"})
  Future<ApiResponse<Student>> createStudent(
    @Body() CreateStudentRequest request,
  );

  @PUT("/students/{id}")
  @Extra({"cache_config": "no_cache"})
  Future<ApiResponse<Student>> updateStudent(
    @Path("id") String id,
    @Body() UpdateStudentRequest request,
  );

  @DELETE("/students/{id}")
  @Extra({"cache_config": "no_cache"})
  Future<ApiResponse<void>> deleteStudent(
    @Path("id") String id,
  );
}
```

### 课程管理 API

```dart
// lib/features/lesson/data/api/lesson_api.dart
@RestApi()
abstract class LessonApi {
  factory LessonApi(Dio dio) = _LessonApi;

  @GET("/lessons")
  @Extra(CacheFor(
    hours: 2,
    strategy: CacheStrategy.firstCache,
    cacheType: CacheType.both,
  ).toExtra())
  Future<ApiResponse<List<Lesson>>> getLessons(
    @Query("page") int page,
    @Query("limit") int limit,
    @Query("category") String? category,
  );

  @GET("/lessons/{id}")
  @Extra({"cache_config": "detail_data"})
  Future<ApiResponse<LessonDetail>> getLessonDetail(
    @Path("id") String id,
  );

  @POST("/lessons/{id}/progress")
  @Extra({"cache_config": "no_cache"})
  Future<ApiResponse<LessonProgress>> updateProgress(
    @Path("id") String id,
    @Body() ProgressUpdateRequest request,
  );
}
```

## 📊 数据模型

### 通用响应模型

```dart
// lib/shared/models/api_response.dart
@MappableClass()
class ApiResponse<T> with ApiResponseMappable<T> {
  final bool success;
  final String? message;
  final T? data;
  final int? code;
  final Map<String, dynamic>? errors;

  const ApiResponse({
    required this.success,
    this.message,
    this.data,
    this.code,
    this.errors,
  });

  bool get isSuccess => success && data != null;
  bool get hasError => !success || errors != null;

  static const fromJson = ApiResponseMapper.fromJson;
}
```

### 分页响应模型

```dart
// lib/shared/models/paginated_response.dart
@MappableClass()
class PaginatedResponse<T> with PaginatedResponseMappable<T> {
  final List<T> data;
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final int itemsPerPage;
  final bool hasNextPage;
  final bool hasPreviousPage;

  const PaginatedResponse({
    required this.data,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.itemsPerPage,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  static const fromJson = PaginatedResponseMapper.fromJson;
}
```

### 学生数据模型

```dart
// lib/features/student/data/models/student.dart
@MappableClass()
class Student with StudentMappable {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final int points;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<String>? tags;

  const Student({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.points,
    this.createdAt,
    this.updatedAt,
    this.tags,
  });

  static const fromJson = StudentMapper.fromJson;
}

// 业务逻辑扩展
extension StudentBusinessLogic on Student {
  String get displayName => name.isNotEmpty ? name : email;
  
  String get pointsLevel {
    if (points >= 10000) return '钻石学员';
    if (points >= 5000) return '黄金学员';
    if (points >= 1000) return '白银学员';
    return '青铜学员';
  }
  
  bool get isVip => points >= 1000;
}
```

## 🔄 缓存配置

### 预定义缓存策略

```dart
// lib/core/network/cache/cache_configs.dart
class CacheConfigs {
  // 列表数据 - 2小时缓存，优先显示缓存
  static const listData = {
    "cache_config": {
      "maxAge": 7200,  // 2小时
      "strategy": "first_cache",
      "cacheType": "both",
      "hitCacheOnError": true,
    }
  };

  // 详情数据 - 1小时缓存，优先显示缓存
  static const detailData = {
    "cache_config": {
      "maxAge": 3600,  // 1小时
      "strategy": "first_cache",
      "cacheType": "both",
      "hitCacheOnError": true,
    }
  };

  // 用户数据 - 30分钟缓存，优先网络
  static const userData = {
    "cache_config": {
      "maxAge": 1800,  // 30分钟
      "strategy": "first_remote",
      "cacheType": "both",
      "hitCacheOnError": true,
    }
  };

  // 不缓存 - 用于写操作
  static const noCache = {
    "cache_config": "no_cache"
  };
}
```

### 动态缓存配置

```dart
// 自定义缓存时间
@Extra(CacheFor(
  minutes: 30,
  strategy: CacheStrategy.firstCache,
  cacheType: CacheType.memory,
).toExtra())
Future<ApiResponse<Data>> getData();

// 基于参数的缓存键
@Extra({
  "cache_config": {
    "maxAge": 3600,
    "key": "lessons_page_{page}_limit_{limit}",
    "strategy": "first_cache",
  }
})
Future<ApiResponse<List<Lesson>>> getLessons(
  @Query("page") int page,
  @Query("limit") int limit,
);
```

## 🛠️ 服务层实现

### 基础服务类

```dart
// lib/features/student/domain/services/student_service.dart
class StudentService {
  final StudentApi _api;
  final AppLogger _logger;

  StudentService(this._api, this._logger);

  Future<ServiceResult<List<Student>>> getStudents({
    int page = 1,
    int limit = 20,
    String? search,
  }) async {
    try {
      _logger.info('Loading students: page=$page, limit=$limit, search=$search');
      
      final response = await _api.getStudents(page, limit, search);
      
      if (response.isSuccess) {
        _logger.info('Students loaded successfully: ${response.data?.length} items');
        return ServiceResult.success(response.data!);
      } else {
        _logger.warning('Failed to load students: ${response.message}');
        return ServiceResult.failure(response.message ?? 'Failed to load students');
      }
    } on DioException catch (e) {
      _logger.error('Network error loading students: ${e.message}');
      return ServiceResult.failure(_handleDioError(e));
    } catch (e) {
      _logger.error('Unexpected error loading students: $e');
      return ServiceResult.failure('An unexpected error occurred');
    }
  }

  Future<ServiceResult<Student>> getStudent(String id) async {
    try {
      final response = await _api.getStudent(id);
      
      if (response.isSuccess) {
        return ServiceResult.success(response.data!);
      } else {
        return ServiceResult.failure(response.message ?? 'Student not found');
      }
    } catch (e) {
      return ServiceResult.failure(_handleError(e));
    }
  }

  String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return '连接超时，请检查网络';
      case DioExceptionType.receiveTimeout:
        return '响应超时，请重试';
      case DioExceptionType.badResponse:
        return '服务器错误：${e.response?.statusCode}';
      default:
        return '网络错误，请检查连接';
    }
  }
}
```

### 服务结果封装

```dart
// lib/shared/models/service_result.dart
class ServiceResult<T> {
  final bool isSuccess;
  final T? data;
  final String? errorMessage;
  final int? errorCode;

  const ServiceResult._({
    required this.isSuccess,
    this.data,
    this.errorMessage,
    this.errorCode,
  });

  factory ServiceResult.success(T data) {
    return ServiceResult._(isSuccess: true, data: data);
  }

  factory ServiceResult.failure(String message, [int? code]) {
    return ServiceResult._(
      isSuccess: false,
      errorMessage: message,
      errorCode: code,
    );
  }

  bool get isFailure => !isSuccess;
  bool get hasData => data != null;
}
```

## 🔐 认证和授权

### 认证拦截器

```dart
// lib/core/network/interceptors/auth_interceptor.dart
class AuthInterceptor extends Interceptor {
  final StorageService _storage;
  final AuthService _authService;

  AuthInterceptor(this._storage, this._authService);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // 添加认证头
    final token = await _storage.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    // 添加通用头
    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // 处理 401 未授权错误
    if (err.response?.statusCode == 401) {
      await _handleUnauthorized();
    }

    handler.next(err);
  }

  Future<void> _handleUnauthorized() async {
    await _storage.clearToken();
    await _authService.logout();
    // 导航到登录页面
  }
}
```

## 📝 API 使用示例

### 在 Provider 中使用

```dart
// lib/features/student/presentation/providers/student_provider.dart
class StudentNotifier extends StateNotifier<StudentState> {
  final StudentService _service;

  StudentNotifier(this._service) : super(const StudentState());

  Future<void> loadStudents({
    int page = 1,
    String? search,
    bool isRefresh = false,
  }) async {
    if (isRefresh) {
      state = state.copyWith(isRefreshing: true);
    } else {
      state = state.copyWith(isLoading: true);
    }

    try {
      final result = await _service.getStudents(
        page: page,
        search: search,
      );

      if (result.isSuccess) {
        final students = result.data!;
        
        if (isRefresh || page == 1) {
          state = state.copyWith(
            students: students,
            currentPage: 1,
            hasMore: students.length >= 20,
          );
        } else {
          state = state.copyWith(
            students: [...state.students, ...students],
            currentPage: page,
            hasMore: students.length >= 20,
          );
        }
      } else {
        state = state.copyWith(error: result.errorMessage);
      }
    } catch (e) {
      state = state.copyWith(error: e.toString());
    } finally {
      state = state.copyWith(isLoading: false, isRefreshing: false);
    }
  }
}
```

## 🚨 错误处理

### 统一错误处理

```dart
// lib/core/network/interceptors/error_interceptor.dart
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final error = _mapError(err);
    
    // 记录错误日志
    AppLogger.error('API Error: ${error.message}', err);
    
    // 显示用户友好的错误信息
    _showErrorToUser(error);
    
    handler.next(err);
  }

  ApiError _mapError(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(
          code: 'CONNECTION_TIMEOUT',
          message: '连接超时，请检查网络连接',
          type: ErrorType.network,
        );
      case DioExceptionType.receiveTimeout:
        return ApiError(
          code: 'RECEIVE_TIMEOUT',
          message: '响应超时，请重试',
          type: ErrorType.network,
        );
      case DioExceptionType.badResponse:
        return _handleHttpError(err.response!);
      default:
        return ApiError(
          code: 'UNKNOWN_ERROR',
          message: '未知错误，请重试',
          type: ErrorType.unknown,
        );
    }
  }
}
```

## 📊 性能优化

### 请求优化

```dart
// 批量请求
Future<List<Student>> loadStudentsBatch(List<String> ids) async {
  final futures = ids.map((id) => _api.getStudent(id));
  final responses = await Future.wait(futures);
  return responses
      .where((response) => response.isSuccess)
      .map((response) => response.data!)
      .toList();
}

// 请求去重
final Map<String, Future<Student>> _pendingRequests = {};

Future<Student> getStudentWithDeduplication(String id) {
  if (_pendingRequests.containsKey(id)) {
    return _pendingRequests[id]!;
  }

  final future = _api.getStudent(id).then((response) {
    _pendingRequests.remove(id);
    return response.data!;
  });

  _pendingRequests[id] = future;
  return future;
}
```

## 📋 最佳实践

### 1. API 设计原则

- 使用 RESTful 设计
- 统一的响应格式
- 合理的 HTTP 状态码
- 清晰的错误信息

### 2. 缓存策略

- 读操作使用缓存
- 写操作不缓存
- 合理设置缓存时间
- 错误时使用缓存

### 3. 错误处理

- 统一的错误处理机制
- 用户友好的错误信息
- 详细的错误日志
- 优雅的降级处理

### 4. 性能优化

- 合理使用缓存
- 避免重复请求
- 实现请求去重
- 使用分页加载

---

**最后更新**: 2024年12月
**维护者**: 开发团队
