import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

/// 修改密码请求模型
@JsonSerializable()
class ChangePasswordRequest {
  /// 当前密码
  @JsonKey(name: 'current_password')
  final String currentPassword;

  /// 新密码
  @JsonKey(name: 'new_password')
  final String newPassword;

  /// 确认新密码
  @JsonKey(name: 'confirm_new_password')
  final String confirmNewPassword;

  /// 构造函数
  const ChangePasswordRequest({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  /// 从JSON创建对象
  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  /// 将对象转换为JSON
  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);

  /// 复制并创建新的对象
  ChangePasswordRequest copyWith({
    String? currentPassword,
    String? newPassword,
    String? confirmNewPassword,
  }) {
    return ChangePasswordRequest(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmNewPassword: confirmNewPassword ?? this.confirmNewPassword,
    );
  }
}
