import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/models/api_response.dart';
import '../../../../shared/models/master/index.dart';

part 'site_api.g.dart';

/// 站点配置相关API服务
@RestApi()
abstract class SiteApi {
  /// 工厂构造函数
  factory SiteApi(Dio dio, {String? baseUrl}) = _SiteApi;

  /// 获取站点配置信息
  @GET("https://mock.apipost.net/mock/2a24920ca865001/k/api/app/1/site_config?apipost_id=231e1b")
  Future<ApiResponse<List<SiteConfig>>> getSiteConfig();
}
