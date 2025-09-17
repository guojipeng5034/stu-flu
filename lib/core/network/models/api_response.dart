import 'package:cptop/features/auth/data/models/stu_auth_resp_vo.dart';
import 'dart:convert';

import '../../logger/app_logger.dart';

/// API响应状态枚举
enum ApiStatus {
  /// 成功状态
  success,

  /// 错误状态
  error,

  /// 加载中状态
  loading,

  /// 网络错误状态
  networkError,

  /// 未授权状态（401）
  unauthorized,

  /// 资源未找到状态（404）
  notFound,

  /// 服务器错误状态（5xx）
  serverError,

  /// 请求超时状态
  timeout,

  /// 请求取消状态
  cancelled,
}

/// 将ApiStatus转换为字符串
String apiStatusToString(ApiStatus status) {
  switch (status) {
    case ApiStatus.success:
      return 'success';
    case ApiStatus.error:
      return 'error';
    case ApiStatus.loading:
      return 'loading';
    case ApiStatus.networkError:
      return 'networkError';
    case ApiStatus.unauthorized:
      return 'unauthorized';
    case ApiStatus.notFound:
      return 'notFound';
    case ApiStatus.serverError:
      return 'serverError';
    case ApiStatus.timeout:
      return 'timeout';
    case ApiStatus.cancelled:
      return 'cancelled';
  }
}

/// 通用API响应模型
class ApiResponse<T> {
  final ApiStatus status;
  final T? data;
  final String? message;
  final int? code;
  final Map<String, dynamic>? extra;

  ApiResponse({
    required this.status,
    this.data,
    this.message,
    this.code,
    this.extra,
  });

  /// 从JSON创建响应
  factory ApiResponse.fromJson(Map<String, dynamic> json,
      [T Function(dynamic json)? fromJson]) {
    // 1. 标准化响应格式
    final standardJson = _standardizeResponse(json);

    // 2. 确定响应状态
    final status = _determineStatus(standardJson);

    // 3. 解析数据
    final data = _parseData<T>(standardJson['data'], fromJson);

    return ApiResponse<T>(
      status: status,
      data: data,
      message: (standardJson['message'] ?? standardJson['msg']) as String?,
      code: standardJson['code'] as int?,
      extra: standardJson['extra'] as Map<String, dynamic>?,
    );
  }

  /// 标准化响应格式
  static Map<String, dynamic> _standardizeResponse(Map<String, dynamic> json) {
    // 处理登录响应
    if (json['access_token'] != null && json['data'] == null) {
      return _processLoginResponse(json);
    }
    return json;
  }

  /// 处理登录响应
  static Map<String, dynamic> _processLoginResponse(Map<String, dynamic> json) {
    final userInfo = json['user_info'] as Map<String, dynamic>? ?? {};
    final info = userInfo['info'] as Map<String, dynamic>? ?? {};

    return {
      'data': {
        'access_token': json['access_token'],
        'refresh_token': json['refresh_token'],
        'expires_in': json['expires_in'],
        'token_type': json['token_type'],
        'username': json['username'],
        'user_id': json['user_id'],
        'user_info': {
          'username': userInfo['username'],
          'nickname': info['nickname'],
          'avatar': info['avatar'],
          'userType': userInfo['userType'],
          'deptId': info['deptId'],
          'deptIds': info['deptIds'],
        }
      },
      'success': true,
      'code': 200,
      'message': json['message'] ?? 'Login successful',
    };
  }

  /// 确定响应状态
  static ApiStatus _determineStatus(Map<String, dynamic> json) {
    if (json['success'] == true || json['is_success'] == 1) {
      return ApiStatus.success;
    }

    final code = json['code'] as int?;
    if (code == null) return ApiStatus.error;

    switch (code) {
      case 401:
        return ApiStatus.unauthorized;
      case 404:
        return ApiStatus.notFound;
      case >= 500:
        return ApiStatus.serverError;
      default:
        return ApiStatus.error;
    }
  }

  /// 将对象转换为JSON字符串
  static String _toJson(dynamic object) {
    if (object is String) {
      return object;
    }
    if (object is Map) {
      return jsonEncode(object);
    }
    try {
      // 尝试调用对象的 toJson 方法
      if (object.toJson is Function) {
        return object.toJson();
      }
    } catch (_) {}
    return jsonEncode(object);
  }

  /// 解析数据
  static T? _parseData<T>(dynamic rawData, T Function(dynamic)? fromJson) {
    if (rawData == null) return null;

    try {
      if (fromJson != null) {
        if (rawData is Map) {
          return fromJson(jsonEncode(rawData));
        }
        return fromJson(rawData);
      }
      return rawData as T?;
    } catch (e) {
      Log.e('Error parsing data: $e', null, StackTrace.current);
      return null;
    }
  }

  /// 将响应转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'status': apiStatusToString(status),
      'message': message,
      'code': code,
      'data': _serializeData(data),
      if (extra != null) 'extra': extra,
    };
  }

  /// 序列化数据
  static dynamic _serializeData(dynamic data) {
    if (data == null) return null;

    try {
      if (data is Map) return data;
      if (data is List) return data;
      if (data is String || data is num || data is bool) return data;

      // 尝试调用 toJson 方法
      if (data.toJson is Function) {
        return data.toJson();
      }

      return data.toString();
    } catch (e) {
      Log.e('Error serializing data: $e', null, StackTrace.current);
      return null;
    }
  }

  /// 创建成功响应
  factory ApiResponse.success(T data,
      {String? message, int? code, Map<String, dynamic>? extra}) {
    return ApiResponse(
      status: ApiStatus.success,
      data: data,
      message: message,
      code: code ?? 200,
      extra: extra,
    );
  }

  /// 创建错误响应
  factory ApiResponse.error(String message,
      {int? code, Map<String, dynamic>? extra}) {
    return ApiResponse(
      status: ApiStatus.error,
      message: message,
      code: code ?? 500,
      extra: extra,
    );
  }

  /// 创建加载中响应
  factory ApiResponse.loading({Map<String, dynamic>? extra}) {
    return ApiResponse(
      status: ApiStatus.loading,
      extra: extra,
    );
  }

  /// 创建网络错误响应
  factory ApiResponse.networkError(String message,
      {int? code, Map<String, dynamic>? extra}) {
    return ApiResponse(
      status: ApiStatus.networkError,
      message: message,
      code: code ?? -1,
      extra: extra,
    );
  }

  /// 创建未授权响应
  factory ApiResponse.unauthorized(
      {String message = '未授权，请登录', Map<String, dynamic>? extra}) {
    return ApiResponse(
      status: ApiStatus.unauthorized,
      message: message,
      code: 401,
      extra: extra,
    );
  }

  /// 创建资源未找到响应
  factory ApiResponse.notFound(
      {String message = '请求的资源不存在', Map<String, dynamic>? extra}) {
    return ApiResponse(
      status: ApiStatus.notFound,
      message: message,
      code: 404,
      extra: extra,
    );
  }

  /// 创建服务器错误响应
  factory ApiResponse.serverError(String message,
      {int code = 500, Map<String, dynamic>? extra}) {
    return ApiResponse(
      status: ApiStatus.serverError,
      message: message,
      code: code,
      extra: extra,
    );
  }

  /// 创建请求超时响应
  factory ApiResponse.timeout(String message, {Map<String, dynamic>? extra}) {
    return ApiResponse(
      status: ApiStatus.timeout,
      message: message,
      code: -2,
      extra: extra,
    );
  }

  /// 创建请求取消响应
  factory ApiResponse.cancelled(String message, {Map<String, dynamic>? extra}) {
    return ApiResponse(
      status: ApiStatus.cancelled,
      message: message,
      code: -3,
      extra: extra,
    );
  }

  /// 判断响应是否成功
  bool get isSuccess => status == ApiStatus.success;

  /// 判断响应是否错误
  bool get isError => status != ApiStatus.success;

  /// 判断响应是否加载中
  bool get isLoading => status == ApiStatus.loading;

  /// 复制并创建新的响应对象
  ApiResponse<T> copyWith({
    ApiStatus? status,
    T? data,
    String? message,
    int? code,
    Map<String, dynamic>? extra,
  }) {
    return ApiResponse<T>(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
      code: code ?? this.code,
      extra: extra ?? this.extra,
    );
  }
}
