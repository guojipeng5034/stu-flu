# Hybrid Localization Setup Guide (本地与服务器混合国际化设置指南)

This guide explains how to use and manage the hybrid internationalization system in this Flutter project, which combines localizations from `.arb` files with dynamically fetched server-side translations.
(本指南解释了如何在此 Flutter 项目中使用和管理混合国际化系统，该系统结合了来自 `.arb` 文件的本地化内容和动态获取的服务器端翻译。)

## Overview (概述)

The system allows for:
(本系统允许：)

-   **Local Translations (本地翻译):** For static UI text, default messages, and fallbacks. Managed via `.arb` files and Flutter's standard `intl` tooling.
    (用于静态UI文本、默认消息和后备方案。通过 `.arb` 文件和 Flutter 的标准 `intl` 工具进行管理。)
-   **Server-Side Translations (服务器端翻译):** For dynamic text that needs to be updated without an app release (e.g., promotional messages, user-specific content). Fetched from an API.
    (用于需要无需应用更新即可更改的动态文本，例如促销信息、用户特定内容等。从API获取。)

## Phase 1: Local Internationalization Setup (阶段一：本地国际化设置)

This phase covers the standard Flutter internationalization setup.
(此阶段涵盖标准的 Flutter 国际化设置。)

### 1. Dependencies (依赖项)

Ensure your `pubspec.yaml` includes:
(确保您的 `pubspec.yaml` 文件包含：)

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations: # Add this
    sdk: flutter         # Add this
  intl: ^0.18.1 # Or your desired version (was added)

dev_dependencies:
  # ... other dev_dependencies
  build_runner: # If not already present
  # ...

flutter:
  uses-material-design: true
  generate: true # Crucial for intl code generation (was added)
  assets:
    # ... your existing assets
```

### 2. ARB Files (.arb 文件)

-   Store your local translation files in `lib/l10n/`.
    (将您的本地翻译文件存储在 `lib/l10n/` 目录下。)
-   The template file (usually English) must be specified in `l10n.yaml`. Example: `app_en.arb`.
    (必须在 `l10n.yaml` 中指定模板文件（通常是英文）。例如：`app_en.arb`。)
-   Other language files follow the pattern `app_<languageCode>.arb` (e.g., `app_zh.arb`).
    (其他语言文件遵循 `app_<语言代码>.arb` 的模式，例如 `app_zh.arb`。)

**Example `lib/l10n/app_en.arb`:**
(示例 `lib/l10n/app_en.arb`：)
```json
{
  "@@locale": "en",
  "helloWorld": "Hello World!",
  "@helloWorld": {
    "description": "A simple greeting."
  }
}
```

**Example `lib/l10n/app_zh.arb`:**
(示例 `lib/l10n/app_zh.arb`：)
```json
{
  "@@locale": "zh",
  "helloWorld": "你好世界!"
}
```

### 3. L10n Configuration File (l10n 配置文件)

Create `l10n.yaml` in the project root:
(在项目根目录下创建 `l10n.yaml` 文件：)

```yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
# Optional:
# output-class: AppLocalizations
# preferred-supported-locales: [ en ]
```

### 4. Generate Dart Localization Code (生成 Dart 本地化代码)

Run the following command in your terminal:
(在您的终端中运行以下命令：)

```bash
flutter pub get
flutter gen-l10n
```
This generates `app_localizations.dart` (and related files) which provide the `AppLocalizations` class.
(这将生成 `app_localizations.dart`（及相关文件），其中提供了 `AppLocalizations` 类。)

### 5. Integrate into MaterialApp (集成到 MaterialApp)

In your main application widget (e.g., `lib/app/core/app.dart`):
(在您的主应用程序小部件中（例如 `lib/app/core/app.dart`）：)

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
// This import path is configured by Flutter's build system for gen-l10n
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ... inside your MaterialApp or MaterialApp.router
MaterialApp.router( // Or MaterialApp(...)
  // ... other properties
  localizationsDelegates: const [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: AppLocalizations.supportedLocales,
  // locale: Locale('en'), // Optionally set initial locale or use localeResolutionCallback
  // ...
)
```

### 6. Using Local Strings (使用本地字符串)

In your widgets:
(在您的小部件中：)
```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ... inside a build method where BuildContext is available
Text(AppLocalizations.of(context)!.helloWorld),
```

## Phase 2: Server-Side Translations Integration (阶段二：服务器端翻译集成)

This allows fetching additional translations from a backend API.
(这允许从后端API获取额外的翻译。)

### 1. Server API Requirements (服务器API要求)

-   **Endpoint:** Your API should expose an endpoint to fetch translations for a given locale.
    (您的API应提供一个端点以获取给定语言环境的翻译。)
    Example: `/api/translations?locale=en_US` or `/api/translations/en_US`.
-   **JSON Response:** The API should return a JSON object where keys are translation IDs and values are the translated strings.
    (API应返回一个JSON对象，其中键是翻译ID，值是翻译后的字符串。)
    Example for `en_US`:
    ```json
    {
      "server_greeting": "Hello from Server!",
      "dynamic_promo_message": "Special offer today!"
    }
    ```

### 2. Configure ServerTranslationService (配置 ServerTranslationService)

-   The service for fetching translations is located at `lib/features/localization/services/server_translation_service.dart`.
    (获取翻译的服务位于 `lib/features/localization/services/server_translation_service.dart`。)
-   **IMPORTANT (重要):** You MUST update the placeholder base URL in this file.
    (您**必须**更新此文件中的占位符基础URL。)
    Open `server_translation_service.dart` and change:
    (打开 `server_translation_service.dart` 并更改：)
    ```dart
    // _dio = dio ?? Dio(BaseOptions(baseUrl: 'https://api.example.com')); // Placeholder (占位符)
    // Replace with your actual API base URL, e.g.:
    _dio = dio ?? Dio(BaseOptions(baseUrl: 'https://your.actual.api/v1'));
    ```

### 3. State Management (Riverpod) (状态管理 Riverpod)

-   Server translations are managed using Riverpod. Key files:
    (服务器翻译使用 Riverpod进行管理。关键文件：)
    -   `lib/features/localization/models/server_translation.dart`: Defines `ServerTranslations` type (`Map<String, String>`).
        (定义 `ServerTranslations` 类型 (`Map<String, String>`)。)
    -   `lib/features/localization/providers/server_translation_provider.dart`: Contains `ServerTranslationsNotifier` (manages state: initial, loading, loaded, error) and `serverTranslationsProvider` (how UI accesses the state).
        (包含 `ServerTranslationsNotifier`（管理状态：初始、加载中、已加载、错误）和 `serverTranslationsProvider`（UI如何访问状态）。)

### 4. Initializing Server Translations (初始化服务器翻译)

-   Server translations for a default locale (e.g., 'en') are loaded when the app starts. This is done in `_MyAppState`'s `initState` method (`lib/app/core/app.dart`):
    (应用启动时会加载默认语言环境（例如 'en'）的服务器翻译。这在 `_MyAppState` 的 `initState` 方法中完成 (`lib/app/core/app.dart`)：)
    ```dart
    // In _MyAppState class:
    @override
    void initState() {
      super.initState();
      // 加载英语的初始服务器翻译
      ref.read(serverTranslationsProvider.notifier).loadTranslations('en');
    }
    ```

### 5. Using Server-Side Strings (使用服务器端字符串)

-   Access server strings via `UnifiedTranslationService` or directly through the Riverpod provider.
    (通过 `UnifiedTranslationService` 或直接通过 Riverpod 提供程序访问服务器字符串。)
-   The `UnifiedTranslationService` is available via `ref.read(unifiedTranslationServiceProvider)`.
    (可通过 `ref.read(unifiedTranslationServiceProvider)` 获取 `UnifiedTranslationService`。)

**Example in a `ConsumerWidget` or `ConsumerStatefulWidget`:**
(在 `ConsumerWidget` 或 `ConsumerStatefulWidget` 中的示例：)
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cptop/features/localization/providers/server_translation_provider.dart';
import 'package:cptop/features/localization/services/unified_translation_service.dart'; // Optional, can use loadedServerTranslationsProvider

// ... inside build(BuildContext context, WidgetRef ref)

final serverState = ref.watch(serverTranslationsProvider);
String serverMessage = "Initializing server string..."; // 初始服务器字符串...

if (serverState is ServerTranslationsLoading) {
  serverMessage = "Loading server string..."; // 正在加载服务器字符串...
} else if (serverState is ServerTranslationsLoaded) {
  // Option 1: Using UnifiedTranslationService
  final String? greeting = ref.read(unifiedTranslationServiceProvider).getServerString("server_greeting");
  serverMessage = greeting ?? "server_greeting not found"; // 未找到 server_greeting

  // Option 2: Directly using loadedServerTranslationsProvider (if you prefer)
  // final serverStringsMap = ref.watch(loadedServerTranslationsProvider);
  // serverMessage = serverStringsMap?["server_greeting"] ?? "server_greeting not found";
} else if (serverState is ServerTranslationsError) {
  serverMessage = "Error: \${serverState.message}"; // 错误：...
}

Text(serverMessage),
```

### 6. Locale Switching (语言环境切换)

-   To change the language for server translations (e.g., after user selects a new language in settings):
    (要更改服务器翻译的语言（例如，在用户于设置中选择新语言后）：)
    ```dart
    String newLocale = 'zh'; // Example new locale (示例新语言环境)
    ref.read(serverTranslationsProvider.notifier).loadTranslations(newLocale);
    ```
    This will trigger a new API call to fetch translations for `newLocale`.
    (这将触发新的API调用以获取 `newLocale` 的翻译。)

## Demonstration (演示)

-   See `lib/demo/intl_demo_screen.dart` for a working example of how both local `.arb` strings and server-fetched strings are displayed.
    (有关如何显示本地 `.arb` 字符串和服务器获取的字符串的工作示例，请参见 `lib/demo/intl_demo_screen.dart`。)

```
