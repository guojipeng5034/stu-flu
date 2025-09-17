import 'package:freezed_annotation/freezed_annotation.dart';

part 'quick_entry_item.freezed.dart';
part 'quick_entry_item.g.dart';

/// 快速入口项数据模型
///
/// 用于首页快速入口功能配置
@freezed
class QuickEntryItem with _$QuickEntryItem {
  const factory QuickEntryItem({
    String? itemName,
    String? icon,
    String? adultIcon,
    String? name,
    String? type,
    String? h5Url,
    String? nativeClass,
  }) = _QuickEntryItem;

  /// 从 JSON 创建 QuickEntryItem 实例
  factory QuickEntryItem.fromJson(Map<String, dynamic> json) => _$QuickEntryItemFromJson(json);
}
