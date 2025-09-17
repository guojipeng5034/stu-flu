import 'dart:io';

import 'package:cptop/core/logger/index.dart';
import 'package:flutter/foundation.dart';

import 'index.dart';

/// 环境配置加载器
/// 负责在应用启动时加载正确的环境配置
class EnvLoader {
  // 定义环境类型常量
  static const String development = 'development';
  static const String staging = 'staging';
  static const String production = 'production';

  /// 从多种来源确定环境类型
  /// 优先级：
  /// 1. 命令行参数 --dart-define=ENV=xxx
  /// 2. 环境变量 FLUTTER_ENV
  /// 3. 构建模式（debug -> development, profile -> staging, release -> production）
  static String getEnvironmentType() {
    // 1. 检查 --dart-define 参数
    const dartDefineEnv = String.fromEnvironment('ENV', defaultValue: '');
    if (dartDefineEnv.isNotEmpty) {
      return dartDefineEnv.toLowerCase();
    }

    // 2. 检查环境变量 (仅在非Web平台)
    if (!kIsWeb) {
      try {
        if (Platform.environment.containsKey('FLUTTER_ENV')) {
          return Platform.environment['FLUTTER_ENV']!.toLowerCase();
        }
      } catch (e) {
        // 在某些平台上可能无法访问环境变量
        if (kDebugMode) {
          Log.w('无法访问环境变量: $e');
        }
      }
    }

    // 3. 根据构建模式判断
    if (kReleaseMode) {
      return production;
    } else if (kProfileMode) {
      return staging;
    } else {
      return development;
    }
  }

  /// 加载环境配置
  static Future<void> load({String? env}) async {
    try {
      // 如果env为null，则使用getEnvironmentType()获取环境类型
      final String environment = env ?? getEnvironmentType();

      if (kDebugMode) {
        //Log.i('🌍 正在加载环境配置: $environment');
      }

      // 使用现有的 Env 类加载配置
      await Env.initialize(env: environment);

      if (kDebugMode) {
        //Log.i('✅ 环境配置加载完成');
        _printEnvironmentInfo(environment);
      }
    } catch (e) {
      if (kDebugMode) {
        //Log.e('❌ 环境配置加载失败: $e');
      }
      rethrow;
    }
  }

  /// 打印环境信息
  static void _printEnvironmentInfo(String environment) {
    final env = Env.instance;
    print('=== 环境配置信息 ===');
    print('环境类型: $environment');
    print('应用名称: ${env.appName}');
    print('应用版本: ${env.fullAppVersion}');
    print('API地址: ${env.apiBaseUrl}');
    print('API超时: ${env.apiTimeout}ms');
    print('启用日志: ${env.enableLogs}');
    print('启用分析: ${env.enableAnalytics}');
    print('启用崩溃报告: ${env.enableCrashReporting}');
    print('调试横幅: ${env.showDebugBanner}');
    print('默认语言: ${env.defaultLocale}');
    print('==================');
  }

  /// 获取当前环境类型
  static String get currentEnvironment => Env.instance.environment;

  /// 判断是否为开发环境
  static bool get isDevelopment => Env.instance.isDevelopment;

  /// 判断是否为测试环境
  static bool get isStaging => Env.instance.isStaging;

  /// 判断是否为生产环境
  static bool get isProduction => Env.instance.isProduction;
}
