import 'package:cptop/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 本地化配置
class LocalizationConfig {
  /// 支持的语言环境
  static final List<Locale> supportedLocales = [
    const Locale('zh'), // 中文（基础）
    const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'), // 简体中文
    const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'), // 繁体中文
    const Locale('en'), // 英语
    const Locale('ja'), // 日语
    const Locale('ko'), // 韩语
    const Locale('ru'), // 俄语
  ];

  /// 回退语言环境
  static const Locale fallbackLocale = Locale('zh');

  /// 获取系统语言环境
  static Locale getSystemLocale() {
    final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;

    // 检查系统语言是否在支持的语言列表中
    for (final supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == systemLocale.languageCode) {
        // 如果是中文，尝试匹配脚本代码
        if (supportedLocale.languageCode == 'zh') {
          // 根据系统语言的脚本代码或地区代码判断简繁体
          if (systemLocale.scriptCode == 'Hant' ||
              systemLocale.countryCode == 'TW' ||
              systemLocale.countryCode == 'HK' ||
              systemLocale.countryCode == 'MO') {
            return const Locale.fromSubtags(
                languageCode: 'zh', scriptCode: 'Hant');
          } else if (systemLocale.scriptCode == 'Hans' ||
              systemLocale.countryCode == 'CN' ||
              systemLocale.countryCode == 'SG') {
            return const Locale.fromSubtags(
                languageCode: 'zh', scriptCode: 'Hans');
          }
          // 默认返回基础中文
          return supportedLocale;
        }
        return supportedLocale;
      }
    }

    // 如果系统语言不支持，返回回退语言
    return fallbackLocale;
  }
}

// 当前语言环境提供者
final currentLocaleProvider = StateProvider<Locale>((ref) {
  // 使用系统语言或回退到中文
  return LocalizationConfig.getSystemLocale();
});

// 语言切换函数提供者
final localeChangerProvider = Provider<Function(Locale)>((ref) {
  return (Locale newLocale) {
    // 更新当前语言环境
    ref.read(currentLocaleProvider.notifier).state = newLocale;
  };
});

/// 全局T变量 - 直接使用AppLocalizations
AppLocalizations? _globalT;

/// 初始化全局T
void initT(BuildContext context) {
  _globalT = AppLocalizations.of(context);
}

/// 全局T访问器 - 就是AppLocalizations本身
AppLocalizations get T {
  if (_globalT == null) {
    throw Exception('T not initialized. Call initT(context) first.');
  }
  return _globalT!;
}
