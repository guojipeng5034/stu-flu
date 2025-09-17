import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 缓存Banner图片组件
class CachedBannerImage extends StatelessWidget {
  /// 图片URL
  final String imageUrl;

  /// 宽度
  final double? width;

  /// 高度
  final double? height;

  /// 图片适配方式
  final BoxFit fit;

  /// 圆角半径
  final double borderRadius;

  /// 点击回调
  final VoidCallback? onTap;

  /// 是否显示阴影
  final bool showShadow;

  /// 阴影颜色
  final Color? shadowColor;

  /// 阴影模糊半径
  final double shadowBlurRadius;

  /// 阴影偏移
  final Offset shadowOffset;

  const CachedBannerImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 12,
    this.onTap,
    this.showShadow = true,
    this.shadowColor,
    this.shadowBlurRadius = 8,
    this.shadowOffset = const Offset(0, 4),
  });

  /// 获取安全的尺寸值，避免无限大
  double? _getSafeSize(double? size, double fallback) {
    if (size == null) return null;
    if (!size.isFinite) return fallback;
    return size;
  }

  @override
  Widget build(BuildContext context) {
    // 获取安全的尺寸值
    final safeWidth = _getSafeSize(width, MediaQuery.of(context).size.width);
    final safeHeight = _getSafeSize(height, 200);

    Widget imageWidget = Container(
      width: safeWidth,
      height: safeHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: shadowColor ?? Colors.black.withValues(alpha: 0.1),
                  blurRadius: shadowBlurRadius,
                  offset: shadowOffset,
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: safeWidth,
          height: safeHeight,
          fit: fit,

          // 加载中的placeholder
          placeholder: (context, url) => _buildPlaceholder(context),

          // 加载失败时的错误占位符
          errorWidget: (context, url, error) => _buildErrorWidget(context),

          // 优化的淡入动画 - 缓存图片快速显示
          fadeInDuration: const Duration(milliseconds: 200),
          fadeOutDuration: const Duration(milliseconds: 100),

          // 强化缓存配置
          memCacheWidth: safeWidth != null ? (safeWidth * 2).round() : null,
          memCacheHeight: safeHeight != null ? (safeHeight * 2).round() : null,

          // 缓存键值，确保相同URL使用相同缓存
          cacheKey: imageUrl,

          // 磁盘缓存尺寸限制
          maxWidthDiskCache: safeWidth?.round(),
          maxHeightDiskCache: safeHeight?.round(),
        ),
      ),
    );

    if (onTap != null) {
      imageWidget = GestureDetector(
        onTap: onTap,
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  /// 构建加载中的placeholder
  Widget _buildPlaceholder(BuildContext context) {
    final safeWidth = _getSafeSize(width, MediaQuery.of(context).size.width);
    final safeHeight = _getSafeSize(height, 200);

    return Container(
      width: safeWidth,
      height: safeHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey[300]!,
            Colors.grey[200]!,
          ],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 背景图标
          Icon(
            Icons.image_outlined,
            size: (height ?? 100) * 0.3,
            color: Colors.grey[400],
          ),
          // 加载指示器
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建错误占位符
  Widget _buildErrorWidget(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withValues(alpha: 0.8),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_not_supported_outlined,
            size: (height ?? 100) * 0.25,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Text(
            '图片加载失败',
            style: TextStyle(
              color: Colors.white,
              fontSize: (height ?? 100) * 0.08,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

/// Banner图片工厂类
class BannerImageFactory {
  /// 创建轮播图Banner
  static Widget carousel({
    required String imageUrl,
    double? width,
    double? height,
    VoidCallback? onTap,
    double borderRadius = 12,
  }) {
    return CachedBannerImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      onTap: onTap,
      borderRadius: borderRadius,
      showShadow: true,
      shadowBlurRadius: 8,
      shadowOffset: const Offset(0, 4),
    );
  }

  /// 创建推广Banner
  static Widget promotion({
    required String imageUrl,
    double? width,
    double? height,
    VoidCallback? onTap,
    double borderRadius = 8,
  }) {
    return CachedBannerImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      onTap: onTap,
      borderRadius: borderRadius,
      showShadow: true,
      shadowBlurRadius: 4,
      shadowOffset: const Offset(0, 2),
    );
  }

  /// 创建课程封面
  static Widget courseCover({
    required String imageUrl,
    double? width,
    double? height,
    VoidCallback? onTap,
    double borderRadius = 8,
  }) {
    return CachedBannerImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      onTap: onTap,
      borderRadius: borderRadius,
      showShadow: false,
    );
  }
}
