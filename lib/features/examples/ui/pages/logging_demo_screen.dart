import 'package:cptop/core/index.dart'; // 导入 StreamingTimeUtil
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// 统一的日志功能演示屏幕
class LoggingDemoScreen extends StatefulWidget {
  const LoggingDemoScreen({super.key});

  @override
  State<LoggingDemoScreen> createState() => _LoggingDemoScreenState();
}

class _LoggingDemoScreenState extends State<LoggingDemoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _logMessages = [];
  final ScrollController _scrollController = ScrollController();

  // 日志配置相关状态（已移除LogConfig相关）
  Level _currentLevel = Log.level;
  bool _isEnabled = true;
  int _methodCount = 2;
  bool _useColors = true;
  bool _useEmojis = true;
  bool _showTime = true;

  // 网络请求相关状态
  final Dio _dio = Dio();
  bool _isLoading = false;

  // 标准 Logger 实例
  static final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 8,
      lineLength: 100,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _initDio();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _initDio() {
    // 添加日志拦截器
    // 使用 UnifiedNetworkInterceptor 替代 AppLogInterceptor
    // _dio.interceptors.add(UnifiedNetworkInterceptor(
    //   enableLogging: true,
    // ));
  }

  void _addLogMessage(String message) {
    setState(() {
      _logMessages
          .add('${DateTime.now().toString().substring(11, 19)}: $message');
      if (_logMessages.length > 50) {
        _logMessages.removeAt(0);
      }
    });

    // 滚动到底部
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _setLoading(bool loading) {
    setState(() {
      _isLoading = loading;
    });
  }

  // 记录所有级别的日志
  void _logAllLevels() {
    _addLogMessage('记录所有级别的日志...');

    Log.v('这是一条详细日志 (verbose)');
    Log.d('这是一条调试日志 (debug)');
    Log.i('这是一条信息日志 (info)');
    Log.w('这是一条警告日志 (warning)');
    Log.e('这是一条错误日志 (error)');
    Log.wtf('这是一条严重错误日志 (wtf)');

    _addLogMessage('所有级别的日志已发送到控制台');
  }

  // Logger包的测试方法
  void _testStandardLogger() {
    _addLogMessage('测试标准Logger包...');

    logger.t("这是一条 Trace 级别的日志");
    logger.d("这是一条 Debug 级别的日志");
    logger.i("这是一条 Info 级别的日志");
    logger.w("这是一条 Warning 级别的日志");
    logger.e("这是一条 Error 级别的日志", error: ArgumentError("示例错误"));
    logger.f("这是一条 Fatal 级别的日志", error: StateError("严重错误"));

    _addLogMessage('标准Logger日志已发送到控制台');
  }

  String _getLevelName(Level level) {
    switch (level) {
      case Level.trace:
        return 'Trace';
      case Level.debug:
        return 'Debug';
      case Level.info:
        return 'Info';
      case Level.warning:
        return 'Warning';
      case Level.error:
        return 'Error';
      case Level.fatal:
        return 'Fatal';
      case Level.nothing:
        return '禁用';
      default:
        return level.toString();
    }
  }

  // 网络请求方法
  Future<void> _makeGetRequest() async {
    _setLoading(true);
    _addLogMessage('发送GET请求...');
    try {
      final response = await _dio
          .get('https://cn.kuaikuenglish.com/k/api/app/1/site_config');
      _addLogMessage('GET请求成功: ${response.statusCode}');
    } catch (e) {
      _addLogMessage('GET请求失败: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _makePostRequest() async {
    _setLoading(true);
    _addLogMessage('发送POST请求...');

    try {
      final response = await _dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {
          'title': '测试标题',
          'body': '测试内容',
          'userId': 1,
        },
      );
      _addLogMessage('POST请求成功: ${response.statusCode}');
    } catch (e) {
      _addLogMessage('POST请求失败: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _makeErrorRequest() async {
    _setLoading(true);
    _addLogMessage('发送错误请求...');

    try {
      await _dio
          .get('https://jsonplaceholder.typicode.com/non_existent_endpoint');
      _addLogMessage('请求成功（不应该发生）');
    } catch (e) {
      _addLogMessage('请求失败（预期行为）: ${e.runtimeType}');
    } finally {
      _setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('日志功能演示'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '基本日志'),
            Tab(text: '网络日志'),
            Tab(text: '标准Logger'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildBasicLogTab(),
                _buildNetworkLogTab(),
                _buildStandardLoggerTab(),
              ],
            ),
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              border: Border(top: BorderSide(color: Colors.grey[800]!)),
            ),
            child: Stack(
              children: [
                ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(8.0),
                  itemCount: _logMessages.length,
                  itemBuilder: (context, index) {
                    return Text(
                      _logMessages[index],
                      style: const TextStyle(
                          color: Colors.greenAccent, fontFamily: 'monospace'),
                    );
                  },
                ),
                if (_isLoading)
                  Container(
                    color: Colors.black54,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 基本日志选项卡
  Widget _buildBasicLogTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildSection('基本日志', [
          _buildLogButton('详细日志 (v)',
              () => _addLogMessage('发送详细日志: [32m${Log.v('这是一条详细日志')}[0m')),
          _buildLogButton('调试日志 (d)',
              () => _addLogMessage('发送调试日志: [34m${Log.d('这是一条调试日志')}[0m')),
          _buildLogButton('信息日志 (i)',
              () => _addLogMessage('发送信息日志: [36m${Log.i('这是一条信息日志')}[0m')),
          _buildLogButton('警告日志 (w)',
              () => _addLogMessage('发送警告日志: [33m${Log.w('这是一条警告日志')}[0m')),
          _buildLogButton('错误日志 (e)',
              () => _addLogMessage('发送错误日志: [31m${Log.e('这是一条错误日志')}[0m')),
          _buildLogButton(
              '严重错误日志 (wtf)',
              () => _addLogMessage(
                  '发送严重错误日志: [35m${Log.wtf('这是一条严重错误日志')}[0m')),
        ]),
        _buildSection('带异常的日志', [
          _buildLogButton('记录异常', () {
            try {
              throw Exception('这是一个测试异常');
            } catch (e, stackTrace) {
              _addLogMessage('捕获到异常: ${Log.e('捕获到异常', e, stackTrace)}');
            }
          }),
        ]),
        _buildSection('其他日志类型', [
          _buildLogButton('API调用日志', () {
            final startTime = DateTime.now();
            Future.delayed(const Duration(milliseconds: 100), () {
              final duration = DateTime.now().difference(startTime);
              _addLogMessage('API调用日志: ${Log.api(
                '用户登录',
                request: {'username': 'test', 'password': '******'},
                response: {'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...'},
                duration: duration,
              )}');
            });
          }),
          _buildLogButton('性能日志', () {
            final stopwatch = Stopwatch()..start();
            for (int i = 0; i < 1000000; i++) {
              // 空循环
            }
            stopwatch.stop();
            _addLogMessage(
                '性能日志: ${Log.performance('百万次循环', stopwatch.elapsed)}');
          }),
          _buildLogButton('用户行为日志', () {
            _addLogMessage('用户行为日志: ${Log.userAction('点击登录按钮', params: {
                  'screen': '登录页面',
                  'timestamp': DateTime.now().toString()
                })}');
          }),
        ]),
      ],
    );
  }

  // 网络日志选项卡
  Widget _buildNetworkLogTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildSection('网络请求示例', [
          _buildLogButton('GET请求', _makeGetRequest),
          _buildLogButton('POST请求', _makePostRequest),
          _buildLogButton('错误请求', _makeErrorRequest),
        ]),
        const SizedBox(height: 16),
        const Text(
          '说明：点击按钮发送网络请求，查看控制台输出的日志信息。',
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '日志拦截器会自动记录请求和响应的详细信息，包括请求方法、URL、请求头、请求体、响应状态码、响应体、错误信息等。',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  // 标准Logger选项卡
  Widget _buildStandardLoggerTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            '这是标准的 logger 包演示，展示了不同于自定义AppLogger的原始功能。',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ElevatedButton(
          onPressed: _testStandardLogger,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
          ),
          child: const Text('测试所有Logger级别'),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            '请在开发控制台查看标准Logger的输出效果，它与自定义AppLogger的格式不同。',
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }

  // 构建日志按钮
  Widget _buildLogButton(String title, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 44),
        ),
        child: Text(title),
      ),
    );
  }

  // 构建分节
  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...children,
        const SizedBox(height: 16),
      ],
    );
  }
}
