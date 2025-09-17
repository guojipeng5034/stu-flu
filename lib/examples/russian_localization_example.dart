import 'package:cptop/core/localization/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 俄语本地化示例页面
class RussianLocalizationExample extends ConsumerWidget {
  const RussianLocalizationExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(currentLocaleProvider);
    final changeLocale = ref.read(localeChangerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(T.appTitle),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 当前语言显示
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      T.currentLanguage,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${currentLocale.languageCode}${currentLocale.scriptCode != null ? '_${currentLocale.scriptCode}' : ''}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 语言切换按钮
            Text(
              T.switchLanguage,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                // 中文（简体）
                ElevatedButton(
                  onPressed: () => changeLocale(
                    const Locale.fromSubtags(
                        languageCode: 'zh', scriptCode: 'Hans'),
                  ),
                  child: const Text('简体中文'),
                ),

                // 中文（繁体）
                ElevatedButton(
                  onPressed: () => changeLocale(
                    const Locale.fromSubtags(
                        languageCode: 'zh', scriptCode: 'Hant'),
                  ),
                  child: const Text('繁體中文'),
                ),

                // 英语
                ElevatedButton(
                  onPressed: () => changeLocale(const Locale('en')),
                  child: const Text('English'),
                ),

                // 日语
                ElevatedButton(
                  onPressed: () => changeLocale(const Locale('ja')),
                  child: const Text('日本語'),
                ),

                // 韩语
                ElevatedButton(
                  onPressed: () => changeLocale(const Locale('ko')),
                  child: const Text('한국어'),
                ),

                // 俄语
                ElevatedButton(
                  onPressed: () => changeLocale(const Locale('ru')),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade100,
                    foregroundColor: Colors.red.shade800,
                  ),
                  child: const Text('Русский'),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // 示例文本
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      T.demoSectionTitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 12),

                    _buildExampleRow(context, T.helloWorld),
                    _buildExampleRow(context, T.welcomeMessage),
                    _buildExampleRow(context, T.login),
                    _buildExampleRow(context, T.register),
                    _buildExampleRow(context, T.forgotPassword),
                    _buildExampleRow(context, T.help),

                    const SizedBox(height: 12),

                    // 登录注册相关示例
                    Text(
                      '登录注册相关:',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),

                    _buildExampleRow(context, T.loginSignUp),
                    _buildExampleRow(context, T.bySMSCode),
                    _buildExampleRow(context, T.byPassword),
                    _buildExampleRow(context, T.agreeAndLogIn),
                    _buildExampleRow(context, T.privacyPolicy),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleRow(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          const Icon(Icons.translate, size: 16, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
