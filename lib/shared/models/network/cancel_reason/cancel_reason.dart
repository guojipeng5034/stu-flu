import 'package:cptop/core/utils/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cancel_reason.freezed.dart';
part 'cancel_reason.g.dart';

/// 取消原因数据模型
///
/// 用于课程取消原因管理
@freezed
class CancelReason with _$CancelReason {
  const factory CancelReason({
    @Default(0) int id,
    @Default('') String labe, // 注意：原Android代码中拼写错误，保持一致
    @Default('') String name,
    @Default('') String description,
    @Default('') String refundDescription,
    CancelReasonRefund? refund,
    @Default('') String by,
    @CTBoolConverter() @Default(false) bool hide,
    @CTBoolConverter() @Default(false) bool alertToStudent,
  }) = _CancelReason;

  /// 从 JSON 创建 CancelReason 实例
  factory CancelReason.fromJson(Map<String, dynamic> json) =>
      _$CancelReasonFromJson(json);
}

/// 取消原因退款信息
@freezed
class CancelReasonRefund with _$CancelReasonRefund {
  const factory CancelReasonRefund({
    @CTBoolConverter() @Default(false) bool points,
    @CTBoolConverter() @Default(false) bool ticket,
    @CTBoolConverter() @Default(false) bool everyday,
  }) = _CancelReasonRefund;

  /// 从 JSON 创建 CancelReasonRefund 实例
  factory CancelReasonRefund.fromJson(Map<String, dynamic> json) =>
      _$CancelReasonRefundFromJson(json);
}
