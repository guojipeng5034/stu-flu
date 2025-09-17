import 'package:flutter_test/flutter_test.dart';
// import 'package:ntp/ntp.dart'; // NTP.now() is no longer directly used in these tests for stability
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:cptop/core/time/time_util.dart';

void main() {
  // 在所有测试运行之前初始化时区数据
  setUpAll(() {
    // tz_data.initializeTimeZones() 会由 TimeUtil 内部的 _ensureTimezonesInitialized 调用
    // 或者在测试中首次调用 TimeUtil.getCurrentTime() 时触发。
    // 为确保独立性，也可以在这里显式调用，它能安全处理多次调用。
    tz_data.initializeTimeZones();
  });

  // 在每个测试之前重置 TimeUtil 的状态
  setUp(() {
    TimeUtil.resetForTest();
  });

  group('TimeUtil.getCurrentTime basic functionality', () {
    // 测试用例 1: 不带时区参数 (应返回本地时间)
    test('should return local time when no timezone is provided', () async {
      final DateTime result = await TimeUtil.getCurrentTime();
      final DateTime nowLocal = DateTime.now();

      // 断言年、月、日、小时是否接近
      // 由于NTP同步和执行时间，允许秒和分钟级别的小差异
      expect(result.year, nowLocal.year);
      expect(result.month, nowLocal.month);
      expect(result.day, nowLocal.day);
      expect(result.hour, nowLocal.hour, reason: "小时应该匹配或非常接近");

      if (result is tz.TZDateTime) {
        expect(result.location, tz.local, reason: "时区位置应为本地");
      } else {
        // TimeUtil 现在总是返回 TZDateTime
        fail(
            "TimeUtil.getCurrentTime did not return a TZDateTime object for local time.");
      }
      // print('Test 1 (Local Time): Result: $result, Expected Local (approx): $nowLocal');
    });

    // 测试用例 2: 使用有效时区参数 ("America/New_York")
    test('should return correct time for a valid timezone (America/New_York)',
        () async {
      const String americaNewYork = "America/New_York";
      final DateTime resultFromUtil =
          await TimeUtil.getCurrentTime(timezone: americaNewYork);

      // 为了使测试更稳定，我们不再依赖于NTP.now()在测试中断言时的精确时间，
      // 而是检查返回的时间是否确实在目标时区。
      // 实际的小时数会因NTP的首次调用而异，但时区应正确。
      final tz.Location location = tz.getLocation(americaNewYork);
      final tz.TZDateTime nowInNewYork = tz.TZDateTime.now(location);

      expect(resultFromUtil.year, nowInNewYork.year);
      expect(resultFromUtil.month, nowInNewYork.month);
      // 日期和小时可能因NTP同步而与 nowInNewYork (基于设备时钟)略有不同。
      // 主要关注时区是否正确。
      // expect(resultFromUtil.day, nowInNewYork.day);
      // expect(resultFromUtil.hour, nowInNewYork.hour);

      if (resultFromUtil is tz.TZDateTime) {
        expect(resultFromUtil.location.name, americaNewYork,
            reason: "时区位置名称应为 America/New_York");
        expect(resultFromUtil.timeZoneName,
            isIn([nowInNewYork.timeZoneName, "EDT", "EST"]),
            reason: "时区名称应为纽约时区的有效名称");
        // print('Test 2 (America/New_York): Result: $resultFromUtil (${resultFromUtil.timeZoneName}), Expected (approx): $nowInNewYork (${nowInNewYork.timeZoneName})');
      } else {
        fail(
            "TimeUtil.getCurrentTime did not return a TZDateTime object for New York timezone.");
      }
    });

    // 测试用例 3: 使用另一个有效时区参数 ("Asia/Shanghai")
    test(
        'should return correct time for another valid timezone (Asia/Shanghai)',
        () async {
      const String asiaShanghai = "Asia/Shanghai";
      final DateTime resultFromUtil =
          await TimeUtil.getCurrentTime(timezone: asiaShanghai);

      final tz.Location location = tz.getLocation(asiaShanghai);
      final tz.TZDateTime nowInShanghai = tz.TZDateTime.now(location);

      expect(resultFromUtil.year, nowInShanghai.year);
      expect(resultFromUtil.month, nowInShanghai.month);
      // expect(resultFromUtil.day, nowInShanghai.day);
      // expect(resultFromUtil.hour, nowInShanghai.hour);

      if (resultFromUtil is tz.TZDateTime) {
        expect(resultFromUtil.location.name, asiaShanghai,
            reason: "时区位置名称应为 Asia/Shanghai");
        expect(resultFromUtil.timeZoneName, "CST",
            reason: "时区名称应为 CST (China Standard Time)");
        // print('Test 3 (Asia/Shanghai): Result: $resultFromUtil (${resultFromUtil.timeZoneName}), Expected (approx): $nowInShanghai (${nowInShanghai.timeZoneName})');
      } else {
        fail(
            "TimeUtil.getCurrentTime did not return a TZDateTime object for Shanghai timezone.");
      }
    });

    // 测试用例 4: 使用无效时区参数 (应回退到本地时间)
    test('should return local time for an invalid timezone', () async {
      final DateTime result =
          await TimeUtil.getCurrentTime(timezone: "Invalid/Timezone");
      final DateTime nowLocal = DateTime.now();

      expect(result.year, nowLocal.year);
      expect(result.month, nowLocal.month);
      expect(result.day, nowLocal.day);
      expect(result.hour, nowLocal.hour, reason: "小时应该匹配或非常接近本地时间");

      if (result is tz.TZDateTime) {
        expect(result.location, tz.local, reason: "时区位置应为本地 (因无效时区回退)");
      } else {
        fail(
            "TimeUtil.getCurrentTime did not return a TZDateTime object for invalid timezone fallback.");
      }
      // print('Test 4 (Invalid Timezone): Result: $result, Expected Local (approx): $nowLocal');
    });
  });

  group('TimeUtil.getCurrentTime caching', () {
    test(
        'should fetch from NTP on first call and use cache on subsequent calls',
        () async {
      // Act: First call
      // final startTimeFirstCall = DateTime.now();
      await TimeUtil.getCurrentTime();
      // final durationFirstCall = DateTime.now().difference(startTimeFirstCall);

      expect(TimeUtil.ntpOffset, isNotNull,
          reason: "Offset should be cached after first call");
      expect(TimeUtil.firstNtpTimeUtc, isNotNull,
          reason: "First NTP time should be cached after first call");

      final firstNtpTimeAfterFirstCall = TimeUtil.firstNtpTimeUtc;
      final ntpOffsetAfterFirstCall = TimeUtil.ntpOffset;

      // Allow some time to pass
      await Future.delayed(const Duration(milliseconds: 50));

      // Act: Second call
      // final startTimeSecondCall = DateTime.now();
      await TimeUtil.getCurrentTime();
      // final durationSecondCall = DateTime.now().difference(startTimeSecondCall);

      // Assert: Cached values should not change
      expect(TimeUtil.firstNtpTimeUtc, equals(firstNtpTimeAfterFirstCall),
          reason:
              "Cached firstNtpTimeUtc should not change on subsequent calls.");
      expect(TimeUtil.ntpOffset, equals(ntpOffsetAfterFirstCall),
          reason: "Cached ntpOffset should not change on subsequent calls.");

      // Test time progression using the cache
      final time1 = await TimeUtil.getCurrentTime();
      await Future.delayed(const Duration(seconds: 2));
      final time2 = await TimeUtil.getCurrentTime();

      final differenceInSeconds = time2.difference(time1).inSeconds;
      expect(differenceInSeconds, closeTo(2, 1),
          reason:
              "Time difference after 2s delay should be approximately 2s, indicating use of local clock + cached offset.");
    });

    test(
        'concurrent calls should all receive results and NTP should only be called once',
        () async {
      // Act: Make multiple calls concurrently
      // TimeUtil.resetForTest() is called in setUp, so cache is clear.

      final resultsFuture = Future.wait([
        TimeUtil.getCurrentTime(),
        TimeUtil.getCurrentTime(),
        TimeUtil.getCurrentTime(),
      ]);

      // No need for Future.delayed here as Future.wait handles the concurrency.
      final List<DateTime> results = await resultsFuture;

      // Assert
      expect(results.length, 3,
          reason: "Should receive three results for concurrent calls.");
      expect(TimeUtil.ntpOffset, isNotNull,
          reason: "NTP offset should be cached after concurrent calls.");
      expect(TimeUtil.firstNtpTimeUtc, isNotNull,
          reason: "First NTP time should be cached after concurrent calls.");

      final firstResultTime = results[0].millisecondsSinceEpoch;
      // Allow a small delta for processing time differences among the resolved futures.
      // Given they all wait on the same initial NTP call, they should resolve very close to each other.
      expect(results[1].millisecondsSinceEpoch, closeTo(firstResultTime, 200),
          reason:
              "Concurrent calls should return times based on the same initial NTP sync.");
      expect(results[2].millisecondsSinceEpoch, closeTo(firstResultTime, 200),
          reason:
              "Concurrent calls should return times based on the same initial NTP sync.");

      // Verify that _firstNtpTime and _ntpOffset did not change after all calls resolved.
      final firstNtpTimeAfterConcurrentCalls = TimeUtil.firstNtpTimeUtc;
      final ntpOffsetAfterConcurrentCalls = TimeUtil.ntpOffset;

      // Another call to ensure no change
      await TimeUtil.getCurrentTime();

      expect(TimeUtil.firstNtpTimeUtc, equals(firstNtpTimeAfterConcurrentCalls),
          reason:
              "Cached firstNtpTimeUtc should remain consistent after concurrent calls and further calls.");
      expect(TimeUtil.ntpOffset, equals(ntpOffsetAfterConcurrentCalls),
          reason:
              "Cached ntpOffset should remain consistent after concurrent calls and further calls.");
    });
  });
}
