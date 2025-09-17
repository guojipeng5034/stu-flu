import 'dart:async';
import 'package:flutter/foundation.dart'; // For debugPrint
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
import 'time_util.dart';
// import 'package:meta/meta.dart'; // @visibleForTesting is in foundation.dart

/// 实时流式时间工具类
/// 提供全局唯一的时间流（每秒推送一次），支持NTP校准和动态切换目标时区。
class StreamingTimeUtil {
  // 广播流控制器，推送当前时间（已校准NTP并转换为目标时区）
  static StreamController<DateTime>? _broadcastController;
  // 全局定时器，每秒触发一次
  static Timer? _globalTimer;
  // 当前监听者数量
  static int _listenerCount = 0;
  // 时区数据是否已初始化
  static bool _timezonesInitialized = false;
  // NTP初始化流程是否正在进行中
  static bool _isNtpInitializing = false;

  // 当前全局目标时区名称和Location对象
  // 默认值为占位，初始化后会被正确赋值
  static String _currentTargetTimezoneName = 'Unknown';
  static late tz.Location _currentTargetLocation; // 由 _ensureTimezonesInitialized 初始化

  /// 确保时区数据已初始化，并设置默认目标时区为本地时区
  static Future<void> _ensureTimezonesInitialized() async {
    if (!_timezonesInitialized) {
      tz_data.initializeTimeZones(); // 加载所有时区数据
      _timezonesInitialized = true;
      // 设置默认目标时区为本地时区
      _currentTargetLocation = tz.local;
      _currentTargetTimezoneName = _currentTargetLocation.name;
      debugPrint('StreamingTimeUtil: 时区数据已初始化，默认目标: $_currentTargetTimezoneName');
    }
  }

  /// 更新全局时间流的目标时区。
  /// [timezoneName] IANA时区数据库中的时区名称 (如 "Asia/Shanghai")。
  /// 若名称无效，目标时区不会改变。
  static Future<void> updateTargetTimezone(String timezoneName) async {
    await _ensureTimezonesInitialized(); // 确保时区数据已加载
    try {
      final newLocation = tz.getLocation(timezoneName);
      _currentTargetTimezoneName = timezoneName;
      _currentTargetLocation = newLocation;
      debugPrint('StreamingTimeUtil: 目标时区已更新为: $timezoneName');
    } catch (e) {
      debugPrint('StreamingTimeUtil: 更新目标时区失败 "$timezoneName"，错误: $e，当前时区保持为 "$_currentTargetTimezoneName"');
    }
  }

  /// 获取当前全局配置的目标时区名称。
  static String get currentTargetTimezoneName => _currentTargetTimezoneName;

  /// 监听者加入时的回调，启动定时器和NTP初始化（如有需要）
  static void _onListen() {
    _listenerCount++;
    debugPrint('StreamingTimeUtil: 新监听者加入，当前数量: $_listenerCount');
    // 只有第一个监听者加入时才启动定时器和NTP初始化
    if (_listenerCount == 1 && (_globalTimer == null || !_globalTimer!.isActive)) {
      _ensureTimeUtilInitializedAndStartTimer();
    }
  }

  /// 监听者取消时的回调，无监听者时停止定时器
  static void _onCancel() {
    _listenerCount--;
    debugPrint('StreamingTimeUtil: 监听者取消，当前数量: $_listenerCount');
    if (_listenerCount == 0) {
      _stopGlobalTimer();
    }
  }

  /// 确保NTP偏移量已初始化并启动全局定时器
  static Future<void> _ensureTimeUtilInitializedAndStartTimer() async {
    if (_isNtpInitializing) {
      debugPrint('StreamingTimeUtil: NTP初始化或定时器启动已在进行中。');
      return;
    }
    _isNtpInitializing = true;
    debugPrint('StreamingTimeUtil: 正在初始化NTP偏移量和定时器...');
    try {
      // 先确保时区数据和目标时区已准备好
      await _ensureTimezonesInitialized();

      // 初始化NTP偏移量（如未初始化）
      if (TimeUtil.ntpOffset == null) {
        debugPrint('StreamingTimeUtil: NTP偏移量为null，调用TimeUtil.getCurrentTime()初始化。');
        await TimeUtil.getCurrentTime();
      }

      // 若NTP偏移量仍为null，视为严重错误
      if (TimeUtil.ntpOffset == null) {
        final error = StateError('StreamingTimeUtil: NTP偏移量初始化失败。');
        _broadcastController?.addError(error);
        debugPrint('StreamingTimeUtil: 严重错误，NTP初始化失败，错误已推送到流。');
        _isNtpInitializing = false;
        return;
      }

      // 仅在有监听者且定时器未激活时启动定时器
      if (_listenerCount > 0 && (_globalTimer == null || !_globalTimer!.isActive)) {
        debugPrint('StreamingTimeUtil: NTP偏移量已初始化: ${TimeUtil.ntpOffset}，启动全局定时器，目标时区: $_currentTargetTimezoneName');
        _globalTimer?.cancel(); // 保险起见先取消旧定时器
        _globalTimer = Timer.periodic(const Duration(seconds: 1), _tickGlobalTimer);
      } else if (_listenerCount == 0) {
        debugPrint('StreamingTimeUtil: NTP已初始化，但无监听者，定时器不启动。');
        _stopGlobalTimer();
      } else {
        debugPrint('StreamingTimeUtil: NTP已初始化，定时器已激活。');
      }
    } catch (e, s) {
      debugPrint('StreamingTimeUtil: 初始化NTP或启动定时器时出错: $e\n$s');
      _broadcastController?.addError(e);
    } finally {
      _isNtpInitializing = false;
    }
  }

  /// 全局定时器每秒触发的事件，推送校准后的当前时间
  static void _tickGlobalTimer(Timer timer) {
    if (TimeUtil.ntpOffset == null) {
      debugPrint('StreamingTimeUtil: 定时器触发但NTP偏移量为null，停止定时器并尝试重新初始化。');
      _stopGlobalTimer();
      if (_listenerCount > 0) {
        _ensureTimeUtilInitializedAndStartTimer();
      }
      _broadcastController?.addError(StateError('StreamingTimeUtil: NTP偏移量意外丢失，已尝试重新初始化。'));
      return;
    }
    // 获取NTP校准后的UTC时间
    final DateTime correctedUtcTime = DateTime.now().toUtc().add(TimeUtil.ntpOffset!);
    // 转换为目标时区时间
    try {
      final DateTime finalTimeInTargetTimezone = tz.TZDateTime.from(correctedUtcTime, _currentTargetLocation);
      _broadcastController?.add(finalTimeInTargetTimezone);
    } catch (e) {
      debugPrint('StreamingTimeUtil: 转换为目标时区时出错: $e，回退推送UTC时间。');
      _broadcastController?.addError(e);
      _broadcastController?.add(correctedUtcTime);
    }
  }

  /// 停止全局定时器
  static void _stopGlobalTimer() {
    debugPrint('StreamingTimeUtil: 停止全局定时器。');
    _globalTimer?.cancel();
    _globalTimer = null;
  }

  /// 获取一个全局唯一的、每秒推送一次的时间流（已校准NTP并转换为目标时区）。
  ///
  /// 默认目标时区为设备本地时区，可通过 updateTargetTimezone 动态切换。
  /// 有监听者时自动启动定时器，无监听者时自动停止。
  static Stream<DateTime> getRealTimeStream() {
    // 兜底初始化，确保目标时区已准备好
    if (!_timezonesInitialized) {
      _ensureTimezonesInitialized();
    }

    if (_broadcastController == null || _broadcastController!.isClosed) {
      debugPrint('StreamingTimeUtil: 创建新的广播流控制器。');
      _broadcastController = StreamController<DateTime>.broadcast(
        onListen: _onListen,
        onCancel: _onCancel,
      );
      _listenerCount = 0;
    }
    return _broadcastController!.stream;
  }

  /// 仅用于测试，重置所有全局状态。
  @visibleForTesting
  static void resetForTest() {
    _stopGlobalTimer();
    _broadcastController?.close();
    _broadcastController = null;
    _listenerCount = 0;
    _isNtpInitializing = false;
    // 重置时区相关状态
    if (_timezonesInitialized) {
      _currentTargetLocation = tz.local;
      _currentTargetTimezoneName = _currentTargetLocation.name;
    } else {
      _timezonesInitialized = false;
      _currentTargetTimezoneName = 'Unknown';
    }
    debugPrint('StreamingTimeUtil: 状态已重置（仅用于测试）。');
  }
}
