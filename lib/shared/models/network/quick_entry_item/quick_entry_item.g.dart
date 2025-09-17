// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_entry_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuickEntryItemImpl _$$QuickEntryItemImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$QuickEntryItemImpl',
      json,
      ($checkedConvert) {
        final val = _$QuickEntryItemImpl(
          itemName: $checkedConvert('item_name', (v) => v as String?),
          icon: $checkedConvert('icon', (v) => v as String?),
          adultIcon: $checkedConvert('adult_icon', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          type: $checkedConvert('type', (v) => v as String?),
          h5Url: $checkedConvert('h5_url', (v) => v as String?),
          nativeClass: $checkedConvert('native_class', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'itemName': 'item_name',
        'adultIcon': 'adult_icon',
        'h5Url': 'h5_url',
        'nativeClass': 'native_class'
      },
    );

Map<String, dynamic> _$$QuickEntryItemImplToJson(
        _$QuickEntryItemImpl instance) =>
    <String, dynamic>{
      if (instance.itemName case final value?) 'item_name': value,
      if (instance.icon case final value?) 'icon': value,
      if (instance.adultIcon case final value?) 'adult_icon': value,
      if (instance.name case final value?) 'name': value,
      if (instance.type case final value?) 'type': value,
      if (instance.h5Url case final value?) 'h5_url': value,
      if (instance.nativeClass case final value?) 'native_class': value,
    };
