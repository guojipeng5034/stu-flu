import 'package:cptop/features/examples/ui/pages/example_list_screen.dart';
import 'package:cptop/features/examples/ui/pages/example_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'router_test_page.dart';

/// 演示路由管理器
/// 
/// 专门处理所有演示页面的路由配置，
/// 包括示例页面、路由测试等功能。
class DemoRouter {
  /// 演示路由前缀
  static const String prefix = '/examples';
  
  /// 路由测试页面路径
  static const String routerTest = '/router-test';
  
  /// 演示列表页面路径
  static const String demoList = '/demo-list';

  /// 获取所有演示相关的路由配置
  static List<RouteBase> getRoutes() {
    return [
      // 演示列表路由
      GoRoute(
        path: demoList,
        name: 'demoList',
        builder: (context, state) => const ExampleListScreen(),
        routes: [
          // 演示列表子路由 - 用于支持 /demo-list/logger 格式的URL
          GoRoute(
            path: ':demoName',
            builder: (context, state) {
              final demoName = state.pathParameters['demoName'] ?? '';
              final fullPath = '$prefix/$demoName';

              // 通过 ExampleRoutes 查找对应路由的构建器
              final builder = ExampleRoutes.routes[fullPath];
              if (builder != null) {
                return builder(context);
              }

              // 找不到匹配的路由，返回错误页面
              return _buildNotFoundPage('未找到演示组件: $demoName');
            },
          ),
        ],
      ),

      // 路由测试页面
      GoRoute(
        path: routerTest,
        name: 'routerTest',
        builder: (context, state) => const RouterTestPage(),
      ),

      // 演示子路由处理 - 通配路由
      GoRoute(
        path: '$prefix/:subPath',
        builder: (context, state) {
          final subPath = state.pathParameters['subPath'] ?? '';
          final fullPath = '$prefix/$subPath';

          // 通过 ExampleRoutes 查找对应路由的构建器
          final builder = ExampleRoutes.routes[fullPath];
          if (builder != null) {
            return builder(context);
          }

          // 找不到匹配的路由，返回错误页面
          return _buildNotFoundPage('未找到路由: $fullPath');
        },
      ),
    ];
  }

  /// 构建未找到页面的通用方法
  static Widget _buildNotFoundPage(String message) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('页面未找到'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  // 返回演示列表页面
                  GoRouter.of(context).go(demoList);
                },
                child: const Text('返回演示列表'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 获取所有演示路由的路径列表（用于调试和测试）
  static List<String> getAllDemoRoutes() {
    return ExampleRoutes.routes.keys.toList();
  }

  /// 检查路径是否为演示路由
  static bool isDemoRoute(String path) {
    return path.startsWith(prefix) || 
           path == routerTest || 
           path == demoList;
  }
}
