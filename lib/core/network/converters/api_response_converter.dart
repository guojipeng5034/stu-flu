import '../models/api_response.dart';
import '../../logger/app_logger.dart';

/// 自定义的 ApiResponse 转换器
/// 用于将 Dio Response 的 extra 信息传递到 ApiResponse 中
class ApiResponseConverter<T> {
  final T Function(dynamic json)? fromJsonT;

  const ApiResponseConverter(this.fromJsonT);

  ApiResponse<T> convert(Map<String, dynamic> responseData) {
    try {
      // 获取 extra 信息（如果可用）
      Map<String, dynamic>? extraInfo = responseData['extra'] as Map<String, dynamic>?;

      // 创建 ApiResponse
      return ApiResponse.fromJson(
        responseData,
        fromJsonT,
      ).copyWith(extra: extraInfo);
      
    } catch (e) {
      Log.e('ApiResponseConverter 转换失败: $e');
      return ApiResponse.error('数据转换失败: $e');
    }
  }
}

/// 为不同类型创建转换器的工厂方法
class ApiResponseConverterFactory {
  /// 创建带有 fromJson 函数的转换器
  static ApiResponseConverter<T> create<T>(T Function(dynamic json)? fromJsonT) {
    return ApiResponseConverter<T>(fromJsonT);
  }
  
  /// 创建不需要转换的转换器（用于基本类型）
  static ApiResponseConverter<T> createSimple<T>() {
    return ApiResponseConverter<T>(null);
  }
}
