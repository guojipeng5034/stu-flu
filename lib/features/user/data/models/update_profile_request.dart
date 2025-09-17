import 'package:json_annotation/json_annotation.dart';

part 'update_profile_request.g.dart';

/// 更新用户资料请求模型
@JsonSerializable()
class UpdateProfileRequest {
  /// 姓名
  @JsonKey(name: 'full_name')
  final String? fullName;

  /// 手机号码
  final String? phone;

  /// 构造函数
  const UpdateProfileRequest({
    this.fullName,
    this.phone,
  });

  /// 从JSON创建对象
  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);

  /// 将对象转换为JSON
  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);

  /// 复制并创建新的对象
  UpdateProfileRequest copyWith({
    String? fullName,
    String? phone,
  }) {
    return UpdateProfileRequest(
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
    );
  }
}
