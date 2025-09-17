import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// 关于页面
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  PackageInfo? _packageInfo;

  @override
  void initState() {
    super.initState();
    _loadPackageInfo();
  }

  Future<void> _loadPackageInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = packageInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 应用信息卡片
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.flutter_dash,
                          size: 48,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _packageInfo?.appName ?? 'Flutter App',
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '版本 ${_packageInfo?.version ?? "1.0.0"}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                '构建号 ${_packageInfo?.buildNumber ?? "1"}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 应用描述
            Text(
              '应用介绍',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              '这是一个基于 Flutter 开发的现代化移动应用，采用了模块化架构设计，'
              '支持多语言、主题切换、状态管理等功能。',
            ),
            const SizedBox(height: 24),

            // 技术栈
            Text(
              '技术栈',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const _TechStackItem(
              icon: Icons.flutter_dash,
              title: 'Flutter',
              description: '跨平台移动应用开发框架',
            ),
            const _TechStackItem(
              icon: Icons.code,
              title: 'Dart',
              description: '现代化编程语言',
            ),
            const _TechStackItem(
              icon: Icons.architecture,
              title: 'Riverpod',
              description: '状态管理解决方案',
            ),
            const _TechStackItem(
              icon: Icons.router,
              title: 'GoRouter',
              description: '声明式路由管理',
            ),
            const SizedBox(height: 24),

            // 版权信息
            Text(
              '版权信息',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              '© ${DateTime.now().year} Flutter App. All rights reserved.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _TechStackItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _TechStackItem({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
