import 'package:url_launcher/url_launcher.dart'; // 导入 url_launcher 包
import 'package:cptop/core/index.dart';

// 此屏幕用于演示 url_launcher 包的功能，例如打开网页、拨打电话、发送短信和邮件
class UrlLauncherDemoScreen extends StatefulWidget {
  const UrlLauncherDemoScreen({super.key});

  static const String routeName = '/urlLauncherDemo'; // 路由名称

  @override
  State<UrlLauncherDemoScreen> createState() => _UrlLauncherDemoScreenState();
}

class _UrlLauncherDemoScreenState extends State<UrlLauncherDemoScreen> {
  // 定义需要启动的各种 URL (Uri 对象)
  // Uri.parse 用于将字符串转换为 Uri 对象

  // 网页 URL: scheme 'https', path 'flutter.dev'
  final Uri _urlWeb = Uri.parse('https://flutter.dev');

  // 电话 URL: scheme 'tel', path (电话号码) '+1555010999'
  final Uri _urlTel = Uri.parse('tel:+1555010999');

  // 短信 URL: scheme 'sms', path (电话号码) '+1555010999'
  // queryParameters (查询参数): 'body' 用于预设短信内容
  final Uri _urlSms =
      Uri.parse('sms:+1555010999?body=你好Flutter来自url_launcher演示');

  // 邮件 URL: scheme 'mailto', path (邮箱地址) 'test@example.com'
  // queryParameters: 'subject' 预设邮件主题, 'body' 预设邮件正文
  final Uri _urlMail = Uri.parse(
      'mailto:test@example.com?subject=来自url_launcher演示的邮件&body=你好！这是邮件正文。');

  // 异步方法：尝试启动指定的 Uri
  Future<void> _launchURL(Uri uriToLaunch) async {
    // canLaunchUrl 检查设备上是否有应用可以处理此 Uri
    // 例如，拨打电话需要电话应用，发送邮件需要邮件应用
    if (await canLaunchUrl(uriToLaunch)) {
      // launchUrl 实际启动 URL
      // mode: LaunchMode.externalApplication 通常是期望的行为，它会在外部应用中打开URL
      try {
        await launchUrl(uriToLaunch, mode: LaunchMode.externalApplication);
      } catch (e) {
        // 即使 canLaunchUrl 返回 true，launchUrl 仍可能因其他原因失败
        if (mounted) {
          // 异步操作后，检查 widget 是否仍在 widget 树中
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('启动失败: ${uriToLaunch.toString()}\n错误: $e',
                  style: const TextStyle(color: Colors.white)),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } else {
      // 如果没有应用可以处理此 Uri，则给出提示
      if (mounted) {
        // 异步操作后，检查 widget 是否仍在 widget 树中
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('无法启动 ${uriToLaunch.toString()}。\n请确保已安装相应应用或URL有效。',
                style: const TextStyle(color: Colors.white)),
            backgroundColor: Colors.orange, // 使用不同颜色以区分错误类型
          ),
        );
      }
      Log.e('无法启动: $uriToLaunch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL启动器 (UrlLauncher) 演示'), // AppBar 标题
      ),
      body: SingleChildScrollView(
        // 使用 SingleChildScrollView 允许内容滚动
        padding: const EdgeInsets.all(16.0), // 为内容添加一些内边距
        child: Center(
          // 使按钮列在水平方向上居中
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 垂直方向上内容居中（如果空间足够）
            crossAxisAlignment: CrossAxisAlignment.stretch, // 使按钮宽度充满列宽
            children: <Widget>[
              // 打开网页按钮
              ElevatedButton(
                onPressed: () => _launchURL(_urlWeb), // 调用 _launchURL 并传入网页 Uri
                child: const Text('打开网页 (flutter.dev)'),
              ),
              const SizedBox(height: 16), // 按钮间的垂直间距

              // 拨打电话按钮
              ElevatedButton(
                onPressed: () => _launchURL(_urlTel), // 调用 _launchURL 并传入电话 Uri
                child: const Text('拨打电话 (+1 555 010 999)'),
              ),
              const SizedBox(height: 16),

              // 发送短信按钮
              ElevatedButton(
                onPressed: () => _launchURL(_urlSms), // 调用 _launchURL 并传入短信 Uri
                child: const Text('发送短信 (+1 555 010 999)'),
              ),
              const SizedBox(height: 16),

              // 发送邮件按钮
              ElevatedButton(
                onPressed: () =>
                    _launchURL(_urlMail), // 调用 _launchURL 并传入邮件 Uri
                child: const Text('发送邮件 (test@example.com)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
