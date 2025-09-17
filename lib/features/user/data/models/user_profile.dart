import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

/// 用户资料模型
@JsonSerializable()
class UserProfile {
  /// 用户ID
  final int id;

  /// 用户全名
  @JsonKey(name: 'name')
  final String fullName;

  /// 用户邮箱
  final String email;

  /// 用户头像URL
  final String? avatar;

  /// 用户手机号码
  final String? phone;

  /// 用户地址
  final String? address;

  /// 创建时间
  @JsonKey(name: 'created_at')
  final String? createdAt;

  /// 更新时间
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  /// 构造函数
  const UserProfile({
    required this.id,
    required this.fullName,
    required this.email,
    this.avatar,
    this.phone,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  /// 从JSON创建对象
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  /// 将对象转换为JSON
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
