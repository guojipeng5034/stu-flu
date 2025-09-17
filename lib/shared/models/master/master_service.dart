import 'dart:convert';
import 'package:flutter/services.dart';

// 导入所有模块
import 'site_config/site_config.dart';
import 'timezone/timezone.dart';
import 'telephone_code/telephone_code.dart';
import 'cancel_reason/cancel_reason.dart';
import 'lesson_time/lesson_time.dart';
import 'gender/gender.dart';
import 'points/points.dart';
import 'rating/rating.dart';
import 'request_category/request_category.dart';

/// Master配置管理服务
/// 
/// 对应Android项目中的Master类功能，提供站点配置、时区、电话区号等管理
class MasterService {
  static MasterService? _instance;
  static MasterService get instance => _instance ??= MasterService._();
  
  MasterService._();

  MasterConfig? _masterConfig;
  List<TimeZoneBean>? _timeZones;
  List<TelephoneCodeBean>? _telephoneCodes;
  List<CancelReasonBean>? _cancelReasons;
  List<LessonTimeBean>? _lessonTimes;
  List<GenderBean>? _genders;
  List<PointsBean>? _points;
  List<RatingBean>? _ratings;
  List<RequestCategoryBean>? _requestCategories;

  /// 初始化Master配置
  Future<void> initialize() async {
    await Future.wait([
      _loadSiteConfig(),
      _loadTimeZones(),
      _loadTelephoneCodes(),
      _loadCancelReasons(),
      _loadLessonTimes(),
      _loadGenders(),
      _loadPoints(),
      _loadRatings(),
      _loadRequestCategories(),
    ]);
  }

  /// 加载站点配置
  Future<void> _loadSiteConfig() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/master/site_config.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      _masterConfig = MasterConfig.fromJson(jsonData);
    } catch (e) {
      print('Error loading site config: $e');
      _masterConfig = const MasterConfig(data: []);
    }
  }

  /// 加载时区配置
  Future<void> _loadTimeZones() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/master/timezone.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final timeZoneList = TimeZoneList.fromJson(jsonData);
      _timeZones = timeZoneList.timeZone ?? [];
    } catch (e) {
      print('Error loading timezone config: $e');
      _timeZones = [];
    }
  }

  /// 加载电话区号配置
  Future<void> _loadTelephoneCodes() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/master/telephone_code.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final telephoneList = TelephoneCodeList.fromJson(jsonData);
      _telephoneCodes = telephoneList.data ?? [];
    } catch (e) {
      print('Error loading telephone code config: $e');
      _telephoneCodes = [];
    }
  }

  /// 加载取消原因配置
  Future<void> _loadCancelReasons() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/master/cancel_reason.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final cancelReasonList = CancelReasonList.fromJson(jsonData);
      _cancelReasons = cancelReasonList.data ?? [];
    } catch (e) {
      print('Error loading cancel reason config: $e');
      _cancelReasons = [];
    }
  }

  /// 加载课程时长配置
  Future<void> _loadLessonTimes() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/master/lesson_time.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final lessonTimeList = LessonTimeList.fromJson(jsonData);
      _lessonTimes = lessonTimeList.data ?? [];
    } catch (e) {
      print('Error loading lesson time config: $e');
      _lessonTimes = [];
    }
  }

  /// 加载性别配置
  Future<void> _loadGenders() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/master/gender.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final genderList = GenderList.fromJson(jsonData);
      _genders = genderList.data ?? [];
    } catch (e) {
      print('Error loading gender config: $e');
      _genders = [];
    }
  }

  /// 加载积分配置
  Future<void> _loadPoints() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/master/points.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final pointsList = PointsList.fromJson(jsonData);
      _points = pointsList.data ?? [];
    } catch (e) {
      print('Error loading points config: $e');
      _points = [];
    }
  }

  /// 加载评分配置
  Future<void> _loadRatings() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/master/rating.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final ratingList = RatingList.fromJson(jsonData);
      _ratings = ratingList.data ?? [];
    } catch (e) {
      print('Error loading rating config: $e');
      _ratings = [];
    }
  }

  /// 加载请求类别配置
  Future<void> _loadRequestCategories() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/master/request_category.json');
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      final requestCategoryList = RequestCategoryList.fromJson(jsonData);
      _requestCategories = requestCategoryList.data ?? [];
    } catch (e) {
      print('Error loading request category config: $e');
      _requestCategories = [];
    }
  }

  /// 获取所有站点配置
  List<SiteConfig> get siteConfigs => _masterConfig?.data ?? [];

  /// 根据站点ID获取站点配置
  SiteConfig? getSiteConfigById(int siteId) {
    try {
      return siteConfigs.firstWhere((config) => config.siteId == siteId);
    } catch (e) {
      return null;
    }
  }




  /// 获取默认站点配置（第一个配置）
  SiteConfig? get defaultSiteConfig {
    return siteConfigs.isNotEmpty ? siteConfigs.first : null;
  }

  /// 获取所有时区
  List<TimeZoneBean> get timeZones => _timeZones ?? [];

  /// 根据标签获取时区
  TimeZoneBean? getTimeZoneByLabel(String label) {
    try {
      return timeZones.firstWhere((tz) => tz.label == label);
    } catch (e) {
      return null;
    }
  }

  /// 根据ID获取时区
  TimeZoneBean? getTimeZoneById(int id) {
    try {
      return timeZones.firstWhere((tz) => tz.id == id);
    } catch (e) {
      return null;
    }
  }

  /// 获取所有电话区号
  List<TelephoneCodeBean> get telephoneCodes => _telephoneCodes ?? [];

  /// 根据区号获取电话区号信息
  TelephoneCodeBean? getTelephoneCodeByCode(String code) {
    try {
      return telephoneCodes.firstWhere((tc) => tc.code == code);
    } catch (e) {
      return null;
    }
  }

  /// 根据国家名称获取电话区号信息
  TelephoneCodeBean? getTelephoneCodeByCountry(String country) {
    try {
      return telephoneCodes.firstWhere((tc) => tc.country == country);
    } catch (e) {
      return null;
    }
  }

  /// 搜索电话区号
  List<TelephoneCodeBean> searchTelephoneCodes(String query) {
    if (query.isEmpty) return telephoneCodes;

    final lowerQuery = query.toLowerCase();
    return telephoneCodes.where((tc) {
      final code = tc.code?.toLowerCase() ?? '';
      final name = tc.name?.toLowerCase() ?? '';
      final country = tc.country?.toLowerCase() ?? '';
      
      return code.contains(lowerQuery) || 
             name.contains(lowerQuery) || 
             country.contains(lowerQuery);
    }).toList();
  }

  /// 获取所有取消原因
  List<CancelReasonBean> get cancelReasons => _cancelReasons ?? [];

  /// 根据ID获取取消原因
  CancelReasonBean? getCancelReasonById(int id) {
    try {
      return cancelReasons.firstWhere((cr) => cr.id == id);
    } catch (e) {
      return null;
    }
  }

  /// 根据标签获取取消原因
  CancelReasonBean? getCancelReasonByLabel(String label) {
    try {
      return cancelReasons.firstWhere((cr) => cr.label == label);
    } catch (e) {
      return null;
    }
  }


  /// 获取所有课程时长
  List<LessonTimeBean> get lessonTimes => _lessonTimes ?? [];

  /// 根据ID获取课程时长
  LessonTimeBean? getLessonTimeById(int id) {
    try {
      return lessonTimes.firstWhere((lt) => lt.id == id);
    } catch (e) {
      return null;
    }
  }

  /// 根据标签获取课程时长
  LessonTimeBean? getLessonTimeByLabel(String label) {
    try {
      return lessonTimes.firstWhere((lt) => lt.label == label);
    } catch (e) {
      return null;
    }
  }

  /// 获取所有性别选项
  List<GenderBean> get genders => _genders ?? [];

  /// 根据ID获取性别
  GenderBean? getGenderById(int id) {
    try {
      return genders.firstWhere((g) => g.id == id);
    } catch (e) {
      return null;
    }
  }

  /// 根据标签获取性别
  GenderBean? getGenderByLabel(String label) {
    try {
      return genders.firstWhere((g) => g.label == label);
    } catch (e) {
      return null;
    }
  }

  /// 获取所有积分选项
  List<PointsBean> get points => _points ?? [];

  /// 根据ID获取积分
  PointsBean? getPointsById(int id) {
    try {
      return points.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  /// 根据积分值获取积分配置
  PointsBean? getPointsByValue(int pointsValue) {
    try {
      return points.firstWhere((p) => p.points == pointsValue);
    } catch (e) {
      return null;
    }
  }


  /// 获取所有评分选项
  List<RatingBean> get ratings => _ratings ?? [];

  /// 根据ID获取评分
  RatingBean? getRatingById(int id) {
    try {
      return ratings.firstWhere((r) => r.id == id);
    } catch (e) {
      return null;
    }
  }

  /// 根据评分值获取评分配置
  RatingBean? getRatingByValue(int value) {
    try {
      return ratings.firstWhere((r) => r.value == value);
    } catch (e) {
      return null;
    }
  }

  /// 获取所有请求类别
  List<RequestCategoryBean> get requestCategories => _requestCategories ?? [];

  /// 根据ID获取请求类别
  RequestCategoryBean? getRequestCategoryById(int id) {
    try {
      return requestCategories.firstWhere((rc) => rc.id == id);
    } catch (e) {
      return null;
    }
  }

  /// 根据映射索引获取请求类别
  RequestCategoryBean? getRequestCategoryByMappingIndex(int mappingIndex) {
    try {
      return requestCategories.firstWhere((rc) => rc.mappingIndex == mappingIndex);
    } catch (e) {
      return null;
    }
  }



  /// 检查是否已初始化
  bool get isInitialized => _masterConfig != null && _timeZones != null && _telephoneCodes != null &&
      _cancelReasons != null && _lessonTimes != null && _genders != null &&
      _points != null && _ratings != null && _requestCategories != null;

  /// 重新加载配置
  Future<void> reload() async {
    _masterConfig = null;
    _timeZones = null;
    _telephoneCodes = null;
    _cancelReasons = null;
    _lessonTimes = null;
    _genders = null;
    _points = null;
    _ratings = null;
    _requestCategories = null;
    await initialize();
  }

  /// 清除缓存
  void clearCache() {
    _masterConfig = null;
    _timeZones = null;
    _telephoneCodes = null;
    _cancelReasons = null;
    _lessonTimes = null;
    _genders = null;
    _points = null;
    _ratings = null;
    _requestCategories = null;
  }
}

