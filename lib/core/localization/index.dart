/// 本地化核心模块统一导出
///
/// 简化的本地翻译系统
library;

// 基础依赖
export 'package:flutter/material.dart';

// 生成的本地化文件
export '../../l10n/generated/app_localizations.dart';

// T翻译工具（包含配置、状态管理和翻译功能）
export 'utils/localization_utils.dart';

// 使用方式: T.helloWorld 或 T('key', 'param')
// 用法示例: import 'package:cptop/core/localization/index.dart';
