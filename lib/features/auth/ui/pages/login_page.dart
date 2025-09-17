import 'dart:async';

import 'package:cptop/core/di/di.dart';
import 'package:cptop/core/network/models/api_response.dart';
import 'package:cptop/env/index.dart';
import 'package:cptop/features/auth/data/models/send_sms_verify_code_req_vo.dart';
import 'package:cptop/features/auth/data/models/stu_auth_resp_vo.dart';
import 'package:cptop/features/auth/data/models/stu_mobile_code_auth_req_vo.dart';
import 'package:cptop/features/auth/data/models/stu_password_auth_req_vo.dart';
import 'package:cptop/features/auth/data/services/auth_api_service.dart';
import 'package:cptop/features/auth/data/services/profile_service.dart';
import 'package:cptop/features/auth/ui/providers/auth_provider.dart';
import 'package:cptop/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:cptop/features/auth/ui/widgets/help_button.dart';
import 'package:cptop/features/auth/ui/widgets/login_background.dart';
import 'package:cptop/features/auth/ui/widgets/login_type_switcher.dart';
import 'package:cptop/l10n/generated/app_localizations.dart';
import 'package:cptop/shared/constants/colors.dart';
import 'package:cptop/shared/constants/country_list.dart';
import 'package:cptop/shared/router/index.dart';
import 'package:cptop/shared/widgets/app_alert.dart';
import 'package:cptop/shared/widgets/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/agreement_links.dart';
import '../widgets/code_input.dart';
import '../widgets/login_button.dart';
import '../widgets/password_input.dart';
import '../widgets/phone_input.dart';
import 'account_select_page.dart';

/// 登录页头像组件
class LoginAvatar extends StatelessWidget {
  const LoginAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 45,
      backgroundImage: AssetImage('assets/images/login_avatar_defualt.png'),
    );
  }
}

/// 注册提示文本组件（仅验证码登录时显示）
class RegisterTipText extends StatelessWidget {
  const RegisterTipText({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Text(
      l10n.unregisteredPhoneWillBeRegisteredAndLoggedInBackup,
      style: const TextStyle(
        fontSize: 12,
        color: Color(0xFF878E91),
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

/// 登录主页面
class LoginPage extends ConsumerStatefulWidget {
  final String? redirectTo;

  const LoginPage({super.key, this.redirectTo});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

/// 登录主页面State
class _LoginPageState extends ConsumerState<LoginPage>
    with SingleTickerProviderStateMixin {
  // ----------------- 控制器与状态变量 -----------------
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final codeController = TextEditingController();
  bool _isPasswordVisible = false;
  int _loginType = 0; // 0: 验证码登录, 1: 密码登录
  bool _isAgreementChecked = false;
  bool isLoginEnabled = false;
  int _secondsLeft = 0;
  Timer? _timer;
  bool _isGettingCode = false;
  String _selectedCountryCode = '+86';
  bool _isLoginInProgress = false; // 添加登录状态标记
  bool _isNavigating = false; // 新增：防止多重导航

  // 全局标志，表示正在进行登录后的跳转流程
  static bool _isLoginNavigationInProgress = false;

  @override
  void initState() {
    super.initState();
    // 监听输入变化，刷新按钮可用状态
    _emailController.addListener(_onInputChanged);
    _passwordController.addListener(_onInputChanged);
    phoneController.addListener(_onInputChanged);
    codeController.addListener(_onInputChanged);
  }

  /// 输入变化时刷新UI
  void _onInputChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // 认证状态监听
    final authState = ref.watch(authProvider);
    final isLoading = authState.status == AuthStatus.authenticating;

    // 按登录方式判断按钮可用状态
    if (_loginType == 0) {
      isLoginEnabled =
          phoneController.text.isNotEmpty && codeController.text.isNotEmpty;
    } else {
      isLoginEnabled = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    }

    return Scaffold(
      appBar: AuthAppBar(
        title: l10n.login,
        actions: const [HelpButton()],
        showBack: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            const LoginBackground(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.5),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  // 头像
                  const LoginAvatar(),
                  const SizedBox(height: 20),
                  // 登录方式切换
                  LoginTypeSwitcher(
                    titles: [l10n.verificationCodeLogin, l10n.passwordLogin],
                    selectedIndex: _loginType,
                    onTypeChanged: (type) => setState(() => _loginType = type),
                  ),
                  const SizedBox(height: 20),
                  // 输入区
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _loginType == 0
                            ? _buildPhoneCodeForm()
                            : _buildPasswordForm(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22.5),
                  // 登录按钮
                  LoginButton(
                    text: _loginType == 0
                        ? '${l10n.login}/${l10n.register}'
                        : l10n.login,
                    enabled:
                        isLoginEnabled && !isLoading && !_isLoginInProgress,
                    onPressed: _onLoginPressed,
                  ),
                  const SizedBox(height: 15),
                  // 注册提示
                  if (_loginType == 0) const RegisterTipText(),
                  // ========================= 以下为临时按钮 ======================================
                  // === 新增：跳转绑定页的临时按钮 ===
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    children: [
                      // 新增：跳转本地化演示页面（临时）
                      // TextButton(
                      //   onPressed: () {
                      //     context.go('/examples/localization');
                      //   },
                      //   child: const Text('🌍 本地化演示（临时）'),
                      // ),
                      // TextButton(
                      //   onPressed: () {
                      //     context.go('${RouteNames.bind}?bindType=phone');
                      //   },
                      //   child: const Text('跳转绑定手机号（临时）'),
                      // ),
                      // TextButton(
                      //   onPressed: () {
                      //     context.go('${RouteNames.bind}?bindType=account');
                      //   },
                      //   child: const Text('跳转绑定账号（临时）'),
                      // ),
                      // // 新增：跳转选择账号页面（登录后场景）
                      // TextButton(
                      //   onPressed: () {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: (_) => AccountSelectPage(
                      //           title: '选择需要进入的账号',
                      //           subtitle: '+86 138****8888 已绑定多个账号，您可进入以下任一账号',
                      //         ),
                      //       ),
                      //     );
                      //   },
                      //   child: const Text('跳转选择账号（登录后）'),
                      // ),
                      // 新增：跳转选择账号页面（忘记密码场景）
                      // TextButton(
                      //   onPressed: () {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: (_) => AccountSelectPage(
                      //           title: '选择需要重置密码的账号',
                      //           subtitle:
                      //               '+86 138****8888 已绑定多个账号，可点击任一账号设置新密码。设置成功后，需要使用新密码登录该账号',
                      //         ),
                      //       ),
                      //     );
                      //   },
                      //   child: const Text('跳转选择账号（忘记密码）'),
                      // ),
                      // TextButton(
                      //   onPressed: () {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: (_) => const CompleteProfilePage(),
                      //       ),
                      //     );
                      //   },
                      //   child: const Text('跳转完善信息页面（临时）'),
                      // ),
                      // 临时跳转按钮，后续可删除
                      // TextButton(
                      //   onPressed: () {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: (_) => const ResetPasswordPage(),
                      //       ),
                      //     );
                      //   },
                      //   child: const Text('跳转重置密码页面（临时）'),
                      // ),
                    ],
                  ),
                  // ============================= 临时按钮结束 ==============

                  const Spacer(),
                  // 协议说明
                  AgreementLinks(
                    checked: _isAgreementChecked,
                    onChanged: (value) {
                      setState(() {
                        _isAgreementChecked = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 构建验证码登录表单
  Widget _buildPhoneCodeForm() {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        PhoneInput(
          countryCode: _selectedCountryCode,
          countryList: countryList,
          controller: phoneController,
          onCountryChanged: (code) =>
              setState(() => _selectedCountryCode = code),
          hintText: l10n.pleaseEnterPhoneNumber,
        ),
        const SizedBox(height: 16),
        CodeInput(
          controller: codeController,
          secondsLeft: _secondsLeft,
          isGettingCode: _isGettingCode,
          identifier:
              '$_selectedCountryCode${phoneController.text.replaceAll(' ', '')}',
          onGetCode: () async => _onGetCodePressed(),
          hintText: l10n.verificationCodeRequired,
          isInputValid: phoneController.text.isNotEmpty, // 已复用
        ),
      ],
    );
  }

  /// 构建密码登录表单
  Widget _buildPasswordForm() {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 账号/邮箱输入框
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            border: Border.all(
              color: const Color(0xFFD6DEE6),
              width: 0.5,
            ),
          ),
          child: TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: l10n.pleaseEnterEmailPhoneAccount,
              border: InputBorder.none,
              isCollapsed: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              suffixIcon: _emailController.text.isNotEmpty
                  ? IconButton(
                      icon:
                          Icon(Icons.cancel, size: 20, color: Colors.grey[400]),
                      onPressed: () {
                        _emailController.clear();
                        setState(() {});
                      },
                    )
                  : null,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'[a-zA-Z0-9!-/:-@¥\[\]`{-~._]+'),
              ),
              LengthLimitingTextInputFormatter(50),
            ],
            onChanged: (value) {
              String newValue = value.replaceAll(' ', '');
              if (newValue != value) {
                _emailController.text = newValue;
                _emailController.selection = TextSelection.fromPosition(
                  TextPosition(offset: newValue.length),
                );
              }
              setState(() {});
            },
            style: TextStyle(fontSize: 15, color: AppColors.primaryBoldText),
          ),
        ),
        const SizedBox(height: 16),
        PasswordInput(
          controller: _passwordController,
          hintText: l10n.passwordRequired,
          visible: _isPasswordVisible,
          onVisibilityChanged: (v) => setState(() => _isPasswordVisible = v),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Spacer(),
            TextButton(
              onPressed: () {
                _forgotPassword();
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                l10n.forgotPassword,
                style: const TextStyle(
                  fontSize: 13,
                  height: 18.5 / 13,
                  color: AppColors.primaryNormalText,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  /// 处理登录结果的公共方法
  Future<void> _handleLoginResult(
      ApiResponse<StuAuthRespVO> resp, String? telCode, String? phone) async {
    if (_isNavigating) return; // 如果正在导航，直接返回

    final l10n = AppLocalizations.of(context)!;

    // print(
    //     "登录调试，响应码: ${resp.code}, 响应消息: ${resp.message}, 响应数据: ${resp.data?.toMap()}");

    if (resp.code != 0 || resp.data == null) {
      if (mounted && (resp.message?.isNotEmpty ?? false)) {
        AppToast.show(context, resp.message!);
      } else if (mounted) {
        AppToast.show(context, '登录失败，请稍后再试');
      }
      return;
    }

    final data = resp.data!;
    // print('_handleLoginResult 开始处理，mounted: $mounted');

    setState(() {
      _isNavigating = true; // 设置为正在导航
    });

    // 设置全局标志，表示正在进行登录后的跳转流程
    _isLoginNavigationInProgress = true;

    try {
      // print(
      //     '进入_handleLoginResult, registerFlag=${data.registerFlag}, multiple=${data.multiple}');
      // if (data.token != null) {
      //   final token = data.token!;
      //   print('后端原始 token json: ${token.toMap()}');
      //   print('StudentAccessTokenVO accessToken: ${token.accessToken}');
      // }

      final dio = await ref.read(DI.dioProvider.future);
      final profileService = ProfileService(dio);

      // 1. 多账号
      if (data.multiple == true) {
        // print('分支: multiple==true, 跳转AccountSelectPage');

        // 检查是否有students数据
        if (data.students == null || data.students!.isEmpty) {
          AppToast.show(context, '多账号数据异常');
          return;
        }

        // 根据登录方式组合subtitle
        String subtitle;
        if (_loginType == 0) {
          // 验证码登录 - 使用手机号（需要拼接国家码）
          final phone = phoneController.text.trim();
          final fullPhone = '$_selectedCountryCode $phone'; // 拼接国家码和手机号
          final maskedPhone = _maskPhone(fullPhone);
          subtitle = l10n.isLinkedToMultipleAccounts(maskedPhone);
        } else {
          // 密码登录 - 使用邮箱/账号
          final username = _emailController.text.trim();
          final maskedUsername = _maskUsername(username);
          subtitle = l10n.isLinkedToMultipleAccounts(maskedUsername);
        }

        // print('多账号subtitle: $subtitle');

        // 跳转到账号选择页面，等待用户选择
        final tempToken = await Navigator.of(context).push<String>(
          MaterialPageRoute(
            builder: (_) => AccountSelectPage(
              title: l10n.selectAnAccountToEnter,
              subtitle: subtitle,
              students: data.students,
            ),
          ),
        );

        // 用户取消选择
        if (tempToken == null) {
          // print('用户取消选择账号');
          return;
        }

        // print('用户选择了账号，tempToken: $tempToken');

        // 用tempToken换取真实token
        final authApi = AuthApiService(dio);
        final tempTokenResp =
            await authApi.tempTokenLogin(tempToken: tempToken);

        if (tempTokenResp.code != 0 || tempTokenResp.data?.token == null) {
          AppToast.show(context, '获取账号token失败');
          return;
        }

        final realToken = tempTokenResp.data!.token!;
        // print('获取到真实token: ${realToken.accessToken}');

        // 保存真实token
        await ref.read(authProvider.notifier).saveTokenFromMobileLogin(
              accessToken: realToken.accessToken,
              refreshToken: realToken.refreshToken,
              tokenType: realToken.tokenType,
              expiresIn: realToken.expiresIn,
            );

        // 用真实token获取用户资料
        final profileResp = await profileService.getProfile();
        final isNeedFill = profileResp['data']?['isNeedFill'] ?? false;
        // print('多账号流程 - isNeedFill: $isNeedFill');

        // 根据isNeedFill判断跳转
        if (isNeedFill == true) {
          // print('多账号流程 - 需要完善信息，跳转完善信息页面');
          context.go(RouteNames.completeProfile);
        } else {
          // print('多账号流程 - 信息已完善，跳转首页');
          context.go(RouteNames.home);
        }

        return; // 多账号流程结束
      }

      // 2. 单一账号
      final token = data.token;
      if (token == null) {
        AppToast.show(context, '缺少token');
        return;
      }
      // print('准备保存token，mounted: $mounted');
      await ref.read(authProvider.notifier).saveTokenFromMobileLogin(
            accessToken: token.accessToken,
            refreshToken: token.refreshToken,
            tokenType: token.tokenType,
            expiresIn: token.expiresIn,
          );
      // print('token保存完成，mounted: $mounted');

      // 登录成功，token 已保存，不在这里处理跳转
      // 跳转逻辑将由认证状态监听器处理
      // print('登录成功，等待认证状态监听器处理跳转');
    } finally {
      if (mounted) {
        setState(() {
          _isNavigating = false; // 重置导航状态
        });
      }
      // 重置全局标志
      _isLoginNavigationInProgress = false;
    }
  }

  /// 登录逻辑
  Future<void> _login() async {
    // 设置登录中状态
    setState(() {
      _isLoginInProgress = true;
    });

    try {
      final dio = await ref.read(DI.dioProvider.future);
      final authApi = AuthApiService(dio);

      if (_loginType == 0) {
        // 验证码登录
        final phone = phoneController.text.trim();
        final code = codeController.text.trim();
        final telCode = _selectedCountryCode;

        final req = StuMobileCodeAuthReqVO(
          telCode: telCode,
          mobile: phone,
          code: code,
          registerSiteId: 102, // 写死为102
        );
        final resp = await authApi.mobileCodeLogin(req);
        await _handleLoginResult(resp, telCode, phone);
      } else {
        // 密码登录 - 使用新的接口
        final username = _emailController.text.trim();
        final password = _passwordController.text;

        final req = StuPasswordAuthReqVO(
          username: username,
          password: password,
        );

        final resp = await authApi.passwordLogin(req);
        await _handleLoginResult(resp, null, null);
      }
    } catch (e) {
      if (mounted) {
        AppToast.show(context, '登录失败：${e.toString()}');
      }
    } finally {
      // 确保无论成功失败都重置登录状态
      if (mounted) {
        setState(() {
          _isLoginInProgress = false;
        });
      }
    }
  }

  /// 忘记密码功能
  void _forgotPassword() {
    context.go(RouteNames.forgotPassword);
  }

  /// 倒计时功能
  void _startCountdown(int seconds) {
    setState(() {
      _secondsLeft = seconds;
      _isGettingCode = true;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft <= 1) {
        timer.cancel();
        setState(() {
          _secondsLeft = 0;
          _isGettingCode = false;
        });
      } else {
        setState(() {
          _secondsLeft--;
        });
      }
    });
  }

  /// 获取验证码按钮点击事件处理
  Future<void> _onGetCodePressed() async {
    final l10n = AppLocalizations.of(context)!;
    final phone = phoneController.text.replaceAll(' ', '');
    if (phone.isEmpty) {
      AppToast.show(context, l10n.pleaseEnterYourPhoneNumber);
      return;
    }
    if (!_isValidPhone(phone)) {
      AppToast.show(context, l10n.pleaseEnterValidPhoneNumber);
      return;
    }
    if (_isGettingCode || _secondsLeft > 0) return;
    setState(() {
      _isGettingCode = true;
    });
    try {
      final dio = await ref.read(DI.dioProvider.future);
      final authApi = AuthApiService(dio);
      final req = SendSmsVerifyCodeReqVO(
          telCode: _selectedCountryCode, mobile: phone, scene: 1 //注册登录
          );
      final resp = await authApi.sendSmsVerifyCode(req);

      if (!mounted) return; // <--- 关键

      if (resp.code == 0 && resp.data == true) {
        AppToast.show(context, l10n.verificationCodeHasBeenSentPleaseCheckSMS);
        _startCountdown(60);
      } else {
        // 检查是否是限制错误
        if (resp.code == 888023000) {
          setState(() {
            _isGettingCode = false;
          });
          throw Exception('${resp.code}: ${resp.message}');
        }
        AppToast.show(context, resp.message ?? '验证码发送失败');
        setState(() {
          _isGettingCode = false;
        });
      }
    } catch (e) {
      if (mounted) {
        // 如果是限制错误，让CodeInput处理
        if (e.toString().contains('888023000')) {
          setState(() {
            _isGettingCode = false;
          });
          rethrow;
        }
        AppToast.show(context, '验证码发送异常: ${e.toString()}');
        setState(() {
          _isGettingCode = false;
        });
      }
    }
  }

  bool _isValidPhone(String phone) {
    // 简单校验，后续可用 libphonenumber
    final reg = RegExp(r'^\d{7,15}$');
    return reg.hasMatch(phone);
  }

  /// 手机号脱敏处理（包含国家码）
  String _maskPhone(String phone) {
    if (phone.length < 7) return phone;

    // 如果包含国家码（以+开头）
    if (phone.startsWith('+')) {
      // 找到第一个空格的位置，分隔国家码和手机号
      final spaceIndex = phone.indexOf(' ');
      if (spaceIndex != -1) {
        final countryCode = phone.substring(0, spaceIndex + 1); // 包含空格
        final phoneNumber = phone.substring(spaceIndex + 1);

        if (phoneNumber.length >= 7) {
          return '$countryCode${phoneNumber.substring(0, 3)}****${phoneNumber.substring(phoneNumber.length - 4)}';
        }
      }
    }

    // 没有国家码的情况
    return '${phone.substring(0, 3)}****${phone.substring(phone.length - 4)}';
  }

  /// 用户名/邮箱脱敏处理
  String _maskUsername(String username) {
    if (username.contains('@')) {
      // 邮箱格式：iren8897@qq.com -> i******@qq.com
      final atIndex = username.indexOf('@');
      final localPart = username.substring(0, atIndex);
      final domain = username.substring(atIndex); // 包含@符号

      if (localPart.length > 1) {
        return '${localPart[0]}${'*' * (localPart.length - 1)}$domain';
      } else {
        return '***$domain';
      }
    } else {
      // 普通用户名：username -> u*******e
      if (username.length > 2) {
        return '${username[0]}${'*' * (username.length - 2)}${username[username.length - 1]}';
      } else if (username.length == 2) {
        return '${username[0]}*';
      }
    }
    return '***';
  }

  void _onLoginPressed() async {
    // 防止重复点击 - 立即更新状态
    if (_isLoginInProgress) return;
    setState(() => _isLoginInProgress = true); // 立即禁用按钮

    final l10n = AppLocalizations.of(context)!;
    if (!_isAgreementChecked) {
      // 弹窗提示
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
          _isAgreementChecked = true;
        });
        await _login(); // 继续执行登录逻辑
      } else {
        setState(() => _isLoginInProgress = false); // 用户取消时恢复按钮状态
      }
    } else {
      await _login(); // 等待登录完成
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    phoneController.dispose();
    codeController.dispose();
    _timer?.cancel();
    super.dispose();
  }
}

// const authOutlineInputBorder = OutlineInputBorder(
//   borderSide: BorderSide(color: Color(0xFF757575)),
//   borderRadius: BorderRadius.all(Radius.circular(100)),
// );

// class SignInForm extends StatelessWidget {
//   final GlobalKey<FormState> formKey;
//   final TextEditingController emailController;
//   final TextEditingController passwordController;
//   final bool isPasswordVisible;
//   final bool isLoading;
//   final VoidCallback onPasswordVisibilityToggle;
//   final VoidCallback onLogin;
//
//   const SignInForm({
//     super.key,
//     required this.formKey,
//     required this.emailController,
//     required this.passwordController,
//     required this.isPasswordVisible,
//     required this.isLoading,
//     required this.onPasswordVisibilityToggle,
//     required this.onLogin,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             controller: emailController,
//             enabled: !isLoading,
//             onSaved: (email) {},
//             onChanged: (email) {},
//             textInputAction: TextInputAction.next,
//             validator: (value) {
//               if (value == null || value.trim().isEmpty) {
//                 return 'Please enter your email';
//               }
//               return null;
//             },
//             decoration: InputDecoration(
//                 hintText: "Enter your email",
//                 labelText: "Email",
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 hintStyle: const TextStyle(color: Color(0xFF757575)),
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                   vertical: 16,
//                 ),
//                 suffix: SvgPicture.string(
//                   SvgIcons.mailIcon,
//                 ),
//                 border: authOutlineInputBorder,
//                 enabledBorder: authOutlineInputBorder,
//                 focusedBorder: authOutlineInputBorder.copyWith(
//                     borderSide: const BorderSide(color: Color(0xFFFF7643)))),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 24),
//             child: TextFormField(
//               controller: passwordController,
//               enabled: !isLoading,
//               onSaved: (password) {},
//               onChanged: (password) {},
//               obscureText: !isPasswordVisible,
//               textInputAction: TextInputAction.done,
//               onFieldSubmitted: (_) => onLogin(),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your password';
//                 }
//                 if (value.length < 6) {
//                   return 'Password must be at least 6 characters';
//                 }
//                 return null;
//               },
//               decoration: InputDecoration(
//                   hintText: "Enter your password",
//                   labelText: "Password",
//                   floatingLabelBehavior: FloatingLabelBehavior.always,
//                   hintStyle: const TextStyle(color: Color(0xFF757575)),
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 24,
//                     vertical: 16,
//                   ),
//                   suffix: SvgPicture.string(
//                     SvgIcons.lockIcon,
//                   ),
//                   border: authOutlineInputBorder,
//                   enabledBorder: authOutlineInputBorder,
//                   focusedBorder: authOutlineInputBorder.copyWith(
//                       borderSide: const BorderSide(color: Color(0xFFFF7643)))),
//             ),
//           ),
//           const SizedBox(height: 8),
//           ElevatedButton(
//             onPressed: isLoading ? null : onLogin,
//             style: ElevatedButton.styleFrom(
//               elevation: 0,
//               backgroundColor: const Color(0xFFFF7643),
//               foregroundColor: Colors.white,
//               minimumSize: const Size(double.infinity, 48),
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(16)),
//               ),
//             ),
//             child: isLoading
//                 ? const SizedBox(
//                     width: 20,
//                     height: 20,
//                     child: CircularProgressIndicator(
//                       strokeWidth: 2,
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                     ),
//                   )
//                 : const Text("Continue"),
//           )
//         ],
//       ),
//     );
//   }
// }
