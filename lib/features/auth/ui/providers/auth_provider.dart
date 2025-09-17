import 'package:cptop/core/index.dart';
import 'package:cptop/features/auth/data/api/auth_api.dart';
import 'package:cptop/features/auth/data/models/stu_auth_resp_vo.dart';
import 'package:cptop/features/auth/data/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 用户认证状态
enum AuthStatus {
  /// 未初始化
  initial,

  /// 正在认证
  authenticating,

  /// 已认证
  authenticated,

  /// 未认证
  unauthenticated,

  /// 认证错误
  error,
}

/// 认证状态模型
class AuthState {
  final AuthStatus status;
  final String? userId;
  final String? errorMessage;
  final String? token;
  final String? username;

  const AuthState({
    this.status = AuthStatus.initial,
    this.userId,
    this.errorMessage,
    this.token,
    this.username,
  });

  bool get isAuthenticated => status == AuthStatus.authenticated;
  bool get isLoading => status == AuthStatus.authenticating;
  bool get hasError => status == AuthStatus.error;

  /// 创建初始状态
  factory AuthState.initial() => const AuthState(status: AuthStatus.initial);

  /// 创建认证中状态
  factory AuthState.authenticating() =>
      const AuthState(status: AuthStatus.authenticating);

  /// 创建已认证状态
  factory AuthState.authenticated({
    required String userId,
    required String token,
    String? username,
  }) =>
      AuthState(
        status: AuthStatus.authenticated,
        userId: userId,
        token: token,
        username: username,
      );

  /// 创建未认证状态
  factory AuthState.unauthenticated() =>
      const AuthState(status: AuthStatus.unauthenticated);

  /// 创建错误状态
  factory AuthState.error(String message) => AuthState(
        status: AuthStatus.error,
        errorMessage: message,
      );

  /// 拷贝当前状态并修改部分属性
  AuthState copyWith({
    AuthStatus? status,
    String? userId,
    String? errorMessage,
    String? token,
    String? username,
  }) {
    return AuthState(
      status: status ?? this.status,
      userId: userId ?? this.userId,
      errorMessage: errorMessage ?? this.errorMessage,
      token: token ?? this.token,
      username: username ?? this.username,
    );
  }

  @override
  String toString() {
    return 'AuthState(status: $status, userId: $userId, username: $username, hasError: $hasError)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthState &&
        other.status == status &&
        other.userId == userId &&
        other.errorMessage == errorMessage &&
        other.token == token &&
        other.username == username;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        userId.hashCode ^
        errorMessage.hashCode ^
        token.hashCode ^
        username.hashCode;
  }
}

/// 认证API提供者
final authApiProvider = DI.createApiProvider<AuthApi>(
  (dio) => AuthApi(dio),
);

/// 认证业务服务提供者
final authBusinessServiceProvider = FutureProvider<AuthService>((ref) async {
  final authApi = await ref.watch(authApiProvider.future);
  final coreAuthService = ref.watch(DI.auth.authServiceProvider);
  return AuthService(authApi, coreAuthService);
});

/// 认证状态提供者
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authServiceAsync = ref.watch(authBusinessServiceProvider);

  return authServiceAsync.when(
    data: (authService) => AuthNotifier(authService),
    loading: () => AuthNotifier.loading(),
    error: (error, stack) => AuthNotifier.error(error.toString()),
  );
});

/// 认证状态管理器
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService? _authService;

  AuthNotifier(this._authService) : super(AuthState.initial()) {
    if (_authService != null) {
      _init();
    }
  }

  /// 创建加载状态的 AuthNotifier
  AuthNotifier.loading()
      : _authService = null,
        super(AuthState.initial());

  /// 创建错误状态的 AuthNotifier
  AuthNotifier.error(String errorMessage)
      : _authService = null,
        super(AuthState.error(errorMessage));

  /// 初始化，从存储中加载认证状态
  Future<void> _init() async {
    if (_authService == null) {
      state = AuthState.error('认证服务未初始化');
      return;
    }

    try {
      final result = _authService!.getCurrentAuthState();

      if (result.isSuccess && result.userId != null) {
        state = AuthState.authenticated(
          token: result.token!,
          userId: result.userId!,
          username: result.username,
        );
      } else {
        state = AuthState.unauthenticated();
      }
    } catch (e) {
      Log.e('初始化认证状态失败: $e');
      state = AuthState.error('初始化认证状态失败: ${e.toString()}');
    }
  }

  /// 登录
  Future<bool> login(String username, String password,
      {bool rememberMe = false}) async {
    if (_authService == null) {
      state = AuthState.error('认证服务未初始化');
      return false;
    }

    // 设置认证中状态
    state = AuthState.authenticating();

    try {
      // 调用业务服务进行登录
      final result = await _authService!.login(
        username: username,
        password: password,
        rememberMe: rememberMe,
      );

      if (result.isSuccess && result.userId != null) {
        // 登录成功，更新状态
        state = AuthState.authenticated(
          token: result.token!,
          userId: result.userId!,
          username: result.username,
        );
        return true;
      } else {
        // 登录失败，更新错误状态
        state = AuthState.error(result.errorMessage ?? '登录失败');
        return false;
      }
    } catch (e) {
      // 异常处理
      Log.e('登录过程中发生异常: $e');
      state = AuthState.error('登录失败，请稍后重试');
      return false;
    }
  }

  /// 登出
  Future<void> logout() async {
    try {
      // 调用业务服务进行登出
      if (_authService != null) {
        await _authService!.logout();
      }

      // 无论结果如何，都更新为未认证状态
      state = AuthState.unauthenticated();
    } catch (e) {
      Log.e('登出过程中发生异常: $e');
      // 即使异常也要更新状态
      state = AuthState.unauthenticated();
    }
  }

  /// 密码重置/手动登录成功后，使用新的Token更新认证状态
  Future<void> loginSuccess(StudentAccessTokenVO tokenInfo,
      {String? userId, String? username}) async {
    if (_authService == null) {
      state = AuthState.error('认证服务未初始化');
      return;
    }

    try {
      // 调用核心认证服务保存新的Token信息
      await _authService!.saveMobileLoginToken(
        accessToken: tokenInfo.accessToken,
        refreshToken: tokenInfo.refreshToken,
        tokenType: tokenInfo.tokenType,
        expiresIn: tokenInfo.expiresIn,
        userId: userId,
        username: username,
      );

      // 更新状态为已认证
      state = AuthState.authenticated(
        token: tokenInfo.accessToken,
        userId: userId ?? state.userId ?? '',
        username: username ?? state.username,
      );
    } catch (e) {
      Log.e('手动更新Token失败: $e');
      state = AuthState.error('更新认证状态失败');
    }
  }

  /// 刷新令牌
  Future<bool> refreshToken() async {
    if (_authService == null) {
      await logout();
      return false;
    }

    try {
      // 调用业务服务刷新令牌
      final result = await _authService!.refreshToken();

      if (result.isSuccess && result.userId != null) {
        // 刷新成功，更新状态
        state = AuthState.authenticated(
          token: result.token!,
          userId: result.userId!,
          username: result.username,
        );
        return true;
      } else {
        // 刷新失败，执行登出
        await logout();
        return false;
      }
    } catch (e) {
      Log.e('刷新令牌过程中发生异常: $e');
      await logout();
      return false;
    }
  }

  /// 检查是否已登录
  bool isLoggedIn() {
    return state.isAuthenticated;
  }

  /// 获取当前用户信息
  String? get currentUserId => state.userId;
  String? get currentUsername => state.username;
  String? get currentToken => state.token;

  /// 验证码登录成功后保存token
  Future<bool> saveTokenFromMobileLogin({
    required String accessToken,
    required String refreshToken,
    required String tokenType,
    required int expiresIn,
    String? qqeToken,
    String? userId,
    String? username,
  }) async {
    if (_authService == null) {
      state = AuthState.error('认证服务未初始化');
      return false;
    }

    try {
      // print('调用 saveTokenFromMobileLogin, accessToken=$accessToken');
      // 调用AuthService保存token
      final result = await _authService!.saveMobileLoginToken(
        accessToken: accessToken,
        refreshToken: refreshToken,
        tokenType: tokenType,
        expiresIn: expiresIn,
        userId: userId,
        username: username,
      );

      if (result.isSuccess) {
        state = AuthState.authenticated(
          token: accessToken,
          userId: userId ?? '',
          username: username,
        );
        return true;
      } else {
        state = AuthState.error(result.errorMessage ?? '保存登录信息失败');
        return false;
      }
    } catch (e) {
      Log.e('保存验证码登录token失败: $e');
      state = AuthState.error('保存登录信息失败');
      return false;
    }
  }

  /// 清除错误状态
  void clearError() {
    if (state.hasError) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: null,
      );
    }
  }
}
