import 'package:cptop/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

/// 顶部AppBar右侧帮助按钮（认证相关页面通用）
class HelpButton extends StatelessWidget {
  const HelpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: TextButton(
        onPressed: () {
          // TODO: 实现帮助功能
        },
        child: Text(
          l10n.help,
          style: const TextStyle(
            color: Color(0xFF666666),
            height: 28 / 20,
          ),
        ),
      ),
    );
  }
}
