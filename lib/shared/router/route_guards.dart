import 'package:cptop/core/auth/auth_state.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';

/// 需要登录才能访问的路由列表
final List<String> _protectedRoutes = [
  RouteNames.home,
  RouteNames.userProfile,
];

/// 不需要登录就能访问的路由列表
final List<String> _publicRoutes = [
  RouteNames.login,
  RouteNames.forgotPassword,
  RouteNames.bind,
  RouteNames.register,
  RouteNames.splash,
  RouteNames.about,
  RouteNames.demoList,
  RouteNames.completeProfile
];

/// 不需要登录就能访问的路由前缀
final List<String> _publicPathPrefixes = [
  RouteNames.publicPrefix,
  RouteNames.examplesPrefix, // 使用新的演示路由前缀
  RouteNames.siteConfig,
];

/// 路由守卫，根据登录状态重定向路由
String? routeGuard(GoRouterState state, AuthState authState) {
  final path = state.uri.path;

  // 判断是否是受保护路由
  final needsAuth = _needsAuthentication(path);

  // 如果不需要认证，直接允许访问
  if (!needsAuth) {
    return null;
  }

  // 如果用户未登录，重定向到登录页
  if (!authState.isAuthenticated) {
    return '/login?redirectTo=${Uri.encodeComponent(path)}';
  }

  // 已登录，允许访问
  return null;
}

/// 判断路由是否需要登录才能访问
bool _needsAuthentication(String path) {
  // 1. 检查是否在公开路由列表中
  if (_publicRoutes.contains(path)) {
    return false;
  }

  // 2. 检查是否在受保护路由列表中
  if (_protectedRoutes.contains(path)) {
    return true;
  }

  // 3. 检查是否以公开路径前缀开头
  for (final prefix in _publicPathPrefixes) {
    if (path.startsWith(prefix)) {
      return false;
    }
  }

  // 4. 默认需要认证
  return true;
}
