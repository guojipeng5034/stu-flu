import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'core/di/di.dart';
import 'core/network/cache/unified_cache_manager.dart';
import 'env/env_loader.dart';

/// 应用入口
void main() async {
  // 确保Flutter绑定初始化
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化环境配置
  await EnvLoader.load();

  // 初始化网络缓存
  await UnifiedCacheManager.initialize(
    maxSize: 100,
    maxEntrySize: 1024 * 1024, // 1MB
    defaultPolicy: CachePolicy.request,
    defaultMaxStale: const Duration(days: 7),
    hitCacheOnErrorCodes: [401, 403, 404, 500],
    priority: CachePriority.normal,
  );

  // 使用DI系统初始化所有依赖
  final container = await DI.initializeProviders();

  // 使用初始化好的容器运行应用
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}
