import 'cancel_reason.dart';

/// CancelReason类的扩展方法
extension CancelReasonX on CancelReason {
  /// 检查是否隐藏
  bool get isHidden => hide;

  /// 检查是否显示
  bool get isVisible => !isHidden;

  /// 检查是否提醒学生
  bool isAlertToStudent() => alertToStudent;

  /// 检查是否有退款信息
  bool get hasRefund => refund != null;

  /// 检查是否有描述
  bool get hasDescription => description.isNotEmpty;

  /// 检查是否有退款描述
  bool get hasRefundDescription => refundDescription.isNotEmpty;

}
