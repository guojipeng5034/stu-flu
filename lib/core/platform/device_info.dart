/// 设备信息工具
/// 提供设备相关信息获取功能
library;

import 'dart:io';
import 'package:flutter/foundation.dart';

class DeviceInfo {
  DeviceInfo._();

  /// 获取平台类型
  static String get platformName {
    if (kIsWeb) return 'Web';
    return Platform.operatingSystem;
  }

  /// 判断是否为移动平台
  static bool get isMobile {
    if (kIsWeb) return false;
    return Platform.isAndroid || Platform.isIOS;
  }

  /// 判断是否为桌面平台
  static bool get isDesktop {
    if (kIsWeb) return false;
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }

  /// 判断是否为Web平台
  static bool get isWeb => kIsWeb;

  /// 判断是否为Android
  static bool get isAndroid {
    if (kIsWeb) return false;
    return Platform.isAndroid;
  }

  /// 判断是否为iOS
  static bool get isIOS {
    if (kIsWeb) return false;
    return Platform.isIOS;
  }

  /// 判断是否为Windows
  static bool get isWindows {
    if (kIsWeb) return false;
    return Platform.isWindows;
  }

  /// 判断是否为macOS
  static bool get isMacOS {
    if (kIsWeb) return false;
    return Platform.isMacOS;
  }

  /// 判断是否为Linux
  static bool get isLinux {
    if (kIsWeb) return false;
    return Platform.isLinux;
  }

  /// 获取操作系统版本
  static String get operatingSystemVersion {
    if (kIsWeb) return 'Web';
    return Platform.operatingSystemVersion;
  }

  /// 获取本地主机名
  static String get localHostname {
    if (kIsWeb) return 'Web';
    return Platform.localHostname;
  }

  /// 获取处理器数量
  static int get numberOfProcessors {
    if (kIsWeb) return 1;
    return Platform.numberOfProcessors;
  }

  /// 获取路径分隔符
  static String get pathSeparator {
    if (kIsWeb) return '/';
    return Platform.pathSeparator;
  }

  /// 获取可执行文件路径
  static String get executable {
    if (kIsWeb) return '';
    return Platform.executable;
  }

  /// 获取环境变量
  static Map<String, String> get environment {
    if (kIsWeb) return {};
    return Platform.environment;
  }

  /// 获取特定环境变量
  static String? getEnvironmentVariable(String name) {
    if (kIsWeb) return null;
    return Platform.environment[name];
  }

  /// 判断是否为调试模式
  static bool get isDebugMode => kDebugMode;

  /// 判断是否为发布模式
  static bool get isReleaseMode => kReleaseMode;

  /// 判断是否为性能测试模式
  static bool get isProfileMode => kProfileMode;

  /// 获取平台信息摘要
  static Map<String, dynamic> get summary => {
        'platform': platformName,
        'isMobile': isMobile,
        'isDesktop': isDesktop,
        'isWeb': isWeb,
        'isDebugMode': isDebugMode,
        'isReleaseMode': isReleaseMode,
        'operatingSystemVersion': operatingSystemVersion,
        'numberOfProcessors': numberOfProcessors,
      };
}
