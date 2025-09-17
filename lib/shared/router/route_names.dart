/// 定义应用中所有路由的名称常量
class RouteNames {
  // 主要路由
  static const String splash = '/splash';
  static const String home = '/home';
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String completeProfile = '/complete_profile';
  static const String bind = '/bind';

  static const String register = '/register';
  static const String userProfile = '/profile';
  static const String siteConfig = '/site-config';
  static const String studentInfo = '/student-info';

  // 公开路由
  static const String about = '/about';

  // 演示和测试路由（由 DemoRouter 管理）
  static const String demoList = '/demo-list';
  static const String routerTest = '/router-test';

  // 路径前缀
  static const String publicPrefix = '/public';
  static const String examplesPrefix = '/examples'; // 新的演示路由前缀
  static const String apiPrefix = '/api';

  // 已废弃的前缀（保留用于兼容性）
  @Deprecated('使用 examplesPrefix 替代')
  static const String demoPrefix = '/demo';
}
