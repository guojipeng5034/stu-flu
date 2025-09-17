import 'package:cptop/core/localization/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // 添加了 Riverpod
import 'package:intl/intl.dart'; // 导入 intl 包

// 此屏幕用于演示 intl 包的国际化和本地化功能
class IntlDemoScreen extends ConsumerStatefulWidget {
  // 更改为 ConsumerStatefulWidget
  const IntlDemoScreen({super.key});

  static const String routeName = '/intlDemo'; // 路由名称

  @override
  ConsumerState<IntlDemoScreen> createState() =>
      _IntlDemoScreenState(); // 更改为 ConsumerState
}

class _IntlDemoScreenState extends ConsumerState<IntlDemoScreen> {
  // 更改为 ConsumerState
  // 用于存储各种 intl 操作结果的字符串
  String _defaultLocaleDisplay = '(待设置)'; // 显示当前 Intl.defaultLocale
  String _dateStyle1 = '(待加载)'; // 日期格式化风格1
  String _dateStyle2 = '(待加载)'; // 日期格式化风格2
  String _dateStyle3 = '(待加载)'; // 日期格式化风格3 (自定义)
  String _currencyValue = '(待加载)'; // 货币格式化结果
  String _percentValue = '(待加载)'; // 百分比格式化结果
  String _pluralResult0 = '(待加载)'; // 复数处理结果 (0个项目)
  String _pluralResult1 = '(待加载)'; // 复数处理结果 (1个项目)
  String _pluralResult5 = '(待加载)'; // 复数处理结果 (5个项目)

  @override
  void initState() {
    super.initState();
    // 设置默认区域设置。这会影响所有未显式指定区域的 Intl 操作。
    // 例如，DateFormat.yMMMMd() 如果不传 locale 参数，就会使用这个默认值。
    // 注意：在实际应用中，通常会在应用启动时（例如 main.dart）根据用户偏好或设备设置来设定。
    Intl.defaultLocale = 'zh_CN'; // 设置为中文（中国）
    _defaultLocaleDisplay = Intl.defaultLocale ?? '未设置';

    // 执行 Intl 操作以初始化显示值
    _performIntlOperations();
  }

  void _performIntlOperations() {
    final now = DateTime.now(); // 获取当前日期和时间

    // --- 日期格式化示例 ---
    // DateFormat.yMMMMd(locale) 使用预定义的骨架 (skeleton) 进行格式化，并可指定区域。
    // 'zh_CN' 会产生如 "2023年10月26日" 的格式。
    _dateStyle1 = "yMMMMd ('zh_CN'): ${DateFormat.yMMMMd('zh_CN').format(now)}";

    // 'en_US' 会产生如 "Thursday, October 26, 2023" 的格式。
    _dateStyle2 =
        "yMMMMEEEEd ('en_US'): ${DateFormat.yMMMMEEEEd('en_US').format(now)}";

    // DateFormat(pattern, locale) 允许使用自定义的模式字符串进行格式化。
    _dateStyle3 =
        "自定义 'yyyy-MM-dd HH:mm:ss': ${DateFormat('yyyy-MM-dd HH:mm:ss', 'zh_CN').format(now)}";

    // --- 数字格式化示例 ---
    // NumberFormat.currency() 用于格式化货币值。
    // locale: 指定区域，影响货币符号、分隔符等。
    // symbol: 可以强制指定货币符号。
    _currencyValue =
        NumberFormat.currency(locale: 'zh_CN', symbol: '¥').format(12345.678);

    // NumberFormat.percentPattern() 用于格式化百分比。
    _percentValue = NumberFormat.percentPattern('zh_CN')
        .format(0.756); // 输出 "76%" (根据区域设置可能不同)

    // --- 复数处理简单示例 ---
    // Intl.plural() 根据数量选择合适的复数形式。
    // zero, one, two, few, many, other: 这些参数定义不同数量下的字符串。
    // name: 参数名，在某些高级本地化场景中使用。
    // locale: 指定区域，因为不同语言的复数规则不同。
    // 注意：Intl.plural 中的 {count} 占位符本身不会被自动替换为实际的数字。
    // 需要手动替换，或者在更完整的 l10n 方案 (如使用 .arb 文件和 flutter_localizations) 中，
    // 这些占位符会由工具链处理。
    _pluralResult0 = Intl.plural(
      0,
      zero: '没有项目',
      one: '1 个项目',
      other: '{count} 个项目', // {count} 是占位符
      name: 'item_count',
      locale: 'zh_CN',
    );

    _pluralResult1 = Intl.plural(
      1,
      zero: '没有项目',
      one: '1 个项目',
      other: '{count} 个项目',
      name: 'item_count',
      locale: 'zh_CN',
    );

    String tempPlural5 = Intl.plural(
      5,
      zero: '没有项目',
      one: '1 个项目',
      other: '{count} 个项目',
      name: 'item_count',
      locale: 'zh_CN',
    );
    // 手动替换 {count} 占位符以作演示
    _pluralResult5 = tempPlural5.replaceAll('{count}', '5');

    // 更新UI以显示结果
    setState(() {});
  }

  // 构建信息展示行的辅助方法
  Widget _buildDemoRow(String label, String value, {bool isTitle = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: isTitle ? 8.0 : 4.0, horizontal: isTitle ? 0 : 16.0),
      child: Text(
        '$label$value',
        style: TextStyle(
          fontSize: isTitle ? 18 : 16,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 访问 .arb 文件的本地化内容
    final localizations = AppLocalizations.of(context)!;
    // 初始化T并获取本地翻译
    initT(context);
    Widget serverTextWidget = Text("本地翻译: ${T.helloWorld}");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Intl & App Localizations Demo'), // AppBar 标题
        actions: [
          // 添加一个刷新按钮，方便重新执行 Intl 操作
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _performIntlOperations,
            tooltip: '刷新演示',
          )
        ],
      ),
      body: SingleChildScrollView(
        // 使用 SingleChildScrollView 允许内容滚动
        padding: const EdgeInsets.all(16.0), // 为内容添加一些内边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 左对齐 Column 内容
          children: <Widget>[
            _buildDemoRow('当前 Intl.defaultLocale: ', _defaultLocaleDisplay,
                isTitle: true),
            const SizedBox(height: 16),

            _buildDemoRow('日期格式化 (DateFormat):', '', isTitle: true),
            _buildDemoRow('  - ', _dateStyle1), // 使用 yMMMMd('zh_CN')
            _buildDemoRow('  - ', _dateStyle2), // 使用 yMMMMEEEEd('en_US')
            _buildDemoRow('  - ', _dateStyle3), // 自定义格式 'yyyy-MM-dd HH:mm:ss'
            const SizedBox(height: 16),

            _buildDemoRow('数字格式化 (NumberFormat):', '', isTitle: true),
            _buildDemoRow('  - 货币 (CNY): ', _currencyValue),
            _buildDemoRow('  - 百分比: ', _percentValue),
            const SizedBox(height: 16),

            _buildDemoRow('复数处理 (Intl.plural):', '', isTitle: true),
            _buildDemoRow('  - ', _pluralResult0), // 0个项目
            _buildDemoRow('  - ', _pluralResult1), // 1个项目
            _buildDemoRow('  - ', _pluralResult5), // 5个项目
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 4.0),
              child: Text(
                '(注意: Intl.plural 中的 {count} 需手动替换或使用 l10n 工具)',
                style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey),
              ),
            ),
            const SizedBox(height: 24), // 间隔

            // ARB 翻译部分
            _buildDemoRow('ARB Translations:', '', isTitle: true),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'From ARB (AppLocalizations): ${localizations.helloWorld}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: serverTextWidget, // 显示本地翻译
            ),
          ],
        ),
      ),
    );
  }
}
