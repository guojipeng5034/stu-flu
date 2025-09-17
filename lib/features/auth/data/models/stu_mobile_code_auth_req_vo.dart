import 'package:dart_mappable/dart_mappable.dart';

part 'stu_mobile_code_auth_req_vo.mapper.dart';

/// 学生手机号验证码登录请求VO
@MappableClass()
class StuMobileCodeAuthReqVO with StuMobileCodeAuthReqVOMappable {
  /// 国家代码
  @MappableField(key: 'telCode')
  final String telCode;

  /// 手机号
  @MappableField(key: 'mobile')
  final String mobile;

  /// 验证码
  @MappableField(key: 'code')
  final String code;

  /// 注册站点ID（用户未注册时使用）
  @MappableField(key: 'registerSiteId')
  final int registerSiteId;

  /// 社交用户类型,SocialTypeEnum枚举
  @MappableField(key: 'socialType')
  final int? socialType;

  /// 社交用户Openid
  @MappableField(key: 'socialOpenid')
  final String? socialOpenid;

  const StuMobileCodeAuthReqVO({
    required this.telCode,
    required this.mobile,
    required this.code,
    required this.registerSiteId,
    this.socialType,
    this.socialOpenid,
  });

  static const fromJson = StuMobileCodeAuthReqVOMapper.fromJson;
}
