import 'app_logger.dart';

/// 专门用于错误日志记录的工具类
/// 提供更详细的错误信息和堆栈跟踪
class ErrorLogger {
  /// 记录详细的错误信息
  /// [context] - 错误发生的上下文
  /// [error] - 错误对象
  /// [stackTrace] - 堆栈跟踪
  /// [additionalInfo] - 额外信息
  static void logError({
    required String context,
    required dynamic error,
    StackTrace? stackTrace,
    Map<String, dynamic>? additionalInfo,
  }) {
    final StringBuffer errorMessage = StringBuffer();
    
    // 基本错误信息
    errorMessage.writeln('🔥 错误发生在: $context');
    errorMessage.writeln('📋 错误类型: ${error.runtimeType}');
    errorMessage.writeln('💬 错误信息: $error');
    
    // 额外信息
    if (additionalInfo != null && additionalInfo.isNotEmpty) {
      errorMessage.writeln('📝 额外信息:');
      additionalInfo.forEach((key, value) {
        errorMessage.writeln('   $key: $value');
      });
    }
    
    // 使用 Log.e 记录错误，包含堆栈跟踪
    Log.e(errorMessage.toString(), error, stackTrace);
  }
  
  /// 记录缓存相关错误
  static void logCacheError({
    required String operation,
    required dynamic error,
    StackTrace? stackTrace,
    String? cacheKey,
    String? url,
    String? strategy,
  }) {
    logError(
      context: '缓存操作: $operation',
      error: error,
      stackTrace: stackTrace,
      additionalInfo: {
        if (cacheKey != null) 'Cache Key': cacheKey,
        if (url != null) 'URL': url,
        if (strategy != null) 'Strategy': strategy,
      },
    );
  }
  
  /// 记录网络相关错误
  static void logNetworkError({
    required String operation,
    required dynamic error,
    StackTrace? stackTrace,
    String? url,
    String? method,
    int? statusCode,
  }) {
    logError(
      context: '网络操作: $operation',
      error: error,
      stackTrace: stackTrace,
      additionalInfo: {
        if (url != null) 'URL': url,
        if (method != null) 'Method': method,
        if (statusCode != null) 'Status Code': statusCode,
      },
    );
  }
  
  /// 记录序列化相关错误
  static void logSerializationError({
    required String operation,
    required dynamic error,
    StackTrace? stackTrace,
    String? dataType,
    String? expectedType,
  }) {
    logError(
      context: '序列化操作: $operation',
      error: error,
      stackTrace: stackTrace,
      additionalInfo: {
        if (dataType != null) 'Data Type': dataType,
        if (expectedType != null) 'Expected Type': expectedType,
      },
    );
  }
  
  /// 记录类型转换错误
  static void logTypeConversionError({
    required String operation,
    required dynamic error,
    StackTrace? stackTrace,
    String? fromType,
    String? toType,
    dynamic value,
  }) {
    logError(
      context: '类型转换: $operation',
      error: error,
      stackTrace: stackTrace,
      additionalInfo: {
        if (fromType != null) 'From Type': fromType,
        if (toType != null) 'To Type': toType,
        if (value != null) 'Value': value.toString(),
      },
    );
  }
}
