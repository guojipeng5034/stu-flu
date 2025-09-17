import 'dart:io';

import 'package:cptop/core/network/models/api_response.dart';
import 'package:cptop/features/user/data/models/change_password_request.dart';
import 'package:cptop/features/user/data/models/update_profile_request.dart';
import 'package:cptop/features/user/data/models/user_profile.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'user_api.g.dart';

/// 用户相关API服务
@RestApi()
abstract class UserApi {
  /// 工厂构造函数
  factory UserApi(Dio dio, {String? baseUrl}) = _UserApi;

  /// 获取当前用户信息
  @GET("/users/me")
  Future<ApiResponse<UserProfile>> getCurrentUser(
      @Header("token") String token);

  /// 获取指定用户信息
  @GET("/users/{userId}")
  Future<ApiResponse<UserProfile>> getUserById(
      @Path("userId") String userId, @Header("token") String token);

  /// 更新用户信息
  @PUT("/users/me")
  Future<ApiResponse<UserProfile>> updateProfile(
      @Body() UpdateProfileRequest request, @Header("token") String token);

  /// 更新用户头像
  @MultiPart()
  @POST("/users/me/avatar")
  Future<ApiResponse<UserProfile>> updateAvatar(
      @Part() File file, @Header("token") String token);

  /// 修改密码
  @PUT("/users/me/password")
  Future<ApiResponse<void>> changePassword(
      @Body() ChangePasswordRequest request, @Header("token") String token);

  /// 获取用户列表
  @GET("/users")
  Future<ApiResponse<List<UserProfile>>> getUsers(@Query("page") int page,
      @Query("page_size") int pageSize, @Header("token") String token);

  /// 删除用户
  @DELETE("/users/{userId}")
  Future<ApiResponse<void>> deleteUser(
      @Path("userId") String userId, @Header("token") String token);
}
