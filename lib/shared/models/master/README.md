# Master配置系统

这个模块实现了与Android项目中`com.qqeng.online.bean.master`包相同的功能，提供站点配置、时区管理、电话区号管理、取消原因、课程时长、性别、积分、评分、请求类别等完整的配置管理功能。

## 📁 文件结构

```
lib/shared/models/master/
├── site_config/                    # 站点配置模块
│   ├── site_config.dart           # 站点配置数据模型
│   ├── site_config_extensions.dart # 站点配置扩展方法
│   ├── site_config.freezed.dart   # 生成的freezed文件
│   └── site_config.g.dart         # 生成的json文件
├── timezone/                       # 时区模块
│   ├── timezone.dart              # 时区数据模型
│   ├── timezone_extensions.dart   # 时区扩展方法
│   ├── timezone.freezed.dart      # 生成的freezed文件
│   └── timezone.g.dart            # 生成的json文件
├── telephone_code/                 # 电话区号模块
│   ├── telephone_code.dart        # 电话区号数据模型
│   ├── telephone_code_extensions.dart # 电话区号扩展方法
│   ├── telephone_code.freezed.dart # 生成的freezed文件
│   └── telephone_code.g.dart      # 生成的json文件
├── cancel_reason/                  # 取消原因模块
│   ├── cancel_reason.dart         # 取消原因数据模型
│   ├── cancel_reason_extensions.dart # 取消原因扩展方法
│   ├── cancel_reason.freezed.dart # 生成的freezed文件
│   └── cancel_reason.g.dart       # 生成的json文件
├── lesson_time/                    # 课程时长模块
│   ├── lesson_time.dart           # 课程时长数据模型
│   ├── lesson_time_extensions.dart # 课程时长扩展方法
│   ├── lesson_time.freezed.dart   # 生成的freezed文件
│   └── lesson_time.g.dart         # 生成的json文件
├── gender/                         # 性别模块
│   ├── gender.dart                # 性别数据模型
│   ├── gender_extensions.dart     # 性别扩展方法
│   ├── gender.freezed.dart        # 生成的freezed文件
│   └── gender.g.dart              # 生成的json文件
├── points/                         # 积分模块
│   ├── points.dart                # 积分数据模型
│   ├── points_extensions.dart     # 积分扩展方法
│   ├── points.freezed.dart        # 生成的freezed文件
│   └── points.g.dart              # 生成的json文件
├── rating/                         # 评分模块
│   ├── rating.dart                # 评分数据模型
│   ├── rating_extensions.dart     # 评分扩展方法
│   ├── rating.freezed.dart        # 生成的freezed文件
│   └── rating.g.dart              # 生成的json文件
├── request_category/               # 请求类别模块
│   ├── request_category.dart      # 请求类别数据模型
│   ├── request_category_extensions.dart # 请求类别扩展方法
│   ├── request_category.freezed.dart # 生成的freezed文件
│   └── request_category.g.dart    # 生成的json文件
├── master_service.dart             # Master配置管理服务
├── master_usage_example.dart       # 使用示例
├── index.dart                      # 统一导出文件
└── README.md                       # 本文档
```

## 🚀 快速开始

### 1. 导入模块

```dart
import 'package:cptop/shared/models/master/index.dart';
```

### 2. 初始化Master服务

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 初始化Master配置
  await MasterService.instance.initialize();
  
  runApp(MyApp());
}
```

### 3. 使用站点配置

```dart
// 获取所有站点配置
final siteConfigs = MasterService.instance.siteConfigs;

// 根据站点ID获取配置
final cnSite = MasterService.instance.getSiteConfigById(101);

// 根据标签获取配置
final jpSite = MasterService.instance.getSiteConfigByLabel('ja');

// 根据国家代码获取配置
final usSite = MasterService.instance.getSiteConfigByCountry('usa');

// 使用扩展方法检查功能
if (cnSite?.isUsingFixing == true) {
  print('中国站点支持修复功能');
}
```

### 4. 使用时区管理

```dart
// 获取所有时区
final timeZones = await MasterTimeZone.get();

// 获取特定时区
final shanghaiTz = await MasterTimeZone.getTimeZone('Asia/Shanghai');

// 获取常用时区
final commonTimeZones = await MasterTimeZone.getCommonTimeZones();

// 搜索时区
final asianTimeZones = await MasterTimeZone.searchTimeZones('Asia');

// 使用扩展方法
if (shanghaiTz?.isAsianTimeZone == true) {
  print('上海时区偏移: ${shanghaiTz?.offsetHours} 小时');
}
```

### 5. 使用电话区号管理

```dart
// 获取所有电话区号
final telephoneCodes = await MasterTelephoneCode.get();

// 获取特定区号
final chinaCode = await MasterTelephoneCode.getDataBeanForCode('86');

// 获取常用区号
final commonCodes = await MasterTelephoneCode.getCommonCodes();

// 搜索区号
final searchResults = await MasterTelephoneCode.search('China');

// 使用扩展方法
if (chinaCode?.isChina == true) {
  print('中国区号显示: ${chinaCode?.displayText}');
}
```

### 6. 使用多语言功能

```dart
// 性别本地化
final gender = MasterService.instance.getGenderByLabel('male');
print(gender?.localizedName); // 输出：男性（中文）/ Male（英文）

// 评分本地化
final rating = MasterService.instance.getRatingByValue(5);
print(rating?.ratingLevelText); // 输出：优秀（中文）/ Excellent（英文）

// 请求类别本地化
final request = MasterService.instance.getRequestCategoryByMappingIndex(0);
print(request?.requestType); // 输出：慢速清晰（中文）/ Slow & Clear（英文）

// 取消原因本地化
final cancelReason = MasterService.instance.getCancelReasonById(4100);
print(cancelReason?.getRefundDisplayText()); // 输出：全额退款（中文）/ Full Refund（英文）

// 积分描述本地化
final points = MasterService.instance.getPointsByValue(50);
print(points?.pointsDescription); // 输出：标准价格（中文）/ Standard Price（英文）
```

## 📊 数据模型

### SiteConfig - 站点配置

包含站点的所有配置信息：

- `siteId`: 站点ID
- `name`: 站点名称
- `defaultLang`: 默认语言
- `defaultTimeZone`: 默认时区
- `defaultCurrencyCode`: 默认货币代码
- `fixing`: 修复功能配置
- `game`: 游戏配置
- `giftCard`: 礼品卡配置
- `useFixing/useGroupLesson/usePoints/useSns`: 功能开关

### TimeZoneBean - 时区信息

- `id`: 时区ID
- `label`: 时区标签（如 Asia/Shanghai）
- `offset`: 时区偏移量（如 +08:00）
- `name`: 时区显示名称

### TelephoneCodeBean - 电话区号

- `code`: 区号（如 86）
- `name`: 国家名称
- `country`: 国家代码

## 🌍 多语言支持

Master配置模块已完全集成到项目的多语言系统中：

### 支持的语言
- 🇺🇸 英语 (en)
- 🇨🇳 中文 (zh)
- 🇯🇵 日语 (ja)
- 🇰🇷 韩语 (ko)

### 多语言功能
- 性别选项本地化
- 评分等级本地化
- 请求类别本地化
- 取消原因本地化
- 积分描述本地化
- 课程时长本地化

详细信息请参考：[多语言集成文档](LOCALIZATION_INTEGRATION.md)

## 🔧 扩展方法

每个数据模型都提供了丰富的扩展方法：

### SiteConfig扩展

```dart
// 功能检查
siteConfig.isUsingFixing
siteConfig.canPlayPuzzleGame
siteConfig.isUsingGroupLesson

// 获取配置值
siteConfig.getMaxLessonsPerDay()
siteConfig.getDefaultTimeZone()
siteConfig.getDefaultCurrencyCode()
```

### TimeZone扩展

```dart
// 时区分类
timeZone.isAsianTimeZone
timeZone.isEuropeanTimeZone
timeZone.isCommonTimeZone

// 偏移量计算
timeZone.offsetHours
timeZone.totalOffsetMinutes

// 显示文本
timeZone.displayText
timeZone.fullDisplayText
```

### TelephoneCode扩展

```dart
// 国家检查
telephoneCode.isChina
telephoneCode.isUSA
telephoneCode.isJapan

// 区域分类
telephoneCode.isAsian
telephoneCode.region

// 显示文本
telephoneCode.displayText
telephoneCode.formattedCode
```

## 📁 配置文件

配置文件位于 `assets/master/` 目录：

- `site_config.json`: 站点配置数据
- `timezone.json`: 时区数据
- `telephone_code.json`: 电话区号数据

确保在 `pubspec.yaml` 中添加assets配置：

```yaml
flutter:
  assets:
    - assets/master/
```

## 🎯 与Android项目的对应关系

| Android类 | Flutter对应 | 功能 |
|-----------|-------------|------|
| `Master` | `MasterService` | 主配置管理 |
| `SiteConfig` | `SiteConfig` | 站点配置 |
| `MasterTimeZone` | `MasterTimeZone` | 时区管理 |
| `MasterTelephoneCode` | `MasterTelephoneCode` | 电话区号管理 |
| `TimeZoneBean` | `TimeZoneBean` | 时区数据模型 |
| `DataBean` | `TelephoneCodeBean` | 电话区号数据模型 |

## 💡 使用建议

1. **初始化时机**: 在应用启动时初始化Master服务
2. **缓存机制**: 工具类自动缓存数据，避免重复加载
3. **错误处理**: 所有方法都有适当的错误处理
4. **扩展方法**: 充分利用扩展方法简化代码
5. **搜索功能**: 使用搜索方法快速查找配置

## 🔄 更新配置

如需更新配置数据：

```dart
// 重新加载所有配置
await MasterService.instance.reload();

// 重新加载特定配置
await MasterTimeZone.reload();
await MasterTelephoneCode.reload();
```

## 📝 完整示例

查看 `master_usage_example.dart` 文件获取完整的使用示例。
