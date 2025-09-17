import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import '../../auth/auth_storage_service.dart';
import '../cache/unified_cache_manager.dart';
import '../config/network_config.dart';
import 'core/auth_interceptor.dart';
import 'core/base_interceptor.dart';
import 'core/cache_interceptor.dart';
import 'core/error_handler_interceptor.dart';
import 'core/headers_interceptor.dart';
import 'core/logging_interceptor.dart';
import 'core/performance_interceptor.dart';

/// 拦截器工厂
///
/// 负责创建各种拦截器实例
class InterceptorFactory {
  InterceptorFactory._();

  /// 创建认证拦截器
  static AuthInterceptor createAuthInterceptor({
    AuthStorageService? authService,
  }) {
    return AuthInterceptor(
      authService: authService,
    );
  }

  /// 创建头部拦截器
  static HeadersInterceptor createHeadersInterceptor({
    Map<String, String>? defaultHeaders,
  }) {
    return HeadersInterceptor(
      defaultHeaders: defaultHeaders,
    );
  }

  /// 创建日志拦截器
  static LoggingInterceptor createLoggingInterceptor({
    bool enableVerbose = false,
  }) {
    return LoggingInterceptor(
      enableVerbose: enableVerbose,
    );
  }

  /// 创建性能监控拦截器
  static PerformanceInterceptor createPerformanceInterceptor() {
    return PerformanceInterceptor();
  }

  /// 创建错误处理拦截器
  static ErrorHandlerInterceptor createErrorHandlerInterceptor({
    void Function(DioException)? onError,
    bool enableRetry = true,
    int maxRetries = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) {
    return ErrorHandlerInterceptor(
      onError: onError,
      enableRetry: enableRetry,
      maxRetries: maxRetries,
      retryDelay: retryDelay,
    );
  }

  /// 创建缓存拦截器
  static Future<CacheInterceptor> createCacheInterceptor({
    CacheOptions? cacheOptions,
  }) async {
    // 如果没有提供缓存选项，则使用统一缓存管理器初始化
    final options = cacheOptions ?? await UnifiedCacheManager.initialize();

    return CacheInterceptor(
      cacheOptions: options,
    );
  }

  /// 创建基础拦截器集合
  static Future<List<Interceptor>> createBasicInterceptors({
    required NetworkConfig config,
    AuthStorageService? authService,
    void Function(DioException)? onError,
  }) async {
    final interceptors = <Interceptor>[];

    // 1. 认证拦截器
    interceptors.add(createAuthInterceptor(
      authService: authService,
    ));

    // 2. 头部拦截器
    interceptors.add(createHeadersInterceptor());

    // 3. 性能监控拦截器
    interceptors.add(createPerformanceInterceptor());

    // 4. 错误处理拦截器
    interceptors.add(createErrorHandlerInterceptor(
      onError: onError,
      enableRetry: config.maxRetries > 0,
      maxRetries: config.maxRetries,
    ));

    // 5. 日志拦截器（如果启用）
    if (config.enableLogging) {
      interceptors.add(createLoggingInterceptor(
        enableVerbose: config.isDevelopment,
      ));
    }

    // 6. 缓存拦截器（如果启用）
    if (config.enableCache) {
      interceptors.add(await createCacheInterceptor());
    }

    return interceptors;
  }

  /// 创建完整拦截器集合
  static Future<List<Interceptor>> createFullInterceptors({
    required NetworkConfig config,
    AuthStorageService? authService,
    void Function(DioException)? onError,
    CacheOptions? cacheOptions,
    List<Interceptor>? additionalInterceptors,
  }) async {
    final interceptors = <Interceptor>[];

    // 添加基础拦截器
    interceptors.addAll(await createBasicInterceptors(
      config: config,
      authService: authService,
      onError: onError,
    ));

    // 添加额外的拦截器
    if (additionalInterceptors != null) {
      interceptors.addAll(additionalInterceptors);
    }

    // 按优先级排序
    interceptors.sort((a, b) {
      final priorityA = a is BaseInterceptor ? a.priority : 100;
      final priorityB = b is BaseInterceptor ? b.priority : 100;
      return priorityA.compareTo(priorityB);
    });

    return interceptors;
  }
}
