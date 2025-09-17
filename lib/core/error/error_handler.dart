/// 全局错误处理器
///
/// 提供统一的错误处理机制
library;

import 'package:cptop/core/logger/index.dart';
import 'package:flutter/foundation.dart';

import 'exceptions.dart';
import 'failure.dart';

class ErrorHandler {
  ErrorHandler._();

  /// 处理异常并转换为 Failure
  static Failure handleException(Exception exception) {
    if (kDebugMode) {
      Log.e('处理异常: $exception');
    }

    if (exception is ServerException) {
      return ServerFailure(exception.message ?? '服务器错误');
    } else if (exception is NetworkException) {
      return NetworkFailure(exception.message ?? '网络连接失败');
    } else if (exception is CacheException) {
      return CacheFailure(exception.message ?? '缓存错误');
    } else {
      return UnknownFailure('未知错误: ${exception.toString()}');
    }
  }

  /// 处理错误并转换为 Failure
  static Failure handleError(Error error) {
    if (kDebugMode) {
      Log.e('处理错误: $error');
      Log.e('堆栈跟踪: ${error.stackTrace}');
    }

    return UnknownFailure('系统错误: ${error.toString()}');
  }

  /// 通用错误处理方法
  static Failure handleAnyError(dynamic error) {
    if (error is Exception) {
      return handleException(error);
    } else if (error is Error) {
      return handleError(error);
    } else {
      if (kDebugMode) {
        Log.e('处理未知类型错误: $error');
      }
      return UnknownFailure('未知错误: ${error.toString()}');
    }
  }

  /// 记录错误日志
  static void logError(dynamic error, [StackTrace? stackTrace]) {
    if (kDebugMode) {
      Log.e('错误日志: $error');
      if (stackTrace != null) {
        Log.e('堆栈跟踪: $stackTrace');
      }
    }
  }

  /// 记录警告日志
  static void logWarning(String message) {
    if (kDebugMode) {
      Log.w('警告: $message');
    }
  }

  /// 记录信息日志
  static void logInfo(String message) {
    if (kDebugMode) {
      Log.i('信息: $message');
    }
  }
}
