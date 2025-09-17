import 'package:dio/dio.dart';
import '../../../logger/app_logger.dart';
import 'base_interceptor.dart';

/// 响应额外信息拦截器
/// 将 Dio Response 的 extra 信息注入到响应数据中，以便 Retrofit 可以访问
///
/// 功能：
/// - 注入响应额外信息
/// - 包装非 Map 类型响应
/// - 提供缓存信息访问
/// - 支持自定义数据结构
class ResponseExtraInterceptor extends BaseInterceptor {

  @override
  String get name => 'ResponseExtraInterceptor';

  @override
  int get priority => 80;

  @override
  String get description => '注入响应额外信息到数据中';

  @override
  void handleResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      // 如果响应数据是 Map，将 extra 信息注入其中
      if (response.data is Map<String, dynamic>) {
        final responseData = response.data as Map<String, dynamic>;
        
        // 注入 extra 信息
        responseData['_extra'] = response.extra;
        
        // 注入缓存相关信息
        if (response.extra.containsKey('dio_cache_interceptor_response')) {
          responseData['_cache_info'] = response.extra['dio_cache_interceptor_response'];
        }
        
        Log.v('📦 [响应额外] 已注入 extra 信息到响应数据 ${ response.extra}');
      } else {
        // 对于非 Map 类型的响应，包装成 Map
        response.data = {
          'data': response.data,
          '_extra': response.extra,
        };
        
        Log.v('📦 [响应额外] 已包装非 Map 响应并注入 extra 信息');
      }
      
      handler.next(response);
    } catch (e, stackTrace) {
      Log.e('❌ [响应额外] 处理响应额外信息时发生错误: $e', null, stackTrace);
      // 发生错误时，直接传递原响应
      handler.next(response);
    }
  }
}
