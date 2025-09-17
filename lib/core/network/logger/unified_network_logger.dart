import 'package:dio/dio.dart';

import '../../logger/app_logger.dart';

/// 日志级别
enum LogLevel {
  /// 详细日志，包含所有信息
  verbose,

  /// 调试日志，包含大部分信息
  debug,

  /// 信息日志，包含重要信息
  info,

  /// 警告日志，包含警告信息
  warning,

  /// 错误日志，包含错误信息
  error,
}

/// 统一网络日志记录器
///
/// 将网络日志记录逻辑从拦截器中分离出来，提供统一的日志记录接口
class UnifiedNetworkLogger {
  /// 私有构造函数，防止实例化
  UnifiedNetworkLogger._();

  /// 日志级别
  static LogLevel _logLevel = LogLevel.debug;

  /// 是否记录请求体
  static bool _logRequestBody = true;

  /// 是否记录响应体
  static bool _logResponseBody = true;

  /// 是否隐藏敏感信息
  static bool _hideSensitiveInfo = true;

  /// 敏感头部字段
  static final Set<String> _sensitiveHeaders = {
    'authorization',
    'cookie',
    'token',
    'refresh-token',
    'api-key',
  };

  /// 配置日志记录器
  static void configure({
    LogLevel logLevel = LogLevel.debug,
    bool logRequestBody = true,
    bool logResponseBody = true,
    bool hideSensitiveInfo = true,
  }) {
    _logLevel = logLevel;
    _logRequestBody = logRequestBody;
    _logResponseBody = logResponseBody;
    _hideSensitiveInfo = hideSensitiveInfo;
  }

  /// 记录请求日志
  static void logRequest(RequestOptions options, {LogLevel? level}) {
    final logLevel = level ?? _logLevel;
    final method = options.method.toUpperCase();
    final uri = options.uri.toString();

    // 基本请求信息
    _log(logLevel, '🔗 [HTTP] $method $uri');

    // 请求头信息
    if (logLevel.index <= LogLevel.verbose.index) {
      final headers = _formatHeaders(options.headers);
      _log(logLevel, '📋 [HTTP] Headers: $headers');
    }

    // 请求体信息
    if (_logRequestBody &&
        options.data != null &&
        logLevel.index <= LogLevel.verbose.index) {
      _log(logLevel, '📦 [HTTP] Body: ${_formatData(options.data)}');
    }
  }

  /// 记录响应日志
  static void logResponse(Response response, {LogLevel? level}) {
    final logLevel = level ?? _logLevel;
    final method = response.requestOptions.method.toUpperCase();
    final uri = response.requestOptions.uri.toString();
    final statusCode = response.statusCode;
    final fromCache = response.extra['fromCache'] as bool? ?? false;

    // 计算响应时间
    final startTime = response.requestOptions.extra['_start_time'] as int?;
    String timeInfo = '';
    if (startTime != null) {
      final duration = DateTime.now().millisecondsSinceEpoch - startTime;
      timeInfo = ' (${duration}ms)';
    }

    // 基本响应信息
    final cacheFlag = fromCache ? '💾' : '✅';
    _log(logLevel, '$cacheFlag [HTTP] $method $uri - $statusCode$timeInfo');

    // 响应头信息
    if (logLevel.index <= LogLevel.verbose.index &&
        response.headers.map.isNotEmpty) {
      _log(logLevel,
          '📋 [HTTP] Response Headers: ${_formatHeaders(response.headers.map)}');
    }

    // 响应体信息
    if (_logResponseBody &&
        response.data != null &&
        logLevel.index <= LogLevel.verbose.index) {
      _log(logLevel, '📦 [HTTP] Response Body: ${_formatData(response.data)}');
    }
  }

  /// 记录错误日志
  static void logError(DioException error, {LogLevel? level}) {
    final logLevel = level ?? LogLevel.error;
    final method = error.requestOptions.method.toUpperCase();
    final uri = error.requestOptions.uri.toString();

    // 根据错误类型记录不同的日志
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        _log(logLevel, '⏰ [HTTP] $method $uri - 请求超时 (${error.type})');
        break;
      case DioExceptionType.connectionError:
        _log(logLevel, '🌐 [HTTP] $method $uri - 网络连接错误');
        break;
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;
        if (statusCode != null) {
          if (statusCode >= 500) {
            _log(logLevel, '🔥 [HTTP] $method $uri - 服务器错误 ($statusCode)');
            if (data != null) {
              _log(logLevel, '📦 [HTTP] 错误响应: ${_formatData(data)}');
            }
          } else if (statusCode >= 400) {
            _log(logLevel, '📱 [HTTP] $method $uri - 客户端错误 ($statusCode)');
            if (data != null) {
              _log(logLevel, '📦 [HTTP] 错误响应: ${_formatData(data)}');
            }
          }
        }
        break;
      default:
        _log(logLevel, '❓ [HTTP] $method $uri - ${error.message}');
        break;
    }

    // 记录错误堆栈
    if (logLevel.index <= LogLevel.debug.index) {
      _log(logLevel, '🔍 [HTTP] 错误堆栈: ${error.stackTrace}');
    }
  }

  /// 根据日志级别记录日志
  static void _log(LogLevel level, String message) {
    switch (level) {
      case LogLevel.verbose:
        Log.v(message);
        break;
      case LogLevel.debug:
        Log.d(message);
        break;
      case LogLevel.info:
        Log.i(message);
        break;
      case LogLevel.warning:
        Log.w(message);
        break;
      case LogLevel.error:
        Log.e(message);
        break;
    }
  }

  /// 格式化头部信息，隐藏敏感信息
  static dynamic _formatHeaders(Map<String, dynamic> headers) {
    if (!_hideSensitiveInfo) return headers;

    final formatted = <String, dynamic>{};
    headers.forEach((key, value) {
      if (_sensitiveHeaders.contains(key.toLowerCase())) {
        formatted[key] = '***';
      } else {
        formatted[key] = value;
      }
    });
    return formatted;
  }

  /// 格式化数据，限制长度
  static String _formatData(dynamic data) {
    if (data == null) return 'null';

    String result;
    if (data is Map || data is List) {
      try {
        // 尝试格式化JSON
        result = data.toString();
      } catch (e) {
        result = data.toString();
      }
    } else {
      result = data.toString();
    }

    // 限制长度
    const maxLength = 1000;
    if (result.length > maxLength) {
      result = '${result.substring(0, maxLength)}... (${result.length} chars)';
    }

    return result;
  }
}
