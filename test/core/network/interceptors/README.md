# 拦截器单元测试

## 🧪 测试概述

本目录包含拦截器系统的完整单元测试，确保所有功能的正确性和稳定性。

## 📋 测试文件

### interceptor_performance_test.dart
测试性能监控器的各项功能：
- 请求统计记录
- 缓存命中率计算
- 网络错误处理
- 响应时间记录
- 性能健康评估
- 性能建议生成

### cache_strategy_test.dart
测试各种缓存策略的行为：
- first_cache 策略
- only_cache 策略
- cache_remote 策略
- cache_remote_distinct 策略
- no_cache 策略
- 错误处理和回退
- 缓存键管理

## 🚀 运行测试

### 运行所有拦截器测试
```bash
flutter test test/core/network/interceptors/
```

### 运行特定测试文件
```bash
# 性能测试
flutter test test/core/network/interceptors/interceptor_performance_test.dart

# 缓存策略测试
flutter test test/core/network/interceptors/cache_strategy_test.dart
```

### 运行测试并生成覆盖率报告
```bash
flutter test --coverage test/core/network/interceptors/
genhtml coverage/lcov.info -o coverage/html
```

## 📊 测试覆盖

目标测试覆盖率：**90%+**

### 覆盖的功能模块
- ✅ 性能监控和统计
- ✅ 缓存策略处理
- ✅ 错误处理和回退
- ✅ 缓存键管理
- ✅ 配置验证
- ✅ 集成测试

### 测试场景
- ✅ 正常流程测试
- ✅ 异常情况测试
- ✅ 边界条件测试
- ✅ 性能压力测试
- ✅ 并发安全测试

## 🔧 测试工具

### Mock 对象
使用 `mockito` 包创建 Mock 对象进行隔离测试。

### 测试数据
使用预定义的测试数据确保测试的一致性和可重复性。

### 断言
使用 `flutter_test` 包的丰富断言功能验证测试结果。

## 📈 持续集成

这些测试会在以下情况自动运行：
- 代码提交时
- Pull Request 创建时
- 发布版本时

## 🐛 调试测试

### 运行单个测试
```bash
flutter test test/core/network/interceptors/interceptor_performance_test.dart --name "应该正确记录请求统计"
```

### 详细输出
```bash
flutter test test/core/network/interceptors/ --verbose
```

### 调试模式
```bash
flutter test test/core/network/interceptors/ --debug
```

## 📝 编写新测试

### 测试命名规范
- 测试文件：`*_test.dart`
- 测试组：`group('功能模块 Tests', () { ... })`
- 测试用例：`test('应该做什么', () { ... })`

### 测试结构
```dart
void main() {
  group('功能模块 Tests', () {
    setUp(() {
      // 测试前准备
    });

    tearDown(() {
      // 测试后清理
    });

    test('应该正确处理某个功能', () {
      // 准备
      // 执行
      // 验证
    });
  });
}
```

## ✅ 测试检查清单

在提交代码前，请确保：
- [ ] 所有测试通过
- [ ] 新功能有对应的测试
- [ ] 测试覆盖率达到要求
- [ ] 测试命名清晰明确
- [ ] 测试逻辑简单易懂
