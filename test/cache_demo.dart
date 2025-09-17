import 'package:cptop/core/network/cache/unified_cache_manager.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';

/// 缓存演示
void main() {
  group('缓存演示', () {
    late Dio dio;

    setUp(() async {
      // 1. 初始化缓存管理器
      final cacheOptions = await UnifiedCacheManager.initialize(
        maxSize: 10,
        maxEntrySize: 1024 * 1024,
        defaultPolicy: CachePolicy.request,
        defaultMaxStale: const Duration(days: 1),
      );

      // 2. 创建Dio实例
      dio = Dio()
        ..interceptors.add(
          DioCacheInterceptor(options: cacheOptions),
        );
    });

    tearDown(() async {
      // 清理缓存
      await UnifiedCacheManager.clearAll();
    });

    test('缓存演示 - 基本用法', () async {
      const url = 'https://api.example.com/data';

      // 第一次请求 - 从网络获取
      final response1 = await dio.get(url);
      expect(response1.statusCode, 200);
      expect(response1.extra['cache_hit'], false);

      // 第二次请求 - 从缓存获取
      final response2 = await dio.get(url);
      expect(response2.statusCode, 200);
      expect(response2.extra['cache_hit'], true);
    });

    test('缓存演示 - 自定义策略', () async {
      const url = 'https://api.example.com/data';

      // 创建自定义缓存选项
      final customOptions = UnifiedCacheManager.createCustomOptions(
        policy: CachePolicy.refresh,
        maxStale: const Duration(hours: 1),
        hitCacheOnErrorCodes: [404, 500],
        priority: CachePriority.high,
      );

      // 使用自定义选项发起请求
      final response = await dio.get(
        url,
        options: Options().copyWith(
          extra: {
            'cache_options': customOptions,
          },
        ),
      );

      expect(response.statusCode, 200);
    });

    test('缓存演示 - 清理缓存', () async {
      const url = 'https://api.example.com/data';

      // 发起请求并缓存
      await dio.get(url);

      // 清理指定URL的缓存
      await UnifiedCacheManager.clearByUrl(url);

      // 再次请求 - 应该从网络获取
      final response = await dio.get(url);
      expect(response.extra['cache_hit'], false);
    });
  });
}
