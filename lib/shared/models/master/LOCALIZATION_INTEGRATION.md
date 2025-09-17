# Master配置多语言集成

## 🌍 概述

Master配置模块已成功集成到项目的多语言系统中，将原本硬编码的多语言文本迁移到ARB文件中，并通过翻译系统统一管理。

## 📋 集成内容

### 1. 新增的翻译键值

#### 性别相关
- `masterGenderMale`: 男性
- `masterGenderFemale`: 女性  
- `masterGenderUnspecified`: 未指定

#### 评分相关
- `masterRatingExcellent`: 优秀
- `masterRatingGood`: 良好
- `masterRatingAverage`: 一般
- `masterRatingPoor`: 较差
- `masterRatingVeryPoor`: 很差
- `masterRatingNoRating`: 无评分

#### 请求类别相关
- `masterRequestSlowClear`: 慢速清晰
- `masterRequestNaturalSpeed`: 自然语速
- `masterRequestStrictTeaching`: 严格教学
- `masterRequestFreeConversation`: 自由对话
- `masterRequestStrictCurriculum`: 严格按课程

#### 取消原因相关
- `masterCancelByStudent`: 学生取消
- `masterCancelByTeacher`: 教师取消
- `masterCancelBySystem`: 系统取消
- `masterRefundFull`: 全额退款
- `masterRefundPartial`: 部分退款
- `masterRefundNone`: 无退款
- `masterRefundPercentage`: {percentage}%退款

#### 积分相关
- `masterPointsFree`: 免费课程
- `masterPointsEconomical`: 经济实惠
- `masterPointsStandard`: 标准价格
- `masterPointsPremium`: 高级课程

#### 课程时长相关
- `masterLessonShort`: 短课程
- `masterLessonStandard`: 标准课程
- `masterLessonLong`: 长课程
- `masterLessonExtraLong`: 超长课程

### 2. 支持的语言

| 语言 | 代码 | 文件 | 状态 |
|------|------|------|------|
| 英语 | en | app_en.arb | ✅ 完成 |
| 中文 | zh | app_zh.arb | ✅ 完成 |
| 日语 | ja | app_ja.arb | ✅ 完成 |
| 韩语 | ko | app_ko.arb | ✅ 完成 |

## 🛠️ 技术实现

### 1. 翻译工具类

创建了 `MasterTranslations` 工具类，提供统一的翻译接口：

```dart
// 获取性别本地化名称
String genderName = MasterTranslations.getGenderName('male');

// 获取评分等级文本
String ratingText = MasterTranslations.getRatingLevelText(5);

// 获取退款描述
String refundText = MasterTranslations.getRefundDisplayText(100);
```

### 2. 扩展方法更新

所有相关的扩展方法都已更新为使用翻译系统：

```dart
// 性别扩展
extension GenderBeanExtensions on GenderBean {
  String get localizedName => MasterTranslations.getGenderName(label);
}

// 评分扩展
extension RatingBeanExtensions on RatingBean {
  String get ratingLevelText => MasterTranslations.getRatingLevelText(getRatingValue());
}

// 请求类别扩展
extension RequestCategoryBeanExtensions on RequestCategoryBean {
  String get requestType => MasterTranslations.getRequestTypeText(getMappingIndex());
}
```

### 3. 向后兼容

为了保持向后兼容性，旧的本地化方法被标记为 `@Deprecated`：

```dart
@Deprecated('Use localizedName instead')
String getLocalizedName(String locale) {
  return localizedName;
}
```

## 🚀 使用方法

### 1. 基本使用

```dart
// 获取性别的本地化名称
final gender = masterService.getGenderByLabel('male');
print(gender?.localizedName); // 输出：男性（中文）/ Male（英文）

// 获取评分的本地化文本
final rating = masterService.getRatingByValue(5);
print(rating?.ratingLevelText); // 输出：优秀（中文）/ Excellent（英文）

// 获取请求类型的本地化文本
final request = masterService.getRequestCategoryByMappingIndex(0);
print(request?.requestType); // 输出：慢速清晰（中文）/ Slow & Clear（英文）
```

### 2. 退款描述

```dart
final cancelReason = masterService.getCancelReasonById(4100);
print(cancelReason?.getRefundDisplayText()); // 输出：全额退款（中文）/ Full Refund（英文）
print(cancelReason?.cancelTypeDescription); // 输出：学生取消（中文）/ Student Cancellation（英文）
```

### 3. 积分和课程描述

```dart
final points = masterService.getPointsByValue(50);
print(points?.pointsDescription); // 输出：标准价格（中文）/ Standard Price（英文）

final lessonTime = masterService.getLessonTimeByLabel('30');
print(lessonTime?.lessonType); // 输出：标准课程（中文）/ Standard Lesson（英文）
```

## 🔧 开发指南

### 1. 添加新的翻译

1. 在ARB文件中添加新的键值对：
```json
// app_en.arb
"masterNewFeature": "New Feature",
"@masterNewFeature": {
  "description": "Description of new feature"
}

// app_zh.arb
"masterNewFeature": "新功能"
```

2. 在 `MasterTranslations` 中添加对应方法：
```dart
static String getNewFeatureText() {
  return T.masterNewFeature;
}
```

3. 在扩展方法中使用：
```dart
String get newFeatureText => MasterTranslations.getNewFeatureText();
```

### 2. 安全性考虑

`MasterTranslations` 提供了安全获取翻译的方法：

```dart
static String safeGetText(String Function() translationGetter, String fallback) {
  try {
    return translationGetter();
  } catch (e) {
    return fallback;
  }
}
```

### 3. 测试注意事项

在测试环境中，翻译系统可能未初始化，因此测试时应注意：

```dart
test('应该提供本地化名称', () {
  const male = GenderBean(id: 1, label: 'male', name: 'Male');
  
  // 只测试方法存在，不测试具体返回值
  expect(() => male.localizedName, returnsNormally);
});
```

## 📈 优势

1. **统一管理**: 所有多语言文本集中在ARB文件中管理
2. **类型安全**: 通过T类提供类型安全的翻译访问
3. **向后兼容**: 保持现有API的兼容性
4. **易于维护**: 新增语言只需添加ARB文件
5. **自动化支持**: 可以集成到现有的翻译自动化流程中

## 🔄 迁移完成

- ✅ 移除硬编码的多语言文本
- ✅ 集成到ARB翻译系统
- ✅ 更新所有扩展方法
- ✅ 提供向后兼容性
- ✅ 添加多语言支持（英、中、日、韩）
- ✅ 更新文档和示例
- ✅ 添加测试用例

Master配置模块的多语言集成已完成，现在所有文本都通过统一的翻译系统管理！🌍
