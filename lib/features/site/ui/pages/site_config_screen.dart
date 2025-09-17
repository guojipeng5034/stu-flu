// Site config screen

import 'package:cptop/core/index.dart';
import 'package:cptop/features/site/ui/providers/site_provider.dart';
import 'package:cptop/shared/models/master/index.dart';
import 'package:flutter/foundation.dart' show kIsWeb, kDebugMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SiteConfigScreen extends ConsumerStatefulWidget {
  const SiteConfigScreen({super.key});

  @override
  ConsumerState<SiteConfigScreen> createState() => _SiteConfigScreenState();
}

class _SiteConfigScreenState extends ConsumerState<SiteConfigScreen> {
  bool _isLoading = true;
  String? _errorMessage;
  List<SiteConfig> _siteConfigs = [];
  bool _useMockData = false; // 新增：是否使用模拟数据的标志
  Stream<DateTime>? _timeStream;

  @override
  void initState() {
    super.initState();
    _loadSiteConfig();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadSiteConfig() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final siteService = await ref.read(siteServiceProvider.future);
      final response = await siteService.getSiteConfig();
      List<SiteConfig>? data = response.data;

      setState(() {
        _isLoading = false;
        if (response.isSuccess && data != null) {
          _siteConfigs = data;
          // 如果成功加载站点配置，设置时区并初始化时间流
          if (_siteConfigs.isNotEmpty &&
              _siteConfigs.first.defaultTimeZone != null) {
            _initializeTimeStream(_siteConfigs.first.defaultTimeZone!);
          }
        } else {
          _errorMessage = response.message ?? '获取站点配置失败';
          // Web环境中，如果获取配置失败，提供使用模拟数据的选项
          _useMockData = kIsWeb;
        }
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = '获取站点配置时出错-----: ${e.toString()}';
        // Web环境中，如果获取配置失败，提供使用模拟数据的选项
        _useMockData = kIsWeb;
      });
    }
  }

  // 初始化时间流
  void _initializeTimeStream(String timezone) {
    // 设置StreamingTimeUtil的目标时区
    StreamingTimeUtil.updateTargetTimezone(timezone);
    // 获取实时时间流
    _timeStream = StreamingTimeUtil.getRealTimeStream();
  }

  // 使用模拟数据
  void _useMockSiteConfig() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('站点配置'),
        actions: [
          // 添加刷新按钮
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadSiteConfig,
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_errorMessage!, style: TextStyle(color: Colors.red)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loadSiteConfig,
              child: const Text('重试'),
            ),
            // 在Web环境中显示使用模拟数据的选项
            if (_useMockData) ...[
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _useMockSiteConfig,
                child: const Text('使用模拟数据 (仅开发用)'),
              ),
              const SizedBox(height: 10),
              Text(
                '注意: 在Web环境中可能存在跨域(CORS)限制',
                style: TextStyle(color: Colors.orange[800], fontSize: 12),
              ),
              const SizedBox(height: 5),
              if (kDebugMode)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '开发者建议: 考虑使用代理服务器或配置CORS头以解决此问题',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ],
        ),
      );
    }

    if (_siteConfigs.isEmpty) {
      return const Center(child: Text('没有获取到站点配置数据'));
    }

    // 显示第一个站点配置
    final siteConfig = _siteConfigs.first;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('基础信息'),
          _buildInfoItem('站点ID', '${siteConfig.siteId ?? '未知'}'),
          _buildInfoItem('默认时区', siteConfig.defaultTimeZone ?? '无'),

          // 添加时区对应的实时时间
          if (siteConfig.defaultTimeZone != null && _timeStream != null)
            _buildTimeStreamWidget(siteConfig.defaultTimeZone!),

          _buildInfoItem('AIGC域名', siteConfig.aigcDomain ?? '无'),
          _buildInfoItem('HTTPS基础URL', siteConfig.uriHttpsBase ?? '无'),
          const SizedBox(height: 16),
          _buildSectionTitle('AIGC横幅'),
          if (siteConfig.aigcBanner != null &&
              siteConfig.aigcBanner!.isNotEmpty)
            ...siteConfig.aigcBanner!.map((banner) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('图片URL: ${banner.image ?? '无'}'),
                    Text('链接: ${banner.url ?? '无'}'),
                    const Divider(),
                  ],
                )),
          const SizedBox(height: 16),
          _buildSectionTitle('课程信息'),
          if (siteConfig.aigcCurriculum != null &&
              siteConfig.aigcCurriculum!.isNotEmpty)
            ...siteConfig.aigcCurriculum!.map((curriculum) => Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          curriculum.name ?? '未命名课程',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('代码: ${curriculum.code ?? '无'}'),
                        Text('描述: ${curriculum.description ?? '无描述'}'),
                        if (curriculum.applicableUser != null &&
                            curriculum.applicableUser!.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              const Text('适用用户:'),
                              ...curriculum.applicableUser!.map(
                                (user) => Text('  · ${user.name ?? '未知'}'),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                )),
          const SizedBox(height: 16),
          _buildSectionTitle('支持的语言'),
          if (siteConfig.supportLang != null &&
              siteConfig.supportLang!.isNotEmpty)
            ...siteConfig.supportLang!.map((lang) => Text(
                  '${lang.name ?? '未知'} (${lang.key ?? '无代码'})',
                )),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  // 构建实时时间显示的Widget
  Widget _buildTimeStreamWidget(String timezone) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '当前时区时间',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: StreamBuilder<DateTime>(
              stream: _timeStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('获取时间出错: ${snapshot.error}',
                      style: TextStyle(color: Colors.red));
                }

                if (!snapshot.hasData) {
                  return const Text('正在获取时间...');
                }

                final DateTime time = snapshot.data!;
                // 格式化显示时间
                return Text(
                  '${time.year}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')} '
                  '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
