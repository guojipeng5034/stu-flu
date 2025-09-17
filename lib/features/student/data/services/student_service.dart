import 'package:cptop/core/logger/index.dart';
// import 'package:dio/dio.dart'; // Dio import removed as it's no longer directly used

import '../../../../core/network/models/api_response.dart';
import '../models/student.dart';
import '../api/student_api.dart';

/// 学生服务类
class StudentService {
  final StudentApi _studentApi;

  /// 构造函数
  StudentService(this._studentApi); // Constructor updated to accept StudentApi directly

  /// 获取当前登录学生信息
  Future<ApiResponse<StudentData>> getCurrentStudent() async {
    try {
      // 尝试获取当前登录学生信息
      return await _studentApi.getCurrentStudent();
    } catch (e) {
      Log.e("获取学生信息失败", e);
      // 处理异常，返回一个错误响应
      return ApiResponse.error("获取学生信息失败：${e.toString()}");
    }
  }
}
