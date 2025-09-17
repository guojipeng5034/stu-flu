import 'package:cptop/core/localization/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 本地化演示页面
class LocalizationDemoPage extends ConsumerWidget {
  const LocalizationDemoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(currentLocaleProvider);

    // 初始化T
    initT(context);

    // 获取语言切换函数
    final changeLocale = ref.read(localeChangerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(T.demoPageTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // 当前语言
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${T.currentLanguage}: ${currentLocale.toString()}',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 16),

                  // 语言切换按钮
                  Wrap(
                    children: [
                      for (final locale in LocalizationConfig.supportedLocales)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ElevatedButton(
                            onPressed: () => changeLocale(locale),
                            style: currentLocale == locale
                                ? ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    foregroundColor: Colors.white,
                                  )
                                : null,
                            child: Text(locale.languageCode.toUpperCase()),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 本地翻译示例
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(T.basicUsageTitle,
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text('T.helloWorld: ${T.helloWorld}'),
                  const SizedBox(height: 4),
                  Text('T.welcomeMessage: ${T.welcomeMessage}'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 翻译状态
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(T.basicUsageTitle,
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text('本地翻译系统已启用'),
                  const SizedBox(height: 4),
                  Text('当前语言: ${currentLocale.languageCode}'),
                  const SizedBox(height: 4),
                  Text('翻译状态: 已初始化'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // T函数使用示例
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(T.demoSectionTitle,
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 16),

                  // T原生调用方式
                  Text('T原生调用方式:'),
                  const SizedBox(height: 8),
                  Text(
                    'T.helloWorld: ${T.helloWorld}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'T.welcomeMessage: ${T.welcomeMessage}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // 带参数的T方法
                  Text('带参数的T方法:'),
                  const SizedBox(height: 4),
                  Text(
                    T.welcomeUserTemplate('用户名'),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // 交互式按钮
                  Text('交互式示例:'),
                  const SizedBox(height: 4),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(T.refreshCompleted)),
                      );
                    },
                    child: Text(T.switchLanguage),
                  ),

                  const SizedBox(height: 16),

                  // 动态翻译示例
                  Text('动态翻译示例:'),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          T.appTitle,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          T.welcomeMessage,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
