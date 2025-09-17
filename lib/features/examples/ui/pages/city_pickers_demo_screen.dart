import 'package:cptop/core/logger/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:city_pickers/city_pickers.dart'; // 导入 city_pickers 包

// 此屏幕用于演示城市选择器功能
class CityPickersDemoScreen extends StatefulWidget {
  const CityPickersDemoScreen({super.key});

  static const String routeName = '/cityPickersDemo'; // 路由名称，方便导航

  @override
  State<CityPickersDemoScreen> createState() => _CityPickersDemoScreenState();
}

class _CityPickersDemoScreenState extends State<CityPickersDemoScreen> {
  // 用于存储城市选择器返回的结果，类型为 Result?，初始为 null
  Result? _selectedCityResult;

  // 调用城市选择器并处理结果的方法
  void _showCityPicker() async {
    // 调用 CityPickers.showCityPicker 显示城市选择器
    // context: 当前的 BuildContext
    // theme: 可以自定义主题样式，这里使用默认
    // location: 默认定位到的城市，可以传入一个 Result 对象
    // The returned Future resolves to the Result of the selection.
    // Result 对象包含 provinceName, cityName, areaName, provinceId, cityId, areaId 等属性
    Result? result = await CityPickers.showCityPicker(
      context: context,
      height: 300,
      cancelWidget: const Text('取消', style: TextStyle(color: Colors.grey)),
      confirmWidget: const Text('确定', style: TextStyle(color: Colors.blue)),
      showType: ShowType.pca, // 显示省市区三级选择
    );

    // 当用户做出选择后 (result 不为 null)
    if (result != null) {
      // 更新状态以显示选择的城市信息
      setState(() {
        _selectedCityResult = result;
      });
      // 打印选择结果到控制台，方便调试
      Log.i(
          "选择结果: 省份=${result.provinceName}, 城市=${result.cityName}, 区域=${result.areaName ?? '无'}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('城市选择器演示'), // AppBar 标题
      ),
      body: Center(
        // 使用 Center 将 Column 内容居中
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
          children: <Widget>[
            // 显示当前选择的城市信息
            // 如果 _selectedCityResult 为 null，则显示 "当前选择：无"
            // 否则，格式化显示省、市、区信息，区信息可能为空，所以用 '未选择区域' 作为默认值
            Text(
              _selectedCityResult == null
                  ? '当前选择：无'
                  : '当前选择：${_selectedCityResult?.provinceName} - ${_selectedCityResult?.cityName} - ${_selectedCityResult?.areaName ?? '未选择区域'}',
              style: const TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center, // 文本居中显示
            ),
            const SizedBox(height: 20), // 添加一些间距
            // 用于触发城市选择器的按钮
            ElevatedButton(
              onPressed: _showCityPicker, // 点击时调用 _showCityPicker 方法
              child: const Text('选择城市'),
            ),
          ],
        ),
      ),
    );
  }
}
