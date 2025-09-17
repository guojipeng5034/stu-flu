import 'package:cptop/shared/models/master/index.dart';

/// 重要提示：这些扩展在生成freezed代码后才能正常工作
/// 需要先运行: flutter pub run build_runner build --delete-conflicting-outputs
///
/// 如果您看到"Undefined name"错误，这是正常的，只要运行上面的命令后就会解决
/// 这些错误是因为freezed生成的代码尚未创建

/// SiteConfig类的扩展方法
extension SiteConfigX on SiteConfig {
  /// 检查修复功能是否可用
  bool get isFixing {
    return fixing?.available ?? false;
  }

  /// 检查是否可以玩拼图游戏
  bool get hasGame {
    return game?.canPlayPuzzleGame ?? false;
  }

  /// 检查是否允许特殊课程
  bool get hasSpecialLesson {
    return specialLessonAllow ?? false;
  }

  /// 检查是否使用修复功能
  bool get isUsingFixing {
    return useFixing ?? false;
  }

  /// 获取站点ID，如果不存在则返回默认值
  int getSiteId({int defaultValue = 0}) {
    return siteId ?? defaultValue;
  }
}




