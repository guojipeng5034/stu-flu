import '../../../../shared/models/network/common_result.dart';
import 'student_profile_resp_vo.dart';

/// 学生资料API响应类型定义
typedef StudentProfileApiResponse = CommonResult<StudentProfileRespVO>;

/// 学生资料API响应扩展方法
extension StudentProfileApiResponseExtension on StudentProfileApiResponse {
  /// 获取学生资料数据，如果请求失败则返回null
  StudentProfileRespVO? get profile => isSuccess ? data : null;

  /// 获取错误消息
  String get errorMessage => msg ?? '请求失败';
}
