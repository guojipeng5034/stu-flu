import 'package:dio/dio.dart';
import 'package:synchronized/synchronized.dart';

import '../../auth/auth_storage_service.dart';
import '../../logger/app_logger.dart';
import '../config/network_config.dart';
import 'core/base_interceptor.dart';
import 'core/performance_interceptor.dart';
import 'interceptor_factory.dart';

/// 统一拦截器管理器
///
/// 负责创建和管理拦截器
class InterceptorManager {
  // 使用锁确保线程安全
  static final Lock _lock = Lock();

  // 性能监控拦截器实例
  static PerformanceInterceptor? _performanceInterceptor;

  /// 私有构造函数
  InterceptorManager._();

  /// 创建拦截器集合
  static Future<List<Interceptor>> create({
    required NetworkConfig config,
    AuthStorageService? authService,
    void Function(DioException)? onError,
  }) async {
    return _lock.synchronized(() async {
      try {
        // 使用拦截器工厂创建拦截器
        final interceptors = await InterceptorFactory.createFullInterceptors(
          config: config,
          authService: authService,
          onError: onError,
        );

        // 保存性能监控拦截器实例
        _performanceInterceptor =
            interceptors.whereType<PerformanceInterceptor>().firstOrNull;

        // 打印配置信息
        _printConfiguration(interceptors);

        return interceptors;
      } catch (e, stackTrace) {
        Log.e('创建拦截器失败', e, stackTrace);
        // 返回空列表，避免空指针异常
        return [];
      }
    });
  }

  /// 创建基础拦截器集合（推荐用于大多数场景）
  static Future<List<Interceptor>> createBasic({
    required NetworkConfig config,
    AuthStorageService? authService,
    void Function(DioException)? onError,
  }) async {
    return create(
      config: config,
      authService: authService,
      onError: onError,
    );
  }

  /// 验证拦截器配置
  static List<String> validateConfiguration(List<Interceptor> interceptors) {
    final issues = <String>[];

    // 检查必要的拦截器类型
    final hasAuth = interceptors
        .any((i) => i is BaseInterceptor && i.name.contains('Auth'));
    if (!hasAuth) {
      issues.add('缺少认证拦截器');
    }

    // 检查错误处理拦截器
    final hasErrorHandler = interceptors
        .any((i) => i is BaseInterceptor && i.name.contains('Error'));
    if (!hasErrorHandler) {
      issues.add('缺少错误处理拦截器');
    }

    // 检查拦截器优先级
    final baseInterceptors = interceptors.whereType<BaseInterceptor>().toList();
    if (baseInterceptors.isNotEmpty) {
      final sortedInterceptors = List<BaseInterceptor>.from(baseInterceptors)
        ..sort((a, b) => a.priority.compareTo(b.priority));

      if (sortedInterceptors.first.name != baseInterceptors.first.name) {
        issues.add('拦截器顺序不正确：拦截器未按优先级排序');
      }
    }

    return issues;
  }

  /// 获取性能统计
  static Map<String, dynamic> getPerformanceStats() {
    if (_performanceInterceptor != null) {
      return _performanceInterceptor!.getPerformanceStats();
    }

    return {
      'total_requests': 0,
      'success_requests': 0,
      'failed_requests': 0,
      'success_rate': '0.0',
      'avg_response_time': '0.0',
    };
  }

  /// 重置性能统计
  static void resetPerformanceStats() {
    if (_performanceInterceptor != null) {
      _performanceInterceptor!.resetPerformanceStats();
    }
  }

  /// 打印性能统计
  static void printPerformanceStats() {
    final stats = getPerformanceStats();
    Log.i('📊 [性能统计]');
    Log.i('   总请求数: ${stats['total_requests']}');
    Log.i('   成功请求数: ${stats['success_requests']}');
    Log.i('   失败请求数: ${stats['failed_requests']}');
    Log.i('   成功率: ${stats['success_rate']}%');
    Log.i('   平均响应时间: ${stats['avg_response_time']}ms');
    Log.i('   95%响应时间: ${stats['p95_response_time'] ?? 'N/A'}ms');
  }

  /// 记录请求
  static void recordRequest({bool fromCache = false}) {
    // 这个方法保留用于向后兼容，实际功能已由性能监控拦截器接管
  }

  /// 记录响应时间
  static void recordResponseTime(double timeMs) {
    // 这个方法保留用于向后兼容，实际功能已由性能监控拦截器接管
  }

  /// 打印拦截器配置信息
  static void _printConfiguration(List<Interceptor> interceptors) {
    // 检查日志是否启用
    try {
      Log.i('🔧 [拦截器配置] 共 ${interceptors.length} 个拦截器:');

      // 按优先级排序显示拦截器
      final baseInterceptors = interceptors
          .whereType<BaseInterceptor>()
          .toList()
        ..sort((a, b) => a.priority.compareTo(b.priority));

      for (int i = 0; i < baseInterceptors.length; i++) {
        final interceptor = baseInterceptors[i];
        Log.i(
            '   ${i + 1}. ${interceptor.name} (优先级: ${interceptor.priority})');
      }

      // 显示非BaseInterceptor类型的拦截器
      final otherInterceptors =
          interceptors.where((i) => i is! BaseInterceptor).toList();
      for (int i = 0; i < otherInterceptors.length; i++) {
        final interceptor = otherInterceptors[i];
        Log.i(
            '   ${baseInterceptors.length + i + 1}. ${interceptor.runtimeType}');
      }

      // 验证配置
      final issues = validateConfiguration(interceptors);
      if (issues.isNotEmpty) {
        Log.w('⚠️ [配置问题]:');
        for (final issue in issues) {
          Log.w('   - $issue');
        }
      } else {
        Log.i('✅ [配置验证] 拦截器配置正确');
      }
    } catch (e) {
      // 忽略日志错误
    }
  }

  /// 获取拦截器健康状态
  static Map<String, dynamic> getHealthStatus(List<Interceptor> interceptors) {
    final issues = validateConfiguration(interceptors);
    final stats = getPerformanceStats();

    return {
      'total_interceptors': interceptors.length,
      'base_interceptors': interceptors.whereType<BaseInterceptor>().length,
      'configuration_issues': issues,
      'is_healthy': issues.isEmpty,
      'performance_stats': stats,
      'last_check': DateTime.now().toIso8601String(),
    };
  }
}
