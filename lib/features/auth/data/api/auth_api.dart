import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/models/api_response.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/register_request.dart';
import '../models/register_response.dart';

part 'auth_api.g.dart';

/// 认证相关API服务
@RestApi()
abstract class AuthApi {
  /// 工厂构造函数
  factory AuthApi(Dio dio, {String? baseUrl}) = _AuthApi;

  /// 用户登录
  //@POST("/auth/login")
  @POST("https://gateway-dev.52cebu.com/auth/oauth2/token")
  //添加header
  @Headers({
    "Accept": "application/json, text/plain, */*",
    "Authorization": "Basic d2ViYXBwOndlYmFwcFNlY3VyaXR5",
    "Content-Type":"application/x-www-form-urlencoded",
    "Signature":"APP",
    "Token":"cee43bd23972788874ba39279c7cbb7471572180bcdd2042518b30c3c4bd4dee1de1688ba6570662"
  })
  Future<ApiResponse<LoginResponse>> login(@Body() LoginRequest request);

  /// 用户注册
  @POST("/auth/register")
  Future<ApiResponse<RegisterResponse>> register(
      @Body() RegisterRequest request);

  /// 刷新访问令牌
  @POST("/auth/refresh")
  Future<ApiResponse<LoginResponse>> refreshToken(
      @Body() Map<String, String> refreshToken);

  /// 退出登录
  @POST("/auth/logout")
  Future<ApiResponse<void>> logout(@Header("token") String token);

  /// 发送重置密码邮件
  @POST("/auth/forgot-password")
  Future<ApiResponse<void>> forgotPassword(@Body() Map<String, String> email);

  /// 重置密码
  @POST("/auth/reset-password")
  Future<ApiResponse<void>> resetPassword(@Body() Map<String, String> data);

  /// 验证邮箱
  @GET("/auth/verify-email")
  Future<ApiResponse<void>> verifyEmail(@Query("token") String token);
}
