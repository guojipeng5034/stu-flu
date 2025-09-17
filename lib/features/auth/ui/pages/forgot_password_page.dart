import 'package:cptop/core/di/di.dart';
import 'package:cptop/features/auth/data/models/send_mail_verify_code_req_vo.dart';
import 'package:cptop/features/auth/data/models/send_sms_verify_code_req_vo.dart';
import 'package:cptop/features/auth/data/models/stu_auth_resp_vo.dart'; // 修改：从正确的文件导入StudentInfoVO
import 'package:cptop/features/auth/data/models/stu_forget_password_req_vo.dart';
import 'package:cptop/features/auth/data/services/auth_api_service.dart';
import 'package:cptop/l10n/generated/app_localizations.dart';
import 'package:cptop/shared/constants/country_list.dart';
import 'package:cptop/shared/router/route_names.dart';
import 'package:cptop/shared/widgets/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/auth_app_bar.dart';
import '../widgets/code_input.dart';
import '../widgets/help_button.dart';
import '../widgets/login_background.dart';
import '../widgets/login_button.dart';
import '../widgets/login_type_switcher.dart';
import '../widgets/phone_input.dart';
import 'account_select_page.dart';
import 'reset_password_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  int _tabIndex = 0; // 0: 手机号验证, 1: 邮箱验证

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AuthAppBar(
        title: l10n.forgotPassword,
        actions: const [HelpButton()],
        backTo: RouteNames.login, // 返回登录页
      ),
      body: Stack(
        children: [
          const LoginBackground(), // 复用背景图
          Column(
            children: [
              const SizedBox(height: 20),
              LoginTypeSwitcher(
                titles: [l10n.smsVerification, l10n.emailVerification],
                selectedIndex: _tabIndex,
                onTypeChanged: (index) {
                  setState(() {
                    _tabIndex = index;
                  });
                },
              ),
              const SizedBox(height: 20),
              // 根据_tabIndex显示不同表单
              Expanded(
                child: _tabIndex == 0
                    ? PhoneResetForm() // 你可以自定义
                    : EmailResetForm(), // 你可以自定义
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PhoneResetForm extends ConsumerStatefulWidget {
  const PhoneResetForm({super.key});

  @override
  ConsumerState<PhoneResetForm> createState() => _PhoneResetFormState();
}

class _PhoneResetFormState extends ConsumerState<PhoneResetForm> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  int secondsLeft = 0;
  bool isGettingCode = false;
  String selectedCountryCode = '+86';
  bool isSubmitting = false; // 新增：提交状态

  @override
  void initState() {
    super.initState();
    phoneController.addListener(() {
      setState(() {});
    });
    codeController.addListener(() {
      setState(() {});
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

  /// 验证表单数据
  bool _validateForm() {
    final phone = phoneController.text.trim();
    final code = codeController.text.trim();

    final l10n = AppLocalizations.of(context)!;

    if (phone.isEmpty) {
      AppToast.show(context, l10n.pleaseEnterYourPhoneNumber);
      return false;
    }

    // 手机号格式验证
    final phoneReg = RegExp(r'^\d{7,15}$');
    if (!phoneReg.hasMatch(phone)) {
      AppToast.show(context, l10n.pleaseEnterValidPhoneNumber);
      return false;
    }

    if (code.isEmpty) {
      AppToast.show(context, l10n.verificationCodeRequired);
      return false;
    }

    // 验证码格式验证：最大6位数字
    final codeReg = RegExp(r'^\d{1,6}$');
    if (!codeReg.hasMatch(code)) {
      AppToast.show(context, '请输入最多6位数字验证码');
      return false;
    }

    return true;
  }

  /// 处理多账号选择结果
  void _handleAccountSelection(List<StudentInfoVO> students, String phone) {
    final l10n = AppLocalizations.of(context)!;

    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (_) => AccountSelectPage(
          title: l10n.selectAnAccountToResetPassword,
          subtitle: l10n.isAssociatedWithMultipleAccountsResetPassword(
              "$selectedCountryCode $phone"),
          students: students,
        ),
      ),
    )
        .then((tempToken) {
      // 用户选择了账号，跳转到重置密码页面
      if (tempToken != null && mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ResetPasswordPage(tempToken: tempToken),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isFormValid = phoneController.text.trim().isNotEmpty &&
        codeController.text.trim().isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.5),
      child: Column(
        children: [
          // 使用封装好的 PhoneInput
          PhoneInput(
            countryCode: selectedCountryCode,
            countryList: countryList,
            controller: phoneController,
            onCountryChanged: (code) =>
                setState(() => selectedCountryCode = code),
            hintText: l10n.phoneNumber,
          ),
          const SizedBox(height: 16),
          // 使用封装好的 CodeInput
          CodeInput(
            controller: codeController,
            secondsLeft: secondsLeft,
            isGettingCode: isGettingCode,
            identifier:
                '$selectedCountryCode${phoneController.text.replaceAll(' ', '')}', // 使用完整手机号作为标识
            onGetCode: () async {
              final phone = phoneController.text.replaceAll(' ', '');
              if (phone.isEmpty) {
                AppToast.show(context, '请输入手机号');
                return;
              }
              final reg = RegExp(r'^\d{7,15}$');
              if (!reg.hasMatch(phone)) {
                AppToast.show(context, '请输入正确的手机号');
                return;
              }
              if (isGettingCode || secondsLeft > 0) return;
              setState(() {
                isGettingCode = true;
              });
              try {
                final dio = await ref.read(DI.dioProvider.future);
                final authApi = AuthApiService(dio);
                final req = SendSmsVerifyCodeReqVO(
                    telCode: selectedCountryCode,
                    mobile: phone,
                    scene: 2 // 忘记密码
                    );
                final resp = await authApi.sendSmsVerifyCode(req);
                if (!mounted) return;
                if (resp.code == 0 && resp.data == true) {
                  AppToast.show(context, '验证码已发送，请查收短信');
                  startCountdown(60);
                } else {
                  // 检查是否是限制错误
                  if (resp.code == 888023000) {
                    setState(() {
                      isGettingCode = false;
                    });
                    // 显示限制错误Toast，然后抛出异常让CodeInput处理倒计时
                    AppToast.show(context, resp.message ?? '操作过于频繁');
                    throw Exception('${resp.code}: ${resp.message}');
                  }
                  AppToast.show(context, resp.message ?? '验证码发送失败');
                  setState(() {
                    isGettingCode = false;
                  });
                }
              } catch (e) {
                if (mounted) {
                  // 如果是限制错误，让CodeInput处理
                  if (e.toString().contains('888023000')) {
                    setState(() {
                      isGettingCode = false;
                    });
                    rethrow;
                  }
                  AppToast.show(context, '验证码发送异常: ${e.toString()}');
                  setState(() {
                    isGettingCode = false;
                  });
                }
              }
            },
            hintText: l10n.verificationCodeRequired, // 更新为要求的占位提示
            isInputValid: phoneController.text.isNotEmpty,
          ),
          const SizedBox(height: 16),
          // 提交按钮
          LoginButton(
            text: isSubmitting ? 'Loading...' : l10n.resetPassword,
            enabled: isFormValid && !isSubmitting,
            onPressed: isSubmitting
                ? null
                : () async {
                    // 表单验证
                    if (!_validateForm()) {
                      return;
                    }

                    setState(() {
                      isSubmitting = true;
                    });

                    try {
                      final phone = phoneController.text.trim();
                      final code = codeController.text.trim();

                      final dio = await ref.read(DI.dioProvider.future);
                      final authApi = AuthApiService(dio);
                      final req = StuForgetPasswordReqVO(
                        telCode: selectedCountryCode,
                        mobile: phone,
                        code: code,
                      );
                      final resp = await authApi.forgetPassword(req);

                      if (!mounted) return;

                      if (resp.code == 0 && resp.data != null) {
                        final students = resp.data!.students ?? [];

                        // 添加调试信息
                        print('学生数量: ${students.length}');

                        if (students.length > 1) {
                          // 多账号情况：跳转到账号选择页面
                          _handleAccountSelection(students, phone);
                        } else if (students.length == 1) {
                          // 单账号情况：直接跳转到重置密码页面
                          final student = students.first;
                          final tempToken = student.tempToken;

                          print('单账号tempToken: $tempToken');

                          if (tempToken != null && tempToken.isNotEmpty) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) =>
                                    ResetPasswordPage(tempToken: tempToken),
                              ),
                            );
                          } else {
                            AppToast.show(context, '服务器未返回临时令牌，请联系客服');
                          }
                        } else {
                          // 没有账号数据
                          AppToast.show(context, '未找到相关账号信息');
                        }
                      } else {
                        AppToast.show(context, resp.message ?? '操作失败');
                      }
                    } catch (e) {
                      if (mounted) {
                        AppToast.show(context, '操作异常: ${e.toString()}');
                      }
                    } finally {
                      if (mounted) {
                        setState(() {
                          isSubmitting = false;
                        });
                      }
                    }
                  },
          ),
        ],
      ),
    );
  }
}

class EmailResetForm extends ConsumerStatefulWidget {
  const EmailResetForm({super.key});

  @override
  ConsumerState<EmailResetForm> createState() => _EmailResetFormState();
}

class _EmailResetFormState extends ConsumerState<EmailResetForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  int secondsLeft = 0;
  bool isGettingCode = false;
  bool isSubmitting = false; // 新增：提交状态

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
    codeController.addListener(() {
      setState(() {});
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

  /// 验证表单数据
  bool _validateForm() {
    final l10n = AppLocalizations.of(context)!;
    final email = emailController.text.trim();
    final code = codeController.text.trim();

    if (email.isEmpty) {
      AppToast.show(context, l10n.pleaseEnterYourEmailAddress);
      return false;
    }

    // 邮箱格式验证
    final emailReg =
        RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');
    if (!emailReg.hasMatch(email)) {
      AppToast.show(context, l10n.pleaseEnterYourEmailAddress);
      return false;
    }

    if (code.isEmpty) {
      AppToast.show(context, l10n.verificationCodeRequired);
      return false;
    }

    // 验证码格式验证：最大6位数字
    final codeReg = RegExp(r'^\d{1,6}$');
    if (!codeReg.hasMatch(code)) {
      AppToast.show(context, '请输入最多6位数字验证码');
      return false;
    }

    return true;
  }

  /// 处理多账号选择结果
  void _handleAccountSelection(List<StudentInfoVO> students, String email) {
    final l10n = AppLocalizations.of(context)!;
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (_) => AccountSelectPage(
          title: l10n.selectAnAccountToResetPassword,
          subtitle: l10n.isAssociatedWithMultipleAccountsResetPassword(email),
          students: students,
        ),
      ),
    )
        .then((tempToken) {
      // 用户选择了账号，跳转到重置密码页面
      if (tempToken != null && mounted) {
        Navigator.of(context).pushNamed(
          '/reset-password',
          arguments: {'tempToken': tempToken},
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isFormValid = emailController.text.trim().isNotEmpty &&
        codeController.text.trim().isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.5),
      child: Column(
        children: [
          // 邮箱输入 - 使用通用的 TextField
          Container(
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              border: Border.all(color: const Color(0xFFD6DEE6), width: 0.5),
            ),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: l10n.pleaseEnterYourEmailAddress,
                border: InputBorder.none,
                isCollapsed: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                hintStyle: const TextStyle(color: Color(0xFFBDBDBD)),
              ),
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 15, color: Color(0xFF222222)),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r"[a-zA-Z0-9!#\$%&'\*\+/=\?\^_`\{\|\}~@.\-]")),
                LengthLimitingTextInputFormatter(50),
              ],
              onChanged: (value) {
                // 粘贴时自动去除空格
                final newValue = value.replaceAll(' ', '');
                if (newValue != value) {
                  emailController.text = newValue;
                  emailController.selection = TextSelection.fromPosition(
                    TextPosition(offset: newValue.length),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 16),
          // 使用封装好的 CodeInput
          CodeInput(
            controller: codeController,
            secondsLeft: secondsLeft,
            isGettingCode: isGettingCode,
            identifier: emailController.text.trim(), // 使用邮箱地址作为标识
            onGetCode: () async {
              final email = emailController.text.trim();
              if (email.isEmpty) {
                AppToast.show(context, l10n.pleaseEnterYourEmailAddress);
                return;
              }
              // 邮箱格式校验
              final emailReg =
                  RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');
              if (!emailReg.hasMatch(email)) {
                AppToast.show(context, l10n.pleaseEnterValidEmailAddress);
                return;
              }
              if (isGettingCode || secondsLeft > 0) return;
              setState(() {
                isGettingCode = true;
              });
              try {
                final dio = await ref.read(DI.dioProvider.future);
                final authApi = AuthApiService(dio);
                final req = SendMailVerifyCodeReqVO(
                    email: email, language: 'zh_cp', scene: 2 // 忘记密码
                    );
                final resp = await authApi.sendMailVerifyCode(req);
                if (!mounted) return;
                if (resp.code == 0 && resp.data == true) {
                  AppToast.show(context, l10n.verificationCodeHasBeenSentPleaseCheckEmail);
                  startCountdown(300);
                } else {
                  // 检查是否是限制错误
                  if (resp.code == 888023000) {
                    setState(() {
                      isGettingCode = false;
                    });
                    throw Exception('${resp.code}: ${resp.message}');
                  }
                  AppToast.show(context, resp.message ?? '验证码发送失败');
                  setState(() {
                    isGettingCode = false;
                  });
                }
              } catch (e) {
                if (mounted) {
                  // 如果是限制错误，让CodeInput处理
                  if (e.toString().contains('888023000')) {
                    setState(() {
                      isGettingCode = false;
                    });
                    rethrow;
                  }
                  AppToast.show(context, '验证码发送异常: ${e.toString()}');
                  setState(() {
                    isGettingCode = false;
                  });
                }
              }
            },
            hintText: l10n.verificationCodeRequired, // 更新为要求的占位提示
            isInputValid: emailController.text.trim().isNotEmpty,
          ),
          const SizedBox(height: 16),
          // 提交按钮
          LoginButton(
            text: isSubmitting ? 'Loading...' : l10n.resetPassword,
            enabled: isFormValid && !isSubmitting,
            onPressed: isSubmitting
                ? null
                : () async {
                    // 表单验证
                    if (!_validateForm()) {
                      return;
                    }

                    setState(() {
                      isSubmitting = true;
                    });

                    try {
                      final email = emailController.text.trim();
                      final code = codeController.text.trim();

                      final dio = await ref.read(DI.dioProvider.future);
                      final authApi = AuthApiService(dio);
                      final req = StuForgetPasswordReqVO(
                        email: email,
                        code: code,
                      );
                      final resp = await authApi.forgetPassword(req);

                      if (!mounted) return;

                      if (resp.code == 0 && resp.data != null) {
                        final students = resp.data!.students ?? [];

                        // 添加调试信息
                        print('学生数量: ${students.length}');

                        if (students.length > 1) {
                          // 多账号情况：跳转到账号选择页面
                          _handleAccountSelection(students, email);
                        } else if (students.length == 1) {
                          // 单账号情况：直接跳转到重置密码页面
                          final student = students.first;
                          final tempToken = student.tempToken;

                          print('单账号tempToken: $tempToken');

                          if (tempToken != null && tempToken.isNotEmpty) {
                            Navigator.of(context).pushNamed(
                              '/reset-password',
                              arguments: {'tempToken': tempToken},
                            );
                          } else {
                            AppToast.show(context, '服务器未返回临时令牌，请联系客服');
                          }
                        } else {
                          // 没有账号数据
                          AppToast.show(context, '未找到相关账号信息');
                        }
                      } else {
                        AppToast.show(context, resp.message ?? '操作失败');
                      }
                    } catch (e) {
                      if (mounted) {
                        AppToast.show(context, '操作异常: ${e.toString()}');
                      }
                    } finally {
                      if (mounted) {
                        setState(() {
                          isSubmitting = false;
                        });
                      }
                    }
                  },
          ),
        ],
      ),
    );
  }
}
