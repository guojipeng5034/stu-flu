// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InformationImpl _$$InformationImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$InformationImpl',
      json,
      ($checkedConvert) {
        final val = _$InformationImpl(
          content: $checkedConvert('content', (v) => v as String? ?? ''),
          contentHtmlFlag:
              $checkedConvert('content_html_flag', (v) => v as String? ?? ''),
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          postedTime: $checkedConvert('posted_time', (v) => v as String? ?? ''),
          title: $checkedConvert('title', (v) => v as String? ?? ''),
          linksJson: $checkedConvert(
              'links_json',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          InformationLink.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          links: $checkedConvert(
              'links',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) =>
                          InformationLink.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
        );
        return val;
      },
      fieldKeyMap: const {
        'contentHtmlFlag': 'content_html_flag',
        'postedTime': 'posted_time',
        'linksJson': 'links_json'
      },
    );

Map<String, dynamic> _$$InformationImplToJson(_$InformationImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'content_html_flag': instance.contentHtmlFlag,
      'id': instance.id,
      'posted_time': instance.postedTime,
      'title': instance.title,
      'links_json': instance.linksJson.map((e) => e.toJson()).toList(),
      'links': instance.links.map((e) => e.toJson()).toList(),
    };

_$InformationLinkImpl _$$InformationLinkImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$InformationLinkImpl',
      json,
      ($checkedConvert) {
        final val = _$InformationLinkImpl(
          target: $checkedConvert('target', (v) => v as String? ?? ''),
          title: $checkedConvert('title', (v) => v as String? ?? ''),
          url: $checkedConvert('url', (v) => v as String? ?? ''),
        );
        return val;
      },
    );

Map<String, dynamic> _$$InformationLinkImplToJson(
        _$InformationLinkImpl instance) =>
    <String, dynamic>{
      'target': instance.target,
      'title': instance.title,
      'url': instance.url,
    };
