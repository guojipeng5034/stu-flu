import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

/// 登录请求模型
@JsonSerializable()
class LoginRequest {
  /// 用户名/邮箱
  final String username;

  /// 密码
  final String password;

  /// 是否记住登录状态
  @JsonKey(name: 'remember_me')
  final bool rememberMe;

  final String scope;

  @JsonKey(name: 'grant_type')
  final String grantType;

  /// 构造函数
  const LoginRequest({
    required this.username,
    required this.password,
    this.rememberMe = false,
    this.scope =  "server",
    this.grantType =  "password",
  });

  /// 从JSON创建对象
  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  /// 将对象转换为JSON
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  /// 复制并创建新的对象
  LoginRequest copyWith({
    String? username,
    String? password,
    bool? rememberMe,
  }) {
    return LoginRequest(
      username: username ?? this.username,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }
}
