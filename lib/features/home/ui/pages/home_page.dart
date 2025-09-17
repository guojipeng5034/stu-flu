import 'package:cptop/features/auth/ui/providers/auth_provider.dart';
import 'package:cptop/features/home/ui/widgets/categories_tab.dart';
import 'package:cptop/features/home/ui/widgets/home_tab.dart';
import 'package:cptop/features/home/ui/widgets/lesson_tab.dart';
import 'package:cptop/features/home/ui/widgets/settings_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 主页面 - 简化版本，只负责底部导航栏
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '首页',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: '分类',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.school),
      label: '课程',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: '设置',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: _buildTabContent(authState),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: _bottomNavItems,
      ),
    );
  }

  /// 构建 tab 内容
  Widget _buildTabContent(dynamic authState) {
    switch (_currentIndex) {
      case 0:
        return HomeTab(authState: authState);
      case 1:
        return const CategoriesTab();
      case 2:
        return const LessonTab();
      case 3:
        return SettingsTab(authState: authState);
      default:
        return HomeTab(authState: authState);
    }
  }
}
