import 'package:cptop/core/auth/auth_storage_service.dart';
import 'package:cptop/core/logger/index.dart';
import 'package:cptop/core/network/config/network_config.dart';
import 'package:cptop/core/network/interceptors/interceptor_factory.dart';
import 'package:cptop/core/network/interceptors/interceptor_manager.dart';
import 'package:cptop/core/storage/storage_service.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:synchronized/synchronized.dart';

/// Dio客户端配置类
/// 负责创建和配置Dio实例
class DioClient {
  /// 使用弱引用存储Dio实例，避免内存泄漏
  static final Map<String, WeakReference<Dio>> _instances = {};

  /// 实例创建锁，确保线程安全
  static final Lock _instanceLock = Lock();

  /// 私有构造函数防止直接实例化
  DioClient._();

  /// 获取Dio实例，如果不存在则创建一个新的
  /// [storageService] - 存储服务，用于基础存储
  /// [authService] - 认证服务，用于认证拦截器
  /// [config] - 网络配置（可选，不传则使用默认环境配置）
  /// [clientKey] - 客户端标识，用于支持多API端点
  /// [additionalInterceptors] - 额外的拦截器
  /// [enableTypeConversion] - 是否启用类型转换，默认启用
  /// [enableCache] - 是否启用HTTP缓存（可选，不传则使用配置中的设置）
  static Future<Dio> getInstance({
    required StorageService storageService,
    required AuthStorageService authService,
    NetworkConfig? config,
    String clientKey = 'default',
    List<Interceptor>? additionalInterceptors,
    bool enableTypeConversion = true,
    bool? enableCache,
    CacheOptions? cacheOptions,
  }) async {
    return _instanceLock.synchronized(() async {
      // 检查现有实例
      final existingInstance = _instances[clientKey]?.target;
      if (existingInstance != null) {
        return existingInstance;
      }

      // 如果没有传入配置，则使用默认环境配置
      final networkConfig = config ?? NetworkConfig.fromEnv();

      // 如果没有明确指定缓存设置，则使用配置中的设置
      final shouldEnableCache = enableCache ?? networkConfig.enableCache;

      // 创建新实例
      final dio = await _createDio(
        storageService: storageService,
        authService: authService,
        config: networkConfig,
        additionalInterceptors: additionalInterceptors,
        enableTypeConversion: enableTypeConversion,
        enableCache: shouldEnableCache,
        cacheOptions: cacheOptions,
      );

      // 使用弱引用存储实例
      _instances[clientKey] = WeakReference(dio);

      return dio;
    });
  }

  /// 清除特定Dio实例
  static Future<void> clearInstance(String clientKey) async {
    await _instanceLock.synchronized(() {
      final instance = _instances[clientKey]?.target;
      if (instance != null) {
        instance.close(force: true);
      }
      _instances.remove(clientKey);
    });
  }

  /// 清除所有Dio实例
  static Future<void> clearAllInstances() async {
    await _instanceLock.synchronized(() {
      for (final entry in _instances.entries) {
        final instance = entry.value.target;
        if (instance != null) {
          instance.close(force: true);
        }
      }
      _instances.clear();
    });
  }

  /// 创建 API 服务
  ///
  /// 这是创建 API 服务的推荐方法
  ///
  /// 使用示例：
  /// ```dart
  /// final dio = await DioClient.getInstance(...);
  /// final userApi = DioClient.createApi(dio, (dio) => UserApi(dio));
  /// ```
  ///
  /// [dio] - Dio 实例
  /// [creator] - API 服务创建函数，接收 Dio 实例并返回 API 服务实例
  static T createApi<T>(Dio dio, T Function(Dio) creator) {
    return creator(dio);
  }

  /// 创建一个新的Dio实例
  static Future<Dio> _createDio({
    required StorageService storageService,
    required AuthStorageService authService,
    required NetworkConfig config,
    List<Interceptor>? additionalInterceptors,
    bool enableTypeConversion = true,
    bool enableCache = false,
    CacheOptions? cacheOptions,
  }) async {
    try {
      // 创建基本Dio实例
      final dio = Dio(config.createDioOptions());

      // 配置适配器
      _configureAdapter(dio, config);

      // 添加拦截器
      final interceptors = await InterceptorFactory.createFullInterceptors(
        config: config,
        authService: authService,
        onError: (error) {
          Log.e('网络请求错误', error, error.stackTrace);
        },
        cacheOptions: cacheOptions,
        additionalInterceptors: additionalInterceptors,
      );

      dio.interceptors.addAll(interceptors);

      // 验证拦截器配置
      final issues = InterceptorManager.validateConfiguration(dio.interceptors);
      if (issues.isNotEmpty) {
        Log.w('拦截器配置问题: ${issues.join(', ')}');
      }

      return dio;
    } catch (e, stackTrace) {
      Log.e('创建Dio实例失败', e, stackTrace);
      rethrow;
    }
  }

  /// 配置HTTP适配器
  static void _configureAdapter(Dio dio, NetworkConfig config) {
    // HTTP/2 适配器配置预留位置
    // 如需启用 HTTP/2，可在此处添加相关配置
  }

  /// 获取客户端性能统计
  static Map<String, dynamic> getPerformanceStats() {
    final stats = <String, dynamic>{
      'active_instances': _instances.length,
      'instance_keys': _instances.keys.toList(),
    };

    // 添加拦截器性能统计
    stats.addAll(InterceptorManager.getPerformanceStats());

    return stats;
  }

  /// 打印性能报告
  static void printPerformanceReport() {
    final stats = getPerformanceStats();
    Log.i('📊 [性能报告]');
    Log.i('   活跃实例数: ${stats['active_instances']}');
    Log.i('   实例标识: ${stats['instance_keys'].join(', ')}');
    Log.i('   总请求数: ${stats['total_requests']}');
    Log.i('   成功率: ${stats['success_rate']}%');
    Log.i('   平均响应时间: ${stats['avg_response_time']}ms');
  }

  /// 重置性能统计
  static void resetPerformanceStats() {
    InterceptorManager.resetPerformanceStats();
  }

  /// 检查拦截器健康状态
  static Map<String, dynamic> checkInterceptorHealth(String clientKey) {
    final dio = _instances[clientKey]?.target;
    if (dio == null) {
      return {'error': '客户端实例不存在'};
    }

    return InterceptorManager.getHealthStatus(dio.interceptors);
  }

  /// 诊断拦截器配置
  static List<String> diagnoseInterceptorConfiguration(String clientKey) {
    final dio = _instances[clientKey]?.target;
    if (dio == null) {
      return ['客户端实例不存在'];
    }

    final issues = InterceptorManager.validateConfiguration(dio.interceptors);
    if (issues.isEmpty) {
      return ['拦截器配置正常'];
    }

    return issues;
  }

  /// 启用缓存调试模式
  static void enableCacheDebug() {
    Log.i('🔍 [缓存调试] 调试模式已启用');
  }

  /// 打印缓存状态
  static void printCacheStatus([String clientKey = 'default']) {
    final dio = _instances[clientKey]?.target;
    if (dio == null) {
      Log.e('❌ 客户端实例不存在: $clientKey');
      return;
    }

    final health = checkInterceptorHealth(clientKey);
    Log.i('💾 [缓存状态]');
    Log.i('   缓存拦截器: ${health['has_cache_interceptor'] ? '✅ 已配置' : '❌ 未配置'}');
    Log.i('   总拦截器数: ${health['total_interceptors']}');
  }

  /// 测试缓存功能
  static Future<void> testCacheFunction(String testUrl,
      [String clientKey = 'default']) async {
    final dio = _instances[clientKey]?.target;
    if (dio == null) {
      Log.e('❌ 客户端实例不存在: $clientKey');
      return;
    }

    try {
      Log.i('🧪 [缓存测试] 开始测试缓存功能...');
      Log.i('🌐 [缓存测试] 测试URL: $testUrl');

      // 第一次请求
      final response1 = await dio.get(testUrl);
      Log.i('📥 [缓存测试] 第一次请求完成: ${response1.statusCode}');

      // 第二次请求（应该从缓存获取）
      final response2 = await dio.get(testUrl);
      Log.i('📥 [缓存测试] 第二次请求完成: ${response2.statusCode}');

      Log.i('✅ [缓存测试] 测试完成');
    } catch (e) {
      Log.e('❌ [缓存测试] 测试失败: $e');
    }
  }

  /// 快速缓存检查
  static void quickCacheCheck([String clientKey = 'default']) {
    Log.i('🔍 [快速检查] 开始缓存状态检查...');

    final dio = _instances[clientKey]?.target;
    if (dio == null) {
      Log.e('❌ 客户端实例不存在: $clientKey');
      return;
    }

    final health = checkInterceptorHealth(clientKey);
    final stats = getPerformanceStats();

    Log.i('💾 缓存拦截器: ${health['has_cache_interceptor'] ? '✅ 已配置' : '❌ 未配置'}');
    Log.i('📊 缓存命中率: ${stats['hit_rate'] ?? 0}%');
    Log.i('📈 总请求数: ${stats['total_requests'] ?? 0}');
    Log.i('✅ 缓存命中数: ${stats['cache_hits'] ?? 0}');

    if (health['has_cache_interceptor'] != true) {
      Log.w('⚠️ 缓存拦截器未配置，请检查 enableCache 参数');
    }

    if ((stats['total_requests'] ?? 0) == 0) {
      Log.i('💡 提示: 还没有发起任何请求，请先发起一些请求再检查');
    }
  }
}
