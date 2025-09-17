// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BannerImpl _$$BannerImplFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$BannerImpl',
      json,
      ($checkedConvert) {
        final val = _$BannerImpl(
          image: $checkedConvert('image', (v) => v as String?),
          url: $checkedConvert('url', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$BannerImplToJson(_$BannerImpl instance) =>
    <String, dynamic>{
      if (instance.image case final value?) 'image': value,
      if (instance.url case final value?) 'url': value,
    };
