// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageImpl _$$PageImplFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$PageImpl',
      json,
      ($checkedConvert) {
        final val = _$PageImpl(
          counts: $checkedConvert('counts', (v) => v as String?),
          end: $checkedConvert('end', (v) => (v as num?)?.toInt() ?? 0),
          limit: $checkedConvert('limit', (v) => v as String?),
          next: $checkedConvert('next', (v) => (v as num?)?.toInt() ?? 0),
          offset: $checkedConvert('offset', (v) => v as String?),
          page: $checkedConvert('page', (v) => (v as num?)?.toInt() ?? 0),
          pagesTotal:
              $checkedConvert('pages_total', (v) => (v as num?)?.toInt() ?? 0),
          prev: $checkedConvert('prev', (v) => v),
          start: $checkedConvert('start', (v) => (v as num?)?.toInt() ?? 0),
          total: $checkedConvert('total', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'pagesTotal': 'pages_total'},
    );

Map<String, dynamic> _$$PageImplToJson(_$PageImpl instance) =>
    <String, dynamic>{
      if (instance.counts case final value?) 'counts': value,
      'end': instance.end,
      if (instance.limit case final value?) 'limit': value,
      'next': instance.next,
      if (instance.offset case final value?) 'offset': value,
      'page': instance.page,
      'pages_total': instance.pagesTotal,
      if (instance.prev case final value?) 'prev': value,
      'start': instance.start,
      if (instance.total case final value?) 'total': value,
    };
