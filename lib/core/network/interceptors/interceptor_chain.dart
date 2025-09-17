import 'package:dio/dio.dart';

import 'core/base_interceptor.dart';

/// 拦截器链
///
/// 负责管理拦截器的顺序和优先级
class InterceptorChain {
  final List<BaseInterceptor> _interceptors = [];

  /// 添加拦截器
  void addInterceptor(BaseInterceptor interceptor) {
    _interceptors.add(interceptor);
    _sortInterceptors();
  }

  /// 添加多个拦截器
  void addInterceptors(List<BaseInterceptor> interceptors) {
    _interceptors.addAll(interceptors);
    _sortInterceptors();
  }

  /// 移除拦截器
  bool removeInterceptor(BaseInterceptor interceptor) {
    return _interceptors.remove(interceptor);
  }

  /// 按类型移除拦截器
  void removeInterceptorByType<T extends BaseInterceptor>() {
    _interceptors.removeWhere((i) => i is T);
  }

  /// 获取所有拦截器
  List<Interceptor> getInterceptors() {
    return List<Interceptor>.from(_interceptors);
  }

  /// 获取特定类型的拦截器
  T? getInterceptorByType<T extends BaseInterceptor>() {
    return _interceptors.whereType<T>().firstOrNull;
  }

  /// 清空拦截器
  void clear() {
    _interceptors.clear();
  }

  /// 获取拦截器数量
  int get length => _interceptors.length;

  /// 按优先级排序拦截器
  void _sortInterceptors() {
    _interceptors.sort((a, b) => a.priority.compareTo(b.priority));
  }

  /// 获取拦截器信息
  List<Map<String, dynamic>> getInterceptorsInfo() {
    return _interceptors.map((i) => i.getInfo()).toList();
  }

  /// 检查是否包含特定类型的拦截器
  bool containsInterceptorOfType<T extends BaseInterceptor>() {
    return _interceptors.any((i) => i is T);
  }
}
