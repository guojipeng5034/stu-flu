import 'points.dart';
import '../utils/master_translations.dart';

/// 积分扩展方法
extension PointsBeanExtensions on PointsBean {
  /// 获取积分值
  int getPointsValue() {
    return points ?? 0;
  }

  /// 获取每分钟积分率
  double getPerMinuteRate() {
    return double.tryParse(perMin ?? '0') ?? 0.0;
  }

  /// 检查是否为免费课程
  bool get isFree {
    return getPointsValue() == 0;
  }

  /// 检查是否为低积分课程（1-25积分）
  bool get isLowPoints {
    final pointsValue = getPointsValue();
    return pointsValue > 0 && pointsValue <= 25;
  }

  /// 检查是否为中等积分课程（26-75积分）
  bool get isMediumPoints {
    final pointsValue = getPointsValue();
    return pointsValue >= 26 && pointsValue <= 75;
  }

  /// 检查是否为高积分课程（76积分以上）
  bool get isHighPoints {
    final pointsValue = getPointsValue();
    return pointsValue >= 76;
  }

  /// 获取积分等级
  String get pointsLevel {
    if (isFree) return 'Free';
    if (isLowPoints) return 'Low';
    if (isMediumPoints) return 'Medium';
    if (isHighPoints) return 'High';
    return 'Unknown';
  }

  /// 计算指定时长的总积分
  int calculateTotalPoints(int minutes) {
    return (getPerMinuteRate() * minutes).round();
  }

  /// 获取积分颜色（用于UI显示）
  String get pointsColor {
    if (isFree) return '#28a745'; // 绿色
    if (isLowPoints) return '#17a2b8'; // 蓝色
    if (isMediumPoints) return '#ffc107'; // 黄色
    if (isHighPoints) return '#dc3545'; // 红色
    return '#6c757d'; // 灰色
  }

  /// 获取积分描述
  String get pointsDescription {
    return MasterTranslations.getPointsDescription(isFree, isLowPoints, isMediumPoints, isHighPoints);
  }
}
