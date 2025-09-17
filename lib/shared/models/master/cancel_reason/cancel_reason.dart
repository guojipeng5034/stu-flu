import 'package:freezed_annotation/freezed_annotation.dart';

part 'cancel_reason.freezed.dart';
part 'cancel_reason.g.dart';

/// 取消原因数据模型
/// 
/// 对应Android项目中的CancelReason配置
@freezed
class CancelReasonBean with _$CancelReasonBean {
  const factory CancelReasonBean({
    int? id,
    String? label,
    String? name,
    String? description,
    String? refundDescription,
    CancelRefund? refund,
    String? by,
    int? hide,
  }) = _CancelReasonBean;

  factory CancelReasonBean.fromJson(Map<String, dynamic> json) =>
      _$CancelReasonBeanFromJson(json);
}

/// 取消退款配置
@freezed
class CancelRefund with _$CancelRefund {
  const factory CancelRefund({
    int? points,
    int? ticket,
    int? everyday,
  }) = _CancelRefund;

  factory CancelRefund.fromJson(Map<String, dynamic> json) =>
      _$CancelRefundFromJson(json);
}

/// 取消原因列表数据模型
@freezed
class CancelReasonList with _$CancelReasonList {
  const factory CancelReasonList({
    List<CancelReasonBean>? data,
  }) = _CancelReasonList;

  factory CancelReasonList.fromJson(Map<String, dynamic> json) =>
      _$CancelReasonListFromJson(json);
}
