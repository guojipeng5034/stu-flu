// ================= Examples 统一导出文件 =================
//
// 这个文件统一导出所有的示例页面和相关组件，
// 方便其他文件统一引用，避免分散的导入语句。
//
// 使用方式：
// import 'package:cptop/pages/examples/index.dart';

import 'package:flutter/material.dart';

// ================= 示例页面 =================

// 核心功能示例
export 'logging_demo_screen.dart';
export 'dotenv_demo_screen.dart';
export 'event_bus_demo_screen.dart';

// UI 组件示例
export 'board_datetime_picker_demo_screen.dart';
export 'carousel_demo_screen.dart';
export 'city_pickers_demo_screen.dart';
export 'screenutil_demo_screen.dart';
export 'webview_demo_screen.dart';
export 'login_ui_demo_screen.dart';

// 国际化和本地化示例
export 'intl_demo_screen.dart';
export 'localization/localization_demo_page.dart';

// 日期时间处理示例
export 'jiffy_demo_screen.dart';

// 设备和系统功能示例
export 'package_info_plus_demo_screen.dart';
export 'permission_handler_demo_screen.dart';
export 'url_launcher_demo_screen.dart';

// 状态管理和数据处理示例
export 'provider_demo_screen.dart';
export 'rxdart_demo_screen.dart';
export 'shared_preferences_demo_screen.dart';

// ================= 路由和配置 =================

// 示例路由配置
export 'example_routes.dart';

// 示例列表页面
export 'example_list_screen.dart';

// ================= 工具类和服务 =================

// 事件总线
export 'event_bus.dart';

// ================= 类型别名 =================

// 为了方便使用，可以创建一些类型别名
typedef ExampleScreen = Widget;
typedef ExampleBuilder = Widget Function(BuildContext context);

// ================= 常量定义 =================

/// 示例页面相关常量
class ExampleConstants {
  /// 示例页面标题前缀
  static const String titlePrefix = '示例 - ';
  
  /// 示例页面默认背景色
  static const Color defaultBackgroundColor = Colors.white;
  
  /// 示例页面默认内边距
  static const EdgeInsets defaultPadding = EdgeInsets.all(16.0);
}

// ================= 工具函数 =================

/// 构建示例页面的通用 AppBar
AppBar buildExampleAppBar(String title) {
  return AppBar(
    title: Text('${ExampleConstants.titlePrefix}$title'),
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  );
}

/// 构建示例页面的通用 Scaffold
Scaffold buildExampleScaffold({
  required String title,
  required Widget body,
  Widget? floatingActionButton,
}) {
  return Scaffold(
    appBar: buildExampleAppBar(title),
    body: Padding(
      padding: ExampleConstants.defaultPadding,
      child: body,
    ),
    backgroundColor: ExampleConstants.defaultBackgroundColor,
    floatingActionButton: floatingActionButton,
  );
}
