import 'network_config.dart';

/// NetworkConfig 扩展方法（统一定义）
/// 合并了之前分散在多个文件中的扩展方法
extension NetworkConfigExtension on NetworkConfig {
  /// 复制配置并修改部分属性
  NetworkConfig copyWith({
    String? baseUrl,
    int? connectTimeout,
    int? receiveTimeout,
    int? sendTimeout,
    bool? enableHttp2,
    Map<String, dynamic>? headers,
    bool? enableLogging,
    String? refreshTokenUrl,
    int? maxRetries,
    NetworkEnvironment? environment,
    bool? enableCache,
  }) {
    return NetworkConfig(
      baseUrl: baseUrl ?? this.baseUrl,
      connectTimeout: connectTimeout ?? this.connectTimeout,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
      sendTimeout: sendTimeout ?? this.sendTimeout,
      enableHttp2: enableHttp2 ?? this.enableHttp2,
      headers: headers ?? this.headers,
      enableLogging: enableLogging ?? this.enableLogging,
      refreshTokenUrl: refreshTokenUrl ?? this.refreshTokenUrl,
      maxRetries: maxRetries ?? this.maxRetries,
      environment: environment ?? this.environment,
      enableCache: enableCache ?? this.enableCache,
    );
  }

  /// 是否启用响应额外信息注入
  bool get enableResponseExtra => 
      headers.containsKey('X-Enable-Response-Extra') || 
      environment == NetworkEnvironment.dev;

  /// 检查是否为开发环境
  bool get isDevelopment => environment == NetworkEnvironment.dev;

  /// 检查是否为测试环境
  bool get isTest => environment == NetworkEnvironment.test;

  /// 检查是否为生产环境
  bool get isProduction => environment == NetworkEnvironment.prod;

  /// 获取环境名称
  String get environmentName {
    switch (environment) {
      case NetworkEnvironment.dev:
        return 'development';
      case NetworkEnvironment.test:
        return 'testing';
      case NetworkEnvironment.prod:
        return 'production';
    }
  }

  /// 是否应该启用详细日志
  bool get shouldEnableVerboseLogging {
    return isDevelopment || isTest;
  }

  /// 是否应该启用缓存调试
  bool get shouldEnableCacheDebug {
    return isDevelopment;
  }

  /// 获取推荐的重试次数
  int get recommendedMaxRetries {
    switch (environment) {
      case NetworkEnvironment.dev:
        return 2; // 开发环境快速失败
      case NetworkEnvironment.test:
        return 3; // 测试环境中等重试
      case NetworkEnvironment.prod:
        return 5; // 生产环境更多重试
    }
  }

  /// 获取推荐的超时时间
  Duration get recommendedTimeout {
    switch (environment) {
      case NetworkEnvironment.dev:
        return const Duration(seconds: 10); // 开发环境较短超时
      case NetworkEnvironment.test:
        return const Duration(seconds: 15); // 测试环境中等超时
      case NetworkEnvironment.prod:
        return const Duration(seconds: 30); // 生产环境较长超时
    }
  }

  /// 验证配置是否有效
  List<String> validateConfiguration() {
    final issues = <String>[];

    if (baseUrl.isEmpty) {
      issues.add('baseUrl不能为空');
    }

    if (!baseUrl.startsWith('http://') && !baseUrl.startsWith('https://')) {
      issues.add('baseUrl必须以http://或https://开头');
    }

    if (connectTimeout <= 0) {
      issues.add('connectTimeout必须大于0');
    }

    if (receiveTimeout <= 0) {
      issues.add('receiveTimeout必须大于0');
    }

    if (sendTimeout <= 0) {
      issues.add('sendTimeout必须大于0');
    }

    if (maxRetries < 0) {
      issues.add('maxRetries不能小于0');
    }

    if (maxRetries > 10) {
      issues.add('maxRetries不应该大于10');
    }

    return issues;
  }

  /// 获取配置摘要
  Map<String, dynamic> getConfigSummary() {
    return {
      'environment': environmentName,
      'baseUrl': baseUrl,
      'enableLogging': enableLogging,
      'enableCache': enableCache,
      'maxRetries': maxRetries,
      'connectTimeout': connectTimeout,
      'receiveTimeout': receiveTimeout,
      'sendTimeout': sendTimeout,
      'enableHttp2': enableHttp2,
      'enableResponseExtra': enableResponseExtra,
    };
  }
}