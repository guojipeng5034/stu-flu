// Placeholder for dependency injection setup
// You might use a package like get_it or provider

import 'package:dio/dio.dart'; // Added import for Dio
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/auth_event_notifier.dart';
import '../auth/auth_events.dart';
import '../auth/auth_storage_service.dart';
import '../network/client/dio_client.dart';
import '../storage/storage_service.dart';

/// 依赖注入管理
/// 集中管理应用程序的依赖关系，使用Riverpod提供者模式
class DI {
  // 私有构造函数，防止实例化
  DI._();

  /// 服务分组
  /// 按功能分组管理Provider，便于查找和维护
  static final services = _Services();
  static final auth = _Auth();
  static final network = _Network();
  static final business = _Business();

  /// 便捷访问器 - 提供对常用 Provider 的直接访问
  /// 这些 getter 提供了更简洁的访问方式
  static FutureProvider<Dio> get dioProvider => _Network.dioProvider;

  /// 初始化容器的覆盖
  /// 在应用启动时调用此方法，设置所有需要的覆盖
  static Future<ProviderContainer> initializeProviders() async {
    // 创建临时容器来初始化异步依赖
    final tempContainer = ProviderContainer();

    try {
      // 等待存储服务初始化完成
      final storageService =
          await tempContainer.read(services.storageServiceInitProvider.future);

      // 创建新容器并覆盖存储服务提供者
      return ProviderContainer(
        overrides: [
          services.storageServiceProvider.overrideWithValue(storageService),
        ],
      );
    } finally {
      // 清理临时容器
      tempContainer.dispose();
    }
  }

  /// API 创建辅助方法
  ///
  /// 提供便捷的 API 创建方式，简化业务模块中的 Provider 代码
  ///
  /// 使用示例：
  /// ```dart
  /// final userApiProvider = DI.createApiProvider<UserApi>(
  ///   (dio) => UserApi(dio),
  /// );
  /// ```
  static FutureProvider<T> createApiProvider<T>(T Function(Dio) creator) {
    return FutureProvider<T>((ref) async {
      final dio = await ref.watch(DI.dioProvider.future);
      return DioClient.createApi(dio, creator);
    });
  }
}

/// 核心服务提供者
class _Services {
  // 静态存储服务实例 - 用于早期初始化
  static StorageService? _storageService;

  /// 注册存储服务实例
  void registerStorageService(StorageService service) {
    _storageService = service;
  }

  /// 获取存储服务实例
  StorageService getStorageService() {
    if (_storageService == null) {
      throw StateError('StorageService 尚未注册，请先调用 registerStorageService');
    }
    return _storageService!;
  }

  /// 存储服务提供者
  /// 提供对本地存储的访问
  final storageServiceProvider = Provider<StorageService>((ref) {
    throw UnimplementedError(
        'storageServiceProvider 尚未初始化，请先调用 storageServiceInitProvider');
  });

  /// 存储服务初始化提供者
  /// 异步初始化存储服务
  final storageServiceInitProvider =
      FutureProvider<StorageService>((ref) async {
    final prefs = await SharedPreferences.getInstance();
    return StorageService(prefs);
  });
}

/// 认证相关提供者
class _Auth {
  /// 认证存储服务提供者
  /// 提供用户认证相关的存储功能
  final authServiceProvider = Provider<AuthStorageService>((ref) {
    final storageService = ref.watch(DI.services.storageServiceProvider);
    return AuthStorageService(storageService);
  });

  /// 认证事件通知提供者
  /// 提供应用范围内的认证事件通知机制
  final authEventNotifierProvider =
      StateNotifierProvider<AuthEventNotifier, AuthEvent?>(
          (ref) => AuthEventNotifier());
}

/// 网络相关提供者
class _Network {
  /// Dio HTTP Client Provider - 网络层核心
  ///
  /// 提供配置完整的 Dio 实例，包含认证、缓存、拦截器等功能
  /// 网络配置（包括缓存设置）会自动从环境变量加载，实现完全解耦
  /// 这是网络层的核心，推荐在业务模块中使用
  static final dioProvider = FutureProvider<Dio>((ref) async {
    final storageService = ref.watch(DI.services.storageServiceProvider);
    final authService = ref.watch(DI.auth.authServiceProvider);

    // 不传递任何配置参数，让 DioClient 内部使用默认配置
    // 包括缓存设置也从 NetworkConfig 中读取
    final dio = await DioClient.getInstance(
      storageService: storageService,
      authService: authService,
    );

    // 当 Provider 被销毁时清理资源
    ref.onDispose(() {
      dio.close(force: true);
    });

    return dio;
  });
}

/// 业务服务提供者
class _Business {
  /// 认证业务服务提供者
  /// 提供认证相关的业务逻辑处理
  ///
  /// ⚠️ 当前为占位符，需根据实际业务类替换返回值
  final authBusinessServiceProvider = Provider<dynamic>((ref) {
    // 示例模板，需导入具体业务类并实现
    throw UnimplementedError('请在此处实现 AuthBusinessService 的创建逻辑');
  });

  // 这里可以添加其他业务服务的提供者
}

/// 功能服务
/// ========================================================
// 这里可以添加其他功能性服务的提供者
