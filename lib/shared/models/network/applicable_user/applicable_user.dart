import 'package:freezed_annotation/freezed_annotation.dart';

part 'applicable_user.freezed.dart';
part 'applicable_user.g.dart';

/// 适用用户数据模型
///
/// 通用的用户适用性模型，用于网络数据传输和API响应
/// 描述某个功能或课程适用的用户类型
/// 在学生模块和站点配置模块中都有使用
@freezed
class ApplicableUser with _$ApplicableUser {
  const factory ApplicableUser({
    String? id,
    String? label,
    String? name,
  }) = _ApplicableUser;

  /// 从 JSON 创建 ApplicableUser 实例
  factory ApplicableUser.fromJson(Map<String, dynamic> json) =>
      _$ApplicableUserFromJson(json);
}
