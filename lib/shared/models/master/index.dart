/// Master配置模块统一导出
///
/// 包含站点配置、时区管理、电话区号管理、取消原因、课程时长、性别、积分、评分、请求类别等功能
/// 对应Android项目中的master包功能
library;

// 站点配置模块
export 'site_config/site_config.dart';
export 'site_config/site_config_extensions.dart';

// 时区模块
export 'timezone/timezone.dart';
export 'timezone/timezone_extensions.dart';

// 电话区号模块
export 'telephone_code/telephone_code.dart';
export 'telephone_code/telephone_code_extensions.dart';

// 取消原因模块
export 'cancel_reason/cancel_reason.dart';
export 'cancel_reason/cancel_reason_extensions.dart';

// 课程时长模块
export 'lesson_time/lesson_time.dart';
export 'lesson_time/lesson_time_extensions.dart';

// 性别模块
export 'gender/gender.dart';
export 'gender/gender_extensions.dart';

// 积分模块
export 'points/points.dart';
export 'points/points_extensions.dart';

// 评分模块
export 'rating/rating.dart';
export 'rating/rating_extensions.dart';

// 请求类别模块
export 'request_category/request_category.dart';
export 'request_category/request_category_extensions.dart';

// 服务类
export 'master_service.dart';

// 工具类
export 'utils/master_translations.dart';
