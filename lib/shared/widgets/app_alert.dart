import 'package:cptop/l10n/generated/app_localizations.dart';
import 'package:cptop/shared/constants/colors.dart';
import 'package:flutter/material.dart';

/// 弹窗按钮动作配置类
/// 用于描述弹窗中每个按钮的显示文本、返回值、颜色和点击回调
class AppAlertAction<T> {
  /// 按钮显示的文本
  final String label;

  /// 按钮点击后通过 Navigator.pop 返回的结果
  final T? result;

  /// 按钮的背景色（可选，未设置时用默认色）
  final Color? bgColor;

  /// 按钮的文本颜色（可选，未设置时用默认色）
  final Color? textColor;

  /// 按钮点击时额外执行的回调（可选）
  final VoidCallback? onTap;

  /// 构造函数
  AppAlertAction(
    this.label, {
    this.result,
    this.bgColor,
    this.textColor,
    this.onTap,
  });
}

/// 通用弹窗工具类
/// 提供 show、confirm、info 三种弹窗调用方式
class AppAlert {
  /// 通用弹窗（支持横向/纵向按钮排列，按钮可自定义颜色和回调）
  ///
  /// [context]      —— BuildContext，必传
  /// [title]        —— 弹窗标题，为null时使用本地化的"温馨提示"
  /// [content]      —— 弹窗内容 Widget，必传
  /// [actions]      —— 按钮列表（每个按钮可自定义颜色、回调等），必传
  /// [barrierDismissible] —— 是否点击遮罩关闭弹窗，默认 false
  ///
  /// 返回 Future<T?>，T 由按钮 result 决定
  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    required Widget content,
    required List<AppAlertAction<T>> actions,
    bool barrierDismissible = false,
  }) {
    // 判断按钮排列方式：2个按钮横向，其余纵向
    final isHorizontal = actions.length == 2;
    final l10n = AppLocalizations.of(context)!;
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (ctx) {
        return Dialog(
          // 弹窗圆角
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 标题区域
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    title ?? l10n.reminder,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.primaryBoldText, // 主标题色
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // 内容区域
                content,
                const SizedBox(height: 24),
                // 按钮区域
                isHorizontal
                    // 两个按钮横向排列
                    ? Row(
                        children: List.generate(actions.length, (i) {
                          final action = actions[i];
                          return Expanded(
                            child: Padding(
                              // 第一个按钮无左间距，第二个按钮有左间距
                              padding: EdgeInsets.only(left: i == 0 ? 0 : 16),
                              child: TextButton(
                                onPressed: () {
                                  // 关闭弹窗并返回 result
                                  Navigator.of(ctx).pop(action.result);
                                  // 执行自定义回调
                                  action.onTap?.call();
                                },
                                style: TextButton.styleFrom(
                                  // 优先使用自定义背景色，否则第一个按钮用灰色，第二个用主色
                                  backgroundColor: action.bgColor ??
                                      (i == 0
                                          ? Color(0xFFF3F7F9)
                                          : AppColors.primary),
                                  // 优先使用自定义文本色，否则第一个按钮用主文本色，第二个用白色
                                  foregroundColor: action.textColor ??
                                      (i == 0
                                          ? AppColors.primaryNormalText
                                          : Colors.white),
                                  // 按钮圆角
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(19.5),
                                  ),
                                  // 按钮内边距（高度主要靠 minimumSize 控制）
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  // 按钮文本样式
                                  textStyle: const TextStyle(fontSize: 14),
                                  // 按钮最小高度 40
                                  minimumSize: const Size(0, 40),
                                ),
                                child: Text(action.label),
                              ),
                            ),
                          );
                        }),
                      )
                    // 多于两个按钮纵向排列
                    : Column(
                        children: List.generate(actions.length, (i) {
                          final action = actions[i];
                          return Column(
                            children: [
                              // 除第一个按钮外，顶部加分割线
                              if (i > 0) const Divider(height: 1),
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop(action.result);
                                    action.onTap?.call();
                                  },
                                  style: TextButton.styleFrom(
                                    // 优先用自定义背景色，否则透明
                                    backgroundColor:
                                        action.bgColor ?? Colors.transparent,
                                    // 优先用自定义文本色，否则"返回"用灰色，其它用主色
                                    foregroundColor: action.textColor ??
                                        (action.label == '返回'
                                            ? const Color(0xFFF3F7F9)
                                            : AppColors.primary),
                                    // 按钮圆角
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(19.5),
                                    ),
                                    // 按钮内边距
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    // 按钮文本样式
                                    textStyle: const TextStyle(fontSize: 14),
                                    // 按钮最小高度 40
                                    minimumSize: const Size(0, 40),
                                  ),
                                  child: Text(action.label),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// 快捷：确认弹窗（双按钮，返回 true/false）
  ///
  /// [cancelText] 取消按钮文本，为null时使用本地化文本
  /// [confirmText] 确认按钮文本，为null时使用本地化文本
  /// [cancelColor] 取消按钮文本色（默认灰色）
  /// [confirmColor] 确认按钮背景色（默认主色）
  /// [onCancel] 取消按钮点击回调
  /// [onConfirm] 确认按钮点击回调
  ///
  /// 返回 true/false
  static Future<bool?> confirm({
    required BuildContext context,
    String? title,
    required Widget content,
    String? cancelText,
    String? confirmText,
    Color confirmColor = AppColors.primary,
    Color cancelColor = const Color(0xFFF3F7F9),
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
  }) {
    final l10n = AppLocalizations.of(context)!;
    return show<bool>(
      context: context,
      title: title,
      content: content,
      actions: [
        // 取消按钮
        AppAlertAction(cancelText ?? l10n.cancel,
            result: false,
            textColor: AppColors.primaryNormalText,
            onTap: onCancel),
        // 确认按钮
        AppAlertAction(confirmText ?? l10n.confirm,
            result: true,
            bgColor: confirmColor,
            textColor: Colors.white,
            onTap: onConfirm),
      ],
    );
  }

  /// 快捷：单按钮弹窗
  ///
  /// [buttonText] 按钮文本，为null时使用本地化文本
  /// [onPressed] 按钮点击回调
  static Future<void> info({
    required BuildContext context,
    String? title,
    required Widget content,
    String? buttonText,
    VoidCallback? onPressed,
  }) {
    final l10n = AppLocalizations.of(context)!;
    return show<void>(
      context: context,
      title: title,
      content: content,
      actions: [
        AppAlertAction(buttonText ?? l10n.gotIt, onTap: onPressed),
      ],
    );
  }
}
