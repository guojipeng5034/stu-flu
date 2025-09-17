import 'package:cptop/env/index.dart';
import 'package:cptop/l10n/generated/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// 协议链接组件
/// 显示用户协议和隐私政策的可点击链接
class AgreementLinks extends StatelessWidget {
  final bool checked;
  final ValueChanged<bool?> onChanged;

  const AgreementLinks({
    super.key,
    required this.checked,
    required this.onChanged,
  });

  /// 打开用户协议链接
  Future<void> _openUserAgreement() async {
    final url = Env.instance.termsUrl;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  /// 打开隐私政策链接
  Future<void> _openPrivacyPolicy() async {
    final url = Env.instance.privacyUrl;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: checked,
            onChanged: onChanged,
            shape: const CircleBorder(),
            fillColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return const Color(0xFF20BAF2);
                }
                return Colors.white;
              },
            ),
            checkColor: Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          Flexible(
            child: Text.rich(
              TextSpan(
                text: l10n.iHaveReadAndAgree,
                style: const TextStyle(fontSize: 12, color: Color(0xFF878E91)),
                children: [
                  TextSpan(
                    text: l10n.userAgreement,
                    style: const TextStyle(color: Color(0xFF20BAF2)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = _openUserAgreement,
                  ),
                  TextSpan(
                    text: l10n.and,
                    style: const TextStyle(color: Color(0xFF878E91)),
                  ),
                  TextSpan(
                    text: l10n.privacyPolicy,
                    style: const TextStyle(color: Color(0xFF20BAF2)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = _openPrivacyPolicy,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
