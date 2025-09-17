# 网络请求缓存安全性示例

## 🔒 核心原则

**失败的请求永远不会被缓存，只有成功的响应（状态码 200-299）才会被缓存。**

### 两个重要概念

1. **缓存写入**：只有成功的响应（200-299）才会被写入缓存
2. **缓存读取**：网络错误时是否读取之前缓存的成功数据（由 `hitCacheOnError` 控制）

### 🔍 详细说明

#### 缓存写入规则（由 SafeCacheInterceptor 保证）
- ✅ **成功响应** (200-299)：写入缓存
- ❌ **失败响应** (400-599)：不写入缓存
- ❌ **网络错误**：不写入缓存

#### 缓存读取规则（由 hitCacheOnError 控制）
- `hitCacheOnError: true`：网络错误时返回之前缓存的成功数据
- `hitCacheOnError: false`：网络错误时直接返回错误

## 📋 缓存行为示例

### ✅ 会被缓存的响应

```dart
// 成功响应 - 会被缓存
@GET("/users")
@Extra(CacheFor(hours: 1).toExtra())
Future<ApiResponse<List<User>>> getUsers();

// 响应示例：
// Status: 200 OK
// Data: [{"id": 1, "name": "张三"}, {"id": 2, "name": "李四"}]
// ✅ 此响应会被缓存 1 小时
```

```dart
// 创建成功响应 - 会被缓存
@POST("/users")
@Extra(CacheFor(minutes: 30).toExtra())
Future<ApiResponse<User>> createUser(@Body() User user);

// 响应示例：
// Status: 201 Created
// Data: {"id": 3, "name": "王五", "created_at": "2024-01-01T10:00:00Z"}
// ✅ 此响应会被缓存 30 分钟
```

### ❌ 不会被缓存的响应

```dart
// 客户端错误 - 不会被缓存
@GET("/users/{id}")
@Extra(CacheFor(hours: 1).toExtra())
Future<ApiResponse<User>> getUser(@Path("id") String id);

// 错误响应示例：
// Status: 404 Not Found
// Data: {"error": "用户不存在", "code": "USER_NOT_FOUND"}
// ❌ 此响应不会被缓存
```

```dart
// 服务器错误 - 不会被缓存
@GET("/users")
@Extra(CacheFor(hours: 1).toExtra())
Future<ApiResponse<List<User>>> getUsers();

// 错误响应示例：
// Status: 500 Internal Server Error
// Data: {"error": "服务器内部错误", "code": "INTERNAL_ERROR"}
// ❌ 此响应不会被缓存
```

```dart
// 认证错误 - 不会被缓存
@GET("/profile")
@Extra(CacheFor(minutes: 15).toExtra())
Future<ApiResponse<UserProfile>> getProfile();

// 错误响应示例：
// Status: 401 Unauthorized
// Data: {"error": "未授权访问", "code": "UNAUTHORIZED"}
// ❌ 此响应不会被缓存
```

## 🔄 错误时的缓存行为

### 场景 1: 网络错误时使用缓存

```dart
@GET("/news")
@Extra(CacheFor(
  hours: 2,
  hitCacheOnError: true,  // 网络错误时使用缓存
).toExtra())
Future<ApiResponse<List<News>>> getNews();
```

**行为说明**：
1. **首次请求成功** (Status: 200) → ✅ 缓存响应数据
2. **后续网络错误** (无网络连接) → ✅ 返回之前缓存的成功数据
3. **服务器错误** (Status: 500) → ❌ 不缓存错误响应，✅ 返回之前缓存的成功数据

### 场景 2: 实时数据不使用错误缓存

```dart
@GET("/stock/price")
@Extra(CacheFor(
  minutes: 1,
  hitCacheOnError: false,  // 网络错误时不使用缓存
).toExtra())
Future<ApiResponse<StockPrice>> getStockPrice();
```

**行为说明**：
1. **首次请求成功** (Status: 200) → ✅ 缓存响应数据
2. **后续网络错误** → ❌ 直接返回错误，不使用缓存
3. **服务器错误** (Status: 500) → ❌ 不缓存错误响应，❌ 直接返回错误

## 🧪 测试验证

### 验证成功响应缓存

```dart
void testSuccessfulResponseCaching() async {
  // 第一次请求 - 从网络获取
  final response1 = await userApi.getUsers();
  expect(response1.data, isNotEmpty);
  
  // 第二次请求 - 从缓存获取（应该很快）
  final stopwatch = Stopwatch()..start();
  final response2 = await userApi.getUsers();
  stopwatch.stop();
  
  expect(response2.data, equals(response1.data));
  expect(stopwatch.elapsedMilliseconds, lessThan(100)); // 缓存响应很快
}
```

### 验证失败响应不缓存

```dart
void testFailedResponseNotCached() async {
  try {
    // 请求不存在的用户 - 返回 404
    await userApi.getUser("nonexistent");
  } catch (e) {
    expect(e, isA<DioException>());
    expect((e as DioException).response?.statusCode, 404);
  }
  
  // 再次请求同样的不存在用户
  // 应该再次发起网络请求，而不是从缓存返回 404
  try {
    final stopwatch = Stopwatch()..start();
    await userApi.getUser("nonexistent");
    stopwatch.stop();
    
    // 如果是网络请求，耗时应该比缓存长
    expect(stopwatch.elapsedMilliseconds, greaterThan(100));
  } catch (e) {
    expect(e, isA<DioException>());
    expect((e as DioException).response?.statusCode, 404);
  }
}
```

## 📊 状态码分类

### ✅ 会被缓存的状态码 (200-299)

| 状态码 | 说明 | 缓存行为 |
|--------|------|----------|
| 200 | OK | ✅ 缓存 |
| 201 | Created | ✅ 缓存 |
| 202 | Accepted | ✅ 缓存 |
| 204 | No Content | ✅ 缓存 |
| 206 | Partial Content | ✅ 缓存 |

### ❌ 不会被缓存的状态码 (非 200-299)

| 状态码 | 说明 | 缓存行为 |
|--------|------|----------|
| 400 | Bad Request | ❌ 不缓存 |
| 401 | Unauthorized | ❌ 不缓存 |
| 403 | Forbidden | ❌ 不缓存 |
| 404 | Not Found | ❌ 不缓存 |
| 500 | Internal Server Error | ❌ 不缓存 |
| 502 | Bad Gateway | ❌ 不缓存 |
| 503 | Service Unavailable | ❌ 不缓存 |

## 💡 最佳实践

### 1. 合理设置 hitCacheOnError

```dart
// 重要但不实时的数据 - 使用缓存
@Extra(CacheFor(
  hours: 1,
  hitCacheOnError: true,  // 网络错误时显示缓存数据
).toExtra())
Future<ApiResponse<List<Article>>> getArticles();

// 实时敏感数据 - 不使用缓存
@Extra(CacheFor(
  minutes: 5,
  hitCacheOnError: false,  // 确保数据实时性
).toExtra())
Future<ApiResponse<UserBalance>> getUserBalance();
```

### 2. 错误处理策略

```dart
Future<List<User>> loadUsers() async {
  try {
    final response = await userApi.getUsers();
    return response.data ?? [];
  } on DioException catch (e) {
    if (e.response?.statusCode == 404) {
      // 404 错误 - 返回空列表
      return [];
    } else if (e.type == DioExceptionType.connectionTimeout) {
      // 网络超时 - 可能返回了缓存数据
      throw NetworkException('网络连接超时，请检查网络设置');
    } else {
      // 其他错误
      throw ServerException('服务器错误，请稍后重试');
    }
  }
}
```

### 3. 缓存清理

```dart
// 用户登出时清理所有缓存
Future<void> logout() async {
  await CacheManager.clearAllCache();
  await authService.clearAuthInfo();
}

// 清理特定缓存
Future<void> refreshUserData() async {
  await CacheManager.clearCacheByKey('user_profile');
  final newData = await userApi.getProfile();
  return newData;
}
```

## 🔍 调试技巧

### 查看缓存状态

```dart
// 在开发环境中添加缓存日志
if (kDebugMode) {
  print('Cache hit: ${response.extra['dio_cache_interceptor_hit']}');
  print('Cache key: ${response.extra['dio_cache_interceptor_key']}');
}
```

### 强制刷新缓存

```dart
// 使用强制刷新选项
@GET("/users")
@Extra(CacheFor(strategy: CacheStrategy.firstRemote).toExtra())
Future<ApiResponse<List<User>>> refreshUsers();
```

通过这些安全措施，确保您的应用只缓存可靠的成功数据，提供更好的用户体验和数据一致性。
