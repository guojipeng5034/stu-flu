import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../models/student_profile_save_req_vo.dart';
import '../models/suggest_resp_vo.dart';

class ProfileService {
  final Dio dio;
  ProfileService(this.dio);

  /// 完善学生信息
  Future<Map<String, dynamic>> updateProfile(
      StudentProfileSaveReqVO req) async {
    final response = await dio.post(
      '/app-api/study/profile/fill',
      data: req.toJson(),
      options: Options(contentType: 'application/json'),
    );
    return response.data as Map<String, dynamic>;
  }

  /// 获取学生信息
  Future<Map<String, dynamic>> getProfile() async {
    final response = await dio.get('/app-api/study/profile/get');
    return response.data as Map<String, dynamic>;
  }

  /// 获取推荐英文名
  Future<List<String>> fetchRecommendedNicknames(
      {required int genderId}) async {
    final resp = await dio.get(
      '/app-api/study/sys/nicknames',
      queryParameters: {'type': genderId.toString()},
      options: Options(contentType: 'application/x-www-form-urlencoded'),
    );
    final result = CommonResultListSuggestRespVO.fromJson(resp.data);
    if (result.code == 0) {
      return result.data.map((e) => e.nickname).toList();
    } else {
      throw Exception(result.msg.isNotEmpty ? result.msg : '获取推荐英文名失败');
    }
  }

  /// 上传文件
  Future<String> uploadFile(XFile file, {String? fileName}) async {
    MultipartFile multipartFile;

    if (kIsWeb) {
      // Web平台使用字节数据
      final bytes = await file.readAsBytes();
      multipartFile = MultipartFile.fromBytes(
        bytes,
        filename: fileName ?? file.name,
      );
    } else {
      // 移动端使用文件路径
      multipartFile = await MultipartFile.fromFile(
        file.path,
        filename: fileName ?? file.name,
      );
    }

    final formData = FormData.fromMap({
      'file': multipartFile,
    });

    final response = await dio.post(
      '/app-api/study/sys/file/upload',
      data: formData,
      queryParameters: fileName != null ? {'path': fileName} : null,
      options: Options(contentType: 'multipart/form-data'),
    );

    final result = response.data as Map<String, dynamic>;
    if (result['code'] == 0) {
      return result['data'] as String;
    } else {
      throw Exception(result['msg'] ?? '文件上传失败');
    }
  }
}
