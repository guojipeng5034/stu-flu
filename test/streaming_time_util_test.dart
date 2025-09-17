import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:cptop/core/time/time_util.dart';
import 'package:cptop/core/time/streaming_time_util.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;
// import 'package:meta/meta.dart'; // Not strictly needed for these tests anymore for isBroadcast

void main() {
  setUpAll(() {
    // This is critical: initializes timezone data for the entire test suite.
    // StreamingTimeUtil relies on this for its default and updated timezones.
    tz_data.initializeTimeZones();
  });

  // tearDown is vital for tests involving static state.
  tearDown(() {
    // Order: StreamingTimeUtil might hold references or have logic dependent on TimeUtil's state.
    // Resetting StreamingTimeUtil first ensures its cleanup (e.g., stopping timers that use TimeUtil).
    // Then reset TimeUtil.
    StreamingTimeUtil.resetForTest();
    TimeUtil.resetForTest();
  });

  group('StreamingTimeUtil.getRealTimeStream (Centralized Timezone)', () {
    test('should be a broadcast stream', () {
      final stream = StreamingTimeUtil.getRealTimeStream();
      expect(stream.isBroadcast, isTrue);
    });

    test('should stream time in default timezone (local) after NTP init',
        () async {
      // Resetting is handled by tearDown.
      // setUpAll has initialized timezones, so tz.local is valid.
      // StreamingTimeUtil.resetForTest() should reset its currentTargetTimezone to tz.local.

      final stream = StreamingTimeUtil.getRealTimeStream();
      DateTime? firstValue;
      StreamSubscription? sub;

      try {
        final completer = Completer<DateTime>();
        sub = stream.listen((dateTime) {
          if (!completer.isCompleted) completer.complete(dateTime);
        });
        firstValue = await completer.future.timeout(const Duration(seconds: 10),
            onTimeout: () => throw TimeoutException(
                "Timeout waiting for first stream value in default (local) timezone."));
      } finally {
        await sub?.cancel();
      }

      expect(TimeUtil.ntpOffset, isNotNull,
          reason: "NTP offset should be initialized.");
      expect(firstValue, isA<tz.TZDateTime>(),
          reason: "Stream should emit TZDateTime objects.");
      final tzDateTime = firstValue as tz.TZDateTime;

      // Check if the emitted timezone is indeed local.
      // StreamingTimeUtil.currentTargetTimezoneName should be local after reset.
      expect(tzDateTime.location.name, equals(tz.local.name),
          reason:
              "Stream should emit time in the default local timezone. Emitted: ${tzDateTime.location.name}, Expected: ${tz.local.name}, Util's current: ${StreamingTimeUtil.currentTargetTimezoneName}");

      // Check if the time is reasonably close to now (local, corrected)
      expect(TimeUtil.ntpOffset, isNotNull); // Should be set by now
      final correctedNowLocal = tz.TZDateTime.from(
          DateTime.now().toUtc().add(TimeUtil.ntpOffset!), tz.local);
      expect(tzDateTime.year, correctedNowLocal.year);
      expect(tzDateTime.month, correctedNowLocal.month);
      expect(tzDateTime.day, correctedNowLocal.day);
      expect(tzDateTime.hour, correctedNowLocal.hour);
      expect(tzDateTime.minute, closeTo(correctedNowLocal.minute, 1));
    });

    test(
        'should emit values approximately every second in the configured timezone',
        () async {
      final stream =
          StreamingTimeUtil.getRealTimeStream(); // Uses default (local)
      final List<DateTime> emissions = [];
      StreamSubscription? sub;
      final completer = Completer<void>();

      sub = stream.listen((dateTime) {
        emissions.add(dateTime);
        if (emissions.length >= 3) {
          if (!completer.isCompleted) completer.complete();
        }
      });

      await completer.future.timeout(const Duration(seconds: 10),
          onTimeout: () {
        throw TimeoutException("Timeout waiting for 3 stream emissions.");
      });
      await sub.cancel();

      expect(emissions.length, greaterThanOrEqualTo(3));
      expect(emissions[0], isA<tz.TZDateTime>());
      expect((emissions[0] as tz.TZDateTime).location.name,
          StreamingTimeUtil.currentTargetTimezoneName);

      if (emissions.length >= 2) {
        final diff1 = emissions[1].difference(emissions[0]);
        expect(diff1.inMilliseconds, closeTo(1000, 500));
      }
      if (emissions.length >= 3) {
        final diff2 = emissions[2].difference(emissions[1]);
        expect(diff2.inMilliseconds, closeTo(1000, 500));
      }
    });

    test(
        'updateTargetTimezone should change subsequent stream emissions to the new timezone',
        () async {
      final stream = StreamingTimeUtil.getRealTimeStream();
      StreamSubscription? sub;

      // 1. Listen and get a value in the default (local) timezone
      final completerDefault = Completer<tz.TZDateTime>();
      sub = stream.listen((dt) {
        if (!completerDefault.isCompleted && dt is tz.TZDateTime) {
          completerDefault.complete(dt);
        }
      });
      final firstDefaultTime = await completerDefault.future.timeout(
          const Duration(seconds: 10),
          onTimeout: () =>
              throw TimeoutException("Timeout on default TZ emission"));
      expect(firstDefaultTime.location.name, tz.local.name);
      // Don't cancel sub yet, let it run through timezone change

      // 2. Update timezone to New York
      const newYorkTzName = 'America/New_York';
      await StreamingTimeUtil.updateTargetTimezone(newYorkTzName);
      expect(StreamingTimeUtil.currentTargetTimezoneName, newYorkTzName);

      // 3. Listen for a new value, should be in New York time
      // The existing subscription 'sub' should now receive values in the new timezone
      final completerNewYork = Completer<tz.TZDateTime>();
      // Re-assign listen callback for the existing subscription to use the new completer
      // Or, more cleanly, use a new listen block if the old one completed.
      // Since 'sub' is still active, its callback will be invoked on the next tick.
      // We need to ensure the callback logic handles new values for the new completer.
      // A simple way: use a list and check the next emission.
      final List<tz.TZDateTime> emissionsAfterUpdate = [];
      sub.onData((dt) {
        // Modify the existing subscription's handler
        if (dt is tz.TZDateTime) {
          emissionsAfterUpdate.add(dt);
          if (dt.location.name == newYorkTzName &&
              !completerNewYork.isCompleted) {
            completerNewYork.complete(dt);
          }
        }
      });

      final firstNewYorkTime = await completerNewYork.future.timeout(
          const Duration(seconds: 10),
          onTimeout: () =>
              throw TimeoutException("Timeout on New York TZ emission"));

      expect(firstNewYorkTime.location.name, newYorkTzName);

      expect(TimeUtil.ntpOffset, isNotNull);
      final correctedNowUtc = DateTime.now().toUtc().add(TimeUtil.ntpOffset!);
      final expectedNewYorkTime =
          tz.TZDateTime.from(correctedNowUtc, tz.getLocation(newYorkTzName));
      expect(firstNewYorkTime.hour, expectedNewYorkTime.hour);
      expect(firstNewYorkTime.minute, closeTo(expectedNewYorkTime.minute, 1));

      await sub.cancel(); // Now cancel the subscription
    });

    test(
        'updateTargetTimezone with invalid name should not change timezone and stream continues',
        () async {
      // Ensure tz data is loaded and default timezone is set
      await StreamingTimeUtil.getRealTimeStream().first.timeout(
          const Duration(seconds: 10)); // Initializes and gets one emission
      final initialTimezoneName = StreamingTimeUtil
          .currentTargetTimezoneName; // Should be local after reset & init
      expect(initialTimezoneName, tz.local.name);

      await StreamingTimeUtil.updateTargetTimezone("Invalid/Timezone_Name");

      expect(StreamingTimeUtil.currentTargetTimezoneName, initialTimezoneName,
          reason: "Timezone should not change if an invalid name is provided.");

      final stream = StreamingTimeUtil.getRealTimeStream();
      final completer = Completer<tz.TZDateTime>();
      final sub = stream.listen((dt) {
        if (!completer.isCompleted && dt is tz.TZDateTime) {
          completer.complete(dt);
        }
      });
      final timeValue = await completer.future.timeout(
          const Duration(seconds: 10),
          onTimeout: () => throw TimeoutException(
              "Timeout on stream emission after invalid TZ update"));
      await sub.cancel();

      expect(timeValue.location.name, initialTimezoneName);
    });

    test('global timer management with listeners (conceptual)', () async {
      final stream = StreamingTimeUtil.getRealTimeStream();

      final sub1Completer = Completer<void>();
      final sub1 = stream.listen((_) {
        if (!sub1Completer.isCompleted) sub1Completer.complete();
      });
      await sub1Completer.future.timeout(const Duration(seconds: 5),
          onTimeout: () => throw TimeoutException("Timeout sub1"));

      final sub2Completer = Completer<void>();
      final sub2 = stream.listen((_) {
        if (!sub2Completer.isCompleted) sub2Completer.complete();
      });
      await sub2Completer.future.timeout(const Duration(seconds: 5),
          onTimeout: () => throw TimeoutException("Timeout sub2"));

      await sub1.cancel();

      final List<DateTime> emissionsForSub3 = [];
      final sub3Completer = Completer<void>();
      // sub2 is still active. Let's use a new subscription to see if the stream continues for new listeners too.
      final sub3 = stream.listen((dt) {
        emissionsForSub3.add(dt);
        if (emissionsForSub3.length >= 2 && !sub3Completer.isCompleted) {
          sub3Completer.complete();
        }
      });
      await sub3Completer.future.timeout(const Duration(seconds: 5),
          onTimeout: () => throw TimeoutException("Timeout sub3"));
      expect(emissionsForSub3.length, greaterThanOrEqualTo(2));

      await sub2.cancel();
      await sub3.cancel();

      expect(true, isTrue);
    });
  });
}
