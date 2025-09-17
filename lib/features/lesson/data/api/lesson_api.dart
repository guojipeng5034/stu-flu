import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/models/api_response.dart';
import '../../../../shared/models/network/lesson/index.dart';
import '../models/lesson_list_api.dart';

part 'lesson_api.g.dart';

/// 课程相关API服务
@RestApi()
abstract class LessonApi {
  /// 工厂构造函数
  factory LessonApi(Dio dio, {String? baseUrl}) = _LessonApi;

  /// 📋 获取课程列表 - 2小时缓存，先加载缓存
  /// [page] 页码，从1开始
  /// [limit] 每页数量，默认20
  @GET(
      "https://mock.apipost.net/mock/2a24920ca865001/k/api/app/1/lesson/list?apipost_id=4db20")
  // @Extra({"cache_config": "list_data"})

  @Extra({
    "cache_time": "1h",           // 🆕 支持简洁时间格式
    "strategy": "cache_remote",    // ✅ 保持原有策略配置
  })
  Future<ApiResponse<LessonListApi>> getLessons({
    @Query("page") int page = 1,
    @Query("limit") int limit = 20,
  });

  /// 📄 获取课程详情 - 30分钟缓存，先加载缓存
  /// [lessonId] 课程ID
  @GET("/lessons/{lessonId}")
  @Extra({"cache_config": "detail_data"})
  Future<ApiResponse<Lesson>> getLessonDetail(
    @Path("lessonId") int lessonId,
  );

  /// 👤 获取用户学习进度 - 先请求网络
  @GET("/user/progress")
  @Extra({"cache_config": "user_data"})
  Future<ApiResponse<dynamic>> getUserProgress();

  /// ⚡ 获取实时课程状态 - 先请求网络
  @GET("/lessons/{lessonId}/status")
  @Extra({"cache_config": "realtime_data"})
  Future<ApiResponse<dynamic>> getLessonStatus(
    @Path("lessonId") int lessonId,
  );

  /// ⚙️ 获取课程分类 - 配置数据缓存
  @GET("/lessons/categories")
  @Extra({"cache_config": "config_data"})
  Future<ApiResponse<dynamic>> getCategories();

  /// 🔄 获取热门课程 - 双重缓存
  @GET("/lessons/hot")
  @Extra({"cache_config": "cache_remote"})
  Future<ApiResponse<dynamic>> getHotLessons();

  /// 🔄 获取推荐课程 - 智能双重缓存
  @GET("/lessons/recommended")
  @Extra({"cache_config": "cache_remote_distinct"})
  Future<ApiResponse<dynamic>> getRecommendedLessons();

  /// 🔒 离线模式 - 仅读取缓存
  @GET("/lessons/offline")
  @Extra({"cache_config": "only_cache"})
  Future<ApiResponse<dynamic>> getOfflineLessons();

  /// 🔄 强制刷新 - 仅网络请求
  @GET("/lessons/refresh")
  @Extra({"cache_config": "only_remote"})
  Future<ApiResponse<dynamic>> getRefreshLessons();

  /// 🚫 提交课程评价 - 不缓存
  @POST("/lessons/{lessonId}/review")
  @Extra({"cache_config": "no_cache"})
  Future<ApiResponse<dynamic>> submitReview(
    @Path("lessonId") int lessonId,
    @Body() Map<String, dynamic> review,
  );
}
