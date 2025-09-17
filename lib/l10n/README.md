# 国际化 (i18n) 目录

本目录包含应用程序的国际化相关文件。

## 📁 目录结构

```
lib/l10n/
├── arb/                    # ARB 源文件目录
│   ├── app_en.arb         # 英文翻译源文件
│   ├── app_zh.arb         # 中文翻译源文件
│   └── ...                # 其他语言的 ARB 文件
├── generated/             # 生成的本地化文件 (请勿手动编辑)
│   ├── app_localizations.dart
│   ├── app_localizations_en.dart
│   ├── app_localizations_zh.dart
│   └── ...
└── README.md              # 本文件
```

## 🔧 如何添加新的翻译

### 1. 编辑 ARB 文件

在 `arb/` 目录中编辑对应语言的 ARB 文件：

**英文 (`arb/app_en.arb`)**:
```json
{
  "@@locale": "en",
  "helloWorld": "Hello World!",
  "@helloWorld": {
    "description": "A simple greeting"
  }
}
```

**中文 (`arb/app_zh.arb`)**:
```json
{
  "@@locale": "zh",
  "helloWorld": "你好世界！",
  "@helloWorld": {
    "description": "简单的问候语"
  }
}
```

### 2. 生成本地化代码

运行以下命令生成 Dart 代码：
```bash
flutter gen-l10n
```

### 3. 在代码中使用

```dart
import 'package:cptop/l10n/generated/app_localizations.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Text(l10n.helloWorld);
  }
}
```

## 📝 ARB 文件格式说明

### 基本格式
```json
{
  "@@locale": "en",
  "key": "Translation text",
  "@key": {
    "description": "Description of this translation"
  }
}
```

### 带参数的翻译
```json
{
  "welcomeUser": "Welcome, {userName}!",
  "@welcomeUser": {
    "description": "Welcome message with user name",
    "placeholders": {
      "userName": {
        "type": "String",
        "example": "John"
      }
    }
  }
}
```

### 复数形式
```json
{
  "itemCount": "{count, plural, =0{No items} =1{One item} other{{count} items}}",
  "@itemCount": {
    "description": "Number of items",
    "placeholders": {
      "count": {
        "type": "int",
        "example": "5"
      }
    }
  }
}
```

## ⚙️ 配置文件

确保项目根目录的 `l10n.yaml` 配置正确：

```yaml
arb-dir: lib/l10n/arb
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
output-dir: lib/l10n/generated
output-class: AppLocalizations
```

## 🌍 支持的语言

当前支持的语言：
- 🇺🇸 英文 (en) - `app_en.arb`
- 🇨🇳 中文 (zh) - `app_zh.arb`

要添加新语言，请：
1. 在 `arb/` 目录中创建新的 ARB 文件（如 `app_fr.arb` 用于法语）
2. 运行 `flutter gen-l10n` 生成代码
3. 在 `pubspec.yaml` 中确保包含了对应的语言支持

## 📚 相关文档

- [Flutter 国际化官方文档](https://docs.flutter.dev/development/accessibility-and-localization/internationalization)
- [ARB 文件格式规范](https://github.com/google/app-resource-bundle/wiki/ApplicationResourceBundleSpecification)
