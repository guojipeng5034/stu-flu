import 'student.dart';
import '../curriculum/curriculum.dart';

/// Student类的扩展方法
extension StudentX on Student {
  /// 获取学生姓名
  String getName() => name ?? '';

  /// 获取学生昵称
  String getNickName() => nickname ?? '';

  /// 设置学生姓名
  Student setName(String newName) => copyWith(name: newName);

  /// 获取订阅ID的整数值
  int getSubscriptionId() => int.tryParse(subscriptionId ?? '0') ?? 0;

  /// 设置订阅ID
  Student setSubscriptionId(int id) => copyWith(subscriptionId: id.toString());

  /// 检查是否使用教室
  bool get isUseClassroom => defaultVideoTool == 'classroom';

  /// 检查是否使用Skype
  bool get isSkype => defaultVideoTool == 'skype';

  /// 检查是否使用Zoom
  bool get isZoom => defaultVideoTool == 'classroom' && defaultVideoToolProvider == '4';

  /// 检查是否使用Google Meet
  bool get isGoogleMeet => defaultVideoTool == 'classroom' && defaultVideoToolProvider == '5';

  /// 获取默认视频工具字符串
  String? defaultVideoToolString() {
    if (isZoom) return 'zoom';
    if (isGoogleMeet) return 'Google Meet';
    return defaultVideoTool;
  }

  /// 检查语言是否匹配指定代码
  bool isLanguageForCode(String code) {
    try {
      final l = lang?.split('_').first;
      return code == l;
    } catch (e) {
      return false;
    }
  }

  /// 检查是否为中文语言
  bool get isZhForLang => isLanguageForCode('zh');

  /// 检查是否为繁体中文语言
  bool get isTwForLang => isLanguageForCode('tw');

  /// 检查是否为日语
  bool get isJAForLang => isLanguageForCode('ja');

  /// 获取积分的整数值
  int getPointsToInt() => int.tryParse(points ?? '0') ?? 0;

  /// 检查是否需要预约FTL
  bool needReserveFtl() {
    if (skipFtl) return false;
    return !completedFtl && !hasFtlLesson;
  }

  /// 检查是否没有活跃订阅和票据
  bool noActiveSubscriptionAndTicket() {
    if (siteId == 102) return false;
    return !hasActiveSubscription && !hasActiveTickets;
  }

  /// 获取性别字符串
  String genderString() {
    switch (genderId) {
      case 1:
        return '男';
      case 2:
        return '女';
      default:
        return '--';
    }
  }

  /// 检查是否可以显示站点
  bool canShowStations() => siteId == 700;

  /// 检查是否为测试邮箱
  bool get isTestEmail {
    return email == 'applestore@kuaikuenglish.com' || 
           email == 'apple@kuaikuenglish.com';
  }

  /// 检查是否可以预约固定教师
  bool canReserveFix() {
    // 这里需要从站点配置中获取信息
    return true; // 临时实现
  }

  /// 获取课程适用用户ID
  String? get curriculumApplicableUserId => 
      curriculumApplicableUser?.id ?? '1';

  /// 获取登录ID
  String? get loginId {
    // 如果是校园版应用使用电话，否则使用邮箱
    // 这里需要根据应用配置判断
    return email; // 临时实现
  }

  /// 检查是否为CN站点
  bool get isCNSite => siteId == 102;

  /// 检查是否为CPZH站点
  bool get isCPZHSite => siteId == 600;

  /// 检查是否为BFC站点
  bool get isBFCSite => siteId == 701;

  /// 检查是否为OF站点
  bool get isOFSite => siteId == 700;

  /// 检查是否有家庭成员
  bool hasFamily() => family.isNotEmpty;

  /// 检查是否有帮助链接
  bool hasHelpLink() {
    if (isTestEmail) return false;
    return helpLink != null && helpLink!.isNotEmpty;
  }

  /// 检查是否为代课
  bool isSubstitute() => requireSubstitute;

  /// 获取家庭成员列表
  List<StudentFamily> getFamily() => family;

  /// 获取通用课程ID列表
  List<Curriculum> getCommonCurriculumIds() => commonCurriculumIds;

  /// 设置通用课程ID列表
  Student setCommonCurriculumIds(List<Curriculum> ids) => 
      copyWith(commonCurriculumIds: ids);

  /// 扣除积分
  Student deductPoints(int num) {
    final currentPoints = getPointsToInt() - num;
    return copyWith(points: currentPoints.toString());
  }

  /// 添加积分
  Student addPoints(int num) {
    final currentPoints = getPointsToInt() + num;
    return copyWith(points: currentPoints.toString());
  }
}
