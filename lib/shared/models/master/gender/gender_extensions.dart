import 'gender.dart';
import '../utils/master_translations.dart';

/// 性别扩展方法
extension GenderBeanExtensions on GenderBean {
  /// 检查是否为男性
  bool get isMale {
    return label == 'male';
  }

  /// 检查是否为女性
  bool get isFemale {
    return label == 'female';
  }

  /// 检查是否为默认（未指定）
  bool get isDefault {
    return label == 'default' || id == 0;
  }

  /// 获取性别代码
  String get genderCode {
    if (isMale) return 'M';
    if (isFemale) return 'F';
    return 'U'; // Unknown/Unspecified
  }

  /// 获取性别颜色（用于UI显示）
  String get genderColor {
    if (isMale) return '#4A90E2'; // 蓝色
    if (isFemale) return '#E24A90'; // 粉色
    return '#9B9B9B'; // 灰色
  }

  /// 检查是否为有效性别选择
  bool get isValidSelection {
    return !isDefault;
  }

  /// 获取性别图标
  String get genderIcon {
    if (isMale) return '♂';
    if (isFemale) return '♀';
    return '--';
  }

  /// 获取本地化显示名称
  String get localizedName {
    return MasterTranslations.getGenderName(label);
  }

  /// 获取排序优先级
  int get sortPriority {
    if (isDefault) return 0;
    if (isMale) return 1;
    if (isFemale) return 2;
    return 3;
  }

}
