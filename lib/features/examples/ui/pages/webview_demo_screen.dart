import 'package:webview_flutter/webview_flutter.dart'; // 导入 webview_flutter 包
import 'package:cptop/core/index.dart';

// 此屏幕用于演示 WebView 功能
class WebViewDemoScreen extends StatefulWidget {
  const WebViewDemoScreen({super.key});

  static const String routeName = '/webViewDemo'; // 路由名称，方便导航

  @override
  State<WebViewDemoScreen> createState() => _WebViewDemoScreenState();
}

class _WebViewDemoScreenState extends State<WebViewDemoScreen> {
  // WebViewController 用于控制 WebView
  late final WebViewController _controller;
  int _progress = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    // 初始化 WebViewController
    _controller = WebViewController()
      // 设置 JavaScript 模式为不受限制，允许 WebView 执行 JavaScript
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // 设置 WebView 的背景颜色，这里设置为透明
      ..setBackgroundColor(const Color(0x00000000))
      // 设置导航代理，用于监听和处理导航事件
      ..setNavigationDelegate(
        NavigationDelegate(
          // 页面加载进度回调
          // onProgress: _onProgressChanged,
          // // 页面开始加载回调
          // onPageStarted: _onPageStarted,
          // // 页面加载完成回调
          // onPageFinished: _onPageFinished,
          // // 网页资源错误回调
          // onWebResourceError: _onWebResourceError,
          // 可以添加 onNavigationRequest 回调来决定是否允许导航到特定URL
          onNavigationRequest: _onNavigationRequest,
        ),
      )
      // 加载指定的 URL，这里加载 Flutter 官方网站
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  void _onProgressChanged(WebViewController controller, int progress) {
    setState(() {
      _progress = progress;
    });
    Log.d('WebView 正在加载 (进度: $progress%)');
  }

  void _onPageStarted(WebViewController controller, String url) {
    setState(() {
      _isLoading = true;
    });
    Log.i('页面开始加载: $url');
  }

  void _onPageFinished(WebViewController controller, String url) {
    setState(() {
      _isLoading = false;
    });
    Log.i('页面加载完成: $url');
  }

  void _onWebResourceError(
      WebViewController controller, WebResourceError error) {
    Log.e('''
WebView 错误:
  错误码: ${error.errorCode}
  描述: ${error.description}
  URL: ${error.url ?? '未知'}
  类型: ${error.errorType}
''');
  }

  NavigationDecision _onNavigationRequest(NavigationRequest request) {
    // 可以在这里拦截导航请求
    if (request.url.contains('blocked-domain.com')) {
      // Log.w('阻止导航到 ${request.url}');
      return NavigationDecision.prevent;
    }
    // Log.d('允许导航到 ${request.url}');
    return NavigationDecision.navigate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView 演示'), // AppBar 标题
      ),
      // 使用 WebViewWidget 显示网页内容，传入之前配置好的 controller
      body: WebViewWidget(controller: _controller),
    );
  }
}
