import 'package:flutter/material.dart';

class AppTheme {
  /// 获取 Material 亮色主题（纯 Material Design）
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF1976D2),
        brightness: Brightness.light,
      ),
      fontFamily: 'Inter',
      textTheme: const TextTheme().apply(
        fontFamily: 'Inter',
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
    );
  }

  /// 获取 Material 暗色主题（纯 Material Design）
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF1976D2),
        brightness: Brightness.dark,
      ),
      fontFamily: 'Inter',
      textTheme: const TextTheme().apply(
        fontFamily: 'Inter',
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
    );
  }
}
