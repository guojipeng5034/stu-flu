// ================= Examples 模块统一导出文件 =================
//
// 这个文件统一导出 Examples 模块的所有组件，
// 方便其他文件统一引用，避免分散的导入语句。
//
// 使用方式：
// import 'package:cptop/features/examples/examples.dart';

// ================= 页面 =================
// 核心功能示例
export 'ui/pages/logging_demo_screen.dart';
export 'ui/pages/dotenv_demo_screen.dart';
export 'ui/pages/event_bus_demo_screen.dart';

// UI 组件示例
export 'ui/pages/board_datetime_picker_demo_screen.dart';
export 'ui/pages/carousel_demo_screen.dart';
export 'ui/pages/city_pickers_demo_screen.dart';
export 'ui/pages/screenutil_demo_screen.dart';
export 'ui/pages/webview_demo_screen.dart';

// 国际化和本地化示例
export 'ui/pages/intl_demo_screen.dart';
export 'ui/pages/localization/localization_demo_page.dart';

// 日期时间处理示例
export 'ui/pages/jiffy_demo_screen.dart';

// 设备和系统功能示例
export 'ui/pages/package_info_plus_demo_screen.dart';
export 'ui/pages/permission_handler_demo_screen.dart';
export 'ui/pages/url_launcher_demo_screen.dart';

// 状态管理和数据处理示例
export 'ui/pages/provider_demo_screen.dart';
export 'ui/pages/rxdart_demo_screen.dart';
export 'ui/pages/shared_preferences_demo_screen.dart';

// 示例列表页面
export 'ui/pages/example_list_screen.dart';

// ================= 路由和配置 =================
export 'ui/pages/example_routes.dart';

// ================= 工具类和服务 =================
export 'ui/pages/event_bus.dart';

// ================= 统一导出 =================
export 'ui/pages/index.dart';
