import 'package:cptop/core/di/di.dart';
import 'package:cptop/env/index.dart';
import 'package:cptop/features/auth/data/models/stu_update_password_req_vo.dart';
import 'package:cptop/features/auth/data/services/auth_api_service.dart';
import 'package:cptop/features/auth/ui/providers/auth_provider.dart';
import 'package:cptop/l10n/generated/app_localizations.dart';
import 'package:cptop/shared/constants/colors.dart';
import 'package:cptop/shared/router/index.dart';
import 'package:cptop/shared/widgets/app_alert.dart';
import 'package:cptop/shared/widgets/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/agreement_links.dart';
import '../widgets/auth_app_bar.dart';
import '../widgets/help_button.dart';
import '../widgets/login_button.dart';
import '../widgets/password_input.dart';

class ResetPasswordPage extends ConsumerStatefulWidget {
  final String tempToken;
  const ResetPasswordPage({super.key, required this.tempToken});

  @override
  ConsumerState<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends ConsumerState<ResetPasswordPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  bool agreementChecked = false;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_onInputChanged);
    confirmPasswordController.addListener(_onInputChanged);
  }

  void _onInputChanged() {
    setState(() {});
    _handleSpaceRemoval(passwordController);
    _handleSpaceRemoval(confirmPasswordController);
  }

  void _handleSpaceRemoval(TextEditingController controller) {
    final text = controller.text;
    final newValue = text.replaceAll(' ', '');
    if (newValue != text) {
      controller.text = newValue;
      controller.selection =
          TextSelection.fromPosition(TextPosition(offset: newValue.length));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AuthAppBar(
        title: l10n.resetPassword,
        showBack: true,
        actions: [HelpButton()],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            PasswordInput(
              controller: passwordController,
              hintText: l10n.newPassword,
              visible: passwordVisible,
              onVisibilityChanged: (v) => setState(() => passwordVisible = v),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Z0-9!@#$%^&*()_\-~`=+\\[\]{}|;:",.<>/?]')),
                LengthLimitingTextInputFormatter(20),
              ],
            ),
            const SizedBox(height: 15),
            PasswordInput(
              controller: confirmPasswordController,
              hintText: l10n.confirmNewPassword,
              visible: confirmPasswordVisible,
              onVisibilityChanged: (v) =>
                  setState(() => confirmPasswordVisible = v),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Z0-9!@#$%^&*()_\-~`=+\\[\]{}|;:",.<>/?]')),
                LengthLimitingTextInputFormatter(20),
              ],
            ),
            const SizedBox(height: 10),
            Center(child: PasswordFormatTip()),
            const SizedBox(height: 20),
            LoginButton(
              text: l10n.completeAndLogIn,
              enabled: _canSubmit(),
              onPressed: _onSubmit,
            ),
            const Spacer(),
            AgreementLinks(
              checked: agreementChecked,
              onChanged: (v) => setState(() => agreementChecked = v ?? false),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  bool _canSubmit() {
    return passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
  }

  void _onSubmit() async {
    final l10n = AppLocalizations.of(context)!;
    if (!agreementChecked) {
      final result = await AppAlert.confirm(
        context: context,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.iHaveReadAndAgree,
              style: TextStyle(fontSize: 15, color: AppColors.primaryBoldText),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final url = Env.instance.termsUrl;
                    final uri = Uri.parse(url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  child: Text(
                    l10n.userAgreement,
                    style: TextStyle(color: Color(0xFF20BAF2), fontSize: 15),
                  ),
                ),
                Text(l10n.and,
                    style: TextStyle(
                        fontSize: 15, color: AppColors.primaryBoldText)),
                GestureDetector(
                  onTap: () async {
                    final url = Env.instance.privacyUrl;
                    final uri = Uri.parse(url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  child: Text(
                    l10n.privacyPolicy,
                    style: TextStyle(color: Color(0xFF20BAF2), fontSize: 15),
                  ),
                ),
              ],
            ),
          ],
        ),
        cancelText: l10n.cancel,
        confirmText: l10n.agreeAndLogin,
      );

      if (result == true) {
        setState(() {
          agreementChecked = true;
        });
        _performSubmit();
      }
      return;
    }
    _performSubmit();
  }

  void _performSubmit() async {
    final l10n = AppLocalizations.of(context)!;
    final pwd = passwordController.text;
    final confirmPwd = confirmPasswordController.text;

    if (pwd != confirmPwd) {
      AppToast.show(context, l10n.passwordsDoNotMatchPleaseReEnter);
      return;
    }
    if (!_isPasswordValid(pwd)) {
      AppToast.show(context, l10n.passwordMustIncludeLettersNumbersSpecialCharacters);
      return;
    }

    try {
      final dio = await ref.read(DI.dioProvider.future);
      final authApi = AuthApiService(dio);
      final req =
          StuUpdatePasswordReqVO(tempToken: widget.tempToken, password: pwd);
      final resp = await authApi.updatePassword(req);

      if (!mounted) return;

      if (resp.code == 0 && resp.data?.token != null) {
        // 先登出，清除旧信息
        await ref.read(authProvider.notifier).logout();
        // 使用新token登录
        await ref.read(authProvider.notifier).loginSuccess(resp.data!.token!);

        // AppToast.show(context, '重置成功，已自动登录');
        context.go('/home');
      } else {
        AppToast.show(context, resp.message ?? '重置密码失败');
      }
    } catch (e) {
      if (mounted) {
        AppToast.show(context, '操作失败: ${e.toString()}');
      }
    }
  }

  bool _isPasswordValid(String pwd) {
    if (pwd.length < 8 || pwd.length > 20) return false;
    final hasLetter = RegExp(r'[A-Za-z]').hasMatch(pwd);
    final hasDigit = RegExp(r'\d').hasMatch(pwd);
    final hasSpecial =
        RegExp(r'''[!@#$%^&*()_\-~`=+\\[\]{}|;:",.<>/?]''').hasMatch(pwd);
    return hasLetter && hasDigit && hasSpecial;
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}

class PasswordFormatTip extends StatelessWidget {
  const PasswordFormatTip({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Text(
      l10n.passwordMustIncludeLettersNumbersSpecialCharacters,
      style: TextStyle(
        color: Color(0xFF878E91),
        fontSize: 12,
      ),
    );
    // return Text.rich(
    //   TextSpan(
    //     children: [
    //       const TextSpan(
    //         text: '密码为 ',
    //         style: TextStyle(
    //           color: Color(0xFF878E91),
    //           fontSize: 12,
    //         ),
    //       ),
    //       const TextSpan(
    //         text: '8~20',
    //         style: TextStyle(
    //           color: AppColors.primaryBoldText,
    //           fontSize: 12,
    //           fontWeight: FontWeight.normal,
    //         ),
    //       ),
    //       const TextSpan(
    //         text: ' 位，且需同时包含数字、字母、特殊符号',
    //         style: TextStyle(
    //           color: Color(0xFF878E91),
    //           fontSize: 12,
    //         ),
    //       ),
    //     ],
    //   ),
    //   textAlign: TextAlign.center,
    // );
  }
}
