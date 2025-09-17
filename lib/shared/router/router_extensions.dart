import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// GoRouter 扩展方法
extension GoRouterExtensions on BuildContext {
  /// 获取 GoRouter 实例
  GoRouter get router => GoRouter.of(this);

  /// 导航到指定路由
  void goNamed(String name,
      {Map<String, String> params = const {},
      Map<String, dynamic> queryParams = const {}}) {
    router.goNamed(
      name,
      pathParameters: params,
      queryParameters: queryParams,
    );
  }

  /// 导航到指定路径
  void go(String path) {
    router.go(path);
  }

  /// 导航到指定路由并替换当前路由
  void replaceNamed(String name,
      {Map<String, String> params = const {},
      Map<String, dynamic> queryParams = const {}}) {
    router.replaceNamed(
      name,
      pathParameters: params,
      queryParameters: queryParams,
    );
  }

  /// 导航到指定路径并替换当前路由
  void replace(String path) {
    router.replace(path);
  }

  /// 返回上一页
  void pop<T>([T? result]) {
    router.pop(result);
  }

  /// 检查是否可以返回
  bool canPop() {
    return router.canPop();
  }
}
