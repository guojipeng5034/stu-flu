import 'package:dio/dio.dart';

import '../../../auth/auth_storage_service.dart';
import '../../../logger/app_logger.dart';
import 'base_interceptor.dart';

/// 认证拦截器
///
/// 专门负责处理认证相关功能：
/// - 添加认证令牌
/// - 处理令牌刷新
/// - 处理认证错误
class AuthInterceptor extends BaseInterceptor {
  final AuthStorageService? _authService;

  const AuthInterceptor({
    AuthStorageService? authService,
  }) : _authService = authService;

  @override
  String get name => 'AuthInterceptor';

  @override
  int get priority => 10; // 高优先级，确保认证最先处理

  @override
  String get description => '处理认证令牌和刷新逻辑';

  @override
  void handleRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (_authService == null) {
      handler.next(options);
      return;
    }

    try {
      // 添加认证令牌
      final token = _authService!.getToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }

      handler.next(options);
    } catch (e) {
      Log.e('[$name] 添加认证令牌失败: $e');
      handler.next(options);
    }
  }

  @override
  void handleError(DioException err, ErrorInterceptorHandler handler) async {
    // 处理401错误，尝试刷新令牌
    if (_shouldRefreshToken(err)) {
      try {
        await _handleTokenRefresh(err, handler);
        return;
      } catch (e) {
        Log.e('[$name] 令牌刷新失败: $e');
      }
    }

    handler.next(err);
  }

  /// 判断是否需要刷新Token
  bool _shouldRefreshToken(DioException err) {
    return err.response?.statusCode == 401 &&
        _authService != null &&
        _authService!.getRefreshToken() != null;
  }

  /// 处理Token刷新
  Future<void> _handleTokenRefresh(
      DioException err, ErrorInterceptorHandler handler) async {
    if (_authService == null) {
      handler.next(err);
      return;
    }

    // 获取刷新令牌
    final refreshToken = _authService!.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      handler.next(err);
      return;
    }

    // 这里需要实现刷新Token的逻辑
    // 通常需要调用刷新Token的API
    // 简化版本，假设刷新失败
    bool refreshed = false;

    // 如果刷新成功，更新Token并重试请求
    if (refreshed) {
      // 使用新Token重试请求
      final options = err.requestOptions;
      final token = _authService!.getToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }

      // 重新发送请求
      final dio = Dio();
      final response = await dio.fetch(options);
      handler.resolve(response);
    } else {
      // 刷新失败，继续传递错误
      handler.next(err);
    }
  }
}
