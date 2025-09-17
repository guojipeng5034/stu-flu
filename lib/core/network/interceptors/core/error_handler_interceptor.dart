import 'package:dio/dio.dart';

import '../../../error/exceptions.dart';
import '../../../logger/app_logger.dart';
import 'base_interceptor.dart';

/// 统一错误处理拦截器
///
/// 负责处理所有网络请求错误，包括：
/// - 网络连接错误
/// - 服务器错误
/// - 超时错误
/// - 认证错误
/// - 缓存错误
class ErrorHandlerInterceptor extends BaseInterceptor {
  final void Function(DioException)? _onError;
  final bool _enableRetry;
  final int _maxRetries;
  final Duration _retryDelay;

  const ErrorHandlerInterceptor({
    void Function(DioException)? onError,
    bool enableRetry = true,
    int maxRetries = 3,
    Duration retryDelay = const Duration(seconds: 1),
  })  : _onError = onError,
        _enableRetry = enableRetry,
        _maxRetries = maxRetries,
        _retryDelay = retryDelay;

  @override
  String get name => 'ErrorHandlerInterceptor';

  @override
  int get priority => 90; // 较高优先级

  @override
  String get description => '统一处理网络请求错误';

  @override
  void handleError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      // 1. 记录错误日志
      _logError(err);

      // 2. 处理重试逻辑
      if (_enableRetry && _shouldRetry(err)) {
        final retryCount = err.requestOptions.extra['retry_count'] as int? ?? 0;
        if (retryCount < _maxRetries) {
          await _retryRequest(err, handler, retryCount);
          return;
        }
      }

      // 3. 转换错误类型
      final exception = _convertError(err);

      // 4. 调用自定义错误处理
      _onError?.call(err);

      // 5. 抛出统一的异常
      handler.next(DioException(
        requestOptions: err.requestOptions,
        error: exception,
        type: err.type,
        response: err.response,
        message: exception.toString(),
      ));
    } catch (e) {
      Log.e('❌ [错误处理] 处理失败: $e');
      handler.next(err);
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
            Log.e('🔥 [Network] $method $uri - 服务器错误 ($statusCode)\n数据: $data');
          } else if (statusCode >= 400) {
            Log.w('📱 [Network] $method $uri - 客户端错误 ($statusCode)\n数据: $data');
          }
        }
        break;
      default:
        Log.e('❓ [Network] $method $uri - ${error.message}');
        break;
    }
  }

  /// 判断是否应该重试请求
  bool _shouldRetry(DioException error) {
    // 只对以下错误类型进行重试
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError ||
        (error.type == DioExceptionType.badResponse &&
            error.response?.statusCode != null &&
            error.response!.statusCode! >= 500);
  }

  /// 重试请求
  Future<void> _retryRequest(
    DioException err,
    ErrorInterceptorHandler handler,
    int currentRetryCount,
  ) async {
    final options = err.requestOptions;

    try {
      // 等待重试延迟
      await Future.delayed(_retryDelay);

      // 更新重试计数
      options.extra['retry_count'] = currentRetryCount + 1;

      Log.i(
          '🔄 [Network] 重试请求 (${currentRetryCount + 1}/$_maxRetries): ${options.uri}');

      // 创建新的请求
      final clonedOptions = RequestOptions(
        path: options.path,
        method: options.method,
        headers: options.headers,
        queryParameters: options.queryParameters,
        data: options.data,
        sendTimeout: options.sendTimeout,
        receiveTimeout: options.receiveTimeout,
        extra: options.extra,
        baseUrl: options.baseUrl,
        contentType: options.contentType,
        responseType: options.responseType,
        validateStatus: options.validateStatus,
      );

      final dio = Dio();
      final response = await dio.fetch(clonedOptions);
      handler.resolve(response);
    } catch (e) {
      Log.e('❌ [Network] 重试失败: $e');
      handler.next(err);
    }
  }

  /// 转换错误类型
  Exception _convertError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException('请求超时');

      case DioExceptionType.connectionError:
        return NetworkException('网络连接错误');

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final data = error.response?.data;

        if (statusCode != null) {
          if (statusCode == 401) {
            return ServerException('未授权访问');
          } else if (statusCode == 403) {
            return ServerException('访问被拒绝');
          } else if (statusCode >= 500) {
            return ServerException('服务器错误 ($statusCode): ${data ?? "未知错误"}');
          } else if (statusCode >= 400) {
            return ServerException('请求错误 ($statusCode): ${data ?? "未知错误"}');
          }
        }
        return ServerException('响应错误: ${error.message}');

      case DioExceptionType.cancel:
        return NetworkException('请求已取消');

      default:
        return NetworkException(error.message ?? '未知网络错误');
    }
  }
}
