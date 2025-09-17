/// 应用级常量定义
///
/// 包含应用程序中使用的各种常量值
/// 注意：环境相关的配置请使用 lib/env/ 中的环境配置
library;

class AppConstants {
  AppConstants._(); // 私有构造函数，防止实例化

  // === 应用信息 ===
  static const String appName = 'Flutter Test App';
  static const String appDescription = 'Flutter 示例应用程序';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';

  // === 网络配置 ===
  static const Duration defaultTimeout = Duration(seconds: 30);
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const int maxRetryAttempts = 3;

  // === 缓存配置 ===
  static const Duration defaultCacheDuration = Duration(hours: 1);
  static const Duration shortCacheDuration = Duration(minutes: 5);
  static const Duration longCacheDuration = Duration(days: 1);
  static const int maxCacheSize = 100; // MB

  // === UI 配置 ===
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 8.0;
  static const double iconSize = 24.0;
  static const double avatarSize = 40.0;

  // === 动画配置 ===
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 300);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);

  // === 分页配置 ===
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  static const int minPageSize = 5;

  // === 文件上传配置 ===
  static const int maxFileSize = 10 * 1024 * 1024; // 10MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'gif'];
  static const List<String> allowedDocumentTypes = [
    'pdf',
    'doc',
    'docx',
    'txt'
  ];

  // === 验证规则 ===
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 20;
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 20;

  // === 存储键名 ===
  static const String userTokenKey = 'user_token';
  static const String userInfoKey = 'user_info';
  static const String languageKey = 'selected_language';
  static const String themeKey = 'selected_theme';
  static const String firstLaunchKey = 'is_first_launch';

  // === 路由名称 ===
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String profileRoute = '/profile';
  static const String settingsRoute = '/settings';
  static const String aboutRoute = '/about';

  // === 错误消息 ===
  static const String networkErrorMessage = '网络连接失败，请检查网络设置';
  static const String serverErrorMessage = '服务器错误，请稍后重试';
  static const String unknownErrorMessage = '未知错误，请联系客服';
  static const String timeoutErrorMessage = '请求超时，请重试';

  // === 正则表达式 ===
  static const String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const String phoneRegex = r'^1[3-9]\d{9}$';
  static const String passwordRegex =
      r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d@$!%*?&]{6,}$';

  // === 日期格式 ===
  static const String dateFormat = 'yyyy-MM-dd';
  static const String timeFormat = 'HH:mm:ss';
  static const String dateTimeFormat = 'yyyy-MM-dd HH:mm:ss';
  static const String displayDateFormat = 'yyyy年MM月dd日';

  // === 支持的语言 ===
  static const List<String> supportedLanguages = ['zh', 'en'];
  static const String defaultLanguage = 'zh';

  // === 调试配置 ===
  static const bool enableDebugMode = true;
  static const bool enablePerformanceOverlay = false;
  static const bool showDebugBanner = false;
}

/// 功能特定常量示例
/// 可以根据需要创建更多的常量类
class ExampleFeatureConstants {
  ExampleFeatureConstants._();

  static const String featureName = 'Example Feature';
  static const String featureDescription = '示例功能模块';
  static const int maxItems = 50;
  static const Duration refreshInterval = Duration(minutes: 5);
}
