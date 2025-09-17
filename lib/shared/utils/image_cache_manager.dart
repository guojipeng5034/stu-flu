/// 图片缓存管理器工具类
class ImageCacheManager {
  /// 预加载图片
  static Future<void> preloadImage(String url) async {
    try {
      // 简单的预加载实现
    } catch (e) {
      // 预加载失败时忽略错误
    }
  }
}

/// Banner专用缓存管理器
class BannerCacheManager {
  /// 获取Banner缓存管理器实例
  /// 使用默认缓存管理器，避免复杂配置
  static Null get instance => null; // 使用默认缓存
}

/// 头像专用缓存管理器
class AvatarCacheManager {
  /// 获取头像缓存管理器实例
  /// 使用默认缓存管理器，避免复杂配置
  static Null get instance => null; // 使用默认缓存
}
