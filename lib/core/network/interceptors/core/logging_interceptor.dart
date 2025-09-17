import 'package:dio/dio.dart';

import '../../../logger/app_logger.dart';
import 'base_interceptor.dart';

/// 日志拦截器
///
/// 专门负责处理请求和响应的日志记录：
/// - 记录请求信息
/// - 记录响应信息
/// - 记录错误信息
class LoggingInterceptor extends BaseInterceptor {
  final bool _enableVerbose;

  LoggingInterceptor({
    bool enableVerbose = false,
  }) : _enableVerbose = enableVerbose;

  @override
  String get name => 'LoggingInterceptor';

  @override
  int get priority => 50; // 中等优先级

  @override
  String get description => '处理请求和响应的日志记录';

  @override
  void handleRequest(
      RequestOptions options, RequestInterceptorHandler handler) {
    try {
      _logRequest(options);
      handler.next(options);
    } catch (e) {
      Log.e('[$name] 记录请求日志失败: $e');
      handler.next(options);
    }
  }

  @override
  void handleResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      _logResponse(response);
      handler.next(response);
    } catch (e) {
      Log.e('[$name] 记录响应日志失败: $e');
      handler.next(response);
    }
  }

  @override
  void handleError(DioException err, ErrorInterceptorHandler handler) {
    try {
      _logError(err);
      handler.next(err);
    } catch (e) {
      Log.e('[$name] 记录错误日志失败: $e');
      handler.next(err);
    }
  }

  /// 记录请求日志
  void _logRequest(RequestOptions options) {
    final method = options.method.toUpperCase();
    final uri = options.uri.toString();

    Log.i('🌐 [Network] $method $uri');

    if (_enableVerbose) {
      if (options.queryParameters.isNotEmpty) {
        Log.d('📝 [Network] 查询参数: ${options.queryParameters}');
      }

      if (options.data != null) {
        Log.d('📝 [Network] 请求数据: ${_truncateData(options.data)}');
      }

      Log.d('📝 [Network] 请求头: ${_filterSensitiveHeaders(options.headers)}');
    }
  }

  /// 记录响应日志
  void _logResponse(Response response) {
    final method = response.requestOptions.method.toUpperCase();
    final uri = response.requestOptions.uri.toString();
    final statusCode = response.statusCode;

    // 计算响应时间
    final startTime = response.requestOptions.extra['_start_time'] as int?;
    String duration = '';
    if (startTime != null) {
      final endTime = DateTime.now().millisecondsSinceEpoch;
      duration = ' (${endTime - startTime}ms)';
    }

    Log.i('✅ [Network] $method $uri - $statusCode$duration');

    if (_enableVerbose) {
      Log.d('📝 [Network] 响应数据: ${_truncateData(response.data)}');
    }
  }

  /// 记录错误日志
  void _logError(DioException error) {
    final method = error.requestOptions.method.toUpperCase();
    final uri = error.requestOptions.uri.toString();

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        Log.w('⏰ [Network] $method $uri - 请求超时');
        break;
      case DioExceptionType.connectionError:
        Log.w('🌐 [Network] $method $uri - 网络连接错误');
        break;
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;
        if (statusCode != null) {
          if (statusCode >= 500) {
            Log.e('🔥 [Network] $method $uri - 服务器错误 ($statusCode)');
            if (_enableVerbose) {
              Log.e('📝 [Network] 错误数据: ${_truncateData(data)}');
            }
          } else if (statusCode >= 400) {
            Log.w('📱 [Network] $method $uri - 客户端错误 ($statusCode)');
            if (_enableVerbose) {
              Log.w('📝 [Network] 错误数据: ${_truncateData(data)}');
            }
          }
        }
        break;
      default:
        Log.e('❓ [Network] $method $uri - ${error.message}');
        break;
    }
  }

  /// 过滤敏感头部信息
  Map<String, dynamic> _filterSensitiveHeaders(Map<String, dynamic> headers) {
    final filtered = Map<String, dynamic>.from(headers);
    final sensitiveHeaders = ['Authorization', 'Cookie', 'token'];

    for (final header in sensitiveHeaders) {
      if (filtered.containsKey(header)) {
        filtered[header] = '******';
      }
    }

    return filtered;
  }

  /// 截断过长的数据
  String _truncateData(dynamic data) {
    if (data == null) return 'null';

    final str = data.toString();
    const maxLength = 500;

    if (str.length <= maxLength) {
      return str;
    }

    return '${str.substring(0, maxLength)}... (${str.length - maxLength} more characters)';
  }
}
