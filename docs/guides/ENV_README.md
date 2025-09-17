# 环境配置系统

本项目使用 `flutter_dotenv` 实现了灵活的环境配置系统，支持开发、测试和生产三种环境。

## 配置文件结构

- `assets/env/env.common` - 所有环境共享的公共配置
- `assets/env/env.development` - 开发环境特定配置
- `assets/env/env.staging` - 测试环境特定配置
- `assets/env/env.production` - 生产环境特定配置

## 运行不同环境

### 使用 IDE

在 IDE 中运行时，可以通过添加 `--dart-define=ENV=环境名称` 参数指定环境：

```
flutter run --dart-define=ENV=development
flutter run --dart-define=ENV=staging
flutter run --dart-define=ENV=production
```

### 使用脚本构建

项目提供了构建脚本，可以快速构建不同环境的应用：

#### Windows

```
build.bat development
build.bat staging
build.bat production
```

#### Linux/macOS

```
chmod +x build.sh  # 首次使用前设置可执行权限
./build.sh development
./build.sh staging
./build.sh production
```

## 自动环境检测

应用启动时会按以下优先级自动检测环境：

1. 命令行参数 `--dart-define=ENV=xxx`
2. 环境变量 `FLUTTER_ENV`
3. 构建模式（debug -> development, profile -> staging, release -> production）

## 在代码中使用

```dart
import 'package:your_app/config/env/index.dart';

// 获取环境配置实例
final env = Env.instance;

// 使用配置
String apiUrl = env.apiBaseUrl;
bool enableLogs = env.enableLogs;

// 获取自定义配置
String customValue = env.getString('CUSTOM_KEY', defaultValue: '默认值');
int customNumber = env.getInt('CUSTOM_NUMBER', defaultValue: 0);
bool customFlag = env.getBool('CUSTOM_FLAG', defaultValue: false);
```

## CI/CD 集成

在 CI/CD 流水线中，可以使用以下命令构建不同环境的应用：

```
# 开发环境
flutter build apk --debug --dart-define=ENV=development

# 测试环境
flutter build apk --profile --dart-define=ENV=staging

# 生产环境
flutter build apk --release --dart-define=ENV=production
``` 