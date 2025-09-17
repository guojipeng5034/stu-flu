import '../storage/storage_service.dart';

/// 认证存储服务类
/// 专门负责认证信息的本地存储和读取，如token、用户信息等
class AuthStorageService {
  final StorageService _storageService;

  // Token相关的键名 - 统一使用 access_token 保持一致性
  static const String _tokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userIdKey = 'user_id';
  static const String _usernameKey = 'username';
  static const String _rememberMeKey = 'remember_me';
  static const String _tokenExpireTimeKey = 'token_expire_time';

  AuthStorageService(this._storageService);

  /// 获取访问令牌
  String? getToken() {
    return _storageService.getString(_tokenKey);
  }

  /// 保存访问令牌
  Future<bool> setToken(String token) {
    print('AuthStorageService.setToken: $token');
    return _storageService.setString(_tokenKey, token);
  }

  /// 获取刷新令牌
  String? getRefreshToken() {
    return _storageService.getString(_refreshTokenKey);
  }

  /// 保存刷新令牌
  Future<bool> setRefreshToken(String token) {
    return _storageService.setString(_refreshTokenKey, token);
  }

  /// 获取用户ID
  String? getUserId() {
    return _storageService.getString(_userIdKey);
  }

  /// 保存用户ID
  Future<bool> setUserId(String userId) {
    return _storageService.setString(_userIdKey, userId);
  }

  /// 获取用户名
  String? getUsername() {
    return _storageService.getString(_usernameKey);
  }

  /// 保存用户名
  Future<bool> setUsername(String username) {
    return _storageService.setString(_usernameKey, username);
  }

  /// 获取记住登录状态
  bool getRememberMe() {
    return _storageService.getBool(_rememberMeKey) ?? false;
  }

  /// 保存记住登录状态
  Future<bool> setRememberMe(bool rememberMe) {
    return _storageService.setBool(_rememberMeKey, rememberMe);
  }

  /// 获取令牌过期时间
  int? getTokenExpireTime() {
    return _storageService.getInt(_tokenExpireTimeKey);
  }

  /// 保存令牌过期时间
  Future<bool> setTokenExpireTime(int expireTime) {
    return _storageService.setInt(_tokenExpireTimeKey, expireTime);
  }

  /// 检查用户是否已登录
  bool isLoggedIn() {
    final token = getToken();
    final userId = getUserId();
    return token != null &&
        token.isNotEmpty &&
        userId != null &&
        userId.isNotEmpty;
  }

  /// 检查令牌是否过期
  bool isTokenExpired() {
    final expireTime = getTokenExpireTime();
    if (expireTime == null) return false;
    return DateTime.now().millisecondsSinceEpoch > expireTime;
  }

  /// 保存完整的认证信息
  Future<void> saveAuthInfo({
    required String token,
    required String refreshToken,
    required String userId,
    required String username,
    bool rememberMe = false,
    int? tokenExpireTime,
  }) async {
    print(
        'AuthStorageService.saveAuthInfo: token=$token, refreshToken=$refreshToken, userId=$userId, username=$username');
    await setToken(token);
    await setRefreshToken(refreshToken);
    await setUserId(userId);
    await setUsername(username);
    await setRememberMe(rememberMe);

    if (tokenExpireTime != null) {
      await setTokenExpireTime(tokenExpireTime);
    }
  }

  /// 更新令牌信息
  Future<void> updateTokens({
    required String token,
    required String refreshToken,
    int? tokenExpireTime,
  }) async {
    await setToken(token);
    await setRefreshToken(refreshToken);

    if (tokenExpireTime != null) {
      await setTokenExpireTime(tokenExpireTime);
    }
  }

  /// 清除所有认证信息（登出）
  Future<void> clearAuthInfo() async {
    await _storageService.remove(_tokenKey);
    await _storageService.remove(_refreshTokenKey);
    await _storageService.remove(_userIdKey);
    await _storageService.remove(_usernameKey);
    await _storageService.remove(_rememberMeKey);
    await _storageService.remove(_tokenExpireTimeKey);
  }

  /// 获取所有认证信息（用于调试）
  Map<String, dynamic> getAuthInfo() {
    return {
      'token': getToken(),
      'refreshToken': getRefreshToken(),
      'userId': getUserId(),
      'username': getUsername(),
      'rememberMe': getRememberMe(),
      'tokenExpireTime': getTokenExpireTime(),
      'isLoggedIn': isLoggedIn(),
      'isTokenExpired': isTokenExpired(),
    };
  }
}
