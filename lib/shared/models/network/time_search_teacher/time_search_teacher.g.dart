// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_search_teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeSearchTeacherImpl _$$TimeSearchTeacherImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TimeSearchTeacherImpl',
      json,
      ($checkedConvert) {
        final val = _$TimeSearchTeacherImpl(
          data: $checkedConvert(
              'data',
              (v) => v == null
                  ? null
                  : TimeSearchTeacherData.fromJson(v as Map<String, dynamic>)),
          isSuccess:
              $checkedConvert('is_success', (v) => (v as num?)?.toInt() ?? 0),
          serviceName: $checkedConvert('service_name', (v) => v as String?),
          errors:
              $checkedConvert('errors', (v) => v as List<dynamic>? ?? const []),
        );
        return val;
      },
      fieldKeyMap: const {
        'isSuccess': 'is_success',
        'serviceName': 'service_name'
      },
    );

Map<String, dynamic> _$$TimeSearchTeacherImplToJson(
        _$TimeSearchTeacherImpl instance) =>
    <String, dynamic>{
      if (instance.data?.toJson() case final value?) 'data': value,
      'is_success': instance.isSuccess,
      if (instance.serviceName case final value?) 'service_name': value,
      'errors': instance.errors,
    };

_$TimeSearchTeacherDataImpl _$$TimeSearchTeacherDataImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$TimeSearchTeacherDataImpl',
      json,
      ($checkedConvert) {
        final val = _$TimeSearchTeacherDataImpl(
          canReserve: $checkedConvert('can_reserve',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          list: $checkedConvert(
              'list',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => Teacher.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          pager: $checkedConvert(
              'pager',
              (v) =>
                  v == null ? null : Page.fromJson(v as Map<String, dynamic>)),
          requireFtl: $checkedConvert('require_ftl',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          requireLogin: $checkedConvert('require_login',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          requireSubscription: $checkedConvert('require_subscription',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
        );
        return val;
      },
      fieldKeyMap: const {
        'canReserve': 'can_reserve',
        'requireFtl': 'require_ftl',
        'requireLogin': 'require_login',
        'requireSubscription': 'require_subscription'
      },
    );

Map<String, dynamic> _$$TimeSearchTeacherDataImplToJson(
        _$TimeSearchTeacherDataImpl instance) =>
    <String, dynamic>{
      if (const CTBoolConverter().toJson(instance.canReserve) case final value?)
        'can_reserve': value,
      'list': instance.list.map((e) => e.toJson()).toList(),
      if (instance.pager?.toJson() case final value?) 'pager': value,
      if (const CTBoolConverter().toJson(instance.requireFtl) case final value?)
        'require_ftl': value,
      if (const CTBoolConverter().toJson(instance.requireLogin)
          case final value?)
        'require_login': value,
      if (const CTBoolConverter().toJson(instance.requireSubscription)
          case final value?)
        'require_subscription': value,
    };
