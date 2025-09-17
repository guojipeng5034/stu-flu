import 'package:cptop/core/auth/auth_state.dart';
import 'package:cptop/features/auth/ui/pages/bind_page.dart';
import 'package:cptop/features/auth/ui/pages/complete_profile_page.dart';
import 'package:cptop/features/auth/ui/pages/forgot_password_page.dart';
// 核心页面导入
import 'package:cptop/features/auth/ui/pages/login_page.dart';
import 'package:cptop/features/auth/ui/pages/user_profile_page.dart';
// 状态管理和模型
import 'package:cptop/features/auth/ui/providers/auth_provider.dart'
    as auth_provider;
import 'package:cptop/features/home/ui/pages/home_page.dart';
import 'package:cptop/features/site/ui/pages/site_config_screen.dart';
import 'package:cptop/features/student/ui/pages/student_info_screen.dart';
import 'package:cptop/shared/pages/about_page.dart';
import 'package:cptop/shared/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// 演示和测试路由（统一导入）
import 'demo/index.dart';
// 路由相关
import 'route_guards.dart';
import 'route_names.dart';

/// 路由提供者
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(auth_provider.authProvider);

  return GoRouter(
    initialLocation: RouteNames.splash,
    debugLogDiagnostics: true,
    redirect: (context, state) => routeGuard(
        state,
        AuthState(
          isAuthenticated: authState.isAuthenticated,
          token: authState.token,
          userId: authState.userId,
        )),
    routes: [
      // 启动页路由
      GoRoute(
        path: RouteNames.splash,
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),

      // 主页路由
      GoRoute(
        path: RouteNames.home,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),

      // 登录路由
      GoRoute(
        path: RouteNames.login,
        name: 'login',
        builder: (context, state) {
          // 获取重定向参数
          final redirectTo = state.uri.queryParameters['redirectTo'];
          return LoginPage(redirectTo: redirectTo);
        },
      ),

      // 忘记密码路由
      GoRoute(
        path: RouteNames.forgotPassword,
        name: 'forgotPassword',
        builder: (context, state) => const ForgotPasswordPage(),
      ),

      // 用户资料路由
      GoRoute(
        path: RouteNames.userProfile,
        name: 'profile',
        builder: (context, state) => const UserProfilePage(),
      ),

      // 关于页面路由
      GoRoute(
        path: RouteNames.about,
        name: 'about',
        builder: (context, state) => const AboutPage(),
      ),

      // 站点配置页面路由
      GoRoute(
        path: RouteNames.siteConfig,
        name: 'siteConfig',
        builder: (context, state) => const SiteConfigScreen(),
      ),

      // 学生信息页面路由
      GoRoute(
        path: RouteNames.studentInfo,
        name: 'studentInfo',
        builder: (context, state) => const StudentInfoScreen(),
      ),

      // 完善信息页面路由
      GoRoute(
        path: RouteNames.completeProfile,
        name: 'completeProfile',
        builder: (context, state) => CompleteProfilePage(),
      ),

      // ================= 演示和测试路由 =================
      // 使用 DemoRouter 统一管理所有演示相关的路由
      ...DemoRouter.getRoutes(),
      GoRoute(
        path: '/bind',
        builder: (context, state) {
          final bindType = state.uri.queryParameters['bindType'] ?? 'phone';
          return BindPage(bindType: bindType);
        },
      ),
    ],

    // 错误页面
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('未找到路由: ${state.uri.path}'),
      ),
    ),
  );
});
