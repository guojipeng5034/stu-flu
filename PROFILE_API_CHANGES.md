# 学生资料接口变更说明

## 概述
根据提供的接口文档，为 `/app-api/study/profile/get` 接口创建了完整的数据模型和响应处理。

## 新增文件

### 1. 数据模型文件
- `lib/features/auth/data/models/student_profile_resp_vo.dart` - 学生资料响应模型
- `lib/features/auth/data/models/student_profile_api_response.dart` - API响应类型定义
- `lib/shared/models/network/common_result.dart` - 通用API响应包装类

### 2. 仓库文件
- `lib/features/auth/data/repositories/student_profile_repository.dart` - 学生资料仓库接口和实现

### 3. 示例文件
- `lib/features/auth/ui/pages/profile_example_page.dart` - 使用示例页面

## 数据模型结构

### StudentProfileRespVO
根据接口文档创建的主要响应模型，包含以下字段：
- `siteId` - 站点ID
- `loginId` - 用户账号
- `nickname` - 用户昵称
- `firstName/middleName/lastName` - 英文姓名字段
- `fullName` - 组合后的完整姓名
- `email` - 用户邮箱
- `mobile` - 手机号码
- `genderId` - 用户性别
- `imageFile` - 用户头像
- `uid` - 用户ID
- `createTime` - 创建时间
- `hasPasswdFlag` - 是否有密码
- `birthday` - 生日
- `parentFlag` - 是否家庭主账号
- `parentStudentId` - 家庭主账号学生ID
- `socialUsers` - 社交用户列表
- `detail` - 学生详细信息
- `isNeedFill` - 是否需要完善资料

### SocialUser
社交用户信息模型：
- `type` - 社交平台类型
- `openid` - 社交用户openid
- `nickname` - 社交用户昵称
- `avatar` - 社交用户头像

### StudentDetail
学生详细信息模型：
- `firstName` - 名字（中文名写入此字段）
- `middleName` - 中间名
- `lastName` - 姓氏
- `fullName` - 组合后的名字

### CommonResult<T>
通用API响应包装类：
- `code` - 响应状态码
- `data` - 响应数据
- `msg` - 响应消息
- `isSuccess` - 判断请求是否成功的便捷属性

## 使用方式

### 1. 基本用法
```dart
final repository = StudentProfileRepositoryImpl();
final response = await repository.getProfile();

if (response.isSuccess) {
  final profile = response.profile;
  print('用户昵称: ${profile?.nickname}');
} else {
  print('错误: ${response.errorMessage}');
}
```

### 2. 类型安全的响应处理
```dart
typedef StudentProfileApiResponse = CommonResult<StudentProfileRespVO>;

extension StudentProfileApiResponseExtension on StudentProfileApiResponse {
  StudentProfileRespVO? get profile => isSuccess ? data : null;
  String get errorMessage => msg ?? '请求失败';
}
```

## 技术特性

1. **类型安全**: 使用 `dart_mappable` 提供完整的类型安全和序列化支持
2. **空安全**: 所有可选字段都正确标记为可空类型
3. **扩展方法**: 为API响应提供便捷的访问方法
4. **代码生成**: 自动生成序列化/反序列化代码
5. **文档完整**: 所有字段都有详细的中文注释

## 接口响应示例
```json
{
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
    "hasPasswdFlag": true,
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
}
```

## 注意事项

1. 所有模型都使用 `dart_mappable` 进行序列化，需要运行 `dart run build_runner build` 生成相关代码
2. `CommonResult` 是通用的响应包装类，可以在其他接口中复用
3. 示例仓库实现使用了模拟数据，实际使用时需要替换为真实的API调用
4. 所有字段都根据接口文档进行了准确的类型定义和注释