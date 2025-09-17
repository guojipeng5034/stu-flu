import 'package:cptop/core/di/di.dart';
import 'package:cptop/core/logger/app_logger.dart';
import 'package:cptop/features/auth/ui/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 应用初始化状态
enum AppInitializationStatus {
  loading,
  completed,
  error,
}

/// 应用初始化状态数据
class AppInitializationState {
  final AppInitializationStatus status;
  final String? errorMessage;

  const AppInitializationState({
    required this.status,
    this.errorMessage,
  });

  AppInitializationState.loading() : this(status: AppInitializationStatus.loading);
  AppInitializationState.completed() : this(status: AppInitializationStatus.completed);
  AppInitializationState.error(String message) : this(status: AppInitializationStatus.error, errorMessage: message);

  bool get isLoading => status == AppInitializationStatus.loading;
  bool get isCompleted => status == AppInitializationStatus.completed;
  bool get hasError => status == AppInitializationStatus.error;
}

/// 应用初始化提供者
/// 负责协调所有核心服务的初始化
final appInitializationProvider = FutureProvider<AppInitializationState>((ref) async {
  try {
    // 1. 等待存储服务初始化
    await ref.watch(DI.services.storageServiceInitProvider.future);
    
    // 2. 等待网络服务初始化
    await ref.watch(DI.dioProvider.future);
    
    // 3. 等待认证服务初始化
    await ref.watch(authBusinessServiceProvider.future);
    
    // 4. 初始化认证状态
    // 这里不需要等待，因为认证状态会在后台异步初始化
    ref.read(authProvider);
    
    return AppInitializationState.completed();
  } catch (error, stackTrace) {
    // 记录错误
    Log.e('应用初始化失败: $error');
    Log.d('堆栈跟踪: $stackTrace');

    return AppInitializationState.error('初始化失败: ${error.toString()}');
  }
});
