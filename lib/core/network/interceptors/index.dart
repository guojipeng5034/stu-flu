/// 现代化拦截器系统统一导出文件
///
/// 这个文件提供了拦截器系统的所有公共 API
/// 使用方式：import 'package:cptop/core/network/interceptors/index.dart';
library;

// 核心基础类
export 'core/base_interceptor.dart';

// 具体拦截器实现
export 'core/response_extra_interceptor.dart';
export 'core/cache_config_interceptor.dart';

// 统一管理器
export 'interceptor_manager.dart';

// 重新导出必要的依赖类型
export 'package:dio/dio.dart' show Dio, Interceptor, RequestOptions, Response, DioException;
export '../../auth/auth_storage_service.dart';
export '../../storage/storage_service.dart';
export '../config/network_config.dart';
/// 现代化拦截器系统版本信息
class InterceptorSystemInfo {
  static const String version = '3.0.0';
  static const String description = '现代化拦截器系统 - 简洁、高效、类型安全';
  static const List<String> features = [
    '统一管理器',
    '类型安全',
    '性能优化',
    '简洁API',
    '快速配置',
    '灵活扩展',
  ];

  /// 获取系统信息
  static Map<String, dynamic> getInfo() {
    return {
      'version': version,
      'description': description,
      'features': features,
      'build_date': DateTime.now().toIso8601String(),
    };
  }
}


