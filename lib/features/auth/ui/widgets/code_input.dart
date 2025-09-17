import 'dart:async';

import 'package:cptop/l10n/generated/app_localizations.dart';
import 'package:cptop/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CodeInput extends StatefulWidget {
  final TextEditingController controller;
  final int secondsLeft;
  final bool isGettingCode;
  final Future<void> Function() onGetCode; // 改为异步函数，支持错误处理
  final String hintText;
  final bool isInputValid;
  final String identifier; // 用于区分不同的输入框（手机号/邮箱）

  const CodeInput({
    super.key,
    required this.controller,
    required this.secondsLeft,
    required this.isGettingCode,
    required this.onGetCode,
    required this.hintText,
    required this.isInputValid,
    required this.identifier,
  });

  @override
  State<CodeInput> createState() => _CodeInputState();
}

class _CodeInputState extends State<CodeInput> {
  bool isBlocked = false; // 是否被限制
  String remainingText = ''; // 剩余时间文本
  int blockEndTime = 0; // 限制结束时间戳
  Timer? _blockTimer; // 限制倒计时器

  static const String _blockEndTimePrefix = 'code_block_end_';

  @override
  void initState() {
    super.initState();
    _checkAndRestoreBlockState();
  }

  @override
  void dispose() {
    _blockTimer?.cancel();
    super.dispose();
  }

  /// 检查并恢复限制状态
  Future<void> _checkAndRestoreBlockState() async {
    final prefs = await SharedPreferences.getInstance();
    final savedBlockEndTime =
        prefs.getInt('$_blockEndTimePrefix${widget.identifier}');

    if (savedBlockEndTime != null) {
      final now = DateTime.now().millisecondsSinceEpoch;

      if (now < savedBlockEndTime) {
        // 仍在限制期内
        setState(() {
          isBlocked = true;
          blockEndTime = savedBlockEndTime;
        });
        _startSmartCountdown();
      } else {
        // 限制期已过，清除存储
        await prefs.remove('$_blockEndTimePrefix${widget.identifier}');
      }
    }
  }

  /// 启动智能倒计时（分钟级 + 秒级）
  void _startSmartCountdown() {
    _blockTimer?.cancel();
    _blockTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now().millisecondsSinceEpoch;
      final remainingMs = blockEndTime - now;

      if (remainingMs <= 0) {
        _clearBlockState();
        timer.cancel();
        return;
      }

      final totalSeconds = (remainingMs / 1000).ceil();
      final minutes = (totalSeconds / 60).floor();
      final seconds = totalSeconds % 60;

      setState(() {
        if (minutes > 0) {
          // 大于1分钟，显示分钟数（向上取整）
          final displayMinutes = seconds > 0 ? minutes + 1 : minutes;
          remainingText = '$displayMinutes分钟';
        } else {
          // 小于等于1分钟，显示秒数
          remainingText = '${seconds}s';
        }
      });
    });
  }

  /// 处理限制错误
  void _handleBlockError(String errorMessage) async {
    // 从错误消息中解析分钟数："操作过于频繁，请 5 分钟后再试"
    final match = RegExp(r'请\s*(\d+)\s*分钟后再试').firstMatch(errorMessage);
    if (match != null) {
      final minutes = int.parse(match.group(1)!);
      final endTime =
          DateTime.now().add(Duration(minutes: minutes)).millisecondsSinceEpoch;

      // 保存到本地存储
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('$_blockEndTimePrefix${widget.identifier}', endTime);

      setState(() {
        isBlocked = true;
        blockEndTime = endTime;
      });

      _startSmartCountdown();
    }
  }

  /// 清除限制状态
  void _clearBlockState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('$_blockEndTimePrefix${widget.identifier}');

    setState(() {
      isBlocked = false;
      remainingText = '';
      blockEndTime = 0;
    });

    _blockTimer?.cancel();
  }

  /// 处理获取验证码点击
  Future<void> _handleGetCode() async {
    try {
      await widget.onGetCode();
    } catch (e) {
      // 检查是否是限制错误
      final errorString = e.toString();

      if (errorString.contains('888023000') || errorString.contains('操作过于频繁')) {
        _handleBlockError(errorString);
        // 限制错误已处理，但仍需重新抛出让上层显示Toast
        rethrow;
      }
      // 非限制错误，重新抛出让上层处理
      rethrow;
    }
  }

  /// 获取按钮文本
  String get buttonText {
    if (isBlocked && remainingText.isNotEmpty) {
      return remainingText;
    } else if (widget.secondsLeft > 0) {
      return '${widget.secondsLeft}s'; // 正常的验证码倒计时
    } else {
      final l10n = AppLocalizations.of(context)!;
      return l10n.getVerificationCode;
    }
  }

  /// 按钮是否可点击
  bool get isButtonEnabled {
    return !isBlocked &&
        !widget.isGettingCode &&
        widget.secondsLeft <= 0 &&
        widget.isInputValid;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFD6DEE6), width: 0.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFFB0B0B0), // placeholder颜色
                  fontSize: 15,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: AppColors.primaryBoldText, // 输入内容颜色
                fontSize: 15,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(6),
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              ],
              onChanged: (value) {
                // 粘贴时自动去除空格
                final newValue = value.replaceAll(' ', '');
                if (newValue != value) {
                  final selection = widget.controller.selection;
                  widget.controller.text = newValue;
                  widget.controller.selection = selection.copyWith(
                    baseOffset: newValue.length,
                    extentOffset: newValue.length,
                  );
                }
              },
            ),
          ),
          Container(width: 1, height: 24, color: const Color(0xFFD6DEE6)),
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 8),
            child: TextButton(
              onPressed: isButtonEnabled ? _handleGetCode : null,
              child: Text(
                buttonText,
                style: TextStyle(
                  color:
                      isButtonEnabled ? AppColors.primary : AppColors.disabled,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
