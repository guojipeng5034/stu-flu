/// 演示路由统一导出文件
///
/// 这个文件统一导出所有演示和测试相关的路由组件，
/// 方便 app_router.dart 统一引用。
///
/// 使用方式：
/// ```dart
/// import 'package:cptop/router/demo/index.dart';
/// ```
library;

// ================= 演示路由管理 =================

/// 演示路由管理器
export 'demo_router.dart';

/// 路由测试页面
export 'router_test_page.dart';

// ================= 常量和工具 =================

/// 演示路由相关常量
class DemoRouteConstants {
  /// 演示功能是否启用（可用于生产环境控制）
  static const bool isDemoEnabled = true;
  
  /// 演示路由的默认标题前缀
  static const String titlePrefix = '演示 - ';
  
  /// 演示页面的默认主题色
  static const String primaryColor = '#2196F3';
}

/// 演示路由工具类
class DemoRouteUtils {
  /// 检查当前是否在演示模式
  static bool isInDemoMode(String currentPath) {
    return currentPath.startsWith('/examples') ||
           currentPath == '/router-test' ||
           currentPath == '/demo-list';
  }
  
  /// 获取演示路由的显示标题
  static String getDemoTitle(String routePath) {
    // 从路径中提取演示名称并格式化
    final segments = routePath.split('/');
    if (segments.length >= 3 && segments[1] == 'examples') {
      final demoName = segments[2];
      return '${DemoRouteConstants.titlePrefix}${_formatDemoName(demoName)}';
    }
    return DemoRouteConstants.titlePrefix + routePath;
  }
  
  /// 格式化演示名称
  static String _formatDemoName(String name) {
    // 将 kebab-case 转换为可读的标题
    return name
        .split('-')
        .map((word) => word.isNotEmpty 
            ? word[0].toUpperCase() + word.substring(1) 
            : word)
        .join(' ');
  }
}
