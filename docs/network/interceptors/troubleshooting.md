# 修复 UnifiedInterceptorManager 未定义错误

## 🔍 问题诊断

如果您遇到 "Undefined name 'UnifiedInterceptorManager'" 错误，请按以下步骤修复：

## ✅ 修复步骤

### 1. 清理 IDE 缓存

#### VS Code
```bash
# 重启 VS Code
# 或者删除 .vscode 文件夹后重启
```

#### Android Studio / IntelliJ
```bash
# File -> Invalidate Caches and Restart
```

### 2. 清理 Flutter 缓存

```bash
# 清理 Flutter 缓存
flutter clean

# 重新获取依赖
flutter pub get

# 重新生成代码
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. 检查导入语句

如果您的代码中有直接导入，请更新为：

```dart
// ❌ 错误的导入（已删除的文件）
import 'package:cptop/core/network/interceptors/unified_interceptor_manager.dart';

// ✅ 正确的导入
import 'package:cptop/core/network/interceptors/unified_cache_interceptor.dart';
import 'package:cptop/core/network/interceptors/interceptor_performance_monitor.dart';

// 或者使用统一导入
import 'package:cptop/core/network/index.dart';
```

### 4. 更新类名引用

如果您的代码中有直接使用 `UnifiedInterceptorManager`，请替换为：

```dart
// ❌ 旧的用法
UnifiedInterceptorManager.getPerformanceStats()
UnifiedInterceptorManager.printPerformanceReport()
UnifiedInterceptorManager.resetStats()

// ✅ 新的用法
InterceptorPerformanceMonitor.getPerformanceStats()
InterceptorPerformanceMonitor.printPerformanceReport()
InterceptorPerformanceMonitor.resetStats()

// 或者通过 DioClient 使用（推荐）
DioClient.getPerformanceStats()
DioClient.printPerformanceReport()
DioClient.resetPerformanceStats()
```

### 5. 检查特定文件

如果错误来自特定文件，请检查以下文件：

#### 检查 DioClient
```dart
// lib/core/network/client/dio_client.dart
// 应该使用 OptimizedInterceptorConfig 而不是 UnifiedInterceptorManager
```

#### 检查测试文件
```dart
// 如果您有自定义的测试文件，请更新其中的引用
```

## 🚀 快速验证

运行以下命令验证修复是否成功：

```bash
# 检查语法错误
flutter analyze

# 尝试编译
flutter build apk --debug
```

## 📞 如果问题仍然存在

如果按照上述步骤操作后问题仍然存在，请：

1. **提供具体错误信息**：包括文件名和行号
2. **检查错误文件**：查看具体是哪个文件报错
3. **重新启动开发环境**：完全关闭 IDE 和终端，重新启动

## ✨ 预防措施

为了避免类似问题，建议：

1. **使用统一导入**：
   ```dart
   import 'package:cptop/core/network/index.dart';
   ```

2. **通过 DioClient 使用功能**：
   ```dart
   // 推荐方式
   DioClient.printPerformanceReport();
   
   // 而不是直接使用内部类
   ```

3. **定期清理缓存**：
   ```bash
   flutter clean && flutter pub get
   ```

## 📋 检查清单

- [ ] 清理了 IDE 缓存
- [ ] 运行了 `flutter clean`
- [ ] 更新了导入语句
- [ ] 替换了类名引用
- [ ] 运行了 `flutter analyze` 检查语法
- [ ] 重启了开发环境

完成以上步骤后，`UnifiedInterceptorManager` 未定义的错误应该就解决了！
