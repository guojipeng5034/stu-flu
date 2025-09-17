import 'package:dart_mappable/dart_mappable.dart';

part 'stu_auth_resp_vo.mapper.dart';

@MappableClass(
  // 添加caseStyle配置匹配后端驼峰命名
  caseStyle: CaseStyle.camelCase,
)
class StudentInfoVO with StudentInfoVOMappable {
  final int siteId;
  final String loginId;
  final bool invalidFlag; // 新增：是否无效
  final String? email; // 修改：可能为null
  final String telCodeId;
  final String? mobile; // 修改：可能为null
  final bool? parentFlag; // 修改：可能为null
  final int? parentStudentId; // 修改：可能为null
  final String? fullName; // 修改：可能为null
  final String? nickname; // 修改：可能为null
  final String? imageFile;
  final int? genderId; // 修改：可能为null
  final String? studentNumber;
  final int? age;
  final String? loginIp; // 修改：可能为null
  final int? loginDate; // 修改：可能为null
  final String? tempToken;

  StudentInfoVO({
    required this.siteId,
    required this.loginId,
    required this.invalidFlag, // 新增
    this.email, // 修改：可空
    required this.telCodeId,
    this.mobile, // 修改：可空
    this.parentFlag, // 修改：可空
    this.parentStudentId, // 修改：可空
    this.fullName, // 修改：可空
    this.nickname, // 修改：可空
    this.imageFile,
    this.genderId, // 修改：可空
    this.studentNumber,
    this.age,
    this.loginIp, // 修改：可空
    this.loginDate, // 修改：可空
    this.tempToken,
  });

  static const fromJson = StudentInfoVOMapper.fromJson;
}

@MappableClass()
class StudentAccessTokenVO with StudentAccessTokenVOMappable {
  @MappableField(key: 'access_token')
  final String accessToken;
  @MappableField(key: 'token_type')
  final String tokenType;
  @MappableField(key: 'expires_in')
  final int expiresIn;
  @MappableField(key: 'refresh_token')
  final String refreshToken;
  @MappableField(key: 'qqe_token')
  final String? qqeToken;
  @MappableField(key: 'qqe_jwt_token') // 新增：QQE JWT令牌
  final String? qqeJwtToken;

  StudentAccessTokenVO({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.refreshToken,
    this.qqeToken,
    this.qqeJwtToken, // 新增
  });

  static const fromJson = StudentAccessTokenVOMapper.fromJson;
}

@MappableClass(
  // 添加caseStyle配置匹配后端驼峰命名
  caseStyle: CaseStyle.camelCase,
)
class StuAuthRespVO with StuAuthRespVOMappable {
  final bool multiple;
  final bool registerFlag; // 保持驼峰命名
  final List<StudentInfoVO>? students;
  final StudentAccessTokenVO? token;
  final int? socialType; // 新增：社交用户类型
  final String? socialOpenid; // 新增：社交用户Openid

  StuAuthRespVO({
    required this.multiple,
    required this.registerFlag,
    this.students,
    this.token,
    this.socialType, // 新增
    this.socialOpenid, // 新增
  });

  static const fromJson = StuAuthRespVOMapper.fromJson;
}
