/// 认证事件的基类
abstract class AuthEvent {
  const AuthEvent();
}

/// 会话过期事件，当用户需要重新登录时触发
class SessionExpiredEvent extends AuthEvent {
  final String? message;

  const SessionExpiredEvent({this.message});
}

/// 令牌刷新成功事件，当令牌刷新成功后触发
class TokenRefreshedEvent extends AuthEvent {
  const TokenRefreshedEvent();
}

/// 登录成功事件
class LoginSuccessEvent extends AuthEvent {
  final String userId;
  final Map<String, dynamic>? userData;

  const LoginSuccessEvent({
    required this.userId,
    this.userData,
  });
}

/// 登出事件
class LogoutEvent extends AuthEvent {
  final bool isForced;
  final String? reason;

  const LogoutEvent({
    this.isForced = false,
    this.reason,
  });
}
