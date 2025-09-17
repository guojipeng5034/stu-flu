// 导入必要的包
import 'dart:async'; // For Completer
import 'package:flutter/foundation.dart'; // for debugPrint, visibleForTesting
import 'package:ntp/ntp.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
// @visibleForTesting is available from foundation.dart, so meta.dart is not strictly needed here.

/// 时间工具类：支持NTP校准和时区转换
class TimeUtil {
  static Duration? _ntpOffset;
  static DateTime? _firstNtpTime;
  static bool _isInitializing = false;
  static final List<Completer<void>> _initializationCompleters = [];
  static bool _timezonesInitialized = false;

  /// 测试专用：重置静态状态
  @visibleForTesting
  static void resetForTest() {
    _ntpOffset = null;
    _firstNtpTime = null;
    _isInitializing = false;
    _initializationCompleters.clear();
    debugPrint('TimeUtil: State has been reset for testing.');
  }

  /// 初始化时区数据（只执行一次）
  static Future<void> _ensureTimezonesInitialized() async {
    if (!_timezonesInitialized) {
      tz_data.initializeTimeZones();
      _timezonesInitialized = true;
      debugPrint('TimeUtil: 时区数据已初始化。');
    }
  }

  /// 获取当前时间（NTP校准，可选时区）
  static Future<DateTime> getCurrentTime({String? timezone}) async {
    await _ensureTimezonesInitialized();

    if (_ntpOffset == null) {
      if (_isInitializing) {
        // 并发等待NTP初始化
        final completer = Completer<void>();
        _initializationCompleters.add(completer);
        await completer.future;
      } else {
        _isInitializing = true;
        try {
          final networkTimeUtc = await NTP.now();
          final deviceTimeUtc = DateTime.now().toUtc();
          _ntpOffset = networkTimeUtc.difference(deviceTimeUtc);
          _firstNtpTime = networkTimeUtc;
          debugPrint('TimeUtil: NTP校准成功，偏移量: $_ntpOffset');
          for (var completer in _initializationCompleters) {
            completer.complete();
          }
          _initializationCompleters.clear();
        } catch (e) {
          debugPrint('TimeUtil: NTP校准失败: $e，使用本地时间。');
          _ntpOffset = Duration.zero;
          _firstNtpTime = DateTime.now().toUtc();
          for (var completer in _initializationCompleters) {
            completer.complete();
          }
          _initializationCompleters.clear();
        } finally {
          _isInitializing = false;
        }
      }
    }

    final Duration offset = _ntpOffset ?? Duration.zero;
    final DateTime estimatedUtc = DateTime.now().toUtc().add(offset);

    if (timezone != null && timezone.isNotEmpty) {
      try {
        final location = tz.getLocation(timezone);
        return tz.TZDateTime.from(estimatedUtc, location);
      } catch (e) {
        debugPrint('TimeUtil: 无效时区 "$timezone"，返回本地时区。');
        return tz.TZDateTime.from(estimatedUtc, tz.local);
      }
    } else {
      return tz.TZDateTime.from(estimatedUtc, tz.local);
    }
  }

  /// 当前NTP偏移量（未初始化时为null）
  static Duration? get ntpOffset => _ntpOffset;

  /// 首次NTP时间（UTC，未初始化时为null）
  static DateTime? get firstNtpTimeUtc => _firstNtpTime;
}
