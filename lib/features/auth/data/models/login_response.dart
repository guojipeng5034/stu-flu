import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

/// 登录响应模型
@JsonSerializable()
class LoginResponse {
  /// 访问令牌
  @JsonKey(name: 'access_token')
  final String accessToken;

  /// 刷新令牌
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  /// 令牌类型
  @JsonKey(name: 'token_type')
  final String tokenType;

  /// 过期时间（秒）
  @JsonKey(name: 'expires_in')
  final int expiresIn;

  /// 用户ID
  @JsonKey(name: 'user_id')
  final int userId;

  /// 用户名
  final String username;

  /// 用户详细信息
  @JsonKey(name: 'user_info')
  final UserInfo userInfo;

  /// 构造函数
  const LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
    required this.userId,
    required this.username,
    required this.userInfo,
  });

  /// 从JSON创建对象
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  /// 将对象转换为JSON
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  /// 格式化打印对象内容

  /// 复制并创建新的对象
  LoginResponse copyWith({
    String? accessToken,
    String? refreshToken,
    String? tokenType,
    int? expiresIn,
    int? userId,
    String? username,
    UserInfo? userInfo,
  }) {
    return LoginResponse(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      tokenType: tokenType ?? this.tokenType,
      expiresIn: expiresIn ?? this.expiresIn,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      userInfo: userInfo ?? this.userInfo,
    );
  }
}

/// 用户详细信息模型
@JsonSerializable()
class UserInfo {
  /// 用户名
  final String username;

  /// 昵称
  final String nickname;

  /// 头像URL
  final String avatar;

  /// 用户类型
  @JsonKey(name: 'userType')
  final int userType;

  /// 部门ID
  @JsonKey(name: 'deptId')
  final String deptId;

  /// 关联部门ID
  @JsonKey(name: 'deptIds')
  final String? deptIds;

  /// 构造函数
  const UserInfo({
    required this.username,
    required this.nickname,
    required this.avatar,
    required this.userType,
    required this.deptId,
    this.deptIds,
  });

  /// 从JSON创建对象
  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  /// 将对象转换为JSON
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
