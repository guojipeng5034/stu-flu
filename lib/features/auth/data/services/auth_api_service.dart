import 'package:cptop/core/network/models/api_response.dart';
import 'package:dio/dio.dart';

import '../models/send_mail_verify_code_req_vo.dart';
import '../models/send_sms_verify_code_req_vo.dart';
import '../models/stu_auth_resp_vo.dart';
import '../models/stu_forget_password_req_vo.dart';
import '../models/stu_forget_password_resp_vo.dart';
import '../models/stu_mobile_code_auth_req_vo.dart';
import '../models/stu_password_auth_req_vo.dart';
import '../models/stu_update_password_req_vo.dart';
import '../models/stu_update_password_resp_vo.dart';

class AuthApiService {
  final Dio dio;

  AuthApiService(this.dio);

  /// 发送短信验证码
  Future<ApiResponse<bool>> sendSmsVerifyCode(
      SendSmsVerifyCodeReqVO req) async {
    final response = await dio.post(
      '/auth/verifyCode/sendSms',
      data: req.toJson(),
    );
    return ApiResponse<bool>.fromJson(
      response.data,
      (data) => data == true,
    );
  }

  /// 发送邮箱验证码
  Future<ApiResponse<bool>> sendMailVerifyCode(
      SendMailVerifyCodeReqVO req) async {
    final response = await dio.post(
      '/auth/verifyCode/sendMail',
      data: req.toJson(),
    );
    return ApiResponse<bool>.fromJson(
      response.data,
      (data) => data == true,
    );
  }

  /// 学生手机号验证码登录
  Future<ApiResponse<StuAuthRespVO>> mobileCodeLogin(
      StuMobileCodeAuthReqVO req) async {
    final response = await dio.post(
      '/auth/student/auth/mobile_code',
      data: req.toJson(),
    );
    return ApiResponse<StuAuthRespVO>.fromJson(
      response.data,
      (json) => StuAuthRespVO.fromJson(json),
    );
  }

  /// 学生密码登录
  Future<ApiResponse<StuAuthRespVO>> passwordLogin(
      StuPasswordAuthReqVO req) async {
    final response = await dio.post(
      '/auth/student/auth/password',
      data: req.toJson(),
    );
    return ApiResponse<StuAuthRespVO>.fromJson(
      response.data,
      (json) => StuAuthRespVO.fromJson(json),
    );
  }

  /// 忘记密码-获取账号列表
  Future<ApiResponse<StuForgetPasswordRespVO>> forgetPassword(
      StuForgetPasswordReqVO req) async {
    final response = await dio.post(
      '/auth/student/auth/forget_password',
      data: req.toJson(),
    );
    return ApiResponse<StuForgetPasswordRespVO>.fromJson(
      response.data,
      (json) => StuForgetPasswordRespVO.fromJson(json),
    );
  }

  /// 忘记密码-修改密码
  Future<ApiResponse<StuUpdatePasswordRespVO>> updatePassword(
      StuUpdatePasswordReqVO req) async {
    final response = await dio.post(
      '/auth/student/auth/update_password',
      data: req.toJson(),
    );
    return ApiResponse<StuUpdatePasswordRespVO>.fromJson(
      response.data,
      (json) => StuUpdatePasswordRespVO.fromJson(json),
    );
  }

  /// 临时令牌登录
  Future<ApiResponse<StuAuthRespVO>> tempTokenLogin({
    required String tempToken,
    int? socialType,
    String? socialOpenid,
  }) async {
    final data = {
      'tempToken': tempToken,
      if (socialType != null) 'socialType': socialType,
      if (socialOpenid != null) 'socialOpenid': socialOpenid,
    };
    final response = await dio.post(
      '/auth/student/auth/temp_token',
      data: data,
    );
    return ApiResponse<StuAuthRespVO>.fromJson(
      response.data,
      (json) => StuAuthRespVO.fromJson(json),
    );
  }
}
