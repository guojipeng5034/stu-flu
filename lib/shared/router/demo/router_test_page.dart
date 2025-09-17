import 'package:cptop/features/examples/ui/pages/example_routes.dart';
import 'package:cptop/shared/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'demo_router.dart';

/// 路由测试页面
///
/// 用于测试和调试应用中的各种路由，
/// 提供快速导航到不同页面的功能。
class RouterTestPage extends StatelessWidget {
  const RouterTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('路由测试'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 基本路由测试
          _buildRouteSection(context, '🏠 基本路由', [
            _RouteItem('首页', RouteNames.home, Icons.home),
            _RouteItem('启动页', RouteNames.splash, Icons.launch),
            _RouteItem('登录页', RouteNames.login, Icons.login),
            _RouteItem('用户资料', RouteNames.userProfile, Icons.person),
            _RouteItem('站点配置', RouteNames.siteConfig, Icons.settings),
            _RouteItem('学生信息', RouteNames.studentInfo, Icons.school),
            _RouteItem('关于页面', RouteNames.about, Icons.info),
          ]),

          const SizedBox(height: 24),

          // 演示路由测试
          _buildRouteSection(context, '🧪 演示路由', [
            _RouteItem('演示列表', DemoRouter.demoList, Icons.list),
            _RouteItem('日志功能', ExampleRouteNames.logging, Icons.bug_report),
            _RouteItem('日期选择器', ExampleRouteNames.boardDatetimePicker,
                Icons.date_range),
            _RouteItem('轮播图', ExampleRouteNames.carousel, Icons.view_carousel),
            _RouteItem(
                '城市选择器', ExampleRouteNames.cityPickers, Icons.location_city),
            _RouteItem(
                '环境变量', ExampleRouteNames.dotenv, Icons.settings_applications),
            _RouteItem('事件总线', ExampleRouteNames.eventBus, Icons.event),
            _RouteItem('国际化', ExampleRouteNames.intl, Icons.language),
            _RouteItem('本地化', ExampleRouteNames.localization, Icons.translate),
            _RouteItem('日期处理', ExampleRouteNames.jiffy, Icons.schedule),
            _RouteItem(
                '包信息', ExampleRouteNames.packageInfoPlus, Icons.info_outline),
            _RouteItem(
                '权限处理', ExampleRouteNames.permissionHandler, Icons.security),
            _RouteItem('状态管理', ExampleRouteNames.provider,
                Icons.settings_input_component),
            _RouteItem('响应式编程', ExampleRouteNames.rxdart, Icons.stream),
            _RouteItem(
                '屏幕适配', ExampleRouteNames.screenUtil, Icons.phone_android),
            _RouteItem(
                '本地存储', ExampleRouteNames.sharedPreferences, Icons.storage),
            _RouteItem('URL启动器', ExampleRouteNames.urlLauncher, Icons.launch),
            _RouteItem('WebView', ExampleRouteNames.webview, Icons.web),
          ]),

          const SizedBox(height: 24),

          // 路由调试信息
          _buildDebugSection(context),
        ],
      ),
    );
  }

  /// 构建路由分组
  Widget _buildRouteSection(
      BuildContext context, String title, List<_RouteItem> routes) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...routes.map((route) => _buildRouteButton(context, route)),
          ],
        ),
      ),
    );
  }

  /// 构建路由按钮
  Widget _buildRouteButton(BuildContext context, _RouteItem route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            try {
              context.go(route.path);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('导航失败: $e'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          icon: Icon(route.icon, size: 20),
          label: Text('${route.title} (${route.path})'),
          style: ElevatedButton.styleFrom(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ),
    );
  }

  /// 构建调试信息区域
  Widget _buildDebugSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🔧 调试信息',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text('当前路由: ${GoRouterState.of(context).uri.path}'),
            const SizedBox(height: 8),
            Text('演示路由总数: ${DemoRouter.getAllDemoRoutes().length}'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                _showAllRoutes(context);
              },
              child: const Text('查看所有演示路由'),
            ),
          ],
        ),
      ),
    );
  }

  /// 显示所有路由的对话框
  void _showAllRoutes(BuildContext context) {
    final routes = DemoRouter.getAllDemoRoutes();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('所有演示路由'),
        content: SizedBox(
          width: double.maxFinite,
          height: 400,
          child: ListView.builder(
            itemCount: routes.length,
            itemBuilder: (context, index) {
              final route = routes[index];
              return ListTile(
                title: Text(route),
                subtitle: Text('路由 ${index + 1}'),
                onTap: () {
                  Navigator.of(context).pop();
                  context.go(route);
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }
}

/// 路由项数据类
class _RouteItem {
  final String title;
  final String path;
  final IconData icon;

  const _RouteItem(this.title, this.path, this.icon);
}
