import 'package:dio/dio.dart';

import 'package:cptop/env/index.dart';

/// 网络环境类型
enum NetworkEnvironment {
  /// 开发环境
  dev,

  /// 测试环境
  test,

  /// 生产环境
  prod,
}

/// 网络配置，管理网络请求的基本配置信息
class NetworkConfig {
  /// API基础URL
  final String baseUrl;

  /// 连接超时时间（毫秒）
  final int connectTimeout;

  /// 接收超时时间（毫秒）
  final int receiveTimeout;

  /// 发送超时时间（毫秒）
  final int sendTimeout;

  /// 是否启用HTTP/2
  final bool enableHttp2;

  /// 默认请求头
  final Map<String, dynamic> headers;

  /// 是否启用日志
  final bool enableLogging;

  /// 刷新令牌URL
  final String refreshTokenUrl;

  /// 重试次数
  final int maxRetries;

  /// 网络环境
  final NetworkEnvironment environment;

  /// 是否启用HTTP缓存
  final bool enableCache;

  const NetworkConfig({
    required this.baseUrl,
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.sendTimeout,
    required this.enableHttp2,
    required this.headers,
    required this.enableLogging,
    required this.refreshTokenUrl,
    required this.maxRetries,
    required this.environment,
    required this.enableCache,
  });

  /// 从环境配置创建网络配置
  factory NetworkConfig.fromEnv() {
    final env = Env.instance;

    // 根据环境确定网络环境类型
    NetworkEnvironment networkEnv;
    if (env.isDevelopment) {
      networkEnv = NetworkEnvironment.dev;
    } else if (env.isStaging) {
      networkEnv = NetworkEnvironment.test;
    } else {
      networkEnv = NetworkEnvironment.prod;
    }

    return NetworkConfig(
      baseUrl: env.apiBaseUrl,
      connectTimeout: env.apiConnectTimeout,
      receiveTimeout: env.apiTimeout,
      sendTimeout: env.apiTimeout,
      enableHttp2: false, // 在生产和测试环境启用HTTP/2
      headers: {},
      enableLogging: env.enableLogs,
      refreshTokenUrl: '${env.getString("API.ENDPOINTS.AUTH")}/refresh',
      maxRetries: env.apiRetryCount,
      environment: networkEnv,
      enableCache: true, // 所有环境都启用缓存，提供更好的离线体验
    );
  }

  /// 创建Dio基本配置
  BaseOptions createDioOptions() {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: connectTimeout),
      receiveTimeout: Duration(milliseconds: receiveTimeout),
      sendTimeout: Duration(milliseconds: sendTimeout),
      headers: headers,
      validateStatus: (_) => true, // 不使用Dio内置的状态码验证，我们自己处理所有状态码
    );
  }

  /// 检查是否为开发环境
  bool get isDevelopment => environment == NetworkEnvironment.dev;

  /// 检查是否为测试环境
  bool get isTest => environment == NetworkEnvironment.test;

  /// 检查是否为生产环境
  bool get isProduction => environment == NetworkEnvironment.prod;
}
