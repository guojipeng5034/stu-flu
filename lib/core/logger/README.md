# 日志工具使用指南

本日志工具基于 `logger` 库进行封装，提供了更加便捷和强大的日志记录功能。

## 安装

在 `pubspec.yaml` 中添加依赖：

```yaml
dependencies:
  logger: ^2.3.0
```

## 基本用法

### 1. 初始化

在应用启动时初始化日志配置：

```dart
import 'package:your_app/core/utils/logger/log_config.dart';

void main() {
  // 根据环境配置日志
  LogConfig.setup(isDevelopment: true);
  
  runApp(MyApp());
}
```

### 2. 记录不同级别的日志

```dart
import 'package:your_app/core/utils/logger/app_logger.dart';

// 详细日志
Log.v('这是一条详细日志');

// 调试日志
Log.d('这是一条调试日志');

// 信息日志
Log.i('这是一条信息日志');

// 警告日志
Log.w('这是一条警告日志');

// 错误日志
Log.e('这是一条错误日志');

// 严重错误日志
Log.wtf('这是一条严重错误日志');
```

### 3. 记录带异常的日志

```dart
try {
  // 可能抛出异常的代码
  throw Exception('发生了一个错误');
} catch (e, stackTrace) {
  Log.e('捕获到异常', e, stackTrace);
}
```

## 高级用法

### 1. 记录网络请求日志

```dart
// 成功的网络请求
Log.network(
  'GET',
  'https://api.example.com/users',
  data: {'page': 1, 'limit': 10},
  response: responseData
);

// 失败的网络请求
Log.network(
  'POST',
  'https://api.example.com/login',
  data: requestData,
  error: '连接超时'
);
```

### 2. 记录API调用日志

```dart
final stopwatch = Stopwatch()..start();

// 执行API调用
final response = await apiService.login(username, password);

stopwatch.stop();
Log.api(
  '用户登录',
  request: {'username': username, 'password': '******'},
  response: response.data,
  duration: stopwatch.elapsed,
);
```

### 3. 记录性能日志

```dart
final stopwatch = Stopwatch()..start();

// 执行需要测量性能的代码
final result = await computeExpensiveOperation();

stopwatch.stop();
Log.performance('耗时操作', stopwatch.elapsed);
```

### 4. 记录用户行为日志

```dart
Log.userAction(
  '点击登录按钮',
  params: {'screen': '登录页面', 'timestamp': DateTime.now().toString()}
);
```

### 5. 开发者日志（仅在调试模式下显示）

```dart
Log.dev('这条日志只在调试模式下显示');
```

## 配置选项

可以根据需要自定义日志配置：

```dart
Log.configure(
  enabled: true,           // 是否启用日志
  level: Level.debug,      // 日志级别
  methodCount: 2,          // 显示的方法调用数量
  lineLength: 120,         // 每行最大长度
  colors: true,            // 是否彩色输出
  printEmojis: true,       // 是否打印表情符号
  printTime: true,         // 是否打印时间
);
```

## 与Dio集成

项目中已经集成了自定义的 `LogInterceptor`，可以自动记录所有网络请求：

```dart
import 'package:your_app/core/utils/logger/log_interceptor.dart';

final dio = Dio();
dio.interceptors.add(LogInterceptor(
  request: true,
  requestHeader: true,
  requestBody: true,
  response: true,
  responseHeader: false,
  responseBody: true,
  error: true,
  timing: true,
  pretty: true,
));
```

## 最佳实践

1. 在开发环境中使用详细级别的日志
2. 在生产环境中只记录警告和错误日志
3. 敏感信息（如密码、令牌）应该在记录前进行脱敏处理
4. 使用适当的日志级别，不要滥用
5. 在关键流程中添加性能日志，帮助识别性能瓶颈 