# StudentInfoVO 模型修复说明

## 问题描述
在测试登录功能时，出现了以下错误：
```
MapperException: Failed to decode (StuAuthRespVO).students(List<StudentInfoVO>?).item(StudentInfoVO).email: Parameter email is missing.
```

## 问题原因
`StudentInfoVO` 模型中的某些字段被定义为必需字段（`required`），但后端实际返回的数据中这些字段为 `null`。

## 后端返回的实际数据
```json
{
  "email": null,
  "parentFlag": null,
  "parentStudentId": null,
  "fullName": null,
  "nickname": null,
  "imageFile": null,
  "genderId": null
}
```

## 修复内容

### 1. 修改 StudentInfoVO 模型字段类型
将以下字段从必需字段改为可空字段：

**修改前：**
```dart
final String email;
final bool parentFlag;
final int parentStudentId;
final String fullName;
final String nickname;
final int genderId;
```

**修改后：**
```dart
final String? email; // 修改：可能为null
final bool? parentFlag; // 修改：可能为null
final int? parentStudentId; // 修改：可能为null
final String? fullName; // 修改：可能为null
final String? nickname; // 修改：可能为null
final int? genderId; // 修改：可能为null
```

### 2. 修改构造函数参数
相应地将构造函数中的参数也改为可空：

**修改前：**
```dart
StudentInfoVO({
  required this.email,
  required this.parentFlag,
  required this.parentStudentId,
  required this.fullName,
  required this.nickname,
  required this.genderId,
  // ...
});
```

**修改后：**
```dart
StudentInfoVO({
  this.email, // 修改：可空
  this.parentFlag, // 修改：可空
  this.parentStudentId, // 修改：可空
  this.fullName, // 修改：可空
  this.nickname, // 修改：可空
  this.genderId, // 修改：可空
  // ...
});
```

### 3. 修复相关使用代码
在 `AccountSelectPage` 中修复了对 `fullName` 字段的使用：

**修改前：**
```dart
name: account.fullName.isNotEmpty
    ? account.fullName
    : '未设置姓名',
```

**修改后：**
```dart
name: (account.fullName?.isNotEmpty == true)
    ? account.fullName!
    : '未设置姓名',
```

## 影响范围
- **文件**: `lib/features/auth/data/models/stu_auth_resp_vo.dart`
- **文件**: `lib/features/auth/ui/pages/account_select_page.dart`
- **功能**: 登录响应数据解析、账号选择页面显示

## 技术细节
1. **空安全处理**: 使用 `?.` 操作符进行安全访问
2. **默认值处理**: 在显示层提供合适的默认值（如"未设置姓名"）
3. **代码生成**: 重新运行 `dart run build_runner build` 生成新的 mapper 文件

## 测试建议
1. 测试登录流程，确保不再出现字段缺失错误
2. 测试多账号选择页面，确保能正确显示账号信息
3. 测试各种数据情况（字段为null、空字符串等）

## 注意事项
- 这些字段现在都是可空的，在使用时需要进行空检查
- 如果后端API有变更，可能需要相应调整字段的可空性
- 建议与后端确认这些字段的实际业务含义和数据规范