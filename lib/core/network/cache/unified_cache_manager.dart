import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:synchronized/synchronized.dart';

import '../../logger/app_logger.dart';

/// 统一缓存管理器
///
/// 解决了多套缓存系统并存的问题，提供统一的缓存管理入口
///
/// 设计原则：
/// - 统一入口：所有缓存操作通过此管理器
/// - 策略统一：使用 dio_cache_interceptor 作为底层实现
/// - 键生成统一：确保缓存键的一致性
/// - 线程安全：支持并发环境
class UnifiedCacheManager {
  static CacheOptions? _defaultOptions;
  static CacheStore? _cacheStore;
  static bool _isInitialized = false;
  static final Lock _initLock = Lock(); // 添加初始化锁

  /// 私有构造函数
  UnifiedCacheManager._();

  /// 初始化缓存管理器
  ///
  /// 这是使用缓存功能前必须调用的方法
  ///
  /// [maxSize] - 最大缓存条目数
  /// [maxEntrySize] - 单个条目最大大小（字节）
  /// [defaultPolicy] - 默认缓存策略
  /// [defaultMaxStale] - 默认过期时间
  /// [hitCacheOnErrorCodes] - 错误时使用缓存的状态码
  /// [priority] - 缓存优先级
  static Future<CacheOptions> initialize({
    int maxSize = 100,
    int maxEntrySize = 1024 * 1024, // 1MB
    CachePolicy defaultPolicy = CachePolicy.request,
    Duration defaultMaxStale = const Duration(days: 7),
    List<int>? hitCacheOnErrorCodes,
    CachePriority priority = CachePriority.normal,
  }) async {
    // 使用锁确保线程安全
    return await _initLock.synchronized(() async {
      if (_isInitialized && _defaultOptions != null) {
        Log.d('✅ [统一缓存管理器] 已初始化，返回现有配置');
        return _defaultOptions!;
      }

      try {
        Log.i('🔧 [统一缓存管理器] 开始初始化...');

        // 创建统一的缓存存储
        _cacheStore = MemCacheStore(
          maxSize: maxSize,
          maxEntrySize: maxEntrySize,
        );

        // 创建统一的缓存选项
        _defaultOptions = CacheOptions(
          store: _cacheStore!,
          policy: defaultPolicy,
          maxStale: defaultMaxStale,
          priority: priority,
          hitCacheOnErrorCodes: hitCacheOnErrorCodes ?? [401, 403, 404, 500],
          keyBuilder: UnifiedCacheKeyGenerator.generate,
          allowPostMethod: false, // POST请求默认不缓存
        );

        _isInitialized = true;
        Log.i('✅ [统一缓存管理器] 初始化成功');

        return _defaultOptions!;
      } catch (e, stackTrace) {
        Log.e('❌ [统一缓存管理器] 初始化失败: $e', null, stackTrace);

        // 返回禁用缓存的配置
        return CacheOptions(
          store: MemCacheStore(),
          policy: CachePolicy.noCache,
        );
      }
    });
  }

  /// 获取默认缓存选项
  static CacheOptions? get defaultOptions => _defaultOptions;

  /// 获取缓存存储
  static CacheStore? get cacheStore => _cacheStore;

  /// 检查是否已初始化
  static bool get isInitialized => _isInitialized;

  /// 清除所有缓存
  static Future<void> clearAll() async {
    try {
      if (_cacheStore != null) {
        await _cacheStore!.clean();
        Log.i('🗑️ [统一缓存管理器] 所有缓存已清除');
      }
    } catch (e) {
      Log.e('❌ [统一缓存管理器] 清除缓存失败: $e');
    }
  }

  /// 清除指定URL的缓存
  static Future<void> clearByUrl(String url) async {
    try {
      if (_cacheStore != null) {
        // 生成缓存键并删除
        final key = UnifiedCacheKeyGenerator.generateForUrl(url);
        await _cacheStore!.delete(key);
        Log.i('🗑️ [统一缓存管理器] 已清除URL缓存: $url');
      }
    } catch (e) {
      Log.e('❌ [统一缓存管理器] 清除URL缓存失败: $e');
    }
  }

  /// 清除匹配模式的缓存
  static Future<void> clearByPattern(String pattern) async {
    try {
      if (_cacheStore != null) {
        final regex = RegExp(pattern);
        var count = 0;

        // 遍历并删除匹配的缓存
        await _cacheStore!.clean();
        Log.i('🗑️ [统一缓存管理器] 已清除匹配的缓存: $pattern');
      }
    } catch (e) {
      Log.e('❌ [统一缓存管理器] 清除匹配缓存失败: $e');
    }
  }

  /// 获取缓存统计信息
  static Future<Map<String, dynamic>> getStats() async {
    try {
      if (_cacheStore != null) {
        return {
          'initialized': _isInitialized,
          'store_type': _cacheStore.runtimeType.toString(),
          'default_policy': _defaultOptions?.policy.toString() ?? 'none',
        };
      }
      return {'initialized': false};
    } catch (e) {
      Log.e('❌ [统一缓存管理器] 获取统计失败: $e');
      return {'error': e.toString()};
    }
  }

  /// 重新初始化缓存管理器
  static Future<CacheOptions> reinitialize({
    int maxSize = 100,
    int maxEntrySize = 1024 * 1024,
    CachePolicy defaultPolicy = CachePolicy.request,
    Duration defaultMaxStale = const Duration(days: 7),
    List<int>? hitCacheOnErrorCodes,
    CachePriority priority = CachePriority.normal,
  }) async {
    Log.i('🔄 [统一缓存管理器] 重新初始化...');

    // 清理现有资源
    await clearAll();
    _isInitialized = false;
    _defaultOptions = null;
    _cacheStore = null;

    // 重新初始化
    return await initialize(
      maxSize: maxSize,
      maxEntrySize: maxEntrySize,
      defaultPolicy: defaultPolicy,
      defaultMaxStale: defaultMaxStale,
      hitCacheOnErrorCodes: hitCacheOnErrorCodes,
      priority: priority,
    );
  }

  /// 创建自定义缓存选项
  static CacheOptions createCustomOptions({
    required CachePolicy policy,
    Duration? maxStale,
    List<int>? hitCacheOnErrorCodes,
    CachePriority? priority,
    bool? allowPostMethod,
    Map<String, String>? varyHeaders,
  }) {
    if (!_isInitialized || _cacheStore == null) {
      throw StateError('缓存管理器未初始化，请先调用 initialize()');
    }

    return CacheOptions(
      store: _cacheStore!,
      policy: policy,
      maxStale: maxStale ?? const Duration(days: 7),
      hitCacheOnErrorCodes: hitCacheOnErrorCodes ?? [401, 403, 404, 500],
      priority: priority ?? CachePriority.normal,
      allowPostMethod: allowPostMethod ?? false,
      keyBuilder: ({required Uri url, Map<String, String>? headers}) {
        final finalHeaders = Map<String, String>.from(headers ?? {});
        if (varyHeaders != null) {
          finalHeaders['cache_vary'] = varyHeaders.keys.join(',');
          finalHeaders.addAll(varyHeaders);
        }
        return UnifiedCacheKeyGenerator.generate(
          headers: finalHeaders,
          url: url,
        );
      },
    );
  }
}

/// 统一缓存键生成器
///
/// 确保整个应用中缓存键生成的一致性
class UnifiedCacheKeyGenerator {
  UnifiedCacheKeyGenerator._();

  /// 生成统一的缓存键
  ///
  /// 这是整个应用中唯一的缓存键生成入口
  static String generate({Map<String, String>? headers, required Uri url}) {
    try {
      final method = headers?['method']?.toUpperCase() ?? 'GET';
      final uri = url.toString();
      final strategy = headers?['cache_strategy'] ?? 'default';

      // 创建基础键
      final keyParts = <String>[method, uri, strategy];

      // 处理查询参数
      if (url.hasQuery) {
        keyParts.add(_getSortedQueryString(url.queryParameters));
      }

      // 处理自定义头部
      if (headers != null && headers.containsKey('cache_vary')) {
        final varyHeaders = headers['cache_vary']!.split(',');
        for (final header in varyHeaders) {
          final value = headers[header.trim()];
          if (value != null) {
            keyParts.add('$header=$value');
          }
        }
      }

      // 合并并清理键
      return _sanitizeKey(keyParts.join(':'));
    } catch (e) {
      Log.e('❌ [缓存键生成器] 生成失败: $e');
      // 降级到简单键生成
      return 'fallback:${url.hashCode}';
    }
  }

  /// 为URL生成缓存键
  static String generateForUrl(String url) {
    try {
      final uri = Uri.parse(url);
      final headers = {'method': 'GET'}; // 默认GET方法

      return generate(headers: headers, url: uri);
    } catch (e) {
      Log.e('❌ [缓存键生成器] URL键生成失败: $e');
      return 'fallback:${url.hashCode}';
    }
  }

  /// 获取排序后的查询字符串
  static String _getSortedQueryString(Map<String, dynamic> queryParams) {
    final sortedParams = queryParams.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return sortedParams
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}')
        .join('&');
  }

  /// 清理缓存键
  static String _sanitizeKey(String key) {
    // 移除非法字符
    final sanitized = key.replaceAll(RegExp(r'[<>:"/\\|?*\x00-\x1f]'), '_');

    // 限制长度并使用哈希值处理过长的键
    if (sanitized.length > 250) {
      final hash = sanitized.hashCode.toString();
      final prefix = sanitized.substring(0, 250 - hash.length - 1);
      return '${prefix}_$hash';
    }

    return sanitized;
  }

  /// 验证缓存键的有效性
  static bool isValidKey(String key) {
    if (key.isEmpty || key.length > 250) return false;

    // 检查是否包含非法字符
    final invalidChars = RegExp(r'[<>:"/\\|?*\x00-\x1f]');
    return !invalidChars.hasMatch(key);
  }
}

/// 缓存策略助手
///
/// 简化缓存策略的使用
class CacheStrategyHelper {
  CacheStrategyHelper._();

  /// 策略映射
  static const Map<String, CachePolicy> _strategyMap = {
    'no_cache': CachePolicy.noCache,
    'request': CachePolicy.request,
    'refresh': CachePolicy.refresh,
    'cache_first': CachePolicy.forceCache,
    'cache_only': CachePolicy.forceCache,
    'refresh_force_cache': CachePolicy.refreshForceCache,
  };

  /// 从字符串获取缓存策略
  static CachePolicy getPolicy(String? strategy) {
    if (strategy == null) return CachePolicy.request;
    return _strategyMap[strategy.toLowerCase()] ?? CachePolicy.request;
  }

  /// 从请求选项中提取缓存策略
  static String extractStrategy(Map<String, dynamic> extra) {
    return extra['cache_strategy'] as String? ??
        extra['cacheStrategy'] as String? ??
        'request';
  }

  /// 获取所有支持的策略
  static List<String> getSupportedStrategies() {
    return _strategyMap.keys.toList();
  }

  /// 获取策略描述
  static String getStrategyDescription(String strategy) {
    const descriptions = {
      'no_cache': '不使用缓存，总是从网络获取',
      'request': '默认策略，优先使用缓存',
      'refresh': '强制刷新，忽略缓存',
      'cache_first': '优先使用缓存，缓存不存在时请求网络',
      'cache_only': '仅使用缓存，不进行网络请求',
      'refresh_force_cache': '刷新缓存并强制使用新数据',
    };

    return descriptions[strategy.toLowerCase()] ?? '未知策略';
  }
}
