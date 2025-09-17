import 'package:carousel_slider/carousel_slider.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';

import '../../../../shared/models/network/banner/banner.dart' as banner_model;
import '../../../../shared/ui/widgets/images/cached_banner_image.dart';
import '../../../../shared/utils/utils.dart';
import 'home_components/home_components.dart';

/// 首页Tab组件 - 包含 DraggableHome 功能
class HomeTab extends StatefulWidget {
  final dynamic authState;

  const HomeTab({
    super.key,
    required this.authState,
  });

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentCarouselIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  // 轮播图数据
  final List<banner_model.Banner> _bannerItems = [
    const banner_model.Banner(
      image: 'https://picsum.photos/800/400?random=1',
      url: 'https://www.example.com/banner1',
    ),
    const banner_model.Banner(
      image: 'https://picsum.photos/800/400?random=2',
      url: 'https://www.example.com/banner2',
    ),
    const banner_model.Banner(
      image: 'https://picsum.photos/800/400?random=3',
      url: 'https://www.example.com/banner3',
    ),
    const banner_model.Banner(
      image: 'https://picsum.photos/800/400?random=4',
      url: 'https://www.example.com/banner4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double expandedRatio = 190 / screenHeight;
    return DraggableHome(
      leading: const Icon(Icons.menu),
      title: const Text('首页'),
      headerWidget: _buildBannerWidget(context),
      headerExpandedHeight: expandedRatio,
      body: [
        _buildHomeContent(context),
      ],
    );
  }

  /// 构建轮播图 Banner 组件
  Widget _buildBannerWidget(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          // 轮播图
          CarouselSlider.builder(
            carouselController: _carouselController,
            itemCount: _bannerItems.length,
            itemBuilder: (context, index, realIndex) {
              final item = _bannerItems[index];
              return BannerImageFactory.carousel(
                imageUrl:
                    item.image ?? 'https://picsum.photos/800/400?random=1',
                width: MediaQuery.of(context).size.width,
                height: 200,
                onTap: () => UrlUtils.openInAppWebView(item.url),
              );
            },
            options: CarouselOptions(
              height: 200,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentCarouselIndex = index;
                });
              },
            ),
          ),
          // 指示器
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            height: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _bannerItems.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _carouselController.animateToPage(entry.key),
                  child: Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentCarouselIndex == entry.key
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// 构建首页内容
  Widget _buildHomeContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 学习通知卡片
          _buildNotificationCard(context),
          const SizedBox(height: 16),

          // 功能按钮网格
          const FunctionGrid(),
          const SizedBox(height: 16),

          // 推广卡片
          _buildPromotionCard(context),
          const SizedBox(height: 16),

          // 推荐课程模块
          const RecommendedCurriculums(),
          const SizedBox(height: 16),

          // 特色课模块
          const SpecialCurriculums(),
          const SizedBox(height: 16),

          // 推荐老师模块
          const RecommendedTeachers(),
          const SizedBox(height: 16),

          // 底部测试按钮
          _buildTestButton(context),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  /// 构建学习通知卡片
  Widget _buildNotificationCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // 左侧学习通知标签
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.red, width: 1),
              //   borderRadius: BorderRadius.circular(2),
              // ),
              child: const Text(
                '学习\n通知',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 12),
            // 右侧内容
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '最新消息！最新消息！快来看！快来看！',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '2025-12-12 12:12',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建推广卡片
  Widget _buildPromotionCard(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.blue[50]!, Colors.white],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: const Text(
                '免费精品外教试听课',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 处理立即领取逻辑
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                '立即领取',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建测试按钮
  Widget _buildTestButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '5分钟测试真实英语水平',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              '立即测试',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
