import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart'; // 导入 package_info_plus 包

// 此屏幕用于演示使用 package_info_plus 获取并显示应用信息
class PackageInfoPlusDemoScreen extends StatefulWidget {
  const PackageInfoPlusDemoScreen({super.key});

  static const String routeName = '/packageInfoPlusDemo'; // 路由名称

  @override
  State<PackageInfoPlusDemoScreen> createState() =>
      _PackageInfoPlusDemoScreenState();
}

class _PackageInfoPlusDemoScreenState extends State<PackageInfoPlusDemoScreen> {
  // 用于存储应用名称
  String _appName = '加载中...';
  // 用于存储应用包名 (例如：com.example.app)
  String _packageName = '加载中...';
  // 用于存储应用版本号 (例如：1.0.0)
  String _version = '加载中...';
  // 用于存储应用构建号 (例如：1)
  String _buildNumber = '加载中...';
  // 用于存储构建签名 (主要用于 Android，iOS 上可能为空)
  String _buildSignature = '加载中...';
  // 用于存储安装来源商店 (例如：com.android.vending 或 AppStore，可能因平台和分发渠道而异)
  String _installerStore = '加载中...';

  @override
  void initState() {
    super.initState();
    // 页面初始化时异步加载应用信息
    _initPackageInfo();
  }

  // 异步方法：获取应用信息并更新状态
  Future<void> _initPackageInfo() async {
    // PackageInfo.fromPlatform() 是一个异步方法，用于从平台获取应用信息
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      // 更新状态变量以在 UI 中显示获取到的信息
      _appName = info.appName;
      _packageName = info.packageName;
      _version = info.version;
      _buildNumber = info.buildNumber;
      _buildSignature = info.buildSignature; // 注意：buildSignature 主要用于 Android
      _installerStore =
          info.installerStore ?? '不可用'; // installerStore 可能为 null，提供默认值
    });
  }

  // 构建单个信息行的辅助方法
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('应用信息 (PackageInfoPlus) 演示'), // AppBar 标题
      ),
      body: SingleChildScrollView(
        // 使用 SingleChildScrollView 允许内容滚动
        padding: const EdgeInsets.all(16.0), // 为内容添加一些内边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 左对齐 Column 内容
          children: <Widget>[
            const Text(
              '通过 PackageInfoPlus 获取的应用信息:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            // 显示应用名称
            _buildInfoRow('应用名称', _appName),
            // 显示包名
            _buildInfoRow('包名', _packageName),
            // 显示版本号
            _buildInfoRow('版本号', _version),
            // 显示构建号
            _buildInfoRow('构建号', _buildNumber),
            // 显示构建签名 (主要用于 Android)
            _buildInfoRow('构建签名', _buildSignature),
            // 显示安装商店 (主要用于 Android)
            _buildInfoRow('安装商店', _installerStore),
            // 后续可以添加按钮来触发信息刷新
          ],
        ),
      ),
    );
  }
}
