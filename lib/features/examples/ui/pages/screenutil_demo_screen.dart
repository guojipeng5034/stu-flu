import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 导入 flutter_screenutil 包

// 此屏幕用于演示 flutter_screenutil 包的屏幕适配功能。
// 注意：理想情况下，ScreenUtilInit 应该在应用的根部 (例如 MaterialApp 的 builder) 初始化一次。
// 由于项目结构限制，此处我们在演示页面局部使用它，这可能不完全反映其最佳实践，但足以演示其 API 用法。
class ScreenUtilDemoScreen extends StatelessWidget {
  const ScreenUtilDemoScreen({super.key});

  static const String routeName = '/screenUtilDemo'; // 路由名称

  @override
  Widget build(BuildContext context) {
    // ScreenUtilInit 用于初始化屏幕适配工具。
    // designSize: 设计稿的基准尺寸，单位是逻辑像素 (dp)。后续所有 .sp, .w, .h 等单位会基于此尺寸进行缩放。
    // builder: 返回使用 ScreenUtil 进行适配的 Widget 树。
    //          通常，builder 会返回 MaterialApp，以便整个应用都能使用 ScreenUtil。
    //          在此演示中，我们直接返回 Scaffold 来展示局部效果。
    return ScreenUtilInit(
      designSize: const Size(360, 690), // 设置设计稿的宽度和高度
      minTextAdapt: true, // 是否根据宽度/高度中的最小值进行文本适配
      splitScreenMode: true, // 是否支持分屏模式下的动态尺寸调整
      builder: (context, child) {
        // 这里的 context 是 ScreenUtilInit 初始化后的 context，可以安全使用 ScreenUtil。
        return Scaffold(
          appBar: AppBar(
            title: const Text('屏幕适配 (ScreenUtil) 演示'), // AppBar 标题
          ),
          body: SingleChildScrollView(
            // 使用 SingleChildScrollView 允许内容滚动
            padding: const EdgeInsets.all(16.0), // 为内容添加一些内边距
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // 显示设计稿基准尺寸
                  Text(
                    '设计稿基准尺寸: 360w x 690h',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontStyle: FontStyle.italic,
                        color: Colors.purple),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),

                  // --- 响应式容器 ---
                  // .w 用于获取相对于设计稿宽度的缩放值
                  // .h 用于获取相对于设计稿高度的缩放值
                  Container(
                    width: 180.w, // 宽度将根据屏幕宽度与设计稿宽度的比例进行缩放
                    height: 100.h, // 高度将根据屏幕高度与设计稿高度的比例进行缩放
                    color: Colors.blueAccent,
                    child: Center(
                      child: Text(
                        '宽180.w 高100.h',
                        // .sp 用于获取根据屏幕密度和设计稿尺寸缩放后的字体大小
                        // 它同时考虑了文字缩放因子，确保文本的可访问性
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // --- 响应式文本 ---
                  Text(
                    '字体大小 16.sp',
                    style: TextStyle(fontSize: 16.sp),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  // .sw 用于获取屏幕宽度的一部分 (0.0 ~ 1.0)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.2.sw), // 水平内边距为屏幕宽度的20%
                    child: Text(
                      '此文本水平内边距为屏幕宽度的20% (0.2.sw)',
                      style: TextStyle(
                          fontSize: 10.sp, backgroundColor: Colors.limeAccent),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // --- 响应式 Padding/Margin 和 SizedBox ---
                  // .r 用于获取一个通用的缩放尺寸，它会根据宽度和高度的缩放比例中较小的一个进行缩放
                  // 这对于需要同时考虑宽度和高度比例的场景（如圆形半径、统一边距）很有用
                  Padding(
                    padding: EdgeInsets.all(10.r),
                    child: Text(
                      '此文本所有内边距为 10.r (自适应半径/通用尺寸)',
                      style: TextStyle(
                          fontSize: 14.sp,
                          backgroundColor: Colors.lightGreenAccent),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20.h), // 使用 .h 来创建响应式高度的间距

                  // --- 固定尺寸与 ScreenUtil 尺寸对比 ---
                  const Text(
                    '固定尺寸 vs ScreenUtil 尺寸对比:',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50, // 固定高度 50dp
                        width: 50, // 固定宽度 50dp
                        color: Colors.amber,
                        child: Center(
                            child: Text('固定\n50dp',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 10.sp, color: Colors.black))),
                      ),
                      Container(
                        height: 50.h, // 响应式高度，基于设计稿的50h
                        width: 50.w, // 响应式宽度，基于设计稿的50w
                        color: Colors.green,
                        child: Center(
                            child: Text('50.h\n50.w',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.sp))),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // 提示用户调整窗口大小
                  const Text(
                    '尝试改变模拟器/窗口尺寸查看适配效果。',
                    style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.deepOrange),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '注意: ScreenUtilInit 通常在应用根部初始化。此页面为局部演示。',
                    style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Colors.orange),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
