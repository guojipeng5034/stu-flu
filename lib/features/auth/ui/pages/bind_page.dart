import 'package:cptop/l10n/generated/app_localizations.dart';
import 'package:cptop/shared/constants/colors.dart';
import 'package:cptop/shared/constants/country_list.dart';
import 'package:cptop/shared/router/route_names.dart';
import 'package:cptop/shared/widgets/app_toast.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_app_bar.dart';
import '../widgets/code_input.dart';
import '../widgets/help_button.dart';
import '../widgets/login_background.dart';
import '../widgets/login_button.dart';
import '../widgets/password_input.dart';
import '../widgets/phone_input.dart';

class BindPage extends StatelessWidget {
  final String bindType; // "phone" or "account"

  const BindPage({super.key, required this.bindType});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuthAppBar(
        title: '', // 必须传
        actions: const [HelpButton()],
        backTo: RouteNames.login,
      ),
      body: Stack(
        children: [
          const LoginBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.5),
            child: Column(
              children: [
                const SizedBox(height: 24),
                // 大标题
                Text(
                  bindType == "phone" ? l10n.bindPhoneNumber : l10n.bindAccount,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryBoldText,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                // 表单
                Expanded(
                  child: bindType == "phone"
                      ? const BindPhoneForm()
                      : const BindAccountForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BindPhoneForm extends StatefulWidget {
  const BindPhoneForm({super.key});

  @override
  State<BindPhoneForm> createState() => _BindPhoneFormState();
}

class _BindPhoneFormState extends State<BindPhoneForm> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();

  String selectedCountryCode = '+86';
  int secondsLeft = 0;
  bool isGettingCode = false;

  @override
  void initState() {
    super.initState();
    // 监听手机号输入变化
    phoneController.addListener(() {
      setState(() {}); // 触发重建以更新 isInputValid
    });
  }

  void startCountdown(int seconds) {
    setState(() {
      secondsLeft = seconds;
      isGettingCode = true;
    });
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (secondsLeft <= 1) {
        setState(() {
          secondsLeft = 0;
          isGettingCode = false;
        });
        return false;
      } else {
        setState(() {
          secondsLeft--;
        });
        return true;
      }
    });
  }

  bool _isValidPhone(String phone) {
    final reg = RegExp(r'^\d{7,15}$');
    return reg.hasMatch(phone);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.5),
      child: Column(
        children: [
          PhoneInput(
            countryCode: selectedCountryCode,
            countryList: countryList,
            controller: phoneController,
            onCountryChanged: (code) =>
                setState(() => selectedCountryCode = code),
            hintText: l10n.phoneNumber,
          ),
          const SizedBox(height: 16),
          CodeInput(
            controller: codeController,
            secondsLeft: secondsLeft,
            isGettingCode: isGettingCode,
            identifier:
                '$selectedCountryCode${phoneController.text.replaceAll(' ', '')}',
            onGetCode: () async {
              final phone = phoneController.text.replaceAll(' ', '');
              if (phone.isEmpty) {
                AppToast.show(context, l10n.pleaseEnterPhoneNumber);
                return;
              }
              if (!_isValidPhone(phone)) {
                AppToast.show(context, l10n.pleaseEnterValidPhoneNumber);
                return;
              }
              // TODO: 请求后端发送验证码
              AppToast.show(context, l10n.verificationCodeResendSuccess);
              startCountdown(60);
            },
            hintText: l10n.verificationCode,
            isInputValid: phoneController.text.isNotEmpty, // 现在会正确响应
          ),
          const SizedBox(height: 24),
          LoginButton(
            text: l10n.bindAndLogin,
            enabled: true, // TODO: 根据表单校验结果决定
            onPressed: () {
              // TODO: 请求后端绑定手机号并登录
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    codeController.dispose();
    super.dispose();
  }
}

class BindAccountForm extends StatefulWidget {
  const BindAccountForm({super.key});

  @override
  State<BindAccountForm> createState() => _BindAccountFormState();
}

class _BindAccountFormState extends State<BindAccountForm> {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.5),
      child: Column(
        children: [
          // 账号/邮箱输入
          Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              border: Border.all(color: const Color(0xFFD6DEE6), width: 0.5),
            ),
            child: TextField(
              controller: accountController,
              decoration: InputDecoration(
                hintText: l10n.registeredEmailOrAccount,
                border: InputBorder.none,
                isCollapsed: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          const SizedBox(height: 16),
          PasswordInput(
            controller: passwordController,
            hintText: l10n.password,
            visible: passwordVisible,
            onVisibilityChanged: (v) => setState(() => passwordVisible = v),
          ),
          const SizedBox(height: 8),
          const PasswordFormatTip(),
          const SizedBox(height: 24),
          LoginButton(
            text: l10n.bindAndLogin,
            enabled: true, // TODO: 根据表单校验结果决定
            onPressed: () {
              // TODO: 请求后端绑定账号并登录
            },
          ),
        ],
      ),
    );
  }
}

// PasswordFormatTip 复用自 forgot_password_page.dart，若需可单独抽出
class PasswordFormatTip extends StatelessWidget {
  const PasswordFormatTip({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Text(
      l10n.passwordsMustBe8To20Characters,
      style: TextStyle(
        color: Color(0xFF878E91),
        fontSize: 12,
      ),
    );
    // return Text.rich(
    //   TextSpan(
    //     children: [
    //       TextSpan(
    //         text: '密码为 ',
    //         style: const TextStyle(
    //           color: Color(0xFF878E91),
    //           fontSize: 12,
    //         ),
    //       ),
    //       TextSpan(
    //         text: '8~20',
    //         style: TextStyle(
    //           color: AppColors.primaryBoldText, // 复用常量
    //           fontSize: 12,
    //           fontWeight: FontWeight.normal,
    //         ),
    //       ),
    //       TextSpan(
    //         text: ' 位，且需同时包含数字、字母、特殊符号',
    //         style: const TextStyle(
    //           color: Color(0xFF878E91),
    //           fontSize: 12,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
