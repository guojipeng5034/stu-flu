import 'package:flutter/material.dart';

// 统一导入所有示例页面
import 'index.dart';

// 示例路由名称
class ExampleRouteNames {
  static const String prefix = '/examples';
  static const String logging = '$prefix/logging'; // 统一的日志演示路由
  static const String boardDatetimePicker = '$prefix/board-datetime-picker';
  static const String carousel = '$prefix/carousel';
  static const String cityPickers = '$prefix/city-pickers';
  static const String dotenv = '$prefix/dotenv';
  static const String eventBus = '$prefix/event-bus';
  static const String intl = '$prefix/intl';
  static const String localization = '$prefix/localization';
  static const String jiffy = '$prefix/jiffy';
  static const String packageInfoPlus = '$prefix/package-info-plus';
  static const String permissionHandler = '$prefix/permission-handler';
  static const String provider = '$prefix/provider';
  static const String rxdart = '$prefix/rxdart';
  static const String screenUtil = '$prefix/screenutil';
  static const String sharedPreferences = '$prefix/shared-preferences';
  static const String urlLauncher = '$prefix/url-launcher';
  static const String webview = '$prefix/webview';
  static const String loginUiDemo = '$prefix/login-ui-demo';
}

// 示例路由页面
class ExampleRoutes {
  // 示例路由映射表
  static final Map<String, WidgetBuilder> routes = {
    ExampleRouteNames.logging: (context) => const LoggingDemoScreen(),
    ExampleRouteNames.boardDatetimePicker: (context) =>
        const BoardDatetimePickerDemoScreen(),
    ExampleRouteNames.carousel: (context) => const CarouselDemoScreen(),
    ExampleRouteNames.cityPickers: (context) => const CityPickersDemoScreen(),
    ExampleRouteNames.dotenv: (context) => const DotenvDemoScreen(),
    ExampleRouteNames.eventBus: (context) => const EventBusDemoScreen(),
    ExampleRouteNames.intl: (context) => const IntlDemoScreen(),
    ExampleRouteNames.localization: (context) => const LocalizationDemoPage(),
    ExampleRouteNames.jiffy: (context) => const JiffyDemoScreen(),

    ExampleRouteNames.packageInfoPlus: (context) =>
        const PackageInfoPlusDemoScreen(),
    ExampleRouteNames.permissionHandler: (context) =>
        const PermissionHandlerDemoScreen(),
    ExampleRouteNames.provider: (context) => const ProviderDemoScreen(),
    ExampleRouteNames.rxdart: (context) => const RxDartDemoScreen(),
    ExampleRouteNames.screenUtil: (context) => const ScreenUtilDemoScreen(),
    ExampleRouteNames.sharedPreferences: (context) =>
        const SharedPreferencesDemoScreen(),
    ExampleRouteNames.urlLauncher: (context) => const UrlLauncherDemoScreen(),
    ExampleRouteNames.webview: (context) => const WebViewDemoScreen(),
    ExampleRouteNames.loginUiDemo: (context) => const LoginUiDemoScreen(),
  };

  // 为示例路由生成路由
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder);
    }
    return null;
  }
}
