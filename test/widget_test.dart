// Flutter 应用基础测试
//
// 测试应用的基本启动和功能

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cptop/app/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // 构建我们的应用并触发一帧
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );

    // 等待应用初始化完成
    await tester.pumpAndSettle();

    // 验证应用是否正常启动
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
