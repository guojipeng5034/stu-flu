import 'package:dart_mappable/dart_mappable.dart';

import 'stu_auth_resp_vo.dart';

part 'stu_forget_password_resp_vo.mapper.dart';

@MappableClass()
class StuForgetPasswordRespVO with StuForgetPasswordRespVOMappable {
  final List<StudentInfoVO>? students;

  StuForgetPasswordRespVO({
    this.students,
  });

  static const fromJson = StuForgetPasswordRespVOMapper.fromJson;
}
