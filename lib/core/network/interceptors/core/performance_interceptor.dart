import 'package:dio/dio.dart';
import 'package:synchronized/synchronized.dart';

import '../../../logger/app_logger.dart';
import 'base_interceptor.dart';

/// 性能监控拦截器
///
/// 专门负责处理性能监控：
/// - 记录请求时间
/// - 统计响应时间
/// - 收集性能指标
class PerformanceInterceptor extends BaseInterceptor
    implements PerformanceAwareInterceptor {
  // 使用实例变量代替静态变量，避免并发安全问题
  int _totalRequests = 0;
  int _successRequests = 0;
  int _failedRequests = 0;
  double _totalResponseTime = 0;
  int _responseCount = 0;

  // 使用锁确保线程安全
  final Lock _lock = Lock();

  // 记录响应时间的列表（保留最近的100个）
  final List<double> _responseTimes = [];
  final int _maxResponseTimeHistory = 100;

  @override
  String get name => 'PerformanceInterceptor';

  @override
  int get priority => 30; // 中等优先级

  @override
  String get description => '监控网络请求性能';

  @override
  void handleRequest(
      RequestOptions options, RequestInterceptorHandler handler) {
    try {
      // 记录请求开始时间
      options.extra['_start_time'] = DateTime.now().millisecondsSinceEpoch;

      // 增加请求计数
      _lock.synchronized(() {
        _totalRequests++;
      });

      handler.next(options);
    } catch (e) {
      Log.e('[$name] 记录请求开始时间失败: $e');
      handler.next(options);
    }
  }

  @override
  void handleResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      // 计算响应时间
      final startTime = response.requestOptions.extra['_start_time'] as int?;
      if (startTime != null) {
        final endTime = DateTime.now().millisecondsSinceEpoch;
        final duration = endTime - startTime;

        // 保存响应时间
        response.extra['response_time_ms'] = duration;

        // 更新统计数据（线程安全）
        _lock.synchronized(() {
          _successRequests++;
          _recordResponseTime(duration.toDouble());
        });
      }

      handler.next(response);
    } catch (e) {
      Log.e('[$name] 记录响应时间失败: $e');
      handler.next(response);
    }
  }

  @override
  void handleError(DioException err, ErrorInterceptorHandler handler) {
    try {
      // 增加失败请求计数
      _lock.synchronized(() {
        _failedRequests++;
      });

      handler.next(err);
    } catch (e) {
      Log.e('[$name] 记录错误失败: $e');
      handler.next(err);
    }
  }

  /// 记录响应时间
  void _recordResponseTime(double timeMs) {
    _responseCount++;
    _totalResponseTime += timeMs;

    // 保留最近的响应时间
    _responseTimes.add(timeMs);
    if (_responseTimes.length > _maxResponseTimeHistory) {
      _responseTimes.removeAt(0);
    }
  }

  @override
  void recordMetrics(String operation, Duration duration) {
    _lock.synchronized(() {
      if (operation == 'response') {
        _recordResponseTime(duration.inMilliseconds.toDouble());
      }
    });
  }

  @override
  Map<String, dynamic> getPerformanceStats() {
    // 计算统计数据
    double avgResponseTime = 0;
    double p95ResponseTime = 0;
    double p99ResponseTime = 0;

    if (_responseCount > 0) {
      avgResponseTime = _totalResponseTime / _responseCount;

      if (_responseTimes.isNotEmpty) {
        // 计算百分位数
        final sortedTimes = List<double>.from(_responseTimes)..sort();
        final p95Index = ((sortedTimes.length - 1) * 0.95).round();
        final p99Index = ((sortedTimes.length - 1) * 0.99).round();

        p95ResponseTime = sortedTimes[p95Index];
        p99ResponseTime = sortedTimes[p99Index];
      }
    }

    return {
      'total_requests': _totalRequests,
      'success_requests': _successRequests,
      'failed_requests': _failedRequests,
      'success_rate': _totalRequests > 0
          ? (_successRequests / _totalRequests * 100).toStringAsFixed(1)
          : '0.0',
      'avg_response_time': avgResponseTime.toStringAsFixed(1),
      'p95_response_time': p95ResponseTime.toStringAsFixed(1),
      'p99_response_time': p99ResponseTime.toStringAsFixed(1),
    };
  }

  @override
  void resetPerformanceStats() {
    _lock.synchronized(() {
      _totalRequests = 0;
      _successRequests = 0;
      _failedRequests = 0;
      _totalResponseTime = 0;
      _responseCount = 0;
      _responseTimes.clear();
    });
  }
}
