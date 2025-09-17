import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart'; // 导入 RxDart 包
import 'dart:async'; // 导入 dart:async 以使用 StreamSubscription

// 此屏幕用于演示 RxDart 包的响应式编程功能
class RxDartDemoScreen extends StatefulWidget {
  const RxDartDemoScreen({super.key});

  static const String routeName = '/rxdartDemo'; // 路由名称

  @override
  State<RxDartDemoScreen> createState() => _RxDartDemoScreenState();
}

class _RxDartDemoScreenState extends State<RxDartDemoScreen> {
  // --- BehaviorSubject Demo ---
  // BehaviorSubject 会记住最后发送的项目，并在新的订阅者开始监听时立即发送该项目。
  final _textBehaviorSubject = BehaviorSubject<String>();
  // 用于订阅 _textBehaviorSubject.stream 的订阅对象
  StreamSubscription? _textSubscription;
  // 用于订阅转换后的流的订阅对象
  StreamSubscription? _transformedTextSubscription;

  // --- ReplaySubject Demo ---
  // ReplaySubject 会记录流中最近的多个项目，并在新的订阅者开始监听时将这些项目重播给它们。
  // maxSize 参数定义了要缓存的最大项目数量。
  final _counterReplaySubject = ReplaySubject<int>(maxSize: 5); // 示例：最多保留最近5个整数
  // 用于订阅 _counterReplaySubject.stream 的订阅对象
  StreamSubscription? _counterSubscription;
  // 用于 ReplaySubject 的计数器
  int _replayCounter = 0;

  // --- UI State Variables ---
  // 用于 TextField 的控制器
  final TextEditingController _textEditingController = TextEditingController();
  // 用于显示 BehaviorSubject 的最新值
  String _behaviorSubjectValue = '(无)';
  // 用于显示 ReplaySubject 发出的所有值 (UI上显示，可能会根据需要调整以匹配maxSize的视觉效果)
  List<int> _replaySubjectValues = [];
  // 用于显示转换后的数据 (例如，文本大写)
  String _transformedValue = '(无)';

  @override
  void initState() {
    super.initState();

    // --- BehaviorSubject 订阅 ---
    // 监听 _textBehaviorSubject 的流，每当有新值发出时，更新 UI 状态
    _textSubscription = _textBehaviorSubject.stream.listen((value) {
      setState(() {
        _behaviorSubjectValue = value;
      });
    });

    // 监听转换后的流 (例如，将输入文本转换为大写)
    // map 是一个流转换操作符，它将流中的每个项目通过一个函数进行转换
    _transformedTextSubscription = _textBehaviorSubject.stream
        .map((s) => s.toUpperCase()) // 将每个字符串转换为大写
        .listen((value) {
      setState(() {
        _transformedValue = value;
      });
    });

    // --- ReplaySubject 订阅 ---
    // 监听 _counterReplaySubject 的流
    _counterSubscription = _counterReplaySubject.stream.listen((value) {
      setState(() {
        _replaySubjectValues.add(value); // 将新值添加到列表中以供显示
        // 为了在UI上模拟 maxSize 的效果，可以限制列表长度，但 ReplaySubject 内部已处理缓存
        // if (_replaySubjectValues.length > 5) {
        //   _replaySubjectValues.removeAt(0);
        // }
      });
    });
  }

  @override
  void dispose() {
    // 非常重要：在 State 对象被销毁时，关闭 Subjects 并取消所有 StreamSubscriptions，以防止内存泄漏。
    _textEditingController.dispose(); // 清理 TextField 控制器

    _textBehaviorSubject.close(); // 关闭 BehaviorSubject
    _textSubscription?.cancel(); // 取消 BehaviorSubject 的订阅
    _transformedTextSubscription?.cancel(); // 取消转换流的订阅

    _counterReplaySubject.close(); // 关闭 ReplaySubject
    _counterSubscription?.cancel(); // 取消 ReplaySubject 的订阅

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RxDart 响应式编程演示'), // AppBar 标题
      ),
      body: SingleChildScrollView(
        // 使用 SingleChildScrollView 允许内容滚动
        padding: const EdgeInsets.all(16.0), // 为内容添加一些内边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 左对齐 Column 内容
          children: <Widget>[
            const Text(
              'BehaviorSubject 示例 (最新值):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // 文本输入框，其输入将作为 BehaviorSubject 的数据源
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                labelText: '输入文本',
                border: OutlineInputBorder(),
                // suffixIcon: Icon(Icons.send), // 可以用一个按钮来发送，或者直接 onChanged
              ),
              // 当 TextField 中的文本改变时，将新值添加到 _textBehaviorSubject
              onChanged: (value) {
                _textBehaviorSubject.add(value);
              },
            ),
            const SizedBox(height: 8),
            // 显示 BehaviorSubject 的最新值
            Text('BehaviorSubject 最新值: $_behaviorSubjectValue',
                style: const TextStyle(fontSize: 16)),
            const Divider(height: 30, thickness: 1),

            const Text(
              'ReplaySubject 示例 (历史值):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // 按钮，用于向 ReplaySubject 添加整数
            ElevatedButton(
              onPressed: () {
                _replayCounter++; // 计数器自增
                // 将新的计数值添加到 _counterReplaySubject
                _counterReplaySubject.add(_replayCounter);
              },
              child: const Text('向 ReplaySubject 添加整数'),
            ),
            const SizedBox(height: 8),
            // 显示 ReplaySubject 发出的所有值 (或者根据 maxSize 显示最近的几个值)
            Text(
                'ReplaySubject 值 (最多显示5个): ${_replaySubjectValues.reversed.take(5).toList().reversed.join(', ')}',
                style: const TextStyle(fontSize: 16)),
            const Divider(height: 30, thickness: 1),

            const Text(
              'Stream 转换示例 (大写转换):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // 显示 BehaviorSubject 输入文本的大写版本
            Text('Stream.map (输入转大写): $_transformedValue',
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
