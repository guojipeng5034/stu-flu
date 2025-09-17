import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import '../../../logger/app_logger.dart';
import '../../cache/unified_cache_manager.dart';
import 'base_interceptor.dart';

/// 缓存拦截器
///
/// 专门负责处理缓存配置：
/// - 配置缓存策略
/// - 处理缓存选项
/// - 统一缓存键生成
class CacheInterceptor extends BaseInterceptor {
  final CacheOptions _cacheOptions;

  CacheInterceptor({
    CacheOptions? cacheOptions,
  }) : _cacheOptions = cacheOptions ??
            CacheOptions(
              store: MemCacheStore(),
              policy: CachePolicy.request,
              hitCacheOnErrorCodes: [401, 403, 404, 500],
              maxStale: const Duration(days: 7),
              priority: CachePriority.normal,
              keyBuilder: UnifiedCacheKeyGenerator.generate,
            );

  @override
  String get name => 'CacheInterceptor';

  @override
  int get priority => 40; // 中等优先级

  @override
  String get description => '处理缓存配置';

  @override
  void handleRequest(
      RequestOptions options, RequestInterceptorHandler handler) {
    try {
      // 处理缓存策略
      final strategy = options.extra['cache_strategy'] as String? ?? 'request';
      final policy = _getCachePolicy(strategy);

      // 创建请求特定的缓存选项
      final requestCacheOptions = _cacheOptions.copyWith(
        policy: policy,
      );

      // 将缓存选项保存到请求中
      options.extra['dio_cache_options'] = requestCacheOptions;

      handler.next(options);
    } catch (e) {
      Log.e('[$name] 处理缓存配置失败: $e');
      handler.next(options);
    }
  }

  /// 获取缓存策略
  CachePolicy _getCachePolicy(String strategy) {
    switch (strategy.toLowerCase()) {
      case 'no_cache':
        return CachePolicy.noCache;
      case 'refresh':
        return CachePolicy.refresh;
      case 'cache_first':
      case 'cache_only':
        return CachePolicy.forceCache;
      case 'refresh_force_cache':
        return CachePolicy.refreshForceCache;
      default:
        return CachePolicy.request;
    }
  }

  /// 获取缓存选项
  CacheOptions get cacheOptions => _cacheOptions;
}
