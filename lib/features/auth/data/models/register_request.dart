import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

/// 注册请求模型
@JsonSerializable()
class RegisterRequest {
  /// 用户名
  final String username;

  /// 邮箱
  final String email;

  /// 密码
  final String password;

  /// 确认密码
  @JsonKey(name: 'confirm_password')
  final String confirmPassword;

  /// 手机号码
  final String? phone;

  /// 姓名
  @JsonKey(name: 'full_name')
  final String? fullName;

  /// 构造函数
  const RegisterRequest({
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.phone,
    this.fullName,
  });

  /// 从JSON创建对象
  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  /// 将对象转换为JSON
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  /// 复制并创建新的对象
  RegisterRequest copyWith({
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
    String? phone,
    String? fullName,
  }) {
    return RegisterRequest(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phone: phone ?? this.phone,
      fullName: fullName ?? this.fullName,
    );
  }
}
