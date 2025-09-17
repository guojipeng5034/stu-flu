import 'package:logger/logger.dart';
import 'app_logger.dart';

/// 🔧 日志配置管理类
/// 统一管理应用的日志级别和详细程度
class LogConfig {
  static bool _isProduction = false;
  static bool _enableNetworkLogs = true;
  static bool _enableDetailedLogs = true;
  static int _maxResponseLength = 500;
  static int _maxRequestLength = 300;

  /// 初始化日志配置
  static void setup({
    bool isProduction = false,
    bool enableNetworkLogs = true,
    bool enableDetailedLogs = true,
    int maxResponseLength = 500,
    int maxRequestLength = 300,
  }) {
    _isProduction = isProduction;
    _enableNetworkLogs = enableNetworkLogs;
    _enableDetailedLogs = enableDetailedLogs;
    _maxResponseLength = maxResponseLength;
    _maxRequestLength = maxRequestLength;

    // 根据环境配置日志级别
    Level logLevel;
    if (isProduction) {
      logLevel = Level.warning; // 生产环境只显示警告和错误
    } else {
      logLevel = enableDetailedLogs ? Level.verbose : Level.info;
    }

    // 配置AppLogger
    Log.configure(
      enabled: true,
      level: logLevel,
      methodCount: isProduction ? 0 : 2,
      errorMethodCount: isProduction ? 3 : 8,
      lineLength: 120,
      colors: !isProduction,
      printEmojis: !isProduction,
      printTime: true,
    );
  }

  /// 是否为生产环境
  static bool get isProduction => _isProduction;

  /// 是否启用网络日志
  static bool get enableNetworkLogs => _enableNetworkLogs;

  /// 是否启用详细日志
  static bool get enableDetailedLogs => _enableDetailedLogs;

  /// 最大响应长度
  static int get maxResponseLength => _maxResponseLength;

  /// 最大请求长度
  static int get maxRequestLength => _maxRequestLength;

  /// 设置网络日志开关
  static void setNetworkLogsEnabled(bool enabled) {
    _enableNetworkLogs = enabled;
  }

  /// 设置详细日志开关
  static void setDetailedLogsEnabled(bool enabled) {
    _enableDetailedLogs = enabled;
  }

  /// 设置响应数据最大长度
  static void setMaxResponseLength(int length) {
    _maxResponseLength = length;
  }

  /// 设置请求数据最大长度
  static void setMaxRequestLength(int length) {
    _maxRequestLength = length;
  }

  /// 开发环境配置
  static void setupForDevelopment() {
    setup(
      isProduction: false,
      enableNetworkLogs: true,
      enableDetailedLogs: true,
      maxResponseLength: 1000,
      maxRequestLength: 500,
    );
  }

  /// 测试环境配置
  static void setupForTesting() {
    setup(
      isProduction: false,
      enableNetworkLogs: true,
      enableDetailedLogs: false,
      maxResponseLength: 300,
      maxRequestLength: 200,
    );
  }

  /// 生产环境配置
  static void setupForProduction() {
    setup(
      isProduction: true,
      enableNetworkLogs: false,
      enableDetailedLogs: false,
      maxResponseLength: 100,
      maxRequestLength: 100,
    );
  }

  /// 调试模式配置（最详细）
  static void setupForDebug() {
    setup(
      isProduction: false,
      enableNetworkLogs: true,
      enableDetailedLogs: true,
      maxResponseLength: 2000,
      maxRequestLength: 1000,
    );
  }

  /// 简洁模式配置（最简洁）
  static void setupForMinimal() {
    setup(
      isProduction: false,
      enableNetworkLogs: false,
      enableDetailedLogs: false,
      maxResponseLength: 50,
      maxRequestLength: 50,
    );
  }

  /// 获取当前配置信息
  static Map<String, dynamic> getCurrentConfig() {
    return {
      'isProduction': _isProduction,
      'enableNetworkLogs': _enableNetworkLogs,
      'enableDetailedLogs': _enableDetailedLogs,
      'maxResponseLength': _maxResponseLength,
      'maxRequestLength': _maxRequestLength,
    };
  }

  /// 打印当前配置
  static void printCurrentConfig() {
    Log.i('''
🔧 ===== 日志配置信息 =====
📱 环境: ${_isProduction ? '生产环境' : '开发环境'}
🌐 网络日志: ${_enableNetworkLogs ? '启用' : '禁用'}
📋 详细日志: ${_enableDetailedLogs ? '启用' : '禁用'}
📥 响应长度限制: $_maxResponseLength 字符
📤 请求长度限制: $_maxRequestLength 字符
========================
''');
  }
}

/// 🎯 日志级别快捷设置
class LogLevel {
  /// 设置为详细模式（显示所有日志）
  static void setVerbose() {
    Log.configure(level: Level.verbose);
  }

  /// 设置为调试模式（显示调试及以上级别）
  static void setDebug() {
    Log.configure(level: Level.debug);
  }

  /// 设置为信息模式（显示信息及以上级别）
  static void setInfo() {
    Log.configure(level: Level.info);
  }

  /// 设置为警告模式（显示警告及以上级别）
  static void setWarning() {
    Log.configure(level: Level.warning);
  }

  /// 设置为错误模式（只显示错误）
  static void setError() {
    Log.configure(level: Level.error);
  }

  /// 禁用所有日志
  static void setOff() {
    Log.configure(level: Level.off);
  }
}

/// 🚀 快捷配置方法
extension LogConfigExtension on LogConfig {
  /// 快速切换到开发模式
  static void dev() => LogConfig.setupForDevelopment();

  /// 快速切换到测试模式
  static void test() => LogConfig.setupForTesting();

  /// 快速切换到生产模式
  static void prod() => LogConfig.setupForProduction();

  /// 快速切换到调试模式
  static void debug() => LogConfig.setupForDebug();

  /// 快速切换到简洁模式
  static void minimal() => LogConfig.setupForMinimal();
}

/// 📋 使用示例
/// 
/// ```dart
/// // 在main.dart中初始化
/// void main() {
///   // 开发环境
///   LogConfig.setupForDevelopment();
///   
///   // 或者自定义配置
///   LogConfig.setup(
///     isProduction: false,
///     enableNetworkLogs: true,
///     maxResponseLength: 300,
///   );
///   
///   // 运行时调整
///   LogConfig.setNetworkLogsEnabled(false);
///   LogLevel.setWarning();
///   
///   runApp(MyApp());
/// }
/// 
/// // 快捷配置
/// LogConfig.dev();     // 开发模式
/// LogConfig.prod();    // 生产模式
/// LogConfig.debug();   // 调试模式
/// LogConfig.minimal(); // 简洁模式
/// ```
