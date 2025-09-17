# 🧪 测试指南

## 📋 概述

本项目采用多层次的测试策略，包括单元测试、集成测试和端到端测试，确保代码质量和功能稳定性。

## 🏗️ 测试架构

### 测试分层

```
测试金字塔
┌─────────────────────────────────────┐
│           E2E Tests                 │  ← 少量，覆盖关键用户流程
├─────────────────────────────────────┤
│        Integration Tests            │  ← 中等数量，测试模块间交互
├─────────────────────────────────────┤
│          Unit Tests                 │  ← 大量，测试单个函数/类
└─────────────────────────────────────┘
```

### 测试目录结构

```
test/
├── unit/                              # 单元测试
│   ├── core/                          # 核心功能测试
│   ├── features/                      # 功能模块测试
│   └── shared/                        # 共享组件测试
├── integration/                       # 集成测试
│   ├── api/                           # API 集成测试
│   └── providers/                     # Provider 集成测试
├── widget/                            # Widget 测试
│   ├── pages/                         # 页面测试
│   └── components/                    # 组件测试
├── e2e/                               # 端到端测试
│   └── flows/                         # 用户流程测试
└── helpers/                           # 测试辅助工具
    ├── mocks/                         # Mock 对象
    ├── fixtures/                      # 测试数据
    └── utils/                         # 测试工具
```

## 🚀 快速开始

### 运行所有测试

```bash
# 运行所有测试
flutter test

# 运行测试并生成覆盖率报告
flutter test --coverage

# 查看覆盖率报告
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### 运行特定测试

```bash
# 运行单元测试
flutter test test/unit/

# 运行集成测试
flutter test test/integration/

# 运行特定测试文件
flutter test test/unit/core/auth/auth_service_test.dart

# 运行包含特定名称的测试
flutter test --name "login"
```

## 📝 单元测试

### 测试核心服务

```dart
// test/unit/core/auth/auth_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:cptop/core/auth/auth_service.dart';

void main() {
  group('AuthService', () {
    late AuthService authService;
    late MockStorageService mockStorage;
    late MockApiClient mockApi;

    setUp(() {
      mockStorage = MockStorageService();
      mockApi = MockApiClient();
      authService = AuthService(mockStorage, mockApi);
    });

    test('should login successfully with valid credentials', () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'password123';
      final expectedToken = 'mock_token';
      
      when(mockApi.login(email, password))
          .thenAnswer((_) async => LoginResponse(token: expectedToken));
      
      // Act
      final result = await authService.login(email, password);
      
      // Assert
      expect(result.isSuccess, true);
      expect(result.data?.token, expectedToken);
      verify(mockStorage.saveToken(expectedToken)).called(1);
    });

    test('should handle login failure', () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'wrong_password';
      
      when(mockApi.login(email, password))
          .thenThrow(ApiException('Invalid credentials'));
      
      // Act
      final result = await authService.login(email, password);
      
      // Assert
      expect(result.isSuccess, false);
      expect(result.errorMessage, contains('Invalid credentials'));
    });
  });
}
```

### 测试数据模型

```dart
// test/unit/features/student/models/student_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:cptop/features/student/data/models/student.dart';

void main() {
  group('Student Model', () {
    test('should create student from JSON', () {
      // Arrange
      final json = {
        'id': '1',
        'name': 'John Doe',
        'email': 'john@example.com',
        'points': 100,
      };

      // Act
      final student = Student.fromJson(json);

      // Assert
      expect(student.id, '1');
      expect(student.name, 'John Doe');
      expect(student.email, 'john@example.com');
      expect(student.points, 100);
    });

    test('should convert student to JSON', () {
      // Arrange
      const student = Student(
        id: '1',
        name: 'John Doe',
        email: 'john@example.com',
        points: 100,
      );

      // Act
      final json = student.toJson();

      // Assert
      expect(json['id'], '1');
      expect(json['name'], 'John Doe');
      expect(json['email'], 'john@example.com');
      expect(json['points'], 100);
    });

    test('should calculate points level correctly', () {
      // Arrange & Act & Assert
      expect(Student(points: 500).pointsLevel, '青铜学员');
      expect(Student(points: 1500).pointsLevel, '白银学员');
      expect(Student(points: 6000).pointsLevel, '黄金学员');
      expect(Student(points: 15000).pointsLevel, '钻石学员');
    });
  });
}
```

## 🔗 集成测试

### 测试 Provider 集成

```dart
// test/integration/providers/student_provider_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:cptop/features/student/presentation/providers/student_provider.dart';

void main() {
  group('StudentProvider Integration', () {
    late ProviderContainer container;
    late MockStudentService mockService;

    setUp(() {
      mockService = MockStudentService();
      container = ProviderContainer(
        overrides: [
          studentServiceProvider.overrideWithValue(mockService),
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('should load student successfully', () async {
      // Arrange
      final student = Student(id: '1', name: 'John');
      when(mockService.getStudent('1'))
          .thenAnswer((_) async => ServiceResult.success(student));

      // Act
      final notifier = container.read(studentProvider.notifier);
      await notifier.loadStudent('1');

      // Assert
      final state = container.read(studentProvider);
      expect(state.currentStudent, student);
      expect(state.isLoading, false);
      expect(state.error, null);
    });
  });
}
```

## 🎨 Widget 测试

### 测试页面组件

```dart
// test/widget/pages/student_detail_page_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cptop/features/student/presentation/pages/student_detail_page.dart';

void main() {
  group('StudentDetailPage Widget', () {
    testWidgets('should display student information', (tester) async {
      // Arrange
      final student = Student(
        id: '1',
        name: 'John Doe',
        email: 'john@example.com',
        points: 1500,
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            studentProvider.overrideWith((ref) => StudentState(
              currentStudent: student,
              isLoading: false,
            )),
          ],
          child: MaterialApp(
            home: StudentDetailPage(studentId: '1'),
          ),
        ),
      );

      // Act
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('john@example.com'), findsOneWidget);
      expect(find.text('白银学员'), findsOneWidget);
    });

    testWidgets('should show loading indicator', (tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            studentProvider.overrideWith((ref) => StudentState(
              isLoading: true,
            )),
          ],
          child: MaterialApp(
            home: StudentDetailPage(studentId: '1'),
          ),
        ),
      );

      // Act
      await tester.pump();

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
```

## 🎯 端到端测试

### 用户流程测试

```dart
// test/e2e/flows/login_flow_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:cptop/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login Flow E2E', () {
    testWidgets('complete login flow', (tester) async {
      // 启动应用
      app.main();
      await tester.pumpAndSettle();

      // 导航到登录页面
      await tester.tap(find.text('登录'));
      await tester.pumpAndSettle();

      // 输入凭据
      await tester.enterText(find.byKey(Key('email_field')), 'test@example.com');
      await tester.enterText(find.byKey(Key('password_field')), 'password123');

      // 点击登录按钮
      await tester.tap(find.text('登录'));
      await tester.pumpAndSettle();

      // 验证登录成功
      expect(find.text('欢迎回来'), findsOneWidget);
    });
  });
}
```

## 🛠️ 测试工具和 Mock

### Mock 对象创建

```dart
// test/helpers/mocks/mock_services.dart
import 'package:mockito/annotations.dart';
import 'package:cptop/core/auth/auth_service.dart';
import 'package:cptop/core/storage/storage_service.dart';
import 'package:cptop/core/network/api_client.dart';

@GenerateMocks([
  AuthService,
  StorageService,
  ApiClient,
  StudentService,
])
void main() {}
```

### 测试数据工厂

```dart
// test/helpers/fixtures/student_fixtures.dart
import 'package:cptop/features/student/data/models/student.dart';

class StudentFixtures {
  static Student createStudent({
    String? id,
    String? name,
    String? email,
    int? points,
  }) {
    return Student(
      id: id ?? '1',
      name: name ?? 'Test Student',
      email: email ?? 'test@example.com',
      points: points ?? 100,
    );
  }

  static List<Student> createStudentList(int count) {
    return List.generate(
      count,
      (index) => createStudent(
        id: (index + 1).toString(),
        name: 'Student ${index + 1}',
        email: 'student${index + 1}@example.com',
        points: (index + 1) * 100,
      ),
    );
  }
}
```

## 📊 测试覆盖率

### 覆盖率目标

- **单元测试覆盖率**: ≥ 80%
- **集成测试覆盖率**: ≥ 60%
- **整体覆盖率**: ≥ 70%

### 生成覆盖率报告

```bash
# 生成覆盖率数据
flutter test --coverage

# 安装 lcov (macOS)
brew install lcov

# 安装 lcov (Ubuntu)
sudo apt-get install lcov

# 生成 HTML 报告
genhtml coverage/lcov.info -o coverage/html

# 查看报告
open coverage/html/index.html
```

## 🔧 测试配置

### 测试依赖

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  integration_test:
    sdk: flutter
  mockito: ^5.4.2
  build_runner: ^2.4.7
  test: ^1.24.6
```

### 测试脚本

```bash
#!/bin/bash
# scripts/run_tests.sh

echo "🧪 Running Flutter Tests..."

# 运行单元测试
echo "📝 Running unit tests..."
flutter test test/unit/ --coverage

# 运行集成测试
echo "🔗 Running integration tests..."
flutter test test/integration/

# 运行 Widget 测试
echo "🎨 Running widget tests..."
flutter test test/widget/

# 生成覆盖率报告
echo "📊 Generating coverage report..."
genhtml coverage/lcov.info -o coverage/html

echo "✅ All tests completed!"
echo "📊 Coverage report: coverage/html/index.html"
```

## 📋 最佳实践

### 1. 测试命名规范

```dart
// ✅ 好的测试名称
test('should return user when login with valid credentials')
test('should throw exception when network is unavailable')
test('should display error message when validation fails')

// ❌ 不好的测试名称
test('login test')
test('test user')
test('error case')
```

### 2. AAA 模式

```dart
test('should calculate total price correctly', () {
  // Arrange - 准备测试数据
  final cart = Cart();
  cart.addItem(Item(price: 10.0, quantity: 2));
  cart.addItem(Item(price: 5.0, quantity: 3));

  // Act - 执行被测试的操作
  final total = cart.calculateTotal();

  // Assert - 验证结果
  expect(total, 35.0);
});
```

### 3. 测试隔离

```dart
group('UserService', () {
  late UserService userService;
  late MockDatabase mockDatabase;

  setUp(() {
    // 每个测试前重新初始化
    mockDatabase = MockDatabase();
    userService = UserService(mockDatabase);
  });

  tearDown(() {
    // 每个测试后清理
    mockDatabase.clear();
  });
});
```

### 4. 异步测试

```dart
test('should load user data asynchronously', () async {
  // Arrange
  when(mockApi.getUser('1'))
      .thenAnswer((_) async => User(id: '1', name: 'John'));

  // Act
  final user = await userService.loadUser('1');

  // Assert
  expect(user.name, 'John');
});
```

## 🚨 常见问题

### Q1: 测试运行缓慢怎么办？

**A**: 
- 使用 `flutter test --concurrency=4` 并行运行测试
- 避免在测试中使用真实的网络请求
- 使用 Mock 对象替代重量级依赖

### Q2: 如何测试异步操作？

**A**:
```dart
test('async operation', () async {
  // 使用 async/await
  final result = await someAsyncFunction();
  expect(result, expectedValue);
});

testWidgets('async widget test', (tester) async {
  // 使用 pumpAndSettle 等待异步操作完成
  await tester.pumpAndSettle();
  expect(find.text('Loaded'), findsOneWidget);
});
```

### Q3: 如何测试 Provider？

**A**:
```dart
test('provider test', () {
  final container = ProviderContainer();
  addTearDown(container.dispose);

  // 测试 Provider 的值
  expect(container.read(counterProvider), 0);

  // 测试 Provider 的方法
  container.read(counterProvider.notifier).increment();
  expect(container.read(counterProvider), 1);
});
```

---

**最后更新**: 2024年12月
**维护者**: 开发团队
