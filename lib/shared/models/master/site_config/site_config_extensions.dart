import 'site_config.dart';

/// SiteConfig扩展方法
extension SiteConfigExtensions on SiteConfig {
  /// 检查修复功能是否可用
  bool get isFixingAvailable {
    return fixing?.available ?? false;
  }

  /// 检查是否可以玩拼图游戏
  bool get canPlayPuzzleGameAvailable {
    return game?.canPlayPuzzleGame ?? false;
  }

  /// 检查是否使用修复功能
  bool get isUsingFixing {
    return useFixing;
  }

  /// 获取站点ID，如果不存在则返回默认值
  int getSiteId({int defaultValue = 0}) {
    return siteId ?? defaultValue;
  }

  /// 获取默认电话区号
  String getDefaultTelephoneCode() {
    return telephoneCodeDefault ?? '0';
  }

  /// 获取默认时区
  String getDefaultTimeZone() {
    return defaultTimeZone ?? 'UTC';
  }
}








