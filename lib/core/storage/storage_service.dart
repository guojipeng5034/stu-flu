import 'package:shared_preferences/shared_preferences.dart';

/// 存储服务，封装 SharedPreferences
class StorageService {
  final SharedPreferences _prefs;

  /// 存储键前缀，用于避免与其他应用的键冲突
  static const String _keyPrefix = 'app_';

  StorageService(this._prefs);

  /// 获取字符串
  String? getString(String key) {
    final value = _prefs.getString(_prefixKey(key));
    print('StorageService.getString: $key = $value');
    return value;
  }

  /// 设置字符串
  Future<bool> setString(String key, String value) async {
    print('StorageService.setString: $key = $value');
    return _prefs.setString(_prefixKey(key), value);
  }

  /// 获取布尔值
  bool? getBool(String key) {
    return _prefs.getBool(_prefixKey(key));
  }

  /// 设置布尔值
  Future<bool> setBool(String key, bool value) {
    return _prefs.setBool(_prefixKey(key), value);
  }

  /// 获取整数
  int? getInt(String key) {
    return _prefs.getInt(_prefixKey(key));
  }

  /// 设置整数
  Future<bool> setInt(String key, int value) {
    return _prefs.setInt(_prefixKey(key), value);
  }

  /// 获取双精度浮点数
  double? getDouble(String key) {
    return _prefs.getDouble(_prefixKey(key));
  }

  /// 设置双精度浮点数
  Future<bool> setDouble(String key, double value) {
    return _prefs.setDouble(_prefixKey(key), value);
  }

  /// 获取字符串列表
  List<String>? getStringList(String key) {
    return _prefs.getStringList(_prefixKey(key));
  }

  /// 设置字符串列表
  Future<bool> setStringList(String key, List<String> value) {
    return _prefs.setStringList(_prefixKey(key), value);
  }

  /// 检查是否包含键
  bool containsKey(String key) {
    return _prefs.containsKey(_prefixKey(key));
  }

  /// 移除键
  Future<bool> remove(String key) {
    return _prefs.remove(_prefixKey(key));
  }

  /// 清除所有数据
  Future<bool> clear() {
    return _prefs.clear();
  }

  /// 为键添加前缀
  String _prefixKey(String key) {
    return _keyPrefix + key;
  }

  /// 获取用户令牌
  String? getToken() {
    return getString('user_token');
  }

  /// 保存用户令牌
  Future<bool> setToken(String token) {
    return setString('user_token', token);
  }

  /// 清除用户令牌
  Future<bool> clearToken() {
    return remove('user_token');
  }
}
