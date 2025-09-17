import 'cancel_reason.dart';
import '../utils/master_translations.dart';

/// 取消原因扩展方法
extension CancelReasonBeanExtensions on CancelReasonBean {
  /// 检查是否隐藏
  bool get isHidden {
    return hide == 1;
  }

  /// 检查是否显示
  bool get isVisible {
    return !isHidden;
  }

  /// 检查是否由学生取消
  bool get isByStudent {
    return by == 'student';
  }

  /// 检查是否由教师取消
  bool get isByTeacher {
    return by == 'teacher';
  }

  /// 检查是否由系统取消
  bool get isBySystem {
    return by == 'system';
  }

  /// 获取积分退款百分比
  int getPointsRefundPercentage() {
    return refund?.points ?? 0;
  }

  /// 获取票券退款状态
  bool getTicketRefundStatus() {
    return (refund?.ticket ?? 0) == 1;
  }

  /// 获取每日课程退款状态
  bool getEverydayRefundStatus() {
    return (refund?.everyday ?? 0) == 1;
  }

  /// 检查是否全额退款
  bool get isFullRefund {
    return getPointsRefundPercentage() == 100;
  }

  /// 检查是否部分退款
  bool get isPartialRefund {
    final percentage = getPointsRefundPercentage();
    return percentage > 0 && percentage < 100;
  }

  /// 检查是否无退款
  bool get isNoRefund {
    return getPointsRefundPercentage() == 0;
  }

  /// 获取退款描述文本
  String getRefundDisplayText() {
    return MasterTranslations.getRefundDisplayText(getPointsRefundPercentage());
  }

  /// 获取取消类型描述
  String get cancelTypeDescription {
    return MasterTranslations.getCancelTypeDescription(by);
  }

  /// 检查是否为无故缺席
  bool get isNoShow {
    return label?.contains('no show') ?? false;
  }

  /// 检查是否为技术问题
  bool get isTechnicalIssue {
    return label?.contains('technical') ?? false;
  }

  /// 获取退款等级
  String get refundLevel {
    final percentage = getPointsRefundPercentage();
    if (percentage == 100) return 'Full';
    if (percentage >= 50) return 'High';
    if (percentage > 0) return 'Partial';
    return 'None';
  }

}
