import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/models/api_response.dart';
import '../models/student.dart';

part 'student_api.g.dart';

/// 学生相关API服务
@RestApi()
abstract class StudentApi {
  /// 工厂构造函数
  factory StudentApi(Dio dio, {String? baseUrl}) = _StudentApi;

  /// 获取当前登录学生信息
  @GET("https://mock.apipost.net/mock/2a24920ca865001/k/api/app/1/student/find?apipost_id=52e65")
  Future<ApiResponse<StudentData>> getCurrentStudent();
}
