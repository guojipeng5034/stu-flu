import 'group_banner.dart';

/// GroupBanner类的扩展方法
extension GroupBannerX on GroupBanner {
  /// 检查是否有图片
  bool get hasImage => image != null && image!.isNotEmpty;

  /// 检查是否有链接
  bool get hasUrl => url != null && url!.isNotEmpty;


  /// 检查是否为外部链接
  bool get isExternalUrl {
    if (!hasUrl) return false;
    return url!.startsWith('http://') || url!.startsWith('https://');
  }

  /// 检查是否为内部路由
  bool get isInternalRoute {
    if (!hasUrl) return false;
    return !isExternalUrl;
  }
}
