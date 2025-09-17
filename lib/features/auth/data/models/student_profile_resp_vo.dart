import 'package:dart_mappable/dart_mappable.dart';

part 'student_profile_resp_vo.mapper.dart';

@MappableClass(
  caseStyle: CaseStyle.camelCase,
)
class SocialUser with SocialUserMappable {
  /// 社交平台的类型，参见 SocialTypeEnum 枚举类
  final int type;

  /// 社交用户的 openid
  final String openid;

  /// 社交用户的 nickname
  final String? nickname;

  /// 社交用户的 avatar
  final String? avatar;

  SocialUser({
    required this.type,
    required this.openid,
    this.nickname,
    this.avatar,
  });

  static const fromJson = SocialUserMapper.fromJson;
}

@MappableClass(
  caseStyle: CaseStyle.camelCase,
)
class StudentDetail with StudentDetailMappable {
  /// 名字, 新系统中文名写入此字段,读取可以读fullName,这样兼容新老数据
  final String? firstName;

  /// 中间名
  final String? middleName;

  /// 姓氏
  final String? lastName;

  /// 组合后的名字
  final String? fullName;

  StudentDetail({
    this.firstName,
    this.middleName,
    this.lastName,
    this.fullName,
  });

  static const fromJson = StudentDetailMapper.fromJson;
}

@MappableClass(
  caseStyle: CaseStyle.camelCase,
)
class StudentProfileRespVO with StudentProfileRespVOMappable {
  /// 站点id
  final int siteId;

  /// 用户账号
  final String loginId;

  /// 英文-用户昵称,上课时必须有
  final String? nickname;

  /// 英文-firstName
  final String? firstName;

  /// 英文-middleName
  final String? middleName;

  /// 英文-lastName
  final String? lastName;

  /// 英文-组合后的名称,前端使用此字段可以支持新老系统格式
  final String? fullName;

  /// 用户邮箱
  final String? email;

  /// 手机号码
  final String? mobile;

  /// 用户性别
  final int? genderId;

  /// 用户头像
  final String? imageFile;

  /// uid
  final String? uid;

  /// 创建时间
  final String? createTime;

  /// 是有有密码
  final bool? hasPasswdFlag;

  /// 生日
  final String? birthday;

  /// 是否家庭主账号
  final bool? parentFlag;

  /// 家庭主账号学生id
  final int? parentStudentId;

  /// 社交用户列表
  final List<SocialUser>? socialUsers;

  /// 学生详细信息
  final StudentDetail? detail;

  /// 是否需要完善资料
  final bool? isNeedFill;

  StudentProfileRespVO({
    required this.siteId,
    required this.loginId,
    this.nickname,
    this.firstName,
    this.middleName,
    this.lastName,
    this.fullName,
    this.email,
    this.mobile,
    this.genderId,
    this.imageFile,
    this.uid,
    this.createTime,
    this.hasPasswdFlag,
    this.birthday,
    this.parentFlag,
    this.parentStudentId,
    this.socialUsers,
    this.detail,
    this.isNeedFill,
  });

  static const fromJson = StudentProfileRespVOMapper.fromJson;
}
