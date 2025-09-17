import 'package:cptop/core/logger/index.dart';
// import 'package:dio/dio.dart'; // Dio import removed as it's no longer directly used

import '../../../../core/network/models/api_response.dart';
import '../../../../shared/models/master/index.dart';
import '../api/site_api.dart';

/// 站点配置服务类
class SiteService {
  final SiteApi _siteApi;

  /// 构造函数
  SiteService(this._siteApi); // Constructor updated to accept SiteApi directly

  /// 获取站点配置
  Future<ApiResponse<List<SiteConfig>>> getSiteConfig() async {
    try {
      // 尝试获取站点配置
      return await _siteApi.getSiteConfig();
    } catch (e) {
      Log.e("网络请求错误", e);
      // 处理其他类型的异常
      return ApiResponse.error('获取站点配置失败000000000000');
    }
  }

}
