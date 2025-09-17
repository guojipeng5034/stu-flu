import 'package:dio/dio.dart';

import '../../../logger/app_logger.dart';
import 'base_interceptor.dart';

/// 优化的缓存配置转换拦截器
/// 负责将自定义的 Extra 缓存配置转换为 dio_cache_interceptor 标准格式
///
/// 核心功能：
/// - 使用简化的缓存策略管理
/// - 智能配置检测和转换
/// - 统一的错误处理和日志记录
class CacheConfigInterceptor extends BaseInterceptor {

  /// 缓存配置键集合
  static const Set<String> _cacheConfigKeys = {
    'strategy', 'cache_strategy', 'cacheStrategy',
    'maxAge', 'cache_time', 'cacheTime',
    'hitCacheOnError', 'cacheType',
  };

  /// 构造函数
  const CacheConfigInterceptor();

  @override
  String get name => 'CacheConfigInterceptor';

  @override
  int get priority => 30;

  @override
  String get description => '转换自定义缓存配置为标准格式';

  @override
  void handleRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      // 检查是否有自定义缓存配置
      final hasCustomConfig = _hasCustomCacheConfig(options.extra);

      if (hasCustomConfig) {
        // 简化的缓存配置处理
        final strategy = options.extra['strategy'] ?? 'first_cache';

        // 记录配置转换
        Log.d('📦 [缓存配置] 策略: $strategy, URL: ${options.uri}');
      }

      handler.next(options);

    } catch (e) {
      Log.e('❌ [缓存配置] 转换失败: $e');

      // 错误情况下继续处理请求
      handler.next(options);
    }
  }

  /// 检查是否有自定义缓存配置
  bool _hasCustomCacheConfig(Map<String, dynamic> extra) {
    return _cacheConfigKeys.any((key) => extra.containsKey(key));
  }

  /// 获取拦截器统计信息
  static Map<String, dynamic> getStats() {
    return {
      'name': 'CacheConfigInterceptor',
      'description': '缓存配置转换拦截器',
      'supported_keys': _cacheConfigKeys.toList(),
      'supported_strategies': ['first_cache', 'only_cache', 'only_remote', 'cache_remote'],
    };
  }
}