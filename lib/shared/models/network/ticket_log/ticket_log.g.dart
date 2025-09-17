// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketLogImpl _$$TicketLogImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TicketLogImpl',
      json,
      ($checkedConvert) {
        final val = _$TicketLogImpl(
          canReserveToTime:
              $checkedConvert('can_reserve_to_time', (v) => v as String?),
          createdTime: $checkedConvert('created_time', (v) => v as String?),
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          studentId: $checkedConvert('student_id', (v) => v as String?),
          usedTotal:
              $checkedConvert('used_total', (v) => (v as num?)?.toInt() ?? 0),
          ticket: $checkedConvert(
              'ticket',
              (v) => v == null
                  ? null
                  : Ticket.fromJson(v as Map<String, dynamic>)),
          isShow: $checkedConvert('is_show', (v) => v as bool? ?? false),
        );
        return val;
      },
      fieldKeyMap: const {
        'canReserveToTime': 'can_reserve_to_time',
        'createdTime': 'created_time',
        'studentId': 'student_id',
        'usedTotal': 'used_total',
        'isShow': 'is_show'
      },
    );

Map<String, dynamic> _$$TicketLogImplToJson(_$TicketLogImpl instance) =>
    <String, dynamic>{
      if (instance.canReserveToTime case final value?)
        'can_reserve_to_time': value,
      if (instance.createdTime case final value?) 'created_time': value,
      'id': instance.id,
      if (instance.studentId case final value?) 'student_id': value,
      'used_total': instance.usedTotal,
      if (instance.ticket?.toJson() case final value?) 'ticket': value,
      'is_show': instance.isShow,
    };
