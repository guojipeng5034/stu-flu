import 'quick_entry_item.dart';

/// QuickEntryItem类的扩展方法
extension QuickEntryItemX on QuickEntryItem {
  /// 获取图标URL（根据应用类型选择合适的图标）
  String? getIconUrl({bool isAdultApp = false}) {
    if (isAdultApp && adultIcon != null && adultIcon!.isNotEmpty) {
      return adultIcon;
    }
    return icon;
  }

  /// 检查是否为原生类型
  bool get isNativeType => type == 'native';

  /// 检查是否为H5类型
  bool get isH5Type => type == 'h5';

  /// 检查是否有有效的H5链接
  bool get hasValidH5Url => h5Url != null && h5Url!.isNotEmpty;

  /// 检查是否有有效的原生类
  bool get hasValidNativeClass => nativeClass != null && nativeClass!.isNotEmpty;
}
