// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupBannerImpl _$$GroupBannerImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$GroupBannerImpl',
      json,
      ($checkedConvert) {
        final val = _$GroupBannerImpl(
          image: $checkedConvert('image', (v) => v as String?),
          url: $checkedConvert('url', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$GroupBannerImplToJson(_$GroupBannerImpl instance) =>
    <String, dynamic>{
      if (instance.image case final value?) 'image': value,
      if (instance.url case final value?) 'url': value,
    };
