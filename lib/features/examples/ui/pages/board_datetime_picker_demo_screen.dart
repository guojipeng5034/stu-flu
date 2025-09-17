import 'package:flutter/material.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart'; // 导入 board_datetime_picker 包
import 'package:intl/intl.dart'; // 导入 intl 包用于日期格式化
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:cptop/core/logger/app_logger.dart';

// 此屏幕用于演示板式日期时间选择器功能
class BoardDatetimePickerDemoScreen extends StatefulWidget {
  const BoardDatetimePickerDemoScreen({super.key});

  static const String routeName = '/boardDatetimePickerDemo'; // 路由名称，方便导航

  @override
  State<BoardDatetimePickerDemoScreen> createState() =>
      _BoardDatetimePickerDemoScreenState();
}

class _BoardDatetimePickerDemoScreenState
    extends State<BoardDatetimePickerDemoScreen> {
  // 用于存储当前选择的日期时间，类型为 DateTime?，初始为 null
  DateTime? _selectedDateTime;

  // 调用板式日期时间选择器并处理结果的方法
  Future<void> _showBoardDateTimePicker() async {
    // 显示板式日期时间选择器
    // context: 当前的 BuildContext
    // pickerType: 选择器类型，这里是 PickerType.datetime 表示选择日期和时间
    // initialDate: 选择器打开时默认显示的日期，如果 _selectedDateTime 为 null，则使用当前时间
    // options: BoardDateTimeOptions 用于自定义选择器的外观和行为，例如标题
    final result = await showBoardDateTimePicker(
      context: context,
      pickerType: DateTimePickerType.datetime, // 指定选择器类型为日期和时间
      initialDate: _selectedDateTime ??
          DateTime.now(), // 设置初始显示的日期，如果之前有选择则显示之前的，否则显示当前日期
      options: const BoardDateTimeOptions(
        boardTitle: '选择日期和时间', // 设置选择器顶部的标题
        // showDateButton: true, // 是否显示日期选择按钮 (默认为 true)
        // showTimeButton: true, // 是否显示时间选择按钮 (默认为 true)
        // pickerSubTitles: BoardDateTimeItemTitles(date: '自定义日期标题', time: '自定义时间标题'), // 自定义子标题
      ),
    );

    // 当用户做出选择并点击确认后 (result 不为 null)
    if (result != null) {
      // 更新状态以显示选择的日期时间
      setState(() {
        _selectedDateTime = result;
      });
      // 打印选择结果到控制台，方便调试
      Log.i("选择的日期时间: ${result.toIso8601String()}");
    }
  }

  // 显示日期时间选择器
  void _showDateTimePicker() {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2020, 1, 1),
      maxTime: DateTime(2030, 12, 31),
      onChanged: (date) {
        // 当用户滚动日期时触发
      },
      onConfirm: (date) {
        setState(() {
          _selectedDateTime = date;
        });
        Log.i("选择的日期时间: ${date.toIso8601String()}");
      },
      currentTime: _selectedDateTime ?? DateTime.now(),
      locale: LocaleType.zh,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('板式日期时间选择器演示'), // AppBar 标题
      ),
      body: Center(
        // 使用 Center 将 Column 内容居中
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 垂直方向居中对齐
          children: <Widget>[
            // 显示当前选择的日期时间
            // 如果 _selectedDateTime 为 null，则显示 "当前选择：无"
            // 否则，使用 toString() 方法格式化显示 DateTime 对象。
            // 注意：为了更友好的日期时间格式，通常会使用 intl 包中的 DateFormat。
            Text(
              _selectedDateTime == null
                  ? '当前选择：无'
                  // 使用 intl包的DateFormat来格式化日期时间，指定中文区域和特定格式
                  : '当前选择：${DateFormat('yyyy-MM-dd HH:mm:ss', 'zh_CN').format(_selectedDateTime!.toLocal())}',
              style: const TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // 添加一些间距
            // 用于触发日期时间选择器的按钮
            ElevatedButton(
              onPressed:
                  _showBoardDateTimePicker, // 点击时调用 _showBoardDateTimePicker 方法
              child: const Text('选择日期时间'),
            ),
          ],
        ),
      ),
    );
  }
}
