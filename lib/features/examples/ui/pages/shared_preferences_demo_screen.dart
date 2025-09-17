import 'package:shared_preferences/shared_preferences.dart'; // 导入 shared_preferences 包
import 'package:cptop/core/index.dart';

// 此屏幕用于演示 SharedPreferences 功能，用于本地持久化存储键值对数据
class SharedPreferencesDemoScreen extends StatefulWidget {
  const SharedPreferencesDemoScreen({super.key});

  static const String routeName = '/sharedPreferencesDemo'; // 路由名称

  @override
  State<SharedPreferencesDemoScreen> createState() =>
      _SharedPreferencesDemoScreenState();
}

class _SharedPreferencesDemoScreenState
    extends State<SharedPreferencesDemoScreen> {
  // SharedPreferences 使用的键 (Keys)
  static const String _stringKey = 'demo_string_key';
  static const String _intKey = 'demo_int_key';
  static const String _boolKey = 'demo_bool_key';
  static const String _doubleKey = 'demo_double_key';
  static const String _stringListKey = 'demo_string_list_key';

  // 用于 TextField 的控制器
  final TextEditingController _stringController = TextEditingController();
  // 用于 Switch 的布尔值
  bool _boolValue = false;

  // 用于显示从 SharedPreferences 加载的数据
  String _loadedString = '未加载';
  int _loadedInt = 0;
  bool _loadedBool = false;
  double _loadedDouble = 0.0;
  List<String> _loadedStringList = [];

  @override
  void initState() {
    super.initState();
    _loadData(); // 页面初始化时加载已保存的数据
  }

  @override
  void dispose() {
    _stringController.dispose(); // 清理控制器
    super.dispose();
  }

  // 保存数据到 SharedPreferences
  Future<void> _saveData() async {
    if (_stringController.text.isEmpty) {
      _showMessage('请填写所有字段');
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_stringKey, _stringController.text);
    await prefs.setInt(_intKey, int.tryParse(_stringController.text) ?? 0);
    await prefs.setBool(_boolKey, _boolValue);
    await prefs.setDouble(
        _doubleKey, double.tryParse(_stringController.text) ?? 0.0);
    await prefs.setStringList(_stringListKey, [_stringController.text]);

    Log.i('数据已保存');
    _showMessage('数据已保存');
  }

  // 从 SharedPreferences 加载数据
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _loadedString = prefs.getString(_stringKey) ?? '未找到';
      _loadedInt = prefs.getInt(_intKey) ?? 0;
      _loadedBool = prefs.getBool(_boolKey) ?? false;
      _loadedDouble = prefs.getDouble(_doubleKey) ?? 0.0;
      _loadedStringList = prefs.getStringList(_stringListKey) ?? [];
    });

    Log.i('数据已加载');
    _showMessage('数据已加载');
  }

  // 清除所有 SharedPreferences 数据
  Future<void> _clearData() async {
    final prefs = await SharedPreferences.getInstance();

    // 清除特定键
    await prefs.remove(_stringKey);
    await prefs.remove(_intKey);
    await prefs.remove(_boolKey);
    await prefs.remove(_doubleKey);
    await prefs.remove(_stringListKey);

    // 或者清除所有数据
    // await prefs.clear();

    setState(() {
      _stringController.text = '';
      _boolValue = false;
    });

    Log.i('数据已清除');
    _showMessage('数据已清除');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences 演示'), // AppBar 标题
      ),
      body: SingleChildScrollView(
        // 使用 SingleChildScrollView 允许内容滚动
        padding: const EdgeInsets.all(16.0), // 为内容添加一些内边距
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 左对齐 Column 内容
          children: <Widget>[
            const Text(
              '输入数据进行保存:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // 字符串输入框
            TextField(
              controller: _stringController,
              decoration: const InputDecoration(
                labelText: '输入字符串',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            //布尔值输入开关
            Row(
              children: [
                const Text('布尔值 (Boolean): ', style: TextStyle(fontSize: 16)),
                Switch(
                  value: _boolValue,
                  onChanged: (value) {
                    setState(() {
                      _boolValue = value;
                    });
                  },
                ),
                Text(_boolValue.toString()),
              ],
            ),
            // 可以在这里添加其他数据类型的输入，例如 int, double
            // (为了简化，本示例仅包含 String 和 bool 的直接输入)

            const SizedBox(height: 20),
            // 操作按钮区域
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _saveData, // 点击时调用 _saveData 方法
                  child: const Text('保存数据'),
                ),
                ElevatedButton(
                  onPressed: _loadData, // 点击时调用 _loadData 方法
                  child: const Text('加载数据'),
                ),
                ElevatedButton(
                  onPressed: _clearData, // 点击时调用 _clearData 方法
                  child: const Text('清除数据'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              '从 SharedPreferences 加载的数据:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // 显示加载的字符串
            Text('字符串 (String): $_loadedString',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            // 显示加载的整数
            Text('整数 (Int): $_loadedInt', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            // 显示加载的布尔值 (转换为字符串显示)
            Text('布尔值 (Bool): ${_loadedBool.toString()}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            // 显示加载的浮点数
            Text('浮点数 (Double): $_loadedDouble',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            // 显示加载的字符串列表 (使用 join 方法转换为逗号分隔的字符串)
            Text('字符串列表 (List<String>): ${_loadedStringList.join(', ')}',
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
