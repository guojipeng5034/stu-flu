import 'dart:ui';

import 'package:cptop/core/logger/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// 环境配置类
/// 使用flutter_dotenv加载和管理环境变量
class Env {
  // 单例实例
  static final Env _instance = Env._internal();
  static Env get instance => _instance;

  // 环境类型
  String? _environment;

  // 私有构造函数
  Env._internal();

  /// 初始化环境配置
  static Future<void> initialize({required String env}) async {
    // 如果已经初始化且环境相同，则跳过
    if (_instance._environment == env) {
      if (kDebugMode) {
        //Log.i('环境配置已存在，跳过重复初始化: $env');
      }
      return;
    }

    // 先加载公共配置
    await dotenv.load(fileName: 'assets/env/env.common');

    // 保存公共配置
    final commonEnv = Map<String, String>.from(dotenv.env);

    // 然后加载特定环境的配置（会覆盖公共配置中的同名变量）
    final envFile = 'assets/env/env.$env';
    await dotenv.load(fileName: envFile, mergeWith: commonEnv);

    // 设置当前环境
    _instance._environment = env;

    if (kDebugMode) {
      //Log.i('环境配置已加载: $env');
      //Log.i('配置文件: $envFile (覆盖 env.common)');
    }
  }

  /// 获取字符串类型的环境变量
  String getString(String key, {String defaultValue = ''}) {
    return dotenv.env[key] ?? defaultValue;
  }

  /// 获取整数类型的环境变量
  int getInt(String key, {int defaultValue = 0}) {
    final value = dotenv.env[key];
    if (value == null) return defaultValue;
    return int.tryParse(value) ?? defaultValue;
  }

  /// 获取双精度类型的环境变量
  double getDouble(String key, {double defaultValue = 0.0}) {
    final value = dotenv.env[key];
    if (value == null) return defaultValue;
    return double.tryParse(value) ?? defaultValue;
  }

  /// 获取布尔类型的环境变量
  bool getBool(String key, {bool defaultValue = false}) {
    final value = dotenv.env[key]?.toLowerCase();
    if (value == null) return defaultValue;
    return value == 'true' || value == '1' || value == 'yes';
  }

  /// 获取颜色类型的环境变量
  Color getColor(String key, {Color defaultValue = const Color(0xFF000000)}) {
    final value = dotenv.env[key];
    if (value == null) return defaultValue;

    try {
      if (value.startsWith('0x')) {
        return Color(int.parse(value));
      } else if (value.startsWith('#')) {
        return Color(int.parse('0xFF${value.substring(1)}'));
      }
    } catch (e) {
      if (kDebugMode) {
        Log.w('无法解析颜色值: $value');
      }
    }

    return defaultValue;
  }

  /// 获取当前环境类型
  String get environment {
    if (_environment == null) {
      throw StateError('环境配置尚未初始化，请先调用 Env.initialize()');
    }
    return _environment!;
  }

  /// 判断是否为开发环境
  bool get isDevelopment => environment == 'development';

  /// 判断是否为测试环境
  bool get isStaging => environment == 'staging';

  /// 判断是否为生产环境
  bool get isProduction => environment == 'production';

  // 常用配置项的便捷访问器

  /// 应用名称
  String get appName => getString('APP_NAME');

  /// 应用版本
  String get appVersion => getString('APP_VERSION');

  /// 应用构建号
  String get appBuild => getString('APP_BUILD');

  /// 完整的应用版本号（版本+构建号）
  String get fullAppVersion => '$appVersion+$appBuild';

  /// API基础URL
  String get apiBaseUrl => getString('API_BASE_URL');

  /// API超时时间（毫秒）
  int get apiTimeout => getInt('API_TIMEOUT');

  /// API重试次数
  int get apiRetryCount => getInt('API_RETRY_COUNT');

  /// API连接超时（毫秒）
  int get apiConnectTimeout => getInt('API_CONNECT_TIMEOUT');

  /// 是否启用日志
  bool get enableLogs => getBool('ENABLE_LOGS');

  /// 是否启用崩溃报告
  bool get enableCrashReporting => getBool('ENABLE_CRASH_REPORTING');

  /// 是否启用分析
  bool get enableAnalytics => getBool('ENABLE_ANALYTICS');

  /// 是否模拟API
  bool get mockApi => getBool('MOCK_API');

  /// 主题颜色
  Color get themeColor => getColor('THEME_COLOR');

  /// 是否显示调试横幅
  bool get showDebugBanner => getBool('SHOW_DEBUG_BANNER');

  /// 默认本地化
  String get defaultLocale =>
      getString('DEFAULT_LOCALE', defaultValue: 'zh_CN');

  /// 基础URL
  String get baseUrl => getString('BASE_URL');

  /// 完整的条款URL
  String get termsUrl => '$baseUrl${getString('TERMS_URL')}';

  /// 完整的隐私政策URL
  String get privacyUrl => '$baseUrl${getString('PRIVACY_URL')}';

  /// 完整的帮助URL
  String get helpUrl => '$baseUrl${getString('HELP_URL')}';

  /// 缓存持续时间（秒）
  int get cacheDuration => getInt('CACHE_DURATION');

  /// 分页大小
  int get paginationSize => getInt('PAGINATION_SIZE');

  /// 最大上传大小（字节）
  int get maxUploadSize => getInt('MAX_UPLOAD_SIZE');
}
