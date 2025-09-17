import 'package:cptop/shared/index.dart';

/// Student类的扩展方法
extension StudentX on Student {
  /// 检查是否已完成FTL
  bool get isCompletedFtl => completedFtl;

  /// 检查是否有活跃订阅
  bool get isActiveSubscription => hasActiveSubscription;

  /// 检查是否有活跃票据
  bool get isActiveTickets => hasActiveTickets;

  /// 检查是否有FTL课程
  bool get isFtlLesson => hasFtlLesson;

  /// 检查是否跳过FTL
  bool get isSkipFtl => skipFtl;

  /// 获取完整姓名
  String get fullName {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    }
    return name ?? nickname ?? 'Unknown';
  }

  /// 检查是否为女性
  bool get isFemale => gender?.toLowerCase() == 'female' || genderId == 2;

  /// 检查是否为男性
  bool get isMale => gender?.toLowerCase() == 'male' || genderId == 1;

  /// 获取性别显示文本
  String get genderDisplay {
    if (isFemale) return '女';
    if (isMale) return '男';
    return '未知';
  }

  /// 检查是否有头像
  bool get hasAvatar => imageFile != null && imageFile!.isNotEmpty;

  /// 检查是否有联系电话
  bool get hasPhone =>
      (tel != null && tel!.isNotEmpty) || (phone != null && phone!.isNotEmpty);

  /// 获取主要联系电话
  String? get primaryPhone => tel?.isNotEmpty == true ? tel : phone;

  /// 检查是否有邮箱
  bool get hasEmail => email != null && email!.isNotEmpty;

  /// 检查是否有Skype (字段不存在于当前模型)
  bool get hasSkype => false;

  /// 获取家庭成员数量
  int get familyMemberCount => family.length ?? 0;

  /// 检查是否有家庭成员
  bool get hasFamilyMembers => familyMemberCount > 0;

  /// 获取课程数量
  int get curriculumCount => commonCurriculumIds.length ?? 0;

  /// 检查是否有课程
  bool get hasCurriculums => curriculumCount > 0;
}

/// StudentFamily类的扩展方法
extension StudentFamilyX on StudentFamily {
  /// 检查是否有头像
  bool get hasAvatar => imageFile != null && imageFile!.isNotEmpty;

  /// 获取显示名称
  String get displayName => nickname ?? 'Unknown';
}
