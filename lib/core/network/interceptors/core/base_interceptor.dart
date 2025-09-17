import 'package:dio/dio.dart';
import '../../../logger/app_logger.dart';

/// 基础拦截器抽象类
/// 提供通用的拦截器功能和规范
abstract class BaseInterceptor extends Interceptor {
  /// 拦截器名称
  String get name;
  
  /// 是否启用
  bool get enabled => true;
  
  /// 优先级（数字越小优先级越高）
  int get priority => 100;
  
  /// 拦截器描述
  String get description => '';

  /// 构造函数
  const BaseInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!enabled) {
      handler.next(options);
      return;
    }
    
    try {
      handleRequest(options, handler);
    } catch (e, stackTrace) {
      Log.e('[$name] 请求处理失败: $e', null, stackTrace);
      handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!enabled) {
      handler.next(response);
      return;
    }
    
    try {
      handleResponse(response, handler);
    } catch (e, stackTrace) {
      Log.e('[$name] 响应处理失败: $e', null, stackTrace);
      handler.next(response);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!enabled) {
      handler.next(err);
      return;
    }

    try {
      handleError(err, handler);
    } catch (e, stackTrace) {
      Log.e('[$name] 错误处理失败: $e', null, stackTrace);
      handler.next(err);
    }
  }

  /// 处理请求
  void handleRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  /// 处理响应
  void handleResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  /// 处理错误
  void handleError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  /// 获取拦截器信息
  Map<String, dynamic> getInfo() {
    return {
      'name': name,
      'enabled': enabled,
      'priority': priority,
      'description': description,
      'type': runtimeType.toString(),
    };
  }

  @override
  String toString() {
    return '$name(enabled: $enabled, priority: $priority)';
  }
}

/// 拦截器接口
abstract class InterceptorInterface {
  /// 拦截器名称
  String get name;
  
  /// 是否启用
  bool get enabled;
  
  /// 优先级
  int get priority;
  
  /// 获取拦截器信息
  Map<String, dynamic> getInfo();
}

/// 可配置拦截器接口
abstract class ConfigurableInterceptor extends BaseInterceptor {
  /// 配置参数
  Map<String, dynamic> get config;
  
  /// 更新配置
  void updateConfig(Map<String, dynamic> newConfig);
  
  /// 验证配置
  bool validateConfig(Map<String, dynamic> config);
}

/// 性能监控拦截器接口
abstract class PerformanceAwareInterceptor extends BaseInterceptor {
  /// 记录性能指标
  void recordMetrics(String operation, Duration duration);
  
  /// 获取性能统计
  Map<String, dynamic> getPerformanceStats();
  
  /// 重置性能统计
  void resetPerformanceStats();
}
