# 🚀 部署指南

## 📋 概述

本指南详细说明了如何将 Flutter 应用部署到不同平台，包括 Android、iOS、Web 和桌面平台。

## 🏗️ 构建准备

### 环境检查

```bash
# 检查 Flutter 环境
flutter doctor

# 检查特定平台支持
flutter doctor --android-licenses  # Android
flutter doctor --ios               # iOS
```

### 代码生成

```bash
# 生成必要的代码文件
flutter pub get
dart run build_runner build --delete-conflicting-outputs

# 生成本地化文件
flutter gen-l10n
```

## 📱 Android 部署

### 1. 配置签名

#### 创建密钥库

```bash
# 创建发布密钥
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

# 将密钥库移动到项目目录
mv ~/upload-keystore.jks android/app/
```

#### 配置密钥属性

创建 `android/key.properties` 文件：

```properties
storePassword=your_store_password
keyPassword=your_key_password
keyAlias=upload
storeFile=upload-keystore.jks
```

#### 配置 build.gradle

在 `android/app/build.gradle` 中添加：

```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

### 2. 构建 APK/AAB

```bash
# 构建 APK (开发环境)
flutter build apk --dart-define=ENV=development

# 构建 APK (生产环境)
flutter build apk --release --dart-define=ENV=production

# 构建 AAB (Google Play)
flutter build appbundle --release --dart-define=ENV=production

# 构建不同架构
flutter build apk --split-per-abi --dart-define=ENV=production
```

### 3. 发布到 Google Play

1. **上传到 Google Play Console**
2. **填写应用信息**
3. **设置内容分级**
4. **配置发布轨道**
5. **提交审核**

## 🍎 iOS 部署

### 1. 配置 Xcode 项目

```bash
# 打开 iOS 项目
open ios/Runner.xcworkspace
```

在 Xcode 中配置：
- Bundle Identifier
- Team 和 Signing Certificate
- Deployment Target
- App Icons 和 Launch Screen

### 2. 构建 iOS 应用

```bash
# 构建 iOS 应用 (开发环境)
flutter build ios --dart-define=ENV=development

# 构建 iOS 应用 (生产环境)
flutter build ios --release --dart-define=ENV=production

# 构建 IPA 文件
flutter build ipa --release --dart-define=ENV=production
```

### 3. 发布到 App Store

1. **在 App Store Connect 创建应用**
2. **使用 Xcode 或 Transporter 上传 IPA**
3. **填写应用元数据**
4. **提交审核**

## 🌐 Web 部署

### 1. 构建 Web 应用

```bash
# 构建 Web 应用 (开发环境)
flutter build web --dart-define=ENV=development

# 构建 Web 应用 (生产环境)
flutter build web --release --dart-define=ENV=production

# 构建并指定基础路径
flutter build web --base-href="/my-app/" --dart-define=ENV=production
```

### 2. 部署到静态托管

#### GitHub Pages

```yaml
# .github/workflows/deploy.yml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.16.0'
    
    - run: flutter pub get
    - run: dart run build_runner build --delete-conflicting-outputs
    - run: flutter build web --release --dart-define=ENV=production
    
    - uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./build/web
```

#### Netlify

```toml
# netlify.toml
[build]
  command = "flutter build web --release --dart-define=ENV=production"
  publish = "build/web"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

#### Firebase Hosting

```bash
# 安装 Firebase CLI
npm install -g firebase-tools

# 初始化 Firebase
firebase init hosting

# 构建并部署
flutter build web --release --dart-define=ENV=production
firebase deploy
```

### 3. Web 配置优化

#### PWA 配置

在 `web/manifest.json` 中配置：

```json
{
  "name": "Flutter App",
  "short_name": "FlutterApp",
  "start_url": ".",
  "display": "standalone",
  "background_color": "#0175C2",
  "theme_color": "#0175C2",
  "description": "A Flutter application",
  "orientation": "portrait-primary",
  "prefer_related_applications": false,
  "icons": [
    {
      "src": "icons/Icon-192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "icons/Icon-512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
```

## 🖥️ 桌面部署

### Windows

```bash
# 构建 Windows 应用
flutter build windows --release --dart-define=ENV=production

# 创建安装包 (需要 Inno Setup)
iscc windows_installer.iss
```

### macOS

```bash
# 构建 macOS 应用
flutter build macos --release --dart-define=ENV=production

# 创建 DMG (需要额外工具)
create-dmg build/macos/Build/Products/Release/YourApp.app
```

### Linux

```bash
# 构建 Linux 应用
flutter build linux --release --dart-define=ENV=production

# 创建 AppImage (需要额外工具)
appimagetool build/linux/x64/release/bundle/
```

## 🔧 CI/CD 配置

### GitHub Actions

```yaml
# .github/workflows/build.yml
name: Build and Test

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.16.0'
    
    - name: Install dependencies
      run: flutter pub get
    
    - name: Generate code
      run: dart run build_runner build --delete-conflicting-outputs
    
    - name: Run tests
      run: flutter test --coverage
    
    - name: Upload coverage
      uses: codecov/codecov-action@v3

  build-android:
    needs: test
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - uses: subosito/flutter-action@v2
    - uses: actions/setup-java@v3
      with:
        distribution: 'zulu'
        java-version: '11'
    
    - run: flutter pub get
    - run: dart run build_runner build --delete-conflicting-outputs
    - run: flutter build apk --release --dart-define=ENV=production
    
    - uses: actions/upload-artifact@v3
      with:
        name: android-apk
        path: build/app/outputs/flutter-apk/

  build-ios:
    needs: test
    runs-on: macos-latest
    steps:
    - uses: actions/checkout@v3
    - uses: subosito/flutter-action@v2
    
    - run: flutter pub get
    - run: dart run build_runner build --delete-conflicting-outputs
    - run: flutter build ios --release --no-codesign --dart-define=ENV=production
```

### GitLab CI

```yaml
# .gitlab-ci.yml
stages:
  - test
  - build
  - deploy

variables:
  FLUTTER_VERSION: "3.16.0"

before_script:
  - apt-get update -qq && apt-get install -y -qq git curl unzip
  - git clone https://github.com/flutter/flutter.git -b stable
  - export PATH="$PATH:`pwd`/flutter/bin"
  - flutter doctor
  - flutter pub get
  - dart run build_runner build --delete-conflicting-outputs

test:
  stage: test
  script:
    - flutter test --coverage
  coverage: '/lines......: \d+\.\d+\%/'

build-web:
  stage: build
  script:
    - flutter build web --release --dart-define=ENV=production
  artifacts:
    paths:
      - build/web/
    expire_in: 1 week

deploy-web:
  stage: deploy
  script:
    - echo "Deploy to production server"
  only:
    - main
```

## 📊 性能优化

### 构建优化

```bash
# 启用混淆和压缩
flutter build apk --release --obfuscate --split-debug-info=debug-info/

# 减小应用大小
flutter build apk --release --target-platform android-arm64

# 分析包大小
flutter build apk --analyze-size
```

### Web 优化

```bash
# 启用 CanvasKit 渲染器
flutter build web --web-renderer canvaskit

# 启用 HTML 渲染器
flutter build web --web-renderer html

# 自动选择渲染器
flutter build web --web-renderer auto
```

## 🔒 安全配置

### 代码混淆

```bash
# Android 混淆
flutter build apk --release --obfuscate --split-debug-info=debug-info/

# iOS 混淆
flutter build ios --release --obfuscate --split-debug-info=debug-info/
```

### 证书固定

```dart
// lib/core/network/certificate_pinning.dart
class CertificatePinning {
  static SecurityContext getSecurityContext() {
    final context = SecurityContext.defaultContext;
    // 添加证书固定逻辑
    return context;
  }
}
```

## 📋 部署检查清单

### 发布前检查

- [ ] 所有测试通过
- [ ] 代码覆盖率达标
- [ ] 性能测试通过
- [ ] 安全扫描通过
- [ ] 版本号更新
- [ ] 更新日志编写
- [ ] 应用图标和启动画面
- [ ] 权限配置正确
- [ ] 环境配置正确
- [ ] 签名配置正确

### 发布后验证

- [ ] 应用正常启动
- [ ] 核心功能正常
- [ ] 网络请求正常
- [ ] 数据持久化正常
- [ ] 推送通知正常
- [ ] 崩溃监控正常

## 🚨 常见问题

### Q1: Android 构建失败怎么办？

**A**: 检查以下几点：
- Java 版本是否正确 (推荐 Java 11)
- Android SDK 是否完整
- 签名配置是否正确
- 依赖版本是否兼容

### Q2: iOS 构建失败怎么办？

**A**: 检查以下几点：
- Xcode 版本是否支持
- 证书和描述文件是否有效
- Bundle ID 是否正确
- Deployment Target 是否合适

### Q3: Web 应用加载缓慢怎么办？

**A**: 尝试以下优化：
- 使用 `--web-renderer html` 减小包大小
- 启用 gzip 压缩
- 使用 CDN 加速
- 优化图片资源

---

**最后更新**: 2024年12月
**维护者**: 开发团队
