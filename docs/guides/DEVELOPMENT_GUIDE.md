# 🛠️ 完整开发指南

## 📋 目录
- [环境准备](#环境准备)
- [项目设置](#项目设置)
- [开发流程](#开发流程)
- [代码规范](#代码规范)
- [功能开发](#功能开发)
- [测试指南](#测试指南)
- [调试技巧](#调试技巧)
- [性能优化](#性能优化)
- [部署发布](#部署发布)

## 🚀 环境准备

### 1. 基础环境
```bash
# Flutter SDK (3.0+)
flutter --version

# Dart SDK (3.0+)
dart --version

# IDE推荐
# - VS Code + Flutter插件
# - Android Studio + Flutter插件
# - IntelliJ IDEA + Flutter插件
```

### 2. 开发工具
```bash
# 代码格式化
dart format .

# 代码分析
dart analyze

# 依赖检查
flutter pub deps
```

### 3. 平台配置
```bash
# Android开发
# - Android Studio
# - Android SDK
# - Java 8+

# iOS开发 (仅macOS)
# - Xcode 12+
# - CocoaPods

# Web开发
# - Chrome浏览器
```

## 📦 项目设置

### 1. 克隆和初始化
```bash
# 克隆项目
git clone <repository-url>
cd cptop

# 安装依赖
flutter pub get

# 生成代码
dart run build_runner build

# 生成国际化文件
flutter gen-l10n
```

### 2. 环境配置
```bash
# 复制环境配置文件
cp assets/env/env.development assets/env/.env

# 配置开发环境变量
# 编辑 assets/env/.env 文件
```

### 3. IDE配置
```json
// VS Code settings.json
{
  "dart.flutterSdkPath": "/path/to/flutter",
  "dart.lineLength": 80,
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll": true
  }
}
```

## 🔄 开发流程

### 1. 分支管理
```bash
# 创建功能分支
git checkout -b feature/user-profile

# 开发完成后
git add .
git commit -m "feat: add user profile functionality"
git push origin feature/user-profile

# 创建Pull Request
```

### 2. 代码提交规范
```bash
# 提交类型
feat:     新功能
fix:      修复bug
docs:     文档更新
style:    代码格式调整
refactor: 代码重构
test:     测试相关
chore:    构建工具或辅助工具的变动

# 示例
git commit -m "feat: add user authentication"
git commit -m "fix: resolve login validation issue"
git commit -m "docs: update API documentation"
```

### 3. 开发工作流
```bash
# 1. 启动开发服务器
node scripts/dev.js

# 2. 选择开发任务
# - 启动应用
# - 监听翻译文件
# - 运行代码生成
# - 执行测试

# 3. 热重载开发
flutter run --hot
```

## 📝 代码规范

### 1. 文件命名
```dart
// 文件名使用snake_case
user_profile.dart
auth_service.dart
login_page.dart

// 类名使用PascalCase
class UserProfile {}
class AuthService {}
class LoginPage {}

// 变量名使用camelCase
String userName = '';
bool isLoggedIn = false;
```

### 2. 目录结构规范
```
lib/features/user/
├── data/
│   ├── api/           # API接口
│   ├── models/        # 数据模型
│   └── services/      # 业务服务
├── ui/
│   ├── pages/         # 页面组件
│   ├── widgets/       # UI组件
│   └── providers/     # 状态管理
└── index.dart         # 统一导出
```

### 3. 导入规范
```dart
// 1. Dart核心库
import 'dart:async';
import 'dart:convert';

// 2. Flutter框架
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 3. 第三方包
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 4. 项目内部导入
import 'package:cptop/core/index.dart';
import 'package:cptop/shared/index.dart';

// 5. 相对导入（同模块内）
import '../models/user.dart';
import 'user_service.dart';
```

### 4. 代码注释规范
```dart
/// 用户认证服务
/// 
/// 提供用户登录、注册、登出等功能
/// 
/// 示例:
/// ```dart
/// final authService = AuthService();
/// final user = await authService.login(email, password);
/// ```
class AuthService {
  /// 用户登录
  /// 
  /// [email] 用户邮箱
  /// [password] 用户密码
  /// 
  /// 返回登录成功的用户信息
  /// 抛出 [AuthException] 当登录失败时
  Future<User> login(String email, String password) async {
    // 实现代码...
  }
}
```

## 🎯 功能开发

### 1. 创建新功能模块
```bash
# 使用脚本快速创建
dart scripts/create_feature.dart profile --all

# 手动创建目录结构
mkdir -p lib/features/profile/{data/{api,models,services},ui/{pages,widgets,providers}}
```

### 2. API开发流程
```dart
// 1. 定义API接口
@RestApi()
abstract class ProfileApi {
  factory ProfileApi(Dio dio) = _ProfileApi;

  @GET("/profile")
  Future<ApiResponse<UserProfile>> getProfile();

  @PUT("/profile")
  Future<ApiResponse<UserProfile>> updateProfile(
    @Body() UpdateProfileRequest request,
  );
}

// 2. 定义数据模型
@MappableClass()
class UserProfile with UserProfileMappable {
  final String id;
  final String name;
  final String email;
  
  const UserProfile({
    required this.id,
    required this.name,
    required this.email,
  });
}

// 3. 创建服务层
class ProfileService {
  final ProfileApi _api;
  
  ProfileService(this._api);
  
  Future<UserProfile> getProfile() async {
    final response = await _api.getProfile();
    return response.data;
  }
}

// 4. 状态管理
class ProfileNotifier extends StateNotifier<AsyncValue<UserProfile?>> {
  final ProfileService _service;
  
  ProfileNotifier(this._service) : super(const AsyncValue.loading());
  
  Future<void> loadProfile() async {
    state = const AsyncValue.loading();
    try {
      final profile = await _service.getProfile();
      state = AsyncValue.data(profile);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
```

### 3. UI开发流程
```dart
// 1. 创建页面组件
class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileProvider);
    
    return Scaffold(
      appBar: AppBar(title: Text('用户资料')),
      body: profileState.when(
        data: (profile) => ProfileContent(profile: profile),
        loading: () => const ProfileShimmer(),
        error: (error, _) => ErrorWidget(error: error),
      ),
    );
  }
}

// 2. 创建UI组件
class ProfileContent extends StatelessWidget {
  final UserProfile? profile;
  
  const ProfileContent({Key? key, this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (profile == null) return const SizedBox();
    
    return Column(
      children: [
        ProfileAvatar(profile: profile!),
        ProfileInfo(profile: profile!),
        ProfileActions(profile: profile!),
      ],
    );
  }
}
```

### 4. 路由配置
```dart
// 在 app_router.dart 中添加路由
GoRoute(
  path: '/profile',
  name: RouteNames.profile,
  builder: (context, state) => const ProfilePage(),
),

// 在 route_names.dart 中定义路由名称
class RouteNames {
  static const String profile = 'profile';
}
```

## 🧪 测试指南

### 1. 单元测试
```dart
// test/features/profile/profile_service_test.dart
void main() {
  group('ProfileService', () {
    late ProfileService service;
    late MockProfileApi mockApi;

    setUp(() {
      mockApi = MockProfileApi();
      service = ProfileService(mockApi);
    });

    test('should return user profile when API call is successful', () async {
      // Arrange
      final expectedProfile = UserProfile(
        id: '1',
        name: 'John Doe',
        email: 'john@example.com',
      );
      when(mockApi.getProfile()).thenAnswer(
        (_) async => ApiResponse(data: expectedProfile),
      );

      // Act
      final result = await service.getProfile();

      // Assert
      expect(result, equals(expectedProfile));
      verify(mockApi.getProfile()).called(1);
    });
  });
}
```

### 2. Widget测试
```dart
// test/features/profile/profile_page_test.dart
void main() {
  group('ProfilePage', () {
    testWidgets('should display profile information', (tester) async {
      // Arrange
      final profile = UserProfile(
        id: '1',
        name: 'John Doe',
        email: 'john@example.com',
      );

      // Act
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            profileProvider.overrideWith((ref) => AsyncValue.data(profile)),
          ],
          child: MaterialApp(home: ProfilePage()),
        ),
      );

      // Assert
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('john@example.com'), findsOneWidget);
    });
  });
}
```

### 3. 集成测试
```bash
# 运行所有测试
flutter test

# 运行特定测试文件
flutter test test/features/profile/

# 运行测试并生成覆盖率报告
flutter test --coverage
```

## 🐛 调试技巧

### 1. 日志调试
```dart
// 使用项目的日志系统
import 'package:cptop/core/logger/index.dart';

class ProfileService {
  Future<UserProfile> getProfile() async {
    AppLogger.info('开始获取用户资料');
    
    try {
      final response = await _api.getProfile();
      AppLogger.success('用户资料获取成功: ${response.data.name}');
      return response.data;
    } catch (error) {
      AppLogger.error('用户资料获取失败', error);
      rethrow;
    }
  }
}
```

### 2. 网络调试
```dart
// 在 DioClient 中已配置日志拦截器
// 可以在控制台查看详细的网络请求日志

// 手动添加调试信息
@GET("/profile")
@Extra({"debug": true})  // 启用详细调试日志
Future<ApiResponse<UserProfile>> getProfile();
```

### 3. 状态调试
```dart
// 使用 Riverpod 的调试功能
class ProfileNotifier extends StateNotifier<AsyncValue<UserProfile?>> {
  @override
  set state(AsyncValue<UserProfile?> newState) {
    AppLogger.debug('ProfileNotifier state changed: $newState');
    super.state = newState;
  }
}
```

### 4. UI调试
```dart
// 使用 Flutter Inspector
// 在 VS Code 中按 Ctrl+Shift+P，选择 "Flutter: Open Widget Inspector"

// 添加调试边框
Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.red), // 调试时添加
  ),
  child: YourWidget(),
)
```

## ⚡ 性能优化

### 1. 网络优化
```dart
// 使用缓存注解
@GET("/profile")
@Extra({"cache_config": "user_data"})  // 缓存用户数据
Future<ApiResponse<UserProfile>> getProfile();

// 预加载数据
class ProfileService {
  Future<void> preloadProfile() async {
    // 在应用启动时预加载用户资料
    await getProfile();
  }
}
```

### 2. UI优化
```dart
// 使用 const 构造函数
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key, required this.profile}) : super(key: key);
}

// 使用 ListView.builder 处理长列表
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => ProfileItem(item: items[index]),
)

// 使用 Shimmer 优化加载体验
class ProfileShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseShimmer(
      child: Column(
        children: [
          ShimmerBox(width: 80, height: 80, isCircle: true),
          ShimmerBox(width: 200, height: 20),
          ShimmerBox(width: 150, height: 16),
        ],
      ),
    );
  }
}
```

### 3. 内存优化
```dart
// 及时释放资源
class ProfilePage extends ConsumerStatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = someStream.listen((data) {
      // 处理数据
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
```

## 🚀 部署发布

### 1. 构建准备
```bash
# 清理项目
flutter clean
flutter pub get

# 生成代码
dart run build_runner build --delete-conflicting-outputs

# 运行测试
flutter test

# 代码分析
dart analyze
```

### 2. Android构建
```bash
# Debug构建
flutter build apk --debug

# Release构建
flutter build apk --release

# App Bundle (推荐)
flutter build appbundle --release
```

### 3. iOS构建
```bash
# Debug构建
flutter build ios --debug

# Release构建
flutter build ios --release

# 使用 Xcode 进行最终构建和签名
```

### 4. Web构建
```bash
# 构建Web版本
flutter build web --release

# 部署到服务器
# 将 build/web 目录内容上传到Web服务器
```

### 5. 版本管理
```yaml
# 在 pubspec.yaml 中更新版本号
version: 1.0.1+2  # 版本号+构建号

# 创建版本标签
git tag v1.0.1
git push origin v1.0.1
```

## 📚 相关文档

- [项目概览](../PROJECT_OVERVIEW.md)
- [API文档](api_documentation.md)
- [测试指南](testing_guide.md)
- [部署指南](deployment_guide.md)
- [网络缓存系统](../../lib/core/network/annotations/README.md)

---

**最后更新**: 2024年12月  
**适用版本**: 1.0.0+  
**维护者**: 开发团队