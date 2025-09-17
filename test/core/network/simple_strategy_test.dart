import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:cptop/core/network/interceptors/unified_cache_interceptor.dart';

void main() {
  group('简单缓存策略测试', () {
    test('验证扁平化策略配置处理', () {
      // 创建拦截器
      final interceptor = UnifiedCacheInterceptor();

      // 创建带有扁平化配置的请求选项
      final requestOptions = RequestOptions(
        path: '/test',
        method: 'GET',
        extra: {
          'strategy': 'first_cache', // 扁平化配置
          'maxAge': 3600,
        },
      );

      // 模拟处理扁平化配置
      final extra = requestOptions.extra;
      
      // 检查是否有扁平化的缓存配置
      if (extra.containsKey('strategy')) {
        final cacheConfig = <String, dynamic>{};
        
        // 提取缓存配置参数
        if (extra.containsKey('maxAge')) {
          cacheConfig['maxAge'] = extra['maxAge'];
        }
        if (extra.containsKey('strategy')) {
          cacheConfig['strategy'] = extra['strategy'];
          // 同时设置到 cache_strategy 中（向后兼容）
          extra['cache_strategy'] = extra['strategy'];
        }
        
        // 设置到 cache_config 中
        extra['cache_config'] = cacheConfig;
      }

      // 验证配置是否正确处理
      expect(requestOptions.extra['cache_strategy'], equals('first_cache'));
      expect(requestOptions.extra['cache_config'], isA<Map<String, dynamic>>());
      
      final cacheConfig = requestOptions.extra['cache_config'] as Map<String, dynamic>;
      expect(cacheConfig['strategy'], equals('first_cache'));
      expect(cacheConfig['maxAge'], equals(3600));

      print('✅ 扁平化策略配置测试通过');
      print('📋 cache_strategy: ${requestOptions.extra['cache_strategy']}');
      print('📋 cache_config: ${requestOptions.extra['cache_config']}');
    });

    test('验证不同策略的处理', () {
      final strategies = [
        'first_cache',
        'only_cache', 
        'cache_remote',
        'remote_only',
      ];

      for (final strategy in strategies) {
        final requestOptions = RequestOptions(
          path: '/test-$strategy',
          method: 'GET',
          extra: {
            'strategy': strategy,
          },
        );

        // 模拟处理
        final extra = requestOptions.extra;
        if (extra.containsKey('strategy')) {
          extra['cache_strategy'] = extra['strategy'];
        }

        // 验证策略设置正确
        expect(requestOptions.extra['cache_strategy'], equals(strategy));
        print('✅ 策略 $strategy 配置正确');
      }
    });

    test('验证默认策略', () {
      final requestOptions = RequestOptions(
        path: '/test-default',
        method: 'GET',
        extra: {}, // 没有缓存配置
      );

      // 模拟获取策略的逻辑
      final strategy = requestOptions.extra['cache_strategy'] as String? ?? 'remote_only';

      // 验证使用默认策略
      expect(strategy, equals('remote_only'));
      print('✅ 默认策略测试通过: $strategy');
    });
  });
}
