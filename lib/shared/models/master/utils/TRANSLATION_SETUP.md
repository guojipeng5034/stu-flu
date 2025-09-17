# Master配置翻译设置指南

## 🚨 当前状态

`MasterTranslations` 类目前使用**回退文本**模式，因为新增的ARB翻译键还没有生成到AppLocalizations类中。

## 📋 启用完整翻译功能的步骤

### 1. 重新生成本地化文件

运行以下命令重新生成本地化文件：

```bash
# 生成本地化文件
flutter gen-l10n

# 或者如果使用build_runner
flutter pub run build_runner build --delete-conflicting-outputs
```

### 2. 验证翻译键是否生成

检查 `lib/l10n/generated/app_localizations.dart` 文件，确认以下方法已生成：

```dart
// 性别相关
String get masterGenderMale;
String get masterGenderFemale;
String get masterGenderUnspecified;

// 评分相关
String get masterRatingExcellent;
String get masterRatingGood;
String get masterRatingAverage;
String get masterRatingPoor;
String get masterRatingVeryPoor;
String get masterRatingNoRating;

// 请求类别相关
String get masterRequestSlowClear;
String get masterRequestNaturalSpeed;
String get masterRequestStrictTeaching;
String get masterRequestFreeConversation;
String get masterRequestStrictCurriculum;

// 取消原因相关
String get masterCancelByStudent;
String get masterCancelByTeacher;
String get masterCancelBySystem;
String get masterRefundFull;
String get masterRefundPartial;
String get masterRefundNone;
String masterRefundPercentage(int percentage);

// 积分相关
String get masterPointsFree;
String get masterPointsEconomical;
String get masterPointsStandard;
String get masterPointsPremium;

// 课程时长相关
String get masterLessonShort;
String get masterLessonStandard;
String get masterLessonLong;
String get masterLessonExtraLong;
```

### 3. 更新MasterTranslations类

一旦翻译键生成成功，更新 `master_translations.dart` 文件：

```dart
/// 获取性别的本地化名称
static String getGenderName(String? genderLabel) {
  try {
    switch (genderLabel) {
      case 'male':
        return T.masterGenderMale;
      case 'female':
        return T.masterGenderFemale;
      case 'default':
      default:
        return T.masterGenderUnspecified;
    }
  } catch (e) {
    // 如果翻译失败，使用回退文本
    return _getGenderFallback(genderLabel);
  }
}
```

### 4. 启用翻译检查

更新 `isTranslationAvailable` 方法：

```dart
static bool get isTranslationAvailable {
  try {
    // 尝试访问新的翻译键
    T.masterGenderMale;
    return true;
  } catch (e) {
    return false;
  }
}
```

## 🔧 完整的更新模板

以下是完整的更新模板，可以在翻译键生成后使用：

```dart
/// 获取性别的本地化名称
static String getGenderName(String? genderLabel) {
  if (!isTranslationAvailable) {
    return _getGenderFallback(genderLabel);
  }
  
  try {
    switch (genderLabel) {
      case 'male':
        return T.masterGenderMale;
      case 'female':
        return T.masterGenderFemale;
      case 'default':
      default:
        return T.masterGenderUnspecified;
    }
  } catch (e) {
    return _getGenderFallback(genderLabel);
  }
}

/// 获取评分等级的本地化文本
static String getRatingLevelText(int? ratingValue) {
  if (!isTranslationAvailable) {
    return _getRatingFallback(ratingValue);
  }
  
  try {
    switch (ratingValue) {
      case 5:
        return T.masterRatingExcellent;
      case 4:
        return T.masterRatingGood;
      case 3:
        return T.masterRatingAverage;
      case 2:
        return T.masterRatingPoor;
      case 1:
        return T.masterRatingVeryPoor;
      default:
        return T.masterRatingNoRating;
    }
  } catch (e) {
    return _getRatingFallback(ratingValue);
  }
}

/// 获取退款描述的本地化文本
static String getRefundDisplayText(int percentage) {
  if (!isTranslationAvailable) {
    return _getRefundFallback(percentage);
  }
  
  try {
    if (percentage == 100) {
      return T.masterRefundFull;
    } else if (percentage > 0) {
      return T.masterRefundPercentage(percentage);
    } else {
      return T.masterRefundNone;
    }
  } catch (e) {
    return _getRefundFallback(percentage);
  }
}
```

## ✅ 验证步骤

1. **运行代码生成**：确保没有编译错误
2. **检查翻译键**：验证所有新增的翻译键都已生成
3. **测试多语言**：切换语言验证翻译是否正常工作
4. **更新文档**：更新相关文档说明翻译功能已启用

## 📝 注意事项

- 在翻译键生成之前，所有方法都会使用英文回退文本
- 回退文本确保了即使翻译系统未初始化，功能也能正常工作
- 一旦翻译键生成，可以逐步启用各个翻译方法
- 建议先测试一个方法，确认无误后再更新其他方法

## 🔄 回退策略

如果翻译键生成失败或有问题，可以继续使用当前的回退文本模式，不会影响功能的正常使用。
