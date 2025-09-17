import 'package:dio/dio.dart';

import 'base_interceptor.dart';

/// 头部拦截器
///
/// 专门负责处理请求头部：
/// - 添加默认头部
/// - 添加自定义头部
/// - 处理内容类型
class HeadersInterceptor extends BaseInterceptor {
  final Map<String, String> _defaultHeaders;

  HeadersInterceptor({
    Map<String, String>? defaultHeaders,
  }) : _defaultHeaders = defaultHeaders ??
            const {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            };

  @override
  String get name => 'HeadersInterceptor';

  @override
  int get priority => 20; // 在认证拦截器之后

  @override
  String get description => '处理请求头部';

  @override
  void handleRequest(
      RequestOptions options, RequestInterceptorHandler handler) {
    try {
      // 添加默认头部
      final headers = Map<String, dynamic>.from(options.headers);
      _defaultHeaders.forEach((key, value) {
        headers.putIfAbsent(key, () => value);
      });
      options.headers = headers;

      handler.next(options);
    } catch (e) {
      handler.next(options);
    }
  }
}
