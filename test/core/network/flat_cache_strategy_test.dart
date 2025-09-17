import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:cptop/core/network/index.dart';

void main() {
  group('扁平化缓存策略测试', () {
    late CacheInterceptor interceptor;
    late CacheStore cacheStore;

    setUp(() async {
      // 创建内存缓存存储
      cacheStore = MemCacheStore(
        maxSize: 10485760, // 10MB
        maxEntrySize: 1048576, // 1MB per entry
      );

      // 创建拦截器实例
      interceptor = CacheInterceptor(cacheStore: cacheStore);
    });

    test('应该正确处理扁平化的 strategy 配置', () async {
      // 创建带有扁平化配置的请求选项
      final requestOptions = RequestOptions(
        path: '/test',
        method: 'GET',
        extra: {
          'maxAge': 3600,
          'strategy': 'first_cache', // 扁平化配置
          'cacheType': 'disk',
          'hitCacheOnError': true,
        },
      );

      // 模拟请求处理
      bool handlerCalled = false;
      final handler = MockRequestInterceptorHandler(() {
        handlerCalled = true;
      });

      // 处理请求
      interceptor.onRequest(requestOptions, handler);

      // 验证配置是否正确处理
      expect(requestOptions.extra['cache_strategy'], equals('first_cache'));
      expect(requestOptions.extra['cache_config'], isA<Map<String, dynamic>>());
      
      final cacheConfig = requestOptions.extra['cache_config'] as Map<String, dynamic>;
      expect(cacheConfig['strategy'], equals('first_cache'));
      expect(cacheConfig['maxAge'], equals(3600));
      expect(cacheConfig['cacheType'], equals('disk'));
      expect(cacheConfig['hitCacheOnError'], equals(true));

      print('✅ 扁平化策略配置测试通过');
      print('📋 cache_strategy: ${requestOptions.extra['cache_strategy']}');
      print('📋 cache_config: ${requestOptions.extra['cache_config']}');
    });

    test('应该正确处理不同的缓存策略', () async {
      final strategies = [
        'first_cache',
        'only_cache',
        'cache_remote',
        'cache_remote_distinct',
        'remote_cache',
        'remote_only',
      ];

      for (final strategy in strategies) {
        final requestOptions = RequestOptions(
          path: '/test-$strategy',
          method: 'GET',
          extra: {
            'strategy': strategy,
            'maxAge': 1800,
          },
        );

        // 模拟请求处理
        final handler = MockRequestInterceptorHandler(() {});
        interceptor.onRequest(requestOptions, handler);

        // 验证策略设置正确
        expect(requestOptions.extra['cache_strategy'], equals(strategy));
        
        final cacheConfig = requestOptions.extra['cache_config'] as Map<String, dynamic>;
        expect(cacheConfig['strategy'], equals(strategy));

        print('✅ 策略 $strategy 配置正确');
      }
    });

    test('应该处理混合配置（扁平化 + cache_config）', () async {
      final requestOptions = RequestOptions(
        path: '/test-mixed',
        method: 'GET',
        extra: {
          'strategy': 'first_cache', // 扁平化
          'maxAge': 3600,           // 扁平化
          'cache_config': {         // 嵌套配置
            'priority': 'high',
            'customKey': 'test_key',
          },
        },
      );

      final handler = MockRequestInterceptorHandler(() {});
      interceptor.onRequest(requestOptions, handler);

      // 验证配置合并正确
      expect(requestOptions.extra['cache_strategy'], equals('first_cache'));
      
      final cacheConfig = requestOptions.extra['cache_config'] as Map<String, dynamic>;
      expect(cacheConfig['strategy'], equals('first_cache'));
      expect(cacheConfig['maxAge'], equals(3600));
      expect(cacheConfig['priority'], equals('high'));
      expect(cacheConfig['customKey'], equals('test_key'));

      print('✅ 混合配置测试通过');
      print('📋 最终配置: $cacheConfig');
    });

    test('应该使用默认策略当没有配置时', () async {
      final requestOptions = RequestOptions(
        path: '/test-default',
        method: 'GET',
        extra: {}, // 没有缓存配置
      );

      final handler = MockRequestInterceptorHandler(() {});
      interceptor.onRequest(requestOptions, handler);

      // 验证使用默认策略
      expect(requestOptions.extra['cache_strategy'], equals('remote_only'));

      print('✅ 默认策略测试通过');
    });

    tearDown(() async {
      // 清理缓存
      await cacheStore.clean();
    });
  });
}

/// 模拟请求拦截器处理器
class MockRequestInterceptorHandler extends RequestInterceptorHandler {
  final VoidCallback onNext;

  MockRequestInterceptorHandler(this.onNext);

  @override
  void next(RequestOptions requestOptions) {
    onNext();
  }

  @override
  void resolve(Response response, [bool callFollowingResponseInterceptor = false]) {
    // Mock implementation
  }

  @override
  void reject(DioException error, [bool callFollowingErrorInterceptor = false]) {
    // Mock implementation
  }
}
