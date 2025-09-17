import 'dart:convert';

import '../../../../shared/models/network/common_result.dart';
import '../models/index.dart';

/// 学生资料仓库接口
abstract class StudentProfileRepository {
  /// 获取学生资料
  Future<StudentProfileApiResponse> getProfile();

  /// 保存学生资料
  Future<bool> saveProfile(StudentProfileSaveReqVO request);
}

/// 学生资料仓库实现示例
class StudentProfileRepositoryImpl implements StudentProfileRepository {
  @override
  Future<StudentProfileApiResponse> getProfile() async {
    // TODO: 实现实际的API调用
    // 这里是示例响应数据，基于接口文档的响应示例
    final mockResponse = {
      "code": 0,
      "data": {
        "siteId": 101,
        "loginId": "cptop",
        "nickname": "jacky",
        "firstName": "michael",
        "middleName": "jeffrey",
        "lastName": "jordan",
        "fullName": "michael jeffrey jordan",
        "email": "cptop@iocoder.cn",
        "mobile": "15601691300",
        "genderId": 1,
        "imageFile": "https://www.iocoder.cn/xxx.png",
        "uid": "",
        "createTime": "",
        "hasPasswdFlag": true,
        "birthday": "",
        "parentFlag": true,
        "parentStudentId": 0,
        "socialUsers": [
          {
            "type": 10,
            "openid": "IPRmJ0wvBptiPIlGEZiPewGwiEiE",
            "nickname": "",
            "avatar": ""
          }
        ],
        "detail": {
          "firstName": "三",
          "middleName": "",
          "lastName": "李",
          "fullName": "李三"
        },
        "isNeedFill": true
      },
      "msg": ""
    };

    // 手动构建响应对象
    return CommonResult<StudentProfileRespVO>(
      code: mockResponse['code'] as int,
      data: mockResponse['data'] != null
          ? StudentProfileRespVO.fromJson(jsonEncode(mockResponse['data']))
          : null,
      msg: mockResponse['msg'] as String?,
    );
  }

  @override
  Future<bool> saveProfile(StudentProfileSaveReqVO request) async {
    // TODO: 实现实际的API调用
    return true;
  }
}
