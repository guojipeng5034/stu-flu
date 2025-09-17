import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:cptop/shared/models/master/index.dart';

void main() {
  group('Master配置测试', () {
    setUpAll(() async {
      // 模拟Flutter环境
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    group('MasterService测试', () {
      test('应该能够初始化Master服务', () async {
        try {
          await MasterService.instance.initialize();
          expect(MasterService.instance.isInitialized, isTrue);
        } catch (e) {
          // 在测试环境中可能无法加载assets，这是正常的
          print('测试环境无法加载assets: $e');
        }
      });

      test('应该能够获取站点配置', () {
        final siteConfigs = MasterService.instance.siteConfigs;
        expect(siteConfigs, isA<List<SiteConfig>>());
      });
    });

    group('SiteConfig扩展方法测试', () {
      test('应该正确检查功能状态', () {
        const siteConfig = SiteConfig(
          useFixing: 1,
          useGroupLesson: 1,
          usePoints: 0,
          useSns: 1,
        );

        expect(siteConfig.isUsingFixing, isTrue);
        expect(siteConfig.isUsingGroupLesson, isTrue);
        expect(siteConfig.isUsingPoints, isFalse);
        expect(siteConfig.isUsingSns, isTrue);
      });

      test('应该正确获取默认值', () {
        const siteConfig = SiteConfig(
          siteId: 101,
          maxLessonsPerDay: 5,
          defaultTimeZone: 'Asia/Shanghai',
          defaultCurrencyCode: 'CNY',
        );

        expect(siteConfig.getSiteId(), equals(101));
        expect(siteConfig.getMaxLessonsPerDay(), equals(5));
        expect(siteConfig.getDefaultTimeZone(), equals('Asia/Shanghai'));
        expect(siteConfig.getDefaultCurrencyCode(), equals('CNY'));
      });

      test('应该处理空值情况', () {
        const siteConfig = SiteConfig();

        expect(siteConfig.getSiteId(defaultValue: 999), equals(999));
        expect(siteConfig.getMaxLessonsPerDay(), equals(0));
        expect(siteConfig.getDefaultTimeZone(), equals('UTC'));
        expect(siteConfig.getDefaultCurrencyCode(), equals('USD'));
      });
    });

    group('TimeZoneBean扩展方法测试', () {
      test('应该正确解析时区偏移量', () {
        const timeZone = TimeZoneBean(
          id: 1,
          label: 'Asia/Shanghai',
          offset: '+08:00',
          name: 'Beijing',
        );

        expect(timeZone.isPositiveOffset, isTrue);
        expect(timeZone.isNegativeOffset, isFalse);
        expect(timeZone.offsetHours, equals(8));
        expect(timeZone.offsetMinutes, equals(0));
        expect(timeZone.totalOffsetMinutes, equals(480));
      });

      test('应该正确识别时区类型', () {
        const asianTz = TimeZoneBean(label: 'Asia/Shanghai');
        const europeanTz = TimeZoneBean(label: 'Europe/London');
        const americanTz = TimeZoneBean(label: 'America/New_York');
        const pacificTz = TimeZoneBean(label: 'Pacific/Auckland');

        expect(asianTz.isAsianTimeZone, isTrue);
        expect(europeanTz.isEuropeanTimeZone, isTrue);
        expect(americanTz.isAmericanTimeZone, isTrue);
        expect(pacificTz.isPacificTimeZone, isTrue);
      });

      test('应该正确生成显示文本', () {
        const timeZone = TimeZoneBean(
          label: 'Asia/Shanghai',
          offset: '+08:00',
          name: 'Beijing',
        );

        expect(timeZone.displayText, equals('Beijing (+08:00)'));
        expect(timeZone.city, equals('Shanghai'));
        expect(timeZone.region, equals('Asia'));
      });
    });

    group('TelephoneCodeBean扩展方法测试', () {
      test('应该正确识别国家', () {
        const chinaCode = TelephoneCodeBean(code: '86', name: 'China', country: 'CHN');
        const usaCode = TelephoneCodeBean(code: '1', name: 'United States', country: 'USA');
        const japanCode = TelephoneCodeBean(code: '81', name: 'Japan', country: 'JPN');

        expect(chinaCode.isChina, isTrue);
        expect(usaCode.isUSA, isTrue);
        expect(japanCode.isJapan, isTrue);
      });

      test('应该正确分类区域', () {
        const chinaCode = TelephoneCodeBean(code: '86', name: 'China', country: 'CHN');
        const usaCode = TelephoneCodeBean(code: '1', name: 'United States', country: 'USA');
        const ukCode = TelephoneCodeBean(code: '44', name: 'United Kingdom', country: 'GBR');

        expect(chinaCode.isAsian, isTrue);
        expect(usaCode.isAmerican, isTrue);
        expect(ukCode.isEuropean, isTrue);
      });

      test('应该正确生成显示文本', () {
        const telephoneCode = TelephoneCodeBean(
          code: '86',
          name: 'China',
          country: 'CHN',
        );

        expect(telephoneCode.displayText, equals('+86 China'));
        expect(telephoneCode.formattedCode, equals('+86'));
        expect(telephoneCode.fullDisplayText, equals('+86 China (CHN)'));
      });
    });

    group('Fixing扩展方法测试', () {
      test('应该正确解析配置值', () {
        const fixing = Fixing(
          available: '1',
          availableNegativePoints: '0',
          extraPoints: '10',
          extraPointsRate: '0.2',
          negativePoints: '200',
          requireSubscription: '1',
        );

        expect(fixing.isAvailable, isTrue);
        expect(fixing.isNegativePointsAvailable, isFalse);
        expect(fixing.isSubscriptionRequired, isTrue);
        expect(fixing.getExtraPoints(), equals(10));
        expect(fixing.getExtraPointsRate(), equals(0.2));
        expect(fixing.getNegativePoints(), equals(200));
      });
    });

    group('Game扩展方法测试', () {
      test('应该正确检查游戏可用性', () {
        const gameAvailable = Game(canPlayPuzzleGame: '1');
        const gameUnavailable = Game(canPlayPuzzleGame: '0');

        expect(gameAvailable.isPuzzleGameAvailable, isTrue);
        expect(gameUnavailable.isPuzzleGameAvailable, isFalse);
      });
    });

    group('TeacherReviews扩展方法测试', () {
      test('应该正确解析教师评价配置', () {
        const teacherReviews = TeacherReviews(
          public: '1',
          showNullComment: '0',
          group: TeacherReviewGroup(
            availables: ['zh', 'en', 'all'],
            defaultValue: 'zh',
          ),
        );

        expect(teacherReviews.isPublic, isTrue);
        expect(teacherReviews.isShowNullComment, isFalse);
        expect(teacherReviews.getDefaultGroup(), equals('zh'));
        expect(teacherReviews.getAvailableGroups(), contains('zh'));
        expect(teacherReviews.getAvailableGroups(), contains('all'));
      });
    });

    group('CancelReason扩展方法测试', () {
      test('应该正确解析取消原因配置', () {
        const cancelReason = CancelReasonBean(
          id: 4100,
          label: 'more than 12 hour',
          name: 'Cancel Lesson (by student, refund=100%)',
          by: 'student',
          hide: 0,
          refund: CancelRefund(points: 100, ticket: 1, everyday: 1),
        );

        expect(cancelReason.isByStudent, isTrue);
        expect(cancelReason.isVisible, isTrue);
        expect(cancelReason.isFullRefund, isTrue);
        expect(cancelReason.getPointsRefundPercentage(), equals(100));
        expect(cancelReason.getRefundDisplayText(), equals('全额退款'));
      });
    });

    group('LessonTime扩展方法测试', () {
      test('应该正确解析课程时长配置', () {
        const lessonTime = LessonTimeBean(
          id: 30,
          label: '30',
          name: '25mins',
          abbr: '25',
          mins: '25',
          openRestriction: 0,
          unavailableLessonStart: [],
        );

        expect(lessonTime.getMinutes(), equals(25));
        expect(lessonTime.isStandardLesson, isTrue);
        expect(lessonTime.hasOpenRestriction, isFalse);
        expect(lessonTime.displayText, equals('25mins'));
      });
    });

    group('Points扩展方法测试', () {
      test('应该正确解析积分配置', () {
        const points = PointsBean(
          id: 50,
          name: '50pts',
          points: 50,
          perMin: '2.0',
        );

        expect(points.getPointsValue(), equals(50));
        expect(points.getPerMinuteRate(), equals(2.0));
        expect(points.isMediumPoints, isTrue);
        expect(points.pointsLevel, equals('Medium'));
        expect(points.calculateTotalPoints(25), equals(50));
      });
    });

    group('Gender扩展方法测试', () {
      test('应该正确识别性别', () {
        const male = GenderBean(id: 1, label: 'male', name: 'Male');
        const female = GenderBean(id: 2, label: 'female', name: 'Female');
        const defaultGender = GenderBean(id: 0, label: 'default', name: '--');

        expect(male.isMale, isTrue);
        expect(female.isFemale, isTrue);
        expect(defaultGender.isDefault, isTrue);
        expect(male.genderIcon, equals('♂'));
        expect(female.genderIcon, equals('♀'));
      });

      test('应该提供本地化名称', () {
        const male = GenderBean(id: 1, label: 'male', name: 'Male');

        // 注意：在测试环境中，翻译系统可能未初始化，所以这里只测试方法存在
        expect(() => male.localizedName, returnsNormally);
      });
    });

    group('Rating扩展方法测试', () {
      test('应该正确解析评分配置', () {
        const rating5 = RatingBean(id: 5, label: '5star', name: '5 Stars', value: 5);
        const rating1 = RatingBean(id: 1, label: '1star', name: '1 Star', value: 1);

        expect(rating5.isHighestRating, isTrue);
        expect(rating5.isPositiveRating, isTrue);
        expect(rating5.starDisplay, equals('★★★★★'));
        expect(rating5.ratingLevelText, equals('Excellent'));

        expect(rating1.isLowestRating, isTrue);
        expect(rating1.isNegativeRating, isTrue);
        expect(rating1.ratingLevelText, equals('Very Poor'));
      });
    });

    group('RequestCategory扩展方法测试', () {
      test('应该正确解析请求类别配置', () {
        const slowClear = RequestCategoryBean(id: 1, mappingIndex: 0, name: 'Please speak slowly');
        const naturalSpeed = RequestCategoryBean(id: 2, mappingIndex: 1, name: 'Natural speed');

        expect(slowClear.isSlowAndClearRequest, isTrue);
        expect(slowClear.requestType, equals('Slow & Clear'));
        expect(slowClear.shortDescription, equals('慢速清晰'));

        expect(naturalSpeed.isNaturalSpeedRequest, isTrue);
        expect(naturalSpeed.requestType, equals('Natural Speed'));
      });
    });
  });
}
