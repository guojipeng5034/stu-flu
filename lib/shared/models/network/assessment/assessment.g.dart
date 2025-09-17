// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssessmentImpl _$$AssessmentImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$AssessmentImpl',
      json,
      ($checkedConvert) {
        final val = _$AssessmentImpl(
          fairId: $checkedConvert('fair_id', (v) => (v as num?)?.toInt() ?? 0),
          message: $checkedConvert('message', (v) => v as String? ?? ''),
          pagesSummary:
              $checkedConvert('pages_summary', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {'fairId': 'fair_id', 'pagesSummary': 'pages_summary'},
    );

Map<String, dynamic> _$$AssessmentImplToJson(_$AssessmentImpl instance) =>
    <String, dynamic>{
      'fair_id': instance.fairId,
      'message': instance.message,
      'pages_summary': instance.pagesSummary,
    };
