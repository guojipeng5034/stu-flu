import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cptop/features/auth/ui/providers/auth_provider.dart';

/// 路由初始化状态
enum RouterInitializationState {
  initializing,
  ready,
  error,
}

/// 路由初始化状态提供者
/// 确保路由系统在所有依赖准备就绪后才开始工作
final routerInitializationProvider = StateNotifierProvider<RouterInitializationNotifier, RouterInitializationState>((ref) {
  return RouterInitializationNotifier(ref);
});

class RouterInitializationNotifier extends StateNotifier<RouterInitializationState> {
  final Ref _ref;

  RouterInitializationNotifier(this._ref) : super(RouterInitializationState.initializing) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      // 等待认证提供者初始化
      await Future.delayed(const Duration(milliseconds: 100));
      
      // 检查认证提供者是否可用
      _ref.read(authProvider);
      
      // 标记为就绪
      state = RouterInitializationState.ready;
    } catch (e) {
      print('路由初始化失败: $e');
      state = RouterInitializationState.error;
      
      // 重试初始化
      await Future.delayed(const Duration(seconds: 1));
      _initialize();
    }
  }

  /// 手动重新初始化
  void reinitialize() {
    state = RouterInitializationState.initializing;
    _initialize();
  }
}
