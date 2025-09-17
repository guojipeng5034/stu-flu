import 'package:url_launcher/url_launcher.dart';

/// URL 相关工具类
class UrlUtils {
  /// 在应用内 WebView 中打开 URL
  /// 
  /// [url] 要打开的 URL 地址
  /// [mode] 启动模式，默认为应用内 WebView
  static Future<void> openInAppWebView(
    String? url, {
    LaunchMode mode = LaunchMode.inAppWebView,
  }) async {
    if (url != null && url.isNotEmpty) {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: mode);
      }
    }
  }

  /// 在外部浏览器中打开 URL
  /// 
  /// [url] 要打开的 URL 地址
  static Future<void> openInExternalBrowser(String? url) async {
    await openInAppWebView(url, mode: LaunchMode.externalApplication);
  }

  /// 在应用内浏览器中打开 URL
  /// 
  /// [url] 要打开的 URL 地址
  static Future<void> openInAppBrowser(String? url) async {
    await openInAppWebView(url, mode: LaunchMode.inAppBrowserView);
  }

  /// 检查 URL 是否可以启动
  /// 
  /// [url] 要检查的 URL 地址
  /// 返回 true 如果 URL 可以启动，否则返回 false
  static Future<bool> canLaunch(String? url) async {
    if (url == null || url.isEmpty) return false;
    try {
      final uri = Uri.parse(url);
      return await canLaunchUrl(uri);
    } catch (e) {
      return false;
    }
  }
}
