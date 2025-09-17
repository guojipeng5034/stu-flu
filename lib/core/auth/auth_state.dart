/// 路由守卫用的简单认证状态模型
///
/// 这是一个轻量级的认证状态模型，专门用于路由守卫
/// 与 features/auth 中的复杂状态模型分离，避免循环依赖
class AuthState {
  /// 用户是否已认证
  final bool isAuthenticated;

  /// 用户令牌
  final String? token;

  /// 用户ID
  final String? userId;

  /// 构造函数
  const AuthState({
    this.isAuthenticated = false,
    this.token,
    this.userId,
  });

  /// 创建未认证状态
  factory AuthState.unauthenticated() {
    return const AuthState(
      isAuthenticated: false,
      token: null,
      userId: null,
    );
  }

  /// 创建已认证状态
  factory AuthState.authenticated({
    required String token,
    required String userId,
  }) {
    return AuthState(
      isAuthenticated: true,
      token: token,
      userId: userId,
    );
  }

  /// 复制并修改当前状态
  AuthState copyWith({
    bool? isAuthenticated,
    String? token,
    String? userId,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      token: token ?? this.token,
      userId: userId ?? this.userId,
    );
  }

  @override
  String toString() {
    return 'AuthState(isAuthenticated: $isAuthenticated, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthState &&
        other.isAuthenticated == isAuthenticated &&
        other.token == token &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return isAuthenticated.hashCode ^ token.hashCode ^ userId.hashCode;
  }
}
