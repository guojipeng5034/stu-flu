# ⏰ 时间工具系统指南

## 📋 概述

项目提供了完整的时间管理解决方案，支持网络时间同步和多时区处理。

## 🛠️ 核心工具

### 🌐 网络请求管理 (ApiManager)

`ApiManager` 是项目的网络请求核心管理器，提供了完整的网络请求解决方案：

#### 核心特性

1. **统一的 Dio 客户端管理**
2. **自动认证拦截器**
3. **请求/响应日志记录**
4. **错误统一处理**
5. **网络状态监控**

#### 使用方式

```dart
// 获取 ApiManager 实例
final apiManager = ApiManager.getInstance();

// 创建具体的 API 服务
final studentApi = StudentApi(apiManager.dio);
final authApi = AuthApi(apiManager.dio);

// 在 Riverpod Provider 中使用
class StudentNotifier extends StateNotifier<StudentState> {
  final StudentApi _api;

  StudentNotifier(this._api) : super(const StudentState());

  Future<void> loadStudent(int id) async {
    try {
      state = state.copyWith(isLoading: true);
      final student = await _api.getStudent(id);
      state = state.copyWith(student: student, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }
}
```

#### 拦截器配置

ApiManager 自动配置了以下拦截器：

- **AuthInterceptor**: 自动添加认证 Token
- **LoggingInterceptor**: 记录请求和响应日志
- **ErrorInterceptor**: 统一错误处理和重试机制

## ⏰ 时间工具 (TimeUtil)

`TimeUtil` 类提供获取当前时间的功能，支持从网络同步时间（首次初始化）并根据指定时区进行转换。

`TimeUtil` 现在会缓存首次从NTP获取的时间与设备时间的偏移量。这意味着只有在应用首次调用 `getCurrentTime()` 时（或在缓存被重置后），才会发生网络请求。后续调用将使用此缓存的偏移量和设备本地时间来快速计算当前校准时间，从而提高性能并减少网络依赖。

### 使用方法

要获取当前时间，可以调用 `TimeUtil.getCurrentTime()` 方法。

**获取本地当前时间:**

```dart
import 'package:cptop/core/utils/time_util.dart'; // 确保路径与你的项目名一致

// ...

DateTime localTime = await TimeUtil.getCurrentTime();
print('当前本地时间: $localTime');
```

**获取指定时区的时间:**

您可以传递一个可选的 `timezone` 参数给 `getCurrentTime()` 方法，以获取特定时区的时间。时区字符串应符合 IANA 时区数据库中的名称 (e.g., "America/New_York", "Asia/Shanghai", "Europe/London").

```dart
import 'package:cptop/core/utils/time_util.dart'; // 确保路径与你的项目名一致
// import 'package:timezone/data/latest.dart' as tz_data; // TimeUtil 内部已处理初始化

// ...

// 获取纽约当前时间
DateTime newYorkTime = await TimeUtil.getCurrentTime(timezone: "America/New_York");
print('纽约当前时间: $newYorkTime');

// 获取上海当前时间
DateTime shanghaiTime = await TimeUtil.getCurrentTime(timezone: "Asia/Shanghai");
print('上海当前时间: $shanghaiTime');
```

**注意:**

*   `TimeUtil.getCurrentTime()` 方法是一个异步方法，会返回一个 `Future<DateTime>`。
*   `TimeUtil` 类内部会自动处理 `timezone` 库的初始化 (`tz_data.initializeTimeZones()`)，因此您通常不需要在调用 `getCurrentTime` 之前单独初始化时区数据。
*   如果提供的时区字符串无效，`getCurrentTime()` 方法将默认返回本地时间，并在控制台打印一条错误信息。

## 🔄 实时时间流 (StreamingTimeUtil)

`StreamingTimeUtil` 类提供了一个共享的、每秒更新的实时时间广播流。这个时间流基于 `TimeUtil` 首次获取的NTP时间与设备时间的校准偏移量，因此它提供的是经过校准的时间。

**核心特性：统一时区处理**

`StreamingTimeUtil` **统一负责时区转换**。它会根据一个全局配置的目标时区，发出已经转换好的 `DateTime` 对象 (实际上是 `tz.TZDateTime` 实例)。
*   **默认时区**: 默认情况下，全局目标时区是设备的本地时区 (`tz.local`)。
*   **动态更新时区**: 您可以使用 `StreamingTimeUtil.updateTargetTimezone(String timezoneName)` 方法随时更改这个全局目标时区。一旦更新，所有订阅者将开始接收新时区的时间。

由于这是一个 **广播流 (broadcast stream)**，多个订阅者可以监听同一个流实例。底层的全局定时器只在至少有一个活跃监听者时运行，并在没有监听者时自动停止，以节省资源。

### 使用方法

**1. 初始化时区数据 (应用启动时)**

在您的应用初始化代码中（例如 `main.dart`），确保 `timezone` 包的数据已加载：

```dart
import 'package:flutter/material.dart'; // For WidgetsFlutterBinding
import 'package:timezone/data/latest.dart' as tz_data;
// import 'package:timezone/timezone.dart' as tz; // Optional for setting default Location if needed early
// import 'package:cptop/core/utils/streaming_time_util.dart'; // For early timezone update

// MyApp definition would be here
// class MyApp extends StatelessWidget { ... }


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 如果是Flutter应用

  // 初始化所有时区数据
  tz_data.initializeTimeZones();

  // (可选) 如果您希望应用启动时就设定一个非本地的默认时区
  // await StreamingTimeUtil.updateTargetTimezone("America/New_York");

  runApp(MyApp()); // Replace MyApp with your actual app widget
}
```

**2. 更新全局目标时区 (按需)**

当需要更改所有时间流订阅者接收的时间的时区时（例如，用户更改了偏好设置）：

```dart
import 'package:cptop/core/utils/streaming_time_util.dart'; // 请替换为实际的包名

// ...

Future<void> changeGlobalTimezone(String newTimezoneName) async {
  await StreamingTimeUtil.updateTargetTimezone(newTimezoneName);
  // 调用后，所有 getRealTimeStream() 的监听者将开始接收新时区的时间
}
```

**3. 监听已转换时区的时间流**

订阅者直接收到的就是根据当前全局配置转换好的 `DateTime` (`tz.TZDateTime`)。

```dart
import 'package:cptop/core/utils/streaming_time_util.dart';
import 'dart:async'; // For StreamSubscription
import 'package:flutter/material.dart'; // For setState (example context)
// import 'package:timezone/timezone.dart' as tz; // 不需要导入 tz 来转换，除非要获取 location name 等

// ...

// Example within a StatefulWidget's State:
// class _MyWidgetState extends State<MyWidget> {
StreamSubscription? _timeSubscription;
DateTime? _currentTimeInGlobalZone; // Placeholder

void _startListeningToRealTime() {
  // (确保 tz_data.initializeTimeZones() 已在应用启动时调用过)
  // (确保 TimeUtil 的NTP已初始化或将在首次监听时初始化)

  final Stream<DateTime> localizedRealTimeStream = StreamingTimeUtil.getRealTimeStream();
  _timeSubscription = localizedRealTimeStream.listen((localizedTime) {
    // localizedTime已经是根据StreamingTimeUtil.currentTargetTimezoneName转换后的时间
    // setState(() { // If in a StatefulWidget
      _currentTimeInGlobalZone = localizedTime;
      // if (localizedTime is tz.TZDateTime) {
      //   print('当前全局配置时区 (${(localizedTime as tz.TZDateTime).location.name}) 的时间: $localizedTime');
      // } else {
      //   print('当前时间: $localizedTime'); // Should be TZDateTime
      // }
    // });
  });
}

void _stopListeningToRealTime() {
  _timeSubscription?.cancel();
}
// }
```

**注意:**

*   `StreamingTimeUtil.getRealTimeStream()` 方法会确保 `TimeUtil` 的NTP偏移量已初始化。
*   返回的 `Stream` 是一个广播流，会每秒发出一个新的 `DateTime` (`tz.TZDateTime`) 对象，该对象已根据 `StreamingTimeUtil` 的当前全局目标时区设置进行了转换。
*   使用 `StreamingTimeUtil.updateTargetTimezone(String timezoneName)` 来更改全局时区。如果提供的时区名称无效，全局时区不会改变。
*   请务必在不再需要时取消对 `Stream` 的订阅（调用 `StreamSubscription.cancel()`），以允许内部定时器在没有监听者时停止。
*   如果 `TimeUtil` 在初始化NTP偏移量时彻底失败，`getRealTimeStream()` 在尝试初始化时或流本身可能会发出错误。

---

**最后更新**: 2024年12月
**维护者**: 开发团队
