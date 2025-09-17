import 'package:cptop/core/di/di.dart';
import 'package:cptop/features/auth/data/services/profile_service.dart';
import 'package:cptop/shared/router/app_router.dart';
import 'package:cptop/shared/router/route_names.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 导航服务，处理登录后的跳转逻辑
class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  factory NavigationService() => _instance;
  NavigationService._internal();

  /// 处理登录成功后的导航逻辑
  static Future<void> handlePostLoginNavigation(WidgetRef ref) async {
    try {
      print('NavigationService: 开始处理登录后导航');

      // 获取用户资料
      final dio = await ref.read(DI.dioProvider.future);
      final profileService = ProfileService(dio);
      final profileResp = await profileService.getProfile();
      final nickname = profileResp['data']?['nickname'];

      print(
          'NavigationService: nickname=$nickname, isEmpty=${nickname?.isEmpty}');

      // 获取 GoRouter 实例
      final router = ref.read(routerProvider);

      if (nickname == null || nickname.isEmpty) {
        print('NavigationService: 跳转到完善信息页面');
        router.go(RouteNames.completeProfile);
      } else {
        print('NavigationService: 跳转到首页');
        router.go(RouteNames.home);
      }
    } catch (e) {
      print('NavigationService: 导航过程中发生错误: $e');
      // 发生错误时跳转到首页
      try {
        final router = ref.read(routerProvider);
        router.go(RouteNames.home);
      } catch (routerError) {
        print('NavigationService: 无法获取路由器: $routerError');
      }
    }
  }
}
