import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// 应用日志工具类
/// 基于logger库封装，提供便捷的日志记录功能
class AppLogger {
  /// 单例实例
  static final AppLogger _instance = AppLogger._internal();

  /// Logger实例
  late Logger _logger;

  /// 是否启用日志
  bool _enabled = true;

  /// 日志级别
  Level _level = Level.verbose;

  // 日志配置参数
  int _methodCount = 2;
  int _errorMethodCount = 8;
  int _lineLength = 120;
  bool _colors = true;
  bool _printEmojis = true;
  bool _printTime = true;

  // 日志长度限制配置
  /// 默认最大日志长度（字符数）
  int _maxLogLength = 1000;

  /// 是否启用长度限制
  bool _enableLengthLimit = true;

  /// 截断时显示的后缀
  String _truncateSuffix = '... (truncated)';

  /// 构造函数私有化
  AppLogger._internal() {
    _initLogger();
  }

  /// 获取单例实例
  static AppLogger get instance => _instance;

  /// 初始化Logger
  void _initLogger() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: _methodCount,
        errorMethodCount: _errorMethodCount,
        lineLength: _lineLength,
        colors: _colors,
        printEmojis: _printEmojis,
        printTime: _printTime,
      ),
      level: _level,
      output: ConsoleOutput(),
    );
  }

  /// 配置日志工具
  /// [enabled] - 是否启用日志
  /// [level] - 日志级别
  /// [methodCount] - 显示的方法调用数量
  /// [lineLength] - 每行最大长度
  /// [colors] - 是否彩色输出
  /// [printEmojis] - 是否打印表情符号
  /// [printTime] - 是否打印时间
  /// [maxLogLength] - 最大日志长度（字符数），默认1000
  /// [enableLengthLimit] - 是否启用长度限制，默认true
  /// [truncateSuffix] - 截断时显示的后缀
  void configure({
    bool? enabled,
    Level? level,
    int methodCount = 2,
    int errorMethodCount = 8,
    int lineLength = 120,
    bool colors = true,
    bool printEmojis = true,
    bool printTime = true,
    int maxLogLength = 1000,
    bool enableLengthLimit = true,
    String truncateSuffix = '... (truncated)',
  }) {
    if (enabled != null) _enabled = enabled;
    if (level != null) _level = level;

    // 保存配置参数
    _methodCount = methodCount;
    _errorMethodCount = errorMethodCount;
    _lineLength = lineLength;
    _colors = colors;
    _printEmojis = printEmojis;
    _printTime = printTime;

    // 保存长度限制配置
    _maxLogLength = maxLogLength;
    _enableLengthLimit = enableLengthLimit;
    _truncateSuffix = truncateSuffix;

    // 重新初始化Logger
    _initLogger();
  }

  /// 设置日志级别
  set level(Level level) {
    _level = level;
    _initLogger();
  }

  /// 获取日志级别
  Level get level => _level;

  /// 启用日志
  void enable() {
    _enabled = true;
  }

  /// 禁用日志
  void disable() {
    _enabled = false;
  }

  /// 限制日志长度
  /// [message] - 原始消息
  /// [maxLength] - 最大长度，如果为null则使用默认配置
  /// [forceLimit] - 是否强制限制，忽略全局配置
  String _limitLogLength(String message, {int? maxLength, bool forceLimit = false}) {
    // 如果没有启用长度限制且不是强制限制，直接返回原消息
    if (!_enableLengthLimit && !forceLimit) {
      return message;
    }

    final limit = maxLength ?? _maxLogLength;

    // 如果消息长度在限制内，直接返回
    if (message.length <= limit) {
      return message;
    }

    // 计算截断位置，保留一些空间给后缀
    final suffixLength = _truncateSuffix.length;
    final truncateAt = limit - suffixLength;

    if (truncateAt <= 0) {
      return _truncateSuffix;
    }

    // 截断消息并添加后缀
    final truncated = message.substring(0, truncateAt);
    return '$truncated$_truncateSuffix';
  }

  /// 格式化日志消息并应用长度限制
  /// [message] - 原始消息
  /// [maxLength] - 最大长度，如果为null则使用默认配置
  /// [forceLimit] - 是否强制限制，忽略全局配置
  String _formatLogMessage(dynamic message, {int? maxLength, bool forceLimit = false}) {
    String logMessage = message is String ? message : _formatObject(message);
    return _limitLogLength(logMessage, maxLength: maxLength, forceLimit: forceLimit);
  }

  /// 设置最大日志长度
  void setMaxLogLength(int length) {
    _maxLogLength = length;
  }

  /// 获取最大日志长度
  int get maxLogLength => _maxLogLength;

  /// 启用长度限制
  void enableLengthLimit() {
    _enableLengthLimit = true;
  }

  /// 禁用长度限制
  void disableLengthLimit() {
    _enableLengthLimit = false;
  }

  /// 获取长度限制状态
  bool get isLengthLimitEnabled => _enableLengthLimit;

  /// 格式化对象，转换为JSON字符串
  String _formatObject(dynamic obj, {bool pretty = true, int indent = 2}) {
    try {
      if (obj == null) return 'null';

      // 处理简单类型
      if (obj is String) {
        // 尝试解析字符串是否为JSON
        try {
          final jsonData = jsonDecode(obj);
          return pretty
              ? JsonEncoder.withIndent(' ' * indent).convert(jsonData)
              : obj;
        } catch (_) {
          return obj; // 不是JSON，直接返回
        }
      }

      if (obj is num || obj is bool) {
        return obj.toString();
      }

      // 处理复杂类型
      dynamic jsonData;

      if (obj is Map) {
        // 处理Map类型
        jsonData = obj;
      } else if (obj is List) {
        // 处理列表
        return _formatList(obj, indent: indent);
      } else {
        // 处理自定义对象
        try {
          // 优先尝试调用toJson方法
          final dynamic result = _invokeToJsonIfExists(obj);
          if (result != null) {
            jsonData = result;
          } else {
            // 如果没有toJson方法，尝试反射获取属性
            jsonData = {'toString()': obj.toString()};
          }
        } catch (e) {
          return '无法格式化对象: ${obj.runtimeType}, 错误: $e';
        }
      }

      // 格式化输出
      if (pretty && jsonData != null) {
        return JsonEncoder.withIndent(' ' * indent).convert(jsonData);
      } else if (jsonData != null) {
        return jsonEncode(jsonData);
      } else {
        return obj.toString();
      }
    } catch (e) {
      return '无法格式化对象: ${obj.runtimeType}, 错误: $e';
    }
  }

  /// 尝试调用对象的toJson方法
  dynamic _invokeToJsonIfExists(dynamic obj) {
    try {
      if (obj == null) return null;

      // 使用反射或动态调用
      if (obj.toJson is Function) {
        return obj.toJson();
      }

      // 特殊处理某些常见的泛型类型
      if (obj.toString().contains('<') && obj.toString().contains('>')) {
        if (obj.toString().startsWith('Instance of')) {
          // 尝试访问常见属性
          final Map<String, dynamic> result = {};

          // 尝试访问常见属性
          try {
            if (obj.data != null) {
              if (obj.data.toJson is Function) {
                result['data'] = obj.data.toJson();
              } else {
                result['data'] = obj.data.toString();
              }
            }
          } catch (_) {}

          try {
            if (obj.status != null) result['status'] = obj.status.toString();
          } catch (_) {}
          try {
            if (obj.message != null) result['message'] = obj.message;
          } catch (_) {}
          try {
            if (obj.code != null) result['code'] = obj.code;
          } catch (_) {}
          try {
            if (obj.error != null) result['error'] = obj.error;
          } catch (_) {}

          if (result.isNotEmpty) {
            return result;
          }
        }
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  /// 格式化列表
  String _formatList(List list, {int indent = 2}) {
    if (list.isEmpty) return '[]';

    StringBuffer sb = StringBuffer();
    sb.write('[\n');

    for (int i = 0; i < list.length; i++) {
      var item = list[i];
      String itemStr;

      if (item is Map ||
          (item != null && item.toJson != null && item.toJson is Function)) {
        itemStr = _formatObject(item, pretty: true, indent: indent);
      } else {
        itemStr = item.toString();
      }

      sb.write('${' ' * indent}$itemStr');
      if (i < list.length - 1) sb.write(',');
      sb.write('\n');
    }

    sb.write(']');
    return sb.toString();
  }

  /// 记录详细日志
  /// [maxLength] - 最大长度，如果为null则使用默认配置
  String v(dynamic message, [dynamic error, StackTrace? stackTrace, int? maxLength]) {
    if (!_enabled) return '';

    String logMessage = _formatLogMessage(message, maxLength: maxLength);

    _logger.v(logMessage, error: error, stackTrace: stackTrace);
    return logMessage;
  }

  /// 记录调试日志
  /// [maxLength] - 最大长度，如果为null则使用默认配置
  String d(dynamic message, [dynamic error, StackTrace? stackTrace, int? maxLength]) {
    if (!_enabled) return '';

    String logMessage = _formatLogMessage(message, maxLength: maxLength);

    _logger.d(logMessage, error: error, stackTrace: stackTrace);
    return logMessage;
  }

  /// 记录信息日志
  /// [maxLength] - 最大长度，如果为null则使用默认配置
  String i(dynamic message, [dynamic error, StackTrace? stackTrace, int? maxLength]) {
    if (!_enabled) return '';

    String logMessage = _formatLogMessage(message, maxLength: maxLength);

    _logger.i(logMessage, error: error, stackTrace: stackTrace);
    return logMessage;
  }

  /// 记录警告日志
  /// [maxLength] - 最大长度，如果为null则使用默认配置
  String w(dynamic message, [dynamic error, StackTrace? stackTrace, int? maxLength]) {
    if (!_enabled) return '';

    String logMessage = _formatLogMessage(message, maxLength: maxLength);

    _logger.w(logMessage, error: error, stackTrace: stackTrace);
    return logMessage;
  }

  /// 记录错误日志
  /// [maxLength] - 最大长度，如果为null则使用默认配置
  String e(dynamic message, [dynamic error, StackTrace? stackTrace, int? maxLength]) {
    if (!_enabled) return '';

    String logMessage = _formatLogMessage(message, maxLength: maxLength);

    _logger.e(logMessage, error: error, stackTrace: stackTrace);
    return logMessage;
  }

  /// 记录严重错误日志
  /// [maxLength] - 最大长度，如果为null则使用默认配置
  String wtf(dynamic message, [dynamic error, StackTrace? stackTrace, int? maxLength]) {
    if (!_enabled) return '';

    String logMessage = _formatLogMessage(message, maxLength: maxLength);

    _logger.wtf(logMessage, error: error, stackTrace: stackTrace);
    return logMessage;
  }

  /// 专门用于打印对象的方法
  String obj(dynamic object, {String? tag, bool pretty = true}) {
    if (!_enabled) return '';

    final StringBuffer sb = StringBuffer();
    final String tagStr = tag != null ? '[$tag]' : '';

    sb.write('┌─────── Object $tagStr ───────┐\n');

    String objStr = _formatObject(object, pretty: pretty);
    objStr.split('\n').forEach((line) {
      sb.write('│ $line\n');
    });

    sb.write('└────────────────────────┘');

    final logMessage = sb.toString();
    _logger.i(logMessage);
    return logMessage;
  }

  /// 记录网络请求日志
  String network(String method, String url,
      {dynamic data, dynamic response, dynamic error}) {
    if (!_enabled) return '';

    final StringBuffer sb = StringBuffer();
    sb.write('┌────── Network ──────┐\n');
    sb.write('│ $method: $url\n');

    if (data != null) {
      String dataStr = _formatObject(data);
      sb.write('│ Request: $dataStr\n');
    }

    if (response != null) {
      String respStr = _formatObject(response);
      sb.write('│ Response: $respStr\n');
    }

    if (error != null) {
      sb.write('│ Error: $error\n');
    }

    sb.write('└─────────────────────┘');

    final logMessage = sb.toString();
    _logger.i(logMessage);
    return logMessage;
  }

  /// 记录API调用日志
  /// 记录API调用的详细信息，包括请求、响应、耗时和错误信息
  /// [api] - API名称或路径
  /// [request] - 请求数据
  /// [response] - 响应数据
  /// [duration] - 请求耗时
  /// [error] - 错误信息
  /// [logLevel] - 日志级别，默认为info
  /// 返回格式化后的日志字符串
  String api(String api,
      {dynamic request,
      dynamic response,
      Duration? duration,
      dynamic error,
      Level logLevel = Level.info}) {
    if (!_enabled) return '';

    // 使用更高效的字符串构建方式
    final parts = <String>[];
    parts.add('┌────── API ──────┐');
    parts.add('│ $api');

    if (request != null) {
      final reqStr = _formatObject(request);
      parts.add('│ Request: $reqStr');
    }

    if (response != null) {
      final respStr = _formatObject(response);
      parts.add('│ Response: $respStr');
    }

    if (duration != null) {
      parts.add('│ Duration: ${duration.inMilliseconds}ms');
    }

    if (error != null) {
      parts.add('│ Error: $error');
    }

    parts.add('└──────────────────┘');

    final logMessage = parts.join('\n');

    // 根据指定的日志级别记录
    switch (logLevel) {
      case Level.verbose:
        _logger.v(logMessage);
        break;
      case Level.debug:
        _logger.d(logMessage);
        break;
      case Level.info:
        _logger.i(logMessage);
        break;
      case Level.warning:
        _logger.w(logMessage);
        break;
      case Level.error:
        _logger.e(logMessage);
        break;
      case Level.wtf:
        _logger.wtf(logMessage);
        break;
      default:
        _logger.i(logMessage);
    }

    return logMessage;
  }

  /// 记录性能日志
  String performance(String tag, Duration duration) {
    if (!_enabled) return '';

    final StringBuffer sb = StringBuffer();
    sb.write('┌────── Performance ──────┐\n');
    sb.write('│ $tag: ${duration.inMilliseconds}ms\n');
    sb.write('└───────────────────────┘');

    final logMessage = sb.toString();
    _logger.d(logMessage);
    return logMessage;
  }

  /// 记录用户行为日志
  String userAction(String action, {Map<String, dynamic>? params}) {
    if (!_enabled) return '';

    final StringBuffer sb = StringBuffer();
    sb.write('┌────── User Action ──────┐\n');
    sb.write('│ $action\n');

    if (params != null && params.isNotEmpty) {
      String paramsStr = _formatObject(params);
      sb.write('│ Params: $paramsStr\n');
    }

    sb.write('└────────────────────────┘');

    final logMessage = sb.toString();
    _logger.i(logMessage);
    return logMessage;
  }

  /// 记录开发者日志（仅在调试模式下显示）
  void dev(dynamic message) {
    if (!_enabled || !kDebugMode) return;

    String logMessage = message is String ? message : _formatObject(message);

    developer.log(logMessage, name: 'DEV');
  }
}

/// 日志工具快捷访问
///
/// 使用示例:
/// ```dart
/// Log.d('调试信息');
/// Log.e('错误信息', error, stackTrace);
/// Log.network('GET', 'https://api.example.com', data: requestData, response: responseData);
/// Log.obj(myObject, tag: '用户信息'); // 格式化打印对象
/// Log.type(myObject); // 打印对象的运行时类型
/// ```
class Log {
  static final AppLogger _logger = AppLogger.instance;

  /// 记录详细日志
  /// [maxLength] - 最大长度，如果为null则使用默认配置
  static String v(dynamic message, [dynamic error, StackTrace? stackTrace, int? maxLength]) =>
      _logger.v(message, error, stackTrace, maxLength);

  /// 记录调试日志
  /// [maxLength] - 最大长度，如果为null则使用默认配置
  static String d(dynamic message, [dynamic error, StackTrace? stackTrace, int? maxLength]) =>
      _logger.d(message, error, stackTrace, maxLength);

  /// 记录信息日志
  /// [maxLength] - 最大长度，如果为null则使用默认配置
  static String i(dynamic message, [dynamic error, StackTrace? stackTrace, int? maxLength]) =>
      _logger.i(message, error, stackTrace, maxLength);

  /// 记录警告日志
  /// [maxLength] - 最大长度，如果为null则使用默认配置
  static String w(dynamic message, [dynamic error, StackTrace? stackTrace, int? maxLength]) =>
      _logger.w(message, error, stackTrace, maxLength);

  /// 记录错误日志
  /// [maxLength] - 最大长度，如果为null则使用默认配置
  static String e(dynamic message, [dynamic error, StackTrace? stackTrace, int? maxLength]) =>
      _logger.e(message, error, stackTrace, maxLength);

  /// 记录严重错误日志
  /// [maxLength] - 最大长度，如果为null则使用默认配置
  static String wtf(dynamic message, [dynamic error, StackTrace? stackTrace, int? maxLength]) =>
      _logger.wtf(message, error, stackTrace, maxLength);

  /// 专门用于打印对象的方法
  static String obj(dynamic object, {String? tag, bool pretty = true}) =>
      _logger.obj(object, tag: tag, pretty: pretty);

  /// 打印对象的运行时类型信息
  static String type(dynamic object, {String? tag}) {
    final StringBuffer sb = StringBuffer();
    final String tagStr = tag != null ? '[$tag]' : '';

    sb.write('┌─────── Type Info $tagStr ───────┐\n');
    sb.write('│ 运行时类型: ${object.runtimeType}\n');

    // 尝试获取更多类型信息
    try {
      if (object is List) {
        sb.write('│ 列表长度: ${object.length}\n');
        if (object.isNotEmpty) {
          sb.write('│ 元素类型: ${object.first.runtimeType}\n');
        }
      } else if (object is Map) {
        sb.write('│ Map大小: ${object.length}\n');
        if (object.isNotEmpty) {
          sb.write('│ 键类型: ${object.keys.first.runtimeType}\n');
          sb.write('│ 值类型: ${object.values.first.runtimeType}\n');
        }
      }

      // 检查常见方法
      sb.write('│ 有toJson方法: ${object.toJson is Function ? '是' : '否'}\n');
    } catch (e) {
      sb.write('│ 检查类型信息时出错: $e\n');
    }

    sb.write('└────────────────────────┘');

    final logMessage = sb.toString();
    _logger.i(logMessage);
    return logMessage;
  }

  /// 记录网络请求日志
  static String network(String method, String url,
          {dynamic data, dynamic response, dynamic error}) =>
      _logger.network(method, url,
          data: data, response: response, error: error);

  /// 记录API调用日志
  static String api(String api,
          {dynamic request,
          dynamic response,
          Duration? duration,
          dynamic error,
          Level logLevel = Level.info}) =>
      _logger.api(api,
          request: request,
          response: response,
          duration: duration,
          error: error,
          logLevel: logLevel);

  /// 记录性能日志
  static String performance(String tag, Duration duration) =>
      _logger.performance(tag, duration);

  /// 记录用户行为日志
  static String userAction(String action, {Map<String, dynamic>? params}) =>
      _logger.userAction(action, params: params);

  /// 记录开发者日志（仅在调试模式下显示）
  static void dev(dynamic message) => _logger.dev(message);

  /// 配置日志工具
  static void configure({
    bool? enabled,
    Level? level,
    int methodCount = 2,
    int errorMethodCount = 8,
    int lineLength = 120,
    bool colors = true,
    bool printEmojis = true,
    bool printTime = true,
    int maxLogLength = 1000,
    bool enableLengthLimit = true,
    String truncateSuffix = '... (truncated)',
  }) =>
      _logger.configure(
        enabled: enabled,
        level: level,
        methodCount: methodCount,
        errorMethodCount: errorMethodCount,
        lineLength: lineLength,
        colors: colors,
        printEmojis: printEmojis,
        printTime: printTime,
        maxLogLength: maxLogLength,
        enableLengthLimit: enableLengthLimit,
        truncateSuffix: truncateSuffix,
      );

  /// 启用日志
  static void enable() => _logger.enable();

  /// 禁用日志
  static void disable() => _logger.disable();

  /// 设置日志级别
  static set level(Level level) => _logger.level = level;

  /// 获取日志级别
  static Level get level => _logger.level;

  /// 设置最大日志长度
  static void setMaxLogLength(int length) => _logger.setMaxLogLength(length);

  /// 获取最大日志长度
  static int get maxLogLength => _logger.maxLogLength;

  /// 启用长度限制
  static void enableLengthLimit() => _logger.enableLengthLimit();

  /// 禁用长度限制
  static void disableLengthLimit() => _logger.disableLengthLimit();

  /// 获取长度限制状态
  static bool get isLengthLimitEnabled => _logger.isLengthLimitEnabled;

  /// 便捷方法：记录长JSON数据（自动限制长度）
  static String json(dynamic jsonData, {String? tag, int maxLength = 500}) {
    final tagStr = tag != null ? '[$tag] ' : '';
    return d('${tagStr}JSON: $jsonData', null, null, maxLength);
  }

  /// 便捷方法：记录API响应（自动限制长度）
  static String apiResponse(dynamic response, {String? api, int maxLength = 800}) {
    final apiStr = api != null ? '[$api] ' : '';
    return d('${apiStr}Response: $response', null, null, maxLength);
  }

  /// 便捷方法：记录大数据对象（自动限制长度）
  static String largeData(dynamic data, {String? tag, int maxLength = 300}) {
    final tagStr = tag != null ? '[$tag] ' : '';
    return d('${tagStr}Data: $data', null, null, maxLength);
  }

  /// 便捷方法：无限制日志（忽略全局长度限制）
  static String unlimited(dynamic message, {Level logLevel = Level.debug}) {
    final originalLimit = _logger._enableLengthLimit;
    _logger._enableLengthLimit = false;

    String result;
    switch (logLevel) {
      case Level.verbose:
        result = v(message);
        break;
      case Level.debug:
        result = d(message);
        break;
      case Level.info:
        result = i(message);
        break;
      case Level.warning:
        result = w(message);
        break;
      case Level.error:
        result = e(message);
        break;
      default:
        result = d(message);
    }

    _logger._enableLengthLimit = originalLimit;
    return result;
  }
}
