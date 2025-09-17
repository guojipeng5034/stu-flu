import 'package:jiffy/jiffy.dart'; // 导入 Jiffy 包
import 'package:cptop/core/index.dart'; // 导入 StreamingTimeUtil
import 'dart:async'; // 导入 dart:async 以使用 StreamSubscription

// 此屏幕用于演示 Jiffy 包进行日期时间处理的功能
class JiffyDemoScreen extends StatefulWidget {
  const JiffyDemoScreen({super.key});

  static const String routeName = '/jiffyDemo'; // 路由名称，方便导航

  @override
  State<JiffyDemoScreen> createState() => _JiffyDemoScreenState();
}

class _JiffyDemoScreenState extends State<JiffyDemoScreen> {
  // 用于存储当前时间并格式化后的结果
  String _nowFormatted = '';
  // 用于存储从字符串解析日期后的结果
  String _parsedDate = '';
  // 用于存储对解析后的日期进行自定义格式化后的结果
  String _formattedDate = '';
  // 用于存储日期加减操作后的结果
  String _manipulatedDate = '';
  // 用于存储相对时间（例如，"几秒前"）的计算结果
  String _relativeTime = '';
  StreamSubscription<DateTime>? _timeSubscription; // 监听实时时间流

  @override
  void initState() {
    super.initState();
    // 监听实时时间流
    _timeSubscription =
        StreamingTimeUtil.getRealTimeStream().listen((dateTime) async {
      await Jiffy.setLocale('zh_cn');
      final jiffyNow = Jiffy.parseFromDateTime(dateTime);
      setState(() {
        _nowFormatted =
            "当前时间 (格式化): \\${jiffyNow.format(pattern: 'yyyy-MM-dd HH:mm:ss')}";
      });
    });
    // 其它演示内容初始化
    _performJiffyOperations();
  }

  @override
  void dispose() {
    _timeSubscription?.cancel();
    super.dispose();
  }

  // 执行所有 Jiffy 日期时间操作的方法
  Future<void> _performJiffyOperations() async {
    // 设置 Jiffy 的区域设置，例如 'zh_cn' 表示中文（中国）
    await Jiffy.setLocale('zh_cn');

    // 2. 从字符串解析日期
    final jiffyParsed = Jiffy.parse('2023-10-26 14:30:00');
    _parsedDate = "解析日期 (yMMMMd): \\${jiffyParsed.yMMMMd}";
    _formattedDate =
        "自定义格式化: \\${jiffyParsed.format(pattern: 'EEEE, MMMM do, yyyy h:mm:ss a')}";
    final jiffyManipulated =
        jiffyParsed.add(days: 7, hours: 2).subtract(months: 1);
    _manipulatedDate =
        "日期操作 (加7天2小时,减1月): \\${jiffyManipulated.format(pattern: 'yyyy/MM/dd HH:mm')}";
    _relativeTime =
        "相对时间 (2023/01/01 至今): \\${Jiffy.parseFromDateTime(DateTime(2023, 1, 1)).fromNow()}";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jiffy 日期处理演示'), // AppBar 标题
      ),
      body: SingleChildScrollView(
        // 使用 SingleChildScrollView 允许内容滚动
        padding: const EdgeInsets.all(16.0), // 为内容添加一些内边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 左对齐 Column 内容
          children: <Widget>[
            const Text(
              'Jiffy 日期时间处理示例:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // 显示当前时间格式化结果
            Text(_nowFormatted, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            // 显示解析日期结果
            Text(_parsedDate, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            // 显示自定义格式化结果
            Text(_formattedDate, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            // 显示日期操作结果
            Text(_manipulatedDate, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            // 显示相对时间计算结果
            Text(_relativeTime, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            // 刷新演示按钮
            Center(
              // 将按钮居中
              child: ElevatedButton(
                onPressed: _performJiffyOperations, // 点击时重新执行 Jiffy 操作
                child: const Text('刷新演示'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
