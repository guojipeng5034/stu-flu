/// 课程API缓存配置
///
/// 这个文件定义了课程相关API的缓存配置，
/// 使用函数返回配置，确保代码生成器正常工作
class LessonCacheConfigs {
  /// 私有构造函数，防止实例化
  LessonCacheConfigs._();

  /// 📋 课程列表缓存配置 - 2小时缓存，先加载缓存
  /// 适用于：课程列表、分页数据等相对稳定的列表数据
  static Map<String, dynamic> get lessonList => const {
    "cache_config": {
      "maxAge": 7200,              // 2小时 = 2 * 60 * 60 秒
      "strategy": "first_cache",   // 先加载缓存策略
      "cacheType": "disk",         // 磁盘缓存
      "hitCacheOnError": true,     // 网络错误时使用缓存
      "priority": "high",          // 高优先级
    }
  };

  /// 📄 课程详情缓存配置 - 30分钟缓存，先加载缓存
  /// 适用于：课程详情、商品详情等详细信息
  static const Map<String, dynamic> lessonDetail = {
    "cache_config": {
      "maxAge": 1800,              // 30分钟 = 30 * 60 秒
      "strategy": "first_cache",   // 先加载缓存策略
      "cacheType": "disk",         // 磁盘缓存
      "hitCacheOnError": true,     // 网络错误时使用缓存
      "priority": "high",          // 高优先级
    }
  };

  /// 👤 用户数据缓存配置 - 15分钟缓存，先请求网络
  /// 适用于：用户信息、学习进度等需要相对实时的数据
  static const Map<String, dynamic> userData = {
    "cache_config": {
      "maxAge": 900,               // 15分钟 = 15 * 60 秒
      "strategy": "first_remote",  // 先请求网络策略
      "cacheType": "memory",       // 内存缓存
      "hitCacheOnError": true,     // 网络错误时使用缓存
      "priority": "normal",        // 普通优先级
    }
  };

  /// ⚡ 实时数据缓存配置 - 5分钟缓存，先请求网络
  /// 适用于：实时状态、在线状态等需要高实时性的数据
  static const Map<String, dynamic> realtimeData = {
    "cache_config": {
      "maxAge": 300,               // 5分钟 = 5 * 60 秒
      "strategy": "first_remote",  // 先请求网络策略
      "cacheType": "memory",       // 内存缓存
      "hitCacheOnError": false,    // 网络错误时不使用缓存
      "priority": "high",          // 高优先级
    }
  };

  /// ⚙️ 配置数据缓存配置 - 24小时缓存，先加载缓存
  /// 适用于：系统配置、字典数据、分类信息等相对固定的数据
  static const Map<String, dynamic> configData = {
    "cache_config": {
      "maxAge": 86400,             // 24小时 = 24 * 60 * 60 秒
      "strategy": "first_cache",   // 先加载缓存策略
      "cacheType": "disk",         // 磁盘缓存
      "hitCacheOnError": true,     // 网络错误时使用缓存
      "priority": "normal",        // 普通优先级
    }
  };

  /// 🔄 双重缓存配置 - 先返回缓存，同时请求网络更新
  /// 适用于：热门数据、推荐数据等需要快速响应但也要保持更新的数据
  static const Map<String, dynamic> cacheRemote = {
    "cache_config": {
      "maxAge": 3600,              // 1小时 = 60 * 60 秒
      "strategy": "cache_remote",  // 双重缓存策略
      "cacheType": "both",         // 内存+磁盘双重缓存
      "hitCacheOnError": true,     // 网络错误时使用缓存
      "priority": "normal",        // 普通优先级
    }
  };

  /// 🔄 智能双重缓存配置 - 先返回缓存，网络数据不同时才更新
  /// 适用于：推荐列表等数据变化不频繁但需要及时更新的场景
  static const Map<String, dynamic> cacheRemoteDistinct = {
    "cache_config": {
      "maxAge": 3600,                    // 1小时 = 60 * 60 秒
      "strategy": "cache_remote_distinct", // 智能双重缓存策略
      "cacheType": "both",               // 内存+磁盘双重缓存
      "hitCacheOnError": true,           // 网络错误时使用缓存
      "priority": "normal",              // 普通优先级
    }
  };

  /// 🔒 仅缓存配置 - 只读取缓存，不请求网络
  /// 适用于：离线模式、已下载的内容等
  static const Map<String, dynamic> onlyCache = {
    "cache_config": {
      "strategy": "only_cache",    // 仅缓存策略
      "cacheType": "disk",         // 磁盘缓存
      "hitCacheOnError": false,    // 不适用网络错误场景
      "priority": "low",           // 低优先级
    }
  };

  /// 🌐 仅网络配置 - 只请求网络，但会缓存结果
  /// 适用于：强制刷新、实时数据等
  static const Map<String, dynamic> onlyRemote = {
    "cache_config": {
      "strategy": "only_remote",   // 仅网络策略
      "cacheType": "disk",         // 磁盘缓存（缓存结果）
      "hitCacheOnError": false,    // 不使用缓存
      "priority": "high",          // 高优先级
    }
  };

  /// 🚫 无缓存配置 - 不使用任何缓存
  /// 适用于：提交操作、敏感数据等
  static const Map<String, dynamic> noCache = {
    "cache_config": {
      "strategy": "no_cache",      // 无缓存策略
      "hitCacheOnError": false,    // 不使用缓存
      "priority": "normal",        // 普通优先级
    }
  };
}
