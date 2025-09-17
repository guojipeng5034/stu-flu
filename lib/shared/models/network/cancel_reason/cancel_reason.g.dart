// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_reason.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CancelReasonImpl _$$CancelReasonImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CancelReasonImpl',
      json,
      ($checkedConvert) {
        final val = _$CancelReasonImpl(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          labe: $checkedConvert('labe', (v) => v as String? ?? ''),
          name: $checkedConvert('name', (v) => v as String? ?? ''),
          description:
              $checkedConvert('description', (v) => v as String? ?? ''),
          refundDescription:
              $checkedConvert('refund_description', (v) => v as String? ?? ''),
          refund: $checkedConvert(
              'refund',
              (v) => v == null
                  ? null
                  : CancelReasonRefund.fromJson(v as Map<String, dynamic>)),
          by: $checkedConvert('by', (v) => v as String? ?? ''),
          hide: $checkedConvert('hide',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          alertToStudent: $checkedConvert('alert_to_student',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
        );
        return val;
      },
      fieldKeyMap: const {
        'refundDescription': 'refund_description',
        'alertToStudent': 'alert_to_student'
      },
    );

Map<String, dynamic> _$$CancelReasonImplToJson(_$CancelReasonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'labe': instance.labe,
      'name': instance.name,
      'description': instance.description,
      'refund_description': instance.refundDescription,
      if (instance.refund?.toJson() case final value?) 'refund': value,
      'by': instance.by,
      if (const CTBoolConverter().toJson(instance.hide) case final value?)
        'hide': value,
      if (const CTBoolConverter().toJson(instance.alertToStudent)
          case final value?)
        'alert_to_student': value,
    };

_$CancelReasonRefundImpl _$$CancelReasonRefundImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CancelReasonRefundImpl',
      json,
      ($checkedConvert) {
        final val = _$CancelReasonRefundImpl(
          points: $checkedConvert('points',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          ticket: $checkedConvert('ticket',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          everyday: $checkedConvert('everyday',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$CancelReasonRefundImplToJson(
        _$CancelReasonRefundImpl instance) =>
    <String, dynamic>{
      if (const CTBoolConverter().toJson(instance.points) case final value?)
        'points': value,
      if (const CTBoolConverter().toJson(instance.ticket) case final value?)
        'ticket': value,
      if (const CTBoolConverter().toJson(instance.everyday) case final value?)
        'everyday': value,
    };
