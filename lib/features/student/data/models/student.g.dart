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
          commonCurriculumIds: $checkedConvert(
              'common_curriculum_ids',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Curriculum.fromJson(e as Map<String, dynamic>))
                  .toList()),
          countsOfMessages: $checkedConvert(
              'counts_of_messages', (v) => (v as num?)?.toInt()),
          curriculumApplicableUser: $checkedConvert(
              'curriculum_applicable_user',
              (v) => v == null
                  ? null
                  : ApplicableUser.fromJson(v as Map<String, dynamic>)),
          defaultVideoTool:
              $checkedConvert('default_video_tool', (v) => v as String?),
          defaultVideoToolProvider: $checkedConvert(
              'default_video_tool_provider', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          family: $checkedConvert(
              'family',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => FamilyMember.fromJson(e as Map<String, dynamic>))
                  .toList()),
          firstName: $checkedConvert('first_name', (v) => v as String?),
          gender: $checkedConvert('gender', (v) => v as String?),
          genderId: $checkedConvert('gender_id', (v) => (v as num?)?.toInt()),
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
          helpLink: $checkedConvert('help_link', (v) => v as String?),
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          imageFile: $checkedConvert('image_file', (v) => v as String?),
          lang: $checkedConvert('lang', (v) => v as String?),
          lastName: $checkedConvert('last_name', (v) => v as String?),
          mobile: $checkedConvert('mobile', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          nickname: $checkedConvert('nickname', (v) => v as String?),
          points: $checkedConvert('points', (v) => (v as num?)?.toInt()),
          requireSubstitute: $checkedConvert('require_substitute', (v) => v),
          siteId: $checkedConvert('site_id', (v) => (v as num?)?.toInt()),
          siteName: $checkedConvert('site_name', (v) => v as String?),
          subscriptionId:
              $checkedConvert('subscription_id', (v) => (v as num?)?.toInt()),
          tel: $checkedConvert('tel', (v) => v as String?),
          timeZone: $checkedConvert('time_zone', (v) => v as String?),
          totalFollow:
              $checkedConvert('total_follow', (v) => (v as num?)?.toInt()),
          totalTicketLog:
              $checkedConvert('total_ticket_log', (v) => v as String?),
          typeId: $checkedConvert('type_id', (v) => v),
          uid: $checkedConvert('uid', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'commonCurriculumIds': 'common_curriculum_ids',
        'countsOfMessages': 'counts_of_messages',
        'curriculumApplicableUser': 'curriculum_applicable_user',
        'defaultVideoTool': 'default_video_tool',
        'defaultVideoToolProvider': 'default_video_tool_provider',
        'firstName': 'first_name',
        'genderId': 'gender_id',
        'completedFtl': 'completed_ftl',
        'hasActiveSubscription': 'has_active_subscription',
        'hasActiveTickets': 'has_active_tickets',
        'hasFtlLesson': 'has_ftl_lesson',
        'skipFtl': 'skip_ftl',
        'helpLink': 'help_link',
        'imageFile': 'image_file',
        'lastName': 'last_name',
        'requireSubstitute': 'require_substitute',
        'siteId': 'site_id',
        'siteName': 'site_name',
        'subscriptionId': 'subscription_id',
        'timeZone': 'time_zone',
        'totalFollow': 'total_follow',
        'totalTicketLog': 'total_ticket_log',
        'typeId': 'type_id'
      },
    );

Map<String, dynamic> _$$StudentImplToJson(_$StudentImpl instance) =>
    <String, dynamic>{
      if (instance.birthday case final value?) 'birthday': value,
      if (instance.commonCurriculumIds?.map((e) => e.toJson()).toList()
          case final value?)
        'common_curriculum_ids': value,
      if (instance.countsOfMessages case final value?)
        'counts_of_messages': value,
      if (instance.curriculumApplicableUser?.toJson() case final value?)
        'curriculum_applicable_user': value,
      if (instance.defaultVideoTool case final value?)
        'default_video_tool': value,
      if (instance.defaultVideoToolProvider case final value?)
        'default_video_tool_provider': value,
      if (instance.email case final value?) 'email': value,
      if (instance.family?.map((e) => e.toJson()).toList() case final value?)
        'family': value,
      if (instance.firstName case final value?) 'first_name': value,
      if (instance.gender case final value?) 'gender': value,
      if (instance.genderId case final value?) 'gender_id': value,
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
      if (instance.helpLink case final value?) 'help_link': value,
      if (instance.id case final value?) 'id': value,
      if (instance.imageFile case final value?) 'image_file': value,
      if (instance.lang case final value?) 'lang': value,
      if (instance.lastName case final value?) 'last_name': value,
      if (instance.mobile case final value?) 'mobile': value,
      if (instance.name case final value?) 'name': value,
      if (instance.nickname case final value?) 'nickname': value,
      if (instance.points case final value?) 'points': value,
      if (instance.requireSubstitute case final value?)
        'require_substitute': value,
      if (instance.siteId case final value?) 'site_id': value,
      if (instance.siteName case final value?) 'site_name': value,
      if (instance.subscriptionId case final value?) 'subscription_id': value,
      if (instance.tel case final value?) 'tel': value,
      if (instance.timeZone case final value?) 'time_zone': value,
      if (instance.totalFollow case final value?) 'total_follow': value,
      if (instance.totalTicketLog case final value?) 'total_ticket_log': value,
      if (instance.typeId case final value?) 'type_id': value,
      if (instance.uid case final value?) 'uid': value,
    };

_$FamilyMemberImpl _$$FamilyMemberImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$FamilyMemberImpl',
      json,
      ($checkedConvert) {
        final val = _$FamilyMemberImpl(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          imageFile: $checkedConvert('image_file', (v) => v as String?),
          nickname: $checkedConvert('nickname', (v) => v as String?),
          skipFtl: $checkedConvert('skip_ftl',
              (v) => v == null ? false : const CTBoolConverter().fromJson(v)),
          uid: $checkedConvert('uid', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'imageFile': 'image_file', 'skipFtl': 'skip_ftl'},
    );

Map<String, dynamic> _$$FamilyMemberImplToJson(_$FamilyMemberImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.imageFile case final value?) 'image_file': value,
      if (instance.nickname case final value?) 'nickname': value,
      if (const CTBoolConverter().toJson(instance.skipFtl) case final value?)
        'skip_ftl': value,
      if (instance.uid case final value?) 'uid': value,
    };

_$StudentDataImpl _$$StudentDataImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$StudentDataImpl',
      json,
      ($checkedConvert) {
        final val = _$StudentDataImpl(
          apiDomain: $checkedConvert('api_domain', (v) => v as String?),
          domain: $checkedConvert('domain', (v) => v as String?),
          hotReserveTime: $checkedConvert('hot_reserve_time',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          student: $checkedConvert(
              'student',
              (v) => v == null
                  ? null
                  : Student.fromJson(v as Map<String, dynamic>)),
          token: $checkedConvert('token', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'apiDomain': 'api_domain',
        'hotReserveTime': 'hot_reserve_time'
      },
    );

Map<String, dynamic> _$$StudentDataImplToJson(_$StudentDataImpl instance) =>
    <String, dynamic>{
      if (instance.apiDomain case final value?) 'api_domain': value,
      if (instance.domain case final value?) 'domain': value,
      if (instance.hotReserveTime case final value?) 'hot_reserve_time': value,
      if (instance.student?.toJson() case final value?) 'student': value,
      if (instance.token case final value?) 'token': value,
    };
