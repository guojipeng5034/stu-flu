import 'package:flutter/material.dart';
import 'package:cptop/env/index.dart';

/// 环境配置使用示例
class DotenvDemoScreen extends StatelessWidget {
  const DotenvDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取环境配置实例
    final env = Env.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dotenv 演示'),
        backgroundColor: env.themeColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 环境信息
            _buildSection(
              '环境信息',
              [
                _buildItem('环境类型', env.environment),
                _buildItem('应用名称', env.appName),
                _buildItem('应用版本', env.fullAppVersion),
              ],
            ),

            // API配置
            _buildSection(
              'API配置',
              [
                _buildItem('基础URL', env.apiBaseUrl),
                _buildItem('超时时间', '${env.apiTimeout}ms'),
                _buildItem('重试次数', '${env.apiRetryCount}次'),
                _buildItem('连接超时', '${env.apiConnectTimeout}ms'),
              ],
            ),

            // 功能开关
            _buildSection(
              '功能开关',
              [
                _buildItem('启用日志', env.enableLogs ? '是' : '否'),
                _buildItem('崩溃报告', env.enableCrashReporting ? '是' : '否'),
                _buildItem('分析', env.enableAnalytics ? '是' : '否'),
                _buildItem('模拟API', env.mockApi ? '是' : '否'),
                _buildItem('调试横幅', env.showDebugBanner ? '是' : '否'),
              ],
            ),

            // URL配置
            _buildSection(
              'URL配置',
              [
                _buildItem('基础URL', env.baseUrl),
                _buildItem('条款URL', env.termsUrl),
                _buildItem('隐私政策URL', env.privacyUrl),
                _buildItem('帮助URL', env.helpUrl),
              ],
            ),

            // 其他配置
            _buildSection(
              '其他配置',
              [
                _buildItem('缓存时间', '${env.cacheDuration}秒'),
                _buildItem('分页大小', '${env.paginationSize}条'),
                _buildItem('最大上传大小', '${env.maxUploadSize / 1024 / 1024}MB'),
                _buildItem('默认本地化', env.defaultLocale),
              ],
            ),

            // 自定义环境变量示例
            _buildSection(
              '自定义环境变量',
              [
                _buildItem('自定义字符串',
                    env.getString('CUSTOM_STRING', defaultValue: '未设置')),
                _buildItem(
                    '自定义整数', '${env.getInt('CUSTOM_INT', defaultValue: 0)}'),
                _buildItem(
                    '自定义布尔值',
                    env.getBool('CUSTOM_BOOL', defaultValue: false)
                        ? '是'
                        : '否'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 构建配置分区
  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: children,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  /// 构建配置项
  Widget _buildItem(String name, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
