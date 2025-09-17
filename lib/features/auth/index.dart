/// 认证模块统一导出
///
/// 提供认证相关的所有功能，包括API、服务、状态管理和UI组件
library;

// Data Layer - 数据层
export 'data/api/auth_api.dart';
export 'data/models/index.dart';
// Data Layer - 业务服务
export 'data/services/auth_service.dart';
export 'ui/pages/login_page.dart';
export 'ui/pages/user_profile_page.dart';
// UI Layer - 用户界面层
export 'ui/providers/auth_provider.dart';
