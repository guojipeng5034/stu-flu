// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentImpl _$$StudentImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$StudentImpl',
      json,
      ($checkedConvert) {
        final val = _$StudentImpl(
          birthday: $checkedConvert('birthday', (v) => v as String?),
          uid: $checkedConvert('uid', (v) => v as String?),
          curriculumApplicableUser: $checkedConvert(
              'curriculum_applicable_user',
              (v) => v == null
                  ? null
                  : ApplicableUser.fromJson(v as Map<String, dynamic>)),
          defaultVideoTool:
              $checkedConvert('default_video_tool', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          phone: $checkedConvert('phone', (v) => v as String?),
          family: $checkedConvert(
              'family',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          StudentFamily.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          gender: $checkedConvert('gender', (v) => v as String?),
          genderId:
              $checkedConvert('gender_id', (v) => (v as num?)?.toInt() ?? 0),
          helpLink: $checkedConvert('help_link', (v) => v as String?),
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          imageFile: $checkedConvert('image_file', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          firstName: $checkedConvert('first_name', (v) => v as String?),
          lastName: $checkedConvert('last_name', (v) => v as String?),
          nickname: $checkedConvert('nickname', (v) => v as String?),
          points: $checkedConvert('points', (v) => v as String?),
          siteId: $checkedConvert('site_id', (v) => (v as num?)?.toInt() ?? 0),
          subscriptionId:
              $checkedConvert('subscription_id', (v) => v as String?),
          tel: $checkedConvert('tel', (v) => v as String?),
          timeZone: $checkedConvert('time_zone', (v) => v as String?),
          totalFollow: $checkedConvert('total_follow', (v) => v as String?),
          totalTicketLog:
              $checkedConvert('total_ticket_log', (v) => v as String?),
          commonCurriculumIds: $checkedConvert(
              'common_curriculum_ids',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map(
                          (e) => Curriculum.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          requireSubstitute: $checkedConvert('require_substitute',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          completedFtl: $checkedConvert('completed_ftl',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          hasActiveSubscription: $checkedConvert('has_active_subscription',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          hasActiveTickets: $checkedConvert('has_active_tickets',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          hasFtlLesson: $checkedConvert('has_ftl_lesson',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          skipFtl: $checkedConvert('skip_ftl',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          lang: $checkedConvert('lang', (v) => v as String?),
          siteName: $checkedConvert('site_name', (v) => v as String?),
          mobile: $checkedConvert('mobile', (v) => v as String?),
          defaultVideoToolProvider: $checkedConvert(
              'default_video_tool_provider', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'curriculumApplicableUser': 'curriculum_applicable_user',
        'defaultVideoTool': 'default_video_tool',
        'genderId': 'gender_id',
        'helpLink': 'help_link',
        'imageFile': 'image_file',
        'firstName': 'first_name',
        'lastName': 'last_name',
        'siteId': 'site_id',
        'subscriptionId': 'subscription_id',
        'timeZone': 'time_zone',
        'totalFollow': 'total_follow',
        'totalTicketLog': 'total_ticket_log',
        'commonCurriculumIds': 'common_curriculum_ids',
        'requireSubstitute': 'require_substitute',
        'completedFtl': 'completed_ftl',
        'hasActiveSubscription': 'has_active_subscription',
        'hasActiveTickets': 'has_active_tickets',
        'hasFtlLesson': 'has_ftl_lesson',
        'skipFtl': 'skip_ftl',
        'siteName': 'site_name',
        'defaultVideoToolProvider': 'default_video_tool_provider'
      },
    );

Map<String, dynamic> _$$StudentImplToJson(_$StudentImpl instance) =>
    <String, dynamic>{
      if (instance.birthday case final value?) 'birthday': value,
      if (instance.uid case final value?) 'uid': value,
      if (instance.curriculumApplicableUser?.toJson() case final value?)
        'curriculum_applicable_user': value,
      if (instance.defaultVideoTool case final value?)
        'default_video_tool': value,
      if (instance.email case final value?) 'email': value,
      if (instance.phone case final value?) 'phone': value,
      'family': instance.family.map((e) => e.toJson()).toList(),
      if (instance.gender case final value?) 'gender': value,
      'gender_id': instance.genderId,
      if (instance.helpLink case final value?) 'help_link': value,
      'id': instance.id,
      if (instance.imageFile case final value?) 'image_file': value,
      if (instance.name case final value?) 'name': value,
      if (instance.firstName case final value?) 'first_name': value,
      if (instance.lastName case final value?) 'last_name': value,
      if (instance.nickname case final value?) 'nickname': value,
      if (instance.points case final value?) 'points': value,
      'site_id': instance.siteId,
      if (instance.subscriptionId case final value?) 'subscription_id': value,
      if (instance.tel case final value?) 'tel': value,
      if (instance.timeZone case final value?) 'time_zone': value,
      if (instance.totalFollow case final value?) 'total_follow': value,
      if (instance.totalTicketLog case final value?) 'total_ticket_log': value,
      'common_curriculum_ids':
          instance.commonCurriculumIds.map((e) => e.toJson()).toList(),
      if (const CTBoolConverter().toJson(instance.requireSubstitute)
          case final value?)
        'require_substitute': value,
      if (const CTBoolConverter().toJson(instance.completedFtl)
          case final value?)
        'completed_ftl': value,
      if (const CTBoolConverter().toJson(instance.hasActiveSubscription)
          case final value?)
        'has_active_subscription': value,
      if (const CTBoolConverter().toJson(instance.hasActiveTickets)
          case final value?)
        'has_active_tickets': value,
      if (const CTBoolConverter().toJson(instance.hasFtlLesson)
          case final value?)
        'has_ftl_lesson': value,
      if (const CTBoolConverter().toJson(instance.skipFtl) case final value?)
        'skip_ftl': value,
      if (instance.lang case final value?) 'lang': value,
      if (instance.siteName case final value?) 'site_name': value,
      if (instance.mobile case final value?) 'mobile': value,
      if (instance.defaultVideoToolProvider case final value?)
        'default_video_tool_provider': value,
    };

_$StudentFamilyImpl _$$StudentFamilyImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$StudentFamilyImpl',
      json,
      ($checkedConvert) {
        final val = _$StudentFamilyImpl(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          imageFile: $checkedConvert('image_file', (v) => v as String?),
          nickname: $checkedConvert('nickname', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'imageFile': 'image_file'},
    );

Map<String, dynamic> _$$StudentFamilyImplToJson(_$StudentFamilyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (instance.imageFile case final value?) 'image_file': value,
      if (instance.nickname case final value?) 'nickname': value,
    };
