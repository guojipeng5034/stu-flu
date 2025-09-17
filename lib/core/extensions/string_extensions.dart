/// String 扩展方法
/// 提供常用的字符串处理功能
library;

extension StringExtensions on String {
  /// 判断字符串是否为空或只包含空白字符
  bool get isBlank => trim().isEmpty;

  /// 判断字符串是否不为空且不只包含空白字符
  bool get isNotBlank => !isBlank;

  /// 首字母大写
  String get capitalize {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// 首字母小写
  String get uncapitalize {
    if (isEmpty) return this;
    return this[0].toLowerCase() + substring(1);
  }

  /// 转换为驼峰命名
  String get toCamelCase {
    if (isEmpty) return this;
    final words = split(RegExp(r'[_\s-]+'));
    if (words.isEmpty) return this;

    return words.first.toLowerCase() +
        words.skip(1).map((word) => word.capitalize).join();
  }

  /// 转换为蛇形命名
  String get toSnakeCase {
    return replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => '_${match.group(0)!.toLowerCase()}',
    ).replaceFirst(RegExp(r'^_'), '');
  }

  /// 转换为短横线命名
  String get toKebabCase {
    return toSnakeCase.replaceAll('_', '-');
  }

  /// 移除所有空白字符
  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');

  /// 截断字符串到指定长度，并添加省略号
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) return this;
    return substring(0, maxLength - ellipsis.length) + ellipsis;
  }

  /// 反转字符串
  String get reverse => split('').reversed.join();

  /// 判断是否为有效的邮箱格式
  bool get isValidEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  /// 判断是否为有效的URL格式
  bool get isValidUrl {
    return RegExp(r'^https?:\/\/.+').hasMatch(this);
  }

  /// 判断是否只包含数字
  bool get isNumeric {
    return RegExp(r'^\d+$').hasMatch(this);
  }

  /// 判断是否只包含字母
  bool get isAlpha {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(this);
  }

  /// 判断是否只包含字母和数字
  bool get isAlphaNumeric {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);
  }

  /// 安全的转换为整数
  int? get toIntOrNull {
    return int.tryParse(this);
  }

  /// 安全的转换为双精度浮点数
  double? get toDoubleOrNull {
    return double.tryParse(this);
  }

  /// 重复字符串指定次数
  String repeat(int times) {
    if (times <= 0) return '';
    return List.filled(times, this).join();
  }

  /// 在字符串左侧填充字符到指定长度
  String padLeft(int width, [String padding = ' ']) {
    if (length >= width) return this;
    final padLength = width - length;
    final fullPads = padLength ~/ padding.length;
    final remainingPad = padLength % padding.length;

    return (padding * fullPads) + padding.substring(0, remainingPad) + this;
  }

  /// 在字符串右侧填充字符到指定长度
  String padRight(int width, [String padding = ' ']) {
    if (length >= width) return this;
    final padLength = width - length;
    final fullPads = padLength ~/ padding.length;
    final remainingPad = padLength % padding.length;

    return this + (padding * fullPads) + padding.substring(0, remainingPad);
  }

  /// 移除字符串开头和结尾的指定字符
  String trimChar(String char) {
    String result = this;
    while (result.startsWith(char)) {
      result = result.substring(char.length);
    }
    while (result.endsWith(char)) {
      result = result.substring(0, result.length - char.length);
    }
    return result;
  }
}
