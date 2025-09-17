import 'package:event_bus/event_bus.dart';

// 全局事件总线实例
// EventBus 用于在应用程序的不同组件之间发送和接收事件，实现解耦。
EventBus eventBus = EventBus();

/// 自定义事件示例：包含一条消息
/// 事件可以是任何 Dart 类。
class CustomEvent {
  String message; // 事件携带的消息内容

  CustomEvent(this.message); // 构造函数

  @override
  String toString() => 'CustomEvent{message: $message}'; // 方便调试时打印事件信息
}

/// 另一个自定义事件示例：包含一个整数值
/// 可以根据需要定义多种不同类型的事件。
class AnotherEvent {
  int value; // 事件携带的整数值

  AnotherEvent(this.value); // 构造函数

  @override
  String toString() => 'AnotherEvent{value: $value}'; // 方便调试时打印事件信息
}
