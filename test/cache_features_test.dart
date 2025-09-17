import 'package:cptop/core/network/cache/unified_cache_manager.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('缓存功能测试', () {
    setUp(() async {
      // 初始化缓存管理器
      await UnifiedCacheManager.initialize(
        maxSize: 10,
        maxEntrySize: 1024 * 1024,
        defaultPolicy: CachePolicy.request,
        defaultMaxStale: const Duration(days: 1),
      );
    });

    tearDown(() async {
      // 清理缓存
      await UnifiedCacheManager.clearAll();
    });

    test('缓存初始化测试', () async {
      expect(UnifiedCacheManager.isInitialized, true);
      expect(UnifiedCacheManager.defaultOptions, isNotNull);
      expect(UnifiedCacheManager.cacheStore, isNotNull);
    });

    test('缓存键生成测试', () {
      final url = 'https://api.example.com/data';
      final key = UnifiedCacheKeyGenerator.generateForUrl(url);

      expect(key, isNotEmpty);
      expect(UnifiedCacheKeyGenerator.isValidKey(key), true);
    });

    test('缓存统计测试', () async {
      final stats = await UnifiedCacheManager.getStats();

      expect(stats, isNotNull);
      expect(stats['initialized'], true);
      expect(stats['store_type'], isNotNull);
    });
  });
}
