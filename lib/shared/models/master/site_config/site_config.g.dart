// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiteConfigImpl _$$SiteConfigImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$SiteConfigImpl',
      json,
      ($checkedConvert) {
        final val = _$SiteConfigImpl(
          siteId: $checkedConvert('site_id', (v) => (v as num?)?.toInt()),
          label: $checkedConvert('label', (v) => v as String?),
          countryDefault:
              $checkedConvert('country_default', (v) => v as String?),
          defaultTimeZone:
              $checkedConvert('default_time_zone', (v) => v as String?),
          aigcBanner: $checkedConvert(
              'aigc_banner',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
                  .toList()),
          aigcCurriculum: $checkedConvert(
              'aigc_curriculum',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Curriculum.fromJson(e as Map<String, dynamic>))
                  .toList()),
          aigcDomain: $checkedConvert('aigc_domain', (v) => v as String?),
          fixing: $checkedConvert(
              'fixing',
              (v) => v == null
                  ? null
                  : Fixing.fromJson(v as Map<String, dynamic>)),
          game: $checkedConvert(
              'game',
              (v) =>
                  v == null ? null : Game.fromJson(v as Map<String, dynamic>)),
          groupBanner: $checkedConvert(
              'group_banner',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
                  .toList()),
          studentNameOrder: $checkedConvert('student_name_order',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          supportLang: $checkedConvert(
              'support_lang',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => SupportLang.fromJson(e as Map<String, dynamic>))
                  .toList()),
          telephoneCodeDefault:
              $checkedConvert('telephone_code_default', (v) => v as String?),
          uriHttpsBase: $checkedConvert('uri_https_base', (v) => v as String?),
          specialLessonAllow: $checkedConvert('special_lesson_allow',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          useFixing: $checkedConvert('use_fixing',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
        );
        return val;
      },
      fieldKeyMap: const {
        'siteId': 'site_id',
        'countryDefault': 'country_default',
        'defaultTimeZone': 'default_time_zone',
        'aigcBanner': 'aigc_banner',
        'aigcCurriculum': 'aigc_curriculum',
        'aigcDomain': 'aigc_domain',
        'groupBanner': 'group_banner',
        'studentNameOrder': 'student_name_order',
        'supportLang': 'support_lang',
        'telephoneCodeDefault': 'telephone_code_default',
        'uriHttpsBase': 'uri_https_base',
        'specialLessonAllow': 'special_lesson_allow',
        'useFixing': 'use_fixing'
      },
    );

Map<String, dynamic> _$$SiteConfigImplToJson(_$SiteConfigImpl instance) =>
    <String, dynamic>{
      if (instance.siteId case final value?) 'site_id': value,
      if (instance.label case final value?) 'label': value,
      if (instance.countryDefault case final value?) 'country_default': value,
      if (instance.defaultTimeZone case final value?)
        'default_time_zone': value,
      if (instance.aigcBanner?.map((e) => e.toJson()).toList()
          case final value?)
        'aigc_banner': value,
      if (instance.aigcCurriculum?.map((e) => e.toJson()).toList()
          case final value?)
        'aigc_curriculum': value,
      if (instance.aigcDomain case final value?) 'aigc_domain': value,
      if (instance.fixing?.toJson() case final value?) 'fixing': value,
      if (instance.game?.toJson() case final value?) 'game': value,
      if (instance.groupBanner?.map((e) => e.toJson()).toList()
          case final value?)
        'group_banner': value,
      if (instance.studentNameOrder case final value?)
        'student_name_order': value,
      if (instance.supportLang?.map((e) => e.toJson()).toList()
          case final value?)
        'support_lang': value,
      if (instance.telephoneCodeDefault case final value?)
        'telephone_code_default': value,
      if (instance.uriHttpsBase case final value?) 'uri_https_base': value,
      if (const CTBoolConverter().toJson(instance.specialLessonAllow)
          case final value?)
        'special_lesson_allow': value,
      if (const CTBoolConverter().toJson(instance.useFixing) case final value?)
        'use_fixing': value,
    };

_$FixingImpl _$$FixingImplFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$FixingImpl',
      json,
      ($checkedConvert) {
        final val = _$FixingImpl(
          available: $checkedConvert('available',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$FixingImplToJson(_$FixingImpl instance) =>
    <String, dynamic>{
      if (const CTBoolConverter().toJson(instance.available) case final value?)
        'available': value,
    };

_$GameImpl _$$GameImplFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$GameImpl',
      json,
      ($checkedConvert) {
        final val = _$GameImpl(
          canPlayPuzzleGame: $checkedConvert('can_play_puzzle_game',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
        );
        return val;
      },
      fieldKeyMap: const {'canPlayPuzzleGame': 'can_play_puzzle_game'},
    );

Map<String, dynamic> _$$GameImplToJson(_$GameImpl instance) =>
    <String, dynamic>{
      if (const CTBoolConverter().toJson(instance.canPlayPuzzleGame)
          case final value?)
        'can_play_puzzle_game': value,
    };

_$MasterConfigImpl _$$MasterConfigImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$MasterConfigImpl',
      json,
      ($checkedConvert) {
        final val = _$MasterConfigImpl(
          data: $checkedConvert(
              'data',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map(
                          (e) => SiteConfig.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
        );
        return val;
      },
    );

Map<String, dynamic> _$$MasterConfigImplToJson(_$MasterConfigImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
