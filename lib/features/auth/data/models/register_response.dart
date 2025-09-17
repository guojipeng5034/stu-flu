import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

/// 注册响应模型
@JsonSerializable()
class RegisterResponse {
  /// 用户ID
  @JsonKey(name: 'user_id')
  final String userId;

  /// 用户名
  final String username;

  /// 邮箱
  final String email;

  /// 是否需要验证邮箱
  @JsonKey(name: 'require_email_verification')
  final bool requireEmailVerification;

  /// 创建时间
  @JsonKey(name: 'created_at')
  final String createdAt;

  /// 构造函数
  const RegisterResponse({
    required this.userId,
    required this.username,
    required this.email,
    required this.requireEmailVerification,
    required this.createdAt,
  });

  /// 从JSON创建对象
  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  /// 将对象转换为JSON
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  /// 复制并创建新的对象
  RegisterResponse copyWith({
    String? userId,
    String? username,
    String? email,
    bool? requireEmailVerification,
    String? createdAt,
  }) {
    return RegisterResponse(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      email: email ?? this.email,
      requireEmailVerification:
          requireEmailVerification ?? this.requireEmailVerification,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
