import 'package:dart_mappable/dart_mappable.dart';

part 'stu_password_auth_req_vo.mapper.dart';

/// 学生密码登录请求VO
@MappableClass()
class StuPasswordAuthReqVO with StuPasswordAuthReqVOMappable {
  /// 用户名,手机号/账号/邮箱
  @MappableField(key: 'username')
  final String username;

  /// 密码
  @MappableField(key: 'password')
  final String password;

  const StuPasswordAuthReqVO({
    required this.username,
    required this.password,
  });

  static const fromJson = StuPasswordAuthReqVOMapper.fromJson;
}
