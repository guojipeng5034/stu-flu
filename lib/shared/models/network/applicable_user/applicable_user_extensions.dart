import 'applicable_user.dart';

/// ApplicableUser类的扩展方法
extension ApplicableUserX on ApplicableUser {
  /// 检查是否为Kids用户
  bool get isKids => label?.toLowerCase() == 'kids';

  /// 检查是否为Adult用户
  bool get isAdult => label?.toLowerCase() == 'adult';

  /// 获取显示名称
  String get displayName => name ?? label ?? id ?? 'Unknown';
}
