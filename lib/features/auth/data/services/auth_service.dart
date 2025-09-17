import 'package:cptop/core/auth/auth_storage_service.dart' as CoreAuthService;
import 'package:cptop/core/index.dart';
import 'package:cptop/features/auth/data/api/auth_api.dart';
import 'package:cptop/features/auth/data/models/login_request.dart';

/// 认证业务服务类
/// 处理认证相关的业务逻辑，作为 Provider 和 API 之间的中间层
class AuthService {
  final AuthApi _authApi;
  final CoreAuthService.AuthStorageService _coreAuthService;

  AuthService(this._authApi, this._coreAuthService);

  /// 用户登录
  ///
  /// [username] 用户名
  /// [password] 密码
  /// [rememberMe] 是否记住登录
  ///
  /// 返回登录结果，包含用户信息或错误信息
  Future<AuthResult> login({
    required String username,
    required String password,
    bool rememberMe = false,
  }) async {
    try {
      // 输入验证
      final validationResult = _validateLoginInput(username, password);
      if (!validationResult.isSuccess) {
        return validationResult;
      }

      // 创建登录请求
      final loginRequest = LoginRequest(
        username: username.trim(),
        password: password,
        rememberMe: rememberMe,
      );

      Log.i('开始用户登录: $username');

      // 调用登录API
      final response = await _authApi.login(loginRequest);

      Log.i('登录API响应: ${response.status}, 消息: ${response.message}');

      if (response.data != null) {
        final loginData = response.data!;

        // 保存认证信息到本地存储
        await _coreAuthService.saveAuthInfo(
          token: loginData.accessToken,
          refreshToken: loginData.refreshToken,
          userId: loginData.userId.toString(),
          username: loginData.username,
          rememberMe: rememberMe,
        );

        Log.i('用户登录成功: ${loginData.username}');

        return AuthResult.success(
          userId: loginData.userId.toString(),
          username: loginData.username,
          token: loginData.accessToken,
        );
      } else {
        // API返回失败
        final errorMessage = response.message ?? '登录失败，请检查用户名和密码';
        Log.w('登录失败: $errorMessage');
        return AuthResult.failure(errorMessage);
      }
    } catch (e) {
      final errorMessage = _handleLoginError(e);
      Log.e('登录异常: $e');
      return AuthResult.failure(errorMessage);
    }
  }

  /// 用户登出
  ///
  /// 清除本地认证信息并调用服务器登出API
  Future<AuthResult> logout() async {
    try {
      // 获取当前token用于调用登出API
      final token = _coreAuthService.getToken();

      // 如果有token，调用服务器登出API
      if (token != null && token.isNotEmpty) {
        try {
          await _authApi.logout(token);
          Log.i('服务器登出成功');
        } catch (e) {
          // 即使服务器登出失败，也要清除本地数据
          Log.w('服务器登出失败，但继续清除本地数据: $e');
        }
      }

      // 清除本地认证信息
      await _coreAuthService.clearAuthInfo();
      Log.i('用户已登出');

      return AuthResult.success();
    } catch (e) {
      Log.e('登出过程中发生错误: $e');
      // 即使出错也要清除本地数据
      await _coreAuthService.clearAuthInfo();
      return AuthResult.success(); // 登出总是返回成功
    }
  }

  /// 刷新访问令牌
  ///
  /// 使用刷新令牌获取新的访问令牌
  Future<AuthResult> refreshToken() async {
    try {
      final refreshToken = _coreAuthService.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        Log.w('刷新令牌为空，需要重新登录');
        return AuthResult.failure('刷新令牌无效，请重新登录');
      }

      Log.i('开始刷新访问令牌');
      final response =
          await _authApi.refreshToken({'refresh_token': refreshToken});

      if (response.isSuccess && response.data != null) {
        final loginData = response.data!;

        // 更新令牌信息
        await _coreAuthService.updateTokens(
          token: loginData.accessToken,
          refreshToken: loginData.refreshToken,
        );

        Log.i('令牌刷新成功');

        return AuthResult.success(
          userId: loginData.userId.toString(),
          username: _coreAuthService.getUsername() ?? '',
          token: loginData.accessToken,
        );
      } else {
        Log.w('令牌刷新失败: ${response.message}');
        return AuthResult.failure('令牌刷新失败，请重新登录');
      }
    } catch (e) {
      Log.e('令牌刷新异常: $e');
      return AuthResult.failure('令牌刷新失败，请重新登录');
    }
  }

  /// 获取当前认证状态
  ///
  /// 从本地存储中获取认证信息
  AuthResult getCurrentAuthState() {
    try {
      final token = _coreAuthService.getToken();
      final userId = _coreAuthService.getUserId();
      final username = _coreAuthService.getUsername();

      if (token != null &&
          token.isNotEmpty &&
          userId != null &&
          userId.isNotEmpty) {
        return AuthResult.success(
          userId: userId,
          username: username ?? '',
          token: token,
        );
      } else {
        return AuthResult.unauthenticated();
      }
    } catch (e) {
      Log.e('获取认证状态失败: $e');
      return AuthResult.failure('获取认证状态失败');
    }
  }

  /// 保存验证码登录的token信息
  ///
  /// [accessToken] 访问令牌
  /// [refreshToken] 刷新令牌
  /// [tokenType] 令牌类型
  /// [expiresIn] 过期时长（秒）
  /// [userId] 用户ID
  /// [username] 用户名
  Future<AuthResult> saveMobileLoginToken({
    required String accessToken,
    required String refreshToken,
    required String tokenType,
    required int expiresIn,
    String? userId,
    String? username,
  }) async {
    try {
      // 计算token过期时间
      final expireTime =
          DateTime.now().millisecondsSinceEpoch + (expiresIn * 1000);

      // 保存认证信息到本地存储
      await _coreAuthService.saveAuthInfo(
        token: accessToken,
        refreshToken: refreshToken,
        userId: userId ?? '',
        username: username ?? '',
        rememberMe: true, // 验证码登录默认记住登录状态
        tokenExpireTime: expireTime,
      );

      Log.i('验证码登录token保存成功');

      return AuthResult.success(
        userId: userId ?? '',
        username: username ?? '',
        token: accessToken,
      );
    } catch (e) {
      Log.e('保存验证码登录token失败: $e');
      return AuthResult.failure('保存登录信息失败');
    }
  }

  /// 检查用户是否已登录
  bool isLoggedIn() {
    return _coreAuthService.isLoggedIn();
  }

  /// 验证登录输入
  AuthResult _validateLoginInput(String username, String password) {
    if (username.trim().isEmpty) {
      return AuthResult.failure('用户名不能为空');
    }
    if (password.trim().isEmpty) {
      return AuthResult.failure('密码不能为空');
    }
    return AuthResult.success();
  }

  /// 处理登录错误
  String _handleLoginError(dynamic error) {
    final errorStr = error.toString();
    if (errorStr.contains('401')) {
      return '用户名或密码错误';
    } else if (errorStr.contains('network') ||
        errorStr.contains('SocketException')) {
      return '网络连接失败，请检查网络设置';
    } else if (errorStr.contains('timeout')) {
      return '请求超时，请重试';
    } else {
      return '登录失败，请稍后重试';
    }
  }
}

/// 认证结果类
/// 封装认证操作的结果
class AuthResult {
  final bool isSuccess;
  final String? errorMessage;
  final String? userId;
  final String? username;
  final String? token;

  const AuthResult._({
    required this.isSuccess,
    this.errorMessage,
    this.userId,
    this.username,
    this.token,
  });

  /// 创建成功结果
  factory AuthResult.success({
    String? userId,
    String? username,
    String? token,
  }) {
    return AuthResult._(
      isSuccess: true,
      userId: userId,
      username: username,
      token: token,
    );
  }

  /// 创建失败结果
  factory AuthResult.failure(String errorMessage) {
    return AuthResult._(
      isSuccess: false,
      errorMessage: errorMessage,
    );
  }

  /// 创建未认证结果
  factory AuthResult.unauthenticated() {
    return const AuthResult._(
      isSuccess: false,
      errorMessage: null,
    );
  }

  /// 是否为未认证状态
  bool get isUnauthenticated => !isSuccess && errorMessage == null;

  /// 是否有错误
  bool get hasError => !isSuccess && errorMessage != null;

  @override
  String toString() {
    return 'AuthResult(isSuccess: $isSuccess, errorMessage: $errorMessage, userId: $userId, username: $username)';
  }
}
