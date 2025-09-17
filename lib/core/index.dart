/// Core 基础设施层统一导出
///
/// 包含所有基础设施组件：网络、存储、日志、扩展方法等
/// 这些组件不包含业务逻辑，可以被任何层使用
library;

// 认证服务
export 'auth/index.dart';
// 依赖注入
export 'di/index.dart';
// 错误处理
export 'error/index.dart';
// 扩展方法
export 'extensions/index.dart';
// 本地化基础设施
export 'localization/index.dart';
// 日志系统
export 'logger/index.dart';
// 数据映射
export 'mapping/index.dart';
// 网络基础设施
export 'network/index.dart';
// 平台工具
export 'platform/index.dart';
// 存储基础设施
export 'storage/index.dart';
// 时间工具
export 'time/index.dart';
