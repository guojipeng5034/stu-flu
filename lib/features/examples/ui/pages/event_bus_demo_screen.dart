import 'package:cptop/core/logger/app_logger.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // 导入 dart:async 以使用 StreamSubscription
import 'event_bus.dart';

// 此屏幕用于演示 EventBus 包在不同组件间进行事件通信的功能
class EventBusDemoScreen extends StatefulWidget {
  const EventBusDemoScreen({super.key});

  static const String routeName = '/eventBusDemo'; // 路由名称

  @override
  State<EventBusDemoScreen> createState() => _EventBusDemoScreenState();
}

class _EventBusDemoScreenState extends State<EventBusDemoScreen> {
  // 用于显示接收到的 CustomEvent 的消息
  String _customEventMessage = '无';
  // 用于显示接收到的 AnotherEvent 的值，使用 int? 类型以支持 null (未接收时)
  int? _anotherEventValue;

  // 用于管理事件订阅的 StreamSubscription 对象
  // 保存订阅对象是为了在 dispose 方法中正确取消订阅，防止内存泄漏
  StreamSubscription? _customEventSubscription;
  StreamSubscription? _anotherEventSubscription;

  @override
  void initState() {
    super.initState();

    // --- 订阅事件 ---
    // 监听 CustomEvent 类型的事件
    // eventBus.on<EventType>() 返回一个 Stream，可以对其进行监听
    _customEventSubscription = eventBus.on<CustomEvent>().listen((event) {
      // 当接收到 CustomEvent 时，执行此回调
      setState(() {
        // 更新 UI 状态以显示接收到的消息
        _customEventMessage = event.message;
      });
      // 调试打印，方便观察事件流
      Log.i('接收到 CustomEvent: ${event.message}');
    });

    // 监听 AnotherEvent 类型的事件
    _anotherEventSubscription = eventBus.on<AnotherEvent>().listen((event) {
      // 当接收到 AnotherEvent 时，执行此回调
      setState(() {
        // 更新 UI 状态以显示接收到的整数值
        _anotherEventValue = event.value;
      });
      // 调试打印
      Log.i('接收到 AnotherEvent: ${event.value}');
    });
  }

  @override
  void dispose() {
    // --- 取消事件订阅 ---
    // 在 Widget 被销毁时，务必取消所有事件订阅，以避免内存泄漏和潜在错误
    _customEventSubscription?.cancel();
    _anotherEventSubscription?.cancel();
    super.dispose();
  }

  // --- 事件发送方法 ---
  void _sendCustomEvent() {
    final message = "你好 EventBus! 时间: ${DateTime.now().toIso8601String()}";
    // eventBus.fire() 用于发送（触发）一个事件
    // 所有订阅了 CustomEvent 类型事件的监听者都会收到此事件
    eventBus.fire(CustomEvent(message));
    // 调试打印
    Log.i('已发送 CustomEvent: $message');
  }

  void _sendAnotherEvent() {
    // 以当前时间的秒数作为示例整数值
    final value = DateTime.now().second;
    // 发送 AnotherEvent
    eventBus.fire(AnotherEvent(value));
    // 调试打印
    Log.i('已发送 AnotherEvent: $value');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EventBus 事件总线演示'), // AppBar 标题
      ),
      body: SingleChildScrollView(
        // 使用 SingleChildScrollView 允许内容滚动
        padding: const EdgeInsets.all(16.0), // 为内容添加一些内边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 左对齐 Column 内容
          children: <Widget>[
            // 事件发送区域
            const Text(
              '事件发送区域:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // 发送 CustomEvent (字符串) 的按钮
            ElevatedButton(
              onPressed: _sendCustomEvent, // 点击时调用发送 CustomEvent 的方法
              child: const Text('发送自定义事件 (字符串)'),
            ),
            const SizedBox(height: 10),
            // 发送 AnotherEvent (整数) 的按钮
            ElevatedButton(
              onPressed: _sendAnotherEvent, // 点击时调用发送 AnotherEvent 的方法
              child: const Text('发送另一事件 (整数)'),
            ),
            const Divider(height: 40, thickness: 1, color: Colors.grey), // 分隔线

            // 事件接收区域
            const Text(
              '事件接收区域:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // 显示接收到的 CustomEvent 消息
            Text(
              '收到的自定义事件消息: $_customEventMessage',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            // 显示接收到的 AnotherEvent 值
            // 如果 _anotherEventValue 为 null (还未收到事件)，则显示 "无"
            Text(
              '收到的另一事件值: ${_anotherEventValue?.toString() ?? '无'}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
