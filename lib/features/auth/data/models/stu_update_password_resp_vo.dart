import 'package:dart_mappable/dart_mappable.dart';

import 'stu_auth_resp_vo.dart';

part 'stu_update_password_resp_vo.mapper.dart';

@MappableClass()
class StuUpdatePasswordRespVO with StuUpdatePasswordRespVOMappable {
  final StudentAccessTokenVO? token;

  StuUpdatePasswordRespVO({
    this.token,
  });

  static const fromJson = StuUpdatePasswordRespVOMapper.fromJson;
}
