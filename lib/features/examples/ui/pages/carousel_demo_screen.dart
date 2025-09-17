import 'package:flutter/material.dart';
// 不再导入 carousel_slider 包

class CarouselDemoScreen extends StatefulWidget {
  const CarouselDemoScreen({super.key});

  static const String routeName = '/carouselDemo'; // 路由名称，方便导航

  @override
  State<CarouselDemoScreen> createState() => _CarouselDemoScreenState();
}

class _CarouselDemoScreenState extends State<CarouselDemoScreen> {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.85);
  int _currentPage = 0;
  bool _isAutoPlaying = true;

  // 定义轮播项目列表
  late final List<Widget> _carouselItems;

  @override
  void initState() {
    super.initState();
    // 在initState中初始化_carouselItems
    _carouselItems = [
      _buildCarouselItem(Colors.blue, '项目 1'),
      _buildCarouselItem(Colors.green, '项目 2'),
      _buildCarouselItem(Colors.red, '项目 3'),
      _buildCarouselItem(Colors.orange, '项目 4'),
      _buildCarouselItem(Colors.purple, '项目 5'),
    ];

    if (_isAutoPlaying) {
      _startAutoPlay();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted || !_isAutoPlaying) return;

      if (_currentPage < _carouselItems.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn,
      );

      _startAutoPlay();
    });
  }

  // 构建单个轮播项目的辅助方法
  Widget _buildCarouselItem(Color color, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text, // 项目文本
          style: const TextStyle(fontSize: 24.0, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('图片轮播演示'), // AppBar 标题
        actions: [
          IconButton(
            icon: Icon(_isAutoPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () {
              setState(() {
                _isAutoPlaying = !_isAutoPlaying;
                if (_isAutoPlaying) {
                  _startAutoPlay();
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: _carouselItems.length,
              itemBuilder: (context, index) {
                return _carouselItems[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _carouselItems.length,
                (index) => Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
