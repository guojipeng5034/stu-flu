import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'example_routes.dart';

/// 示例列表页面，用于展示所有可用的演示组件
class ExampleListScreen extends StatelessWidget {
  const ExampleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('组件演示'),
      ),
      body: ListView(
        children: [
          // 架构演示（置顶）
          _buildDemoTile(context, '🏗️ Flutter 架构演示', '/examples/architecture'),
          const Divider(),

          _buildDemoTile(context, '日志功能', ExampleRouteNames.logging),
          _buildDemoTile(
              context, '日期时间选择器', ExampleRouteNames.boardDatetimePicker),
          _buildDemoTile(context, '轮播图', ExampleRouteNames.carousel),
          _buildDemoTile(context, '城市选择器', ExampleRouteNames.cityPickers),
          _buildDemoTile(context, '环境变量配置', ExampleRouteNames.dotenv),
          _buildDemoTile(context, '事件总线', ExampleRouteNames.eventBus),
          _buildDemoTile(context, '本地化管理', ExampleRouteNames.localization),
          _buildDemoTile(context, 'Intl包使用', ExampleRouteNames.intl),
          _buildDemoTile(context, '日期处理', ExampleRouteNames.jiffy),
          _buildDemoTile(context, '包信息', ExampleRouteNames.packageInfoPlus),
          _buildDemoTile(context, '权限处理', ExampleRouteNames.permissionHandler),
          _buildDemoTile(context, 'Provider状态管理', ExampleRouteNames.provider),
          _buildDemoTile(context, 'RxDart响应式编程', ExampleRouteNames.rxdart),
          _buildDemoTile(context, '屏幕适配', ExampleRouteNames.screenUtil),
          _buildDemoTile(context, '本地存储', ExampleRouteNames.sharedPreferences),
          _buildDemoTile(context, 'URL启动器', ExampleRouteNames.urlLauncher),
          _buildDemoTile(context, 'WebView', ExampleRouteNames.webview),
          _buildDemoTile(context, '🎨 登录UI演示', ExampleRouteNames.loginUiDemo),
        ],
      ),
    );
  }

  /// 构建演示列表项
  Widget _buildDemoTile(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () => context.go(route),
    );
  }
}
