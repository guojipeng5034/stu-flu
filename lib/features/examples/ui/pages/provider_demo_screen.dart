import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // 导入 riverpod 包

// --- 1. 定义状态管理类 (StateNotifier) ---
// CounterNotifier 类，继承自 StateNotifier，用于管理计数器的状态。
// 当状态改变时，它会通知所有监听它的组件进行刷新。
class CounterNotifier extends StateNotifier<int> {
  // 构造函数，初始状态为0
  CounterNotifier() : super(0);

  // 公开获取计数值的 getter
  int get count => state;

  // 增加计数的方法
  void increment() {
    state++; // 直接修改 state，Riverpod 会自动通知监听者
  }

  // 减少计数的方法
  void decrement() {
    state--; // 直接修改 state，Riverpod 会自动通知监听者
  }
}

// --- 2. 定义 Provider ---
// 创建一个 StateNotifierProvider 来管理 CounterNotifier
final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

// --- 3. 主屏幕 Widget (消费状态) ---
// ProviderDemoScreen 是演示页面的根 Widget。
// 使用 ConsumerWidget 来访问 Riverpod 提供者。
class ProviderDemoScreen extends ConsumerWidget {
  const ProviderDemoScreen({super.key});

  static const String routeName = '/providerDemo'; // 路由名称

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 使用 ref.watch 来监听 counterProvider 的状态变化
    // 当状态改变时，此 Widget 将会重建以反映最新的状态
    final count = ref.watch(counterProvider);

    // Scaffold 作为页面的基本结构
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod 状态管理演示'), // AppBar 标题
      ),
      body: Center(
        // 将内容居中显示
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 显示计数值的文本
            // count 直接从 counterProvider 中获取当前状态值
            // 由于使用了 ref.watch，当计数值改变时，这个 Text Widget 会自动更新
            Text(
              '计数值: $count', // 显示当前的计数值
              style: Theme.of(context).textTheme.headlineMedium, // 使用主题的标题样式
            ),
            const SizedBox(height: 20),
            // 操作按钮区域
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 增加计数的按钮
                ElevatedButton(
                  onPressed: () {
                    // 使用 ref.read 来获取 CounterNotifier 的实例并调用方法
                    // ref.read 不会注册为监听者，适用于仅调用方法的场景
                    ref.read(counterProvider.notifier).increment();
                  },
                  child: const Icon(Icons.add),
                ),
                // 减少计数的按钮
                ElevatedButton(
                  onPressed: () {
                    // 同样使用 ref.read 来调用方法
                    ref.read(counterProvider.notifier).decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


