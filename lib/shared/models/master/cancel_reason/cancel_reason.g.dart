// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_reason.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CancelReasonBeanImpl _$$CancelReasonBeanImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CancelReasonBeanImpl',
      json,
      ($checkedConvert) {
        final val = _$CancelReasonBeanImpl(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          label: $checkedConvert('label', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          refundDescription:
              $checkedConvert('refund_description', (v) => v as String?),
          refund: $checkedConvert(
              'refund',
              (v) => v == null
                  ? null
                  : CancelRefund.fromJson(v as Map<String, dynamic>)),
          by: $checkedConvert('by', (v) => v as String?),
          hide: $checkedConvert('hide', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'refundDescription': 'refund_description'},
    );

Map<String, dynamic> _$$CancelReasonBeanImplToJson(
        _$CancelReasonBeanImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.label case final value?) 'label': value,
      if (instance.name case final value?) 'name': value,
      if (instance.description case final value?) 'description': value,
      if (instance.refundDescription case final value?)
        'refund_description': value,
      if (instance.refund?.toJson() case final value?) 'refund': value,
      if (instance.by case final value?) 'by': value,
      if (instance.hide case final value?) 'hide': value,
    };

_$CancelRefundImpl _$$CancelRefundImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CancelRefundImpl',
      json,
      ($checkedConvert) {
        final val = _$CancelRefundImpl(
          points: $checkedConvert('points', (v) => (v as num?)?.toInt()),
          ticket: $checkedConvert('ticket', (v) => (v as num?)?.toInt()),
          everyday: $checkedConvert('everyday', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$CancelRefundImplToJson(_$CancelRefundImpl instance) =>
    <String, dynamic>{
      if (instance.points case final value?) 'points': value,
      if (instance.ticket case final value?) 'ticket': value,
      if (instance.everyday case final value?) 'everyday': value,
    };

_$CancelReasonListImpl _$$CancelReasonListImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CancelReasonListImpl',
      json,
      ($checkedConvert) {
        final val = _$CancelReasonListImpl(
          data: $checkedConvert(
              'data',
              (v) => (v as List<dynamic>?)
                  ?.map((e) =>
                      CancelReasonBean.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$CancelReasonListImplToJson(
        _$CancelReasonListImpl instance) =>
    <String, dynamic>{
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
    };
