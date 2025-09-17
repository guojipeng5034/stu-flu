// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get helloWorld => '你好世界!';

  @override
  String get welcomeMessage => '欢迎使用我们的应用！';

  @override
  String get demoPageTitle => '本地化演示';

  @override
  String get demoSectionTitle => '本地化示例';

  @override
  String get basicUsageTitle => '基本用法';

  @override
  String get languageSwitchTitle => '切换语言';

  @override
  String get serverTranslationTitle => '服务器翻译状态';

  @override
  String get currentLanguage => '当前语言';

  @override
  String get refreshTranslations => '刷新翻译';

  @override
  String get refreshCompleted => '翻译已刷新';

  @override
  String get translationError => '翻译错误';

  @override
  String get serverTranslationsLoaded => '服务器翻译已加载';

  @override
  String get noServerTranslations => '没有可用的服务器翻译';

  @override
  String get translationNotInitialized => '翻译未初始化';

  @override
  String get userProfileTitle => '用户资料';

  @override
  String get nameLabel => '姓名';

  @override
  String get emailLabel => '邮箱';

  @override
  String get roleLabel => '角色';

  @override
  String get updateProfile => '更新资料';

  @override
  String get profileUpdated => '资料更新成功';

  @override
  String welcomeUserTemplate(String userName) {
    return '欢迎，$userName！';
  }

  @override
  String get error_404 => '资源未找到';

  @override
  String get error_500 => '服务器错误，请稍后再试';

  @override
  String get appTitle => '我的应用';

  @override
  String get switchLanguage => '切换语言';

  @override
  String get masterGenderMale => '男';

  @override
  String get masterGenderFemale => '女';

  @override
  String get masterGenderUnspecified => '未指定';

  @override
  String get masterRatingExcellent => '优秀';

  @override
  String get masterRatingGood => '良好';

  @override
  String get masterRatingAverage => '一般';

  @override
  String get masterRatingPoor => '较差';

  @override
  String get masterRatingVeryPoor => '很差';

  @override
  String get masterRatingNoRating => '无评分';

  @override
  String get masterRequestSlowClear => '慢速清晰';

  @override
  String get masterRequestNaturalSpeed => '自然语速';

  @override
  String get masterRequestStrictTeaching => '严格教学';

  @override
  String get masterRequestFreeConversation => '自由对话';

  @override
  String get masterRequestStrictCurriculum => '严格按课程';

  @override
  String get masterCancelByStudent => '学生取消';

  @override
  String get masterCancelByTeacher => '教师取消';

  @override
  String get masterCancelBySystem => '系统取消';

  @override
  String get masterRefundFull => '全额退款';

  @override
  String get masterRefundPartial => '部分退款';

  @override
  String get masterRefundNone => '无退款';

  @override
  String masterRefundPercentage(int percentage) {
    return '$percentage%退款';
  }

  @override
  String get masterPointsFree => '免费课程';

  @override
  String get masterPointsEconomical => '经济实惠';

  @override
  String get masterPointsStandard => '标准价格';

  @override
  String get masterPointsPremium => '高级课程';

  @override
  String get masterLessonShort => '短课程';

  @override
  String get masterLessonStandard => '标准课程';

  @override
  String get masterLessonLong => '长课程';

  @override
  String get masterLessonExtraLong => '超长课程';

  @override
  String get help => '帮助';

  @override
  String get verificationCode => '验证码';

  @override
  String get getVerificationCode => '获取验证码';

  @override
  String get verificationCodeInvalid => '验证码无效';

  @override
  String get verificationCodeExpired => '验证码已过期';

  @override
  String get verificationCodeRequired => '请输入验证码';

  @override
  String get verificationCodeResend => '重新发送验证码';

  @override
  String get verificationCodeResendSuccess => '验证码已发送，请查收短信';

  @override
  String get verificationCodeResendFailed => '验证码发送失败';

  @override
  String get verificationCodeResendLimitExceeded => '验证码发送次数已达上限';

  @override
  String get verificationCodeResendCooldown => '请稍后再试';

  @override
  String verificationCodeResendCooldownMessage(int seconds) {
    return '请 $seconds 秒后再试';
  }

  @override
  String verificationCodeResendCooldownMessage2(int minutes) {
    return '请 $minutes 分钟后再试';
  }

  @override
  String get password => '密码';

  @override
  String get passwordConfirm => '确认密码';

  @override
  String get passwordInvalid => '密码无效';

  @override
  String get passwordRequired => '请输入密码';

  @override
  String get login => '登录';

  @override
  String get logout => '登出';

  @override
  String get register => '注册';

  @override
  String get forgotPassword => '忘记密码?';

  @override
  String get cancel => '取消';

  @override
  String get confirm => '确定';

  @override
  String get agreeAndLogin => '同意并登录';

  @override
  String get verificationCodeLogin => '验证码登录';

  @override
  String get passwordLogin => '密码登录';

  @override
  String get unregisteredPhoneWillBeRegisteredAndLoggedInBackup =>
      '未注册的手机号将被注册并登录';

  @override
  String get iHaveReadAndAgree => '我已阅读并同意';

  @override
  String get userAgreement => '《用户协议》';

  @override
  String get and => '和';

  @override
  String get privacyPolicy => '《隐私政策》';

  @override
  String get pleaseEnterPhoneNumber => '请输入手机号码';

  @override
  String get pleaseEnterValidPhoneNumber => '请输入有效的手机号码';

  @override
  String get pleaseEnterEmailPhoneAccount => '请输入邮箱/手机号/账号';

  @override
  String get select => '选择';

  @override
  String get country => '国家';

  @override
  String get or => '或';

  @override
  String get district => '地区';

  @override
  String get phoneVerification => '手机号验证';

  @override
  String get emailVerification => '邮箱验证';

  @override
  String get phoneNumber => '手机号码';

  @override
  String get email => '邮箱';

  @override
  String get newPassword => '新密码';

  @override
  String get confirmNewPassword => '确认新密码';

  @override
  String get completeAndLogin => '完成并登录';

  @override
  String get bindPhone => '绑定手机号';

  @override
  String get bindAccount => '绑定账号';

  @override
  String get bindAndLogin => '绑定并登录';

  @override
  String get registeredEmailOrAccount => '已注册的邮箱/账号';

  @override
  String get loginSignUp => '登录/注册';

  @override
  String get quickLoginWithLocalNumber => '本机号码一键登录';

  @override
  String get useAnotherNumberAccount => '其他手机号/账号登录';

  @override
  String get unregisteredPhoneWillBeRegisteredAndLoggedIn => '未注册的手机号将自动注册并登录';

  @override
  String get bySMSCode => '验证码登录';

  @override
  String get byPassword => '密码登录';

  @override
  String get getACode => '获取验证码';

  @override
  String get otherLoginMethods => '其他方式登录';

  @override
  String get iAgreeToUserAgreementAndPrivacyPolicy => '我已阅读并同意《用户协议》和《隐私政策》';

  @override
  String get emailPhoneNumberUsername => '邮箱/手机号/账号';

  @override
  String get signUpWithEmail => '邮箱注册';

  @override
  String get logIn => '登录';

  @override
  String get passwordsMustBe8To20Characters => '密码规则为 8-20位，且需要同时包含数字、字母、特殊符号';

  @override
  String get agreeAndLogIn => '同意并登录';

  @override
  String get completeAndLogIn => '完成并登录';

  @override
  String get bindAndLogIn => '绑定并登录';

  @override
  String get smsVerification => '手机号验证';

  @override
  String get emailAddress => '邮箱';

  @override
  String get bindPhoneNumber => '绑定手机号';

  @override
  String get signUp => '注册';

  @override
  String get signUpAndLogIn => '注册并登录';

  @override
  String get selectAnAccountToEnter => '选择需要进入的账号';

  @override
  String isLinkedToMultipleAccounts(Object userAccount) {
    return '$userAccount 已绑定多个账号，您可进入以下任一账号';
  }

  @override
  String get selectAnAccountToResetPassword => '选择需要重置密码的账号';

  @override
  String isAssociatedWithMultipleAccountsResetPassword(Object userAccount) {
    return '$userAccount 已绑定多个账号，可点击任一账号设置新密码。设置成功后，需要使用新密码登录该账号';
  }

  @override
  String get selectAnAccountToLinkWithWeChat => '选择需要微信绑定的账号';

  @override
  String isLinkedToMultipleAccountsWeChat(Object userAccount) {
    return '$userAccount 已绑定多个账号，可点击任一账号绑定微信。设置成功后，可以使用微信登录该账号';
  }

  @override
  String get enter => '进入';

  @override
  String get recentlyUsed => '上次';

  @override
  String get selectYourCountryOrRegion => '选择国家和地区';

  @override
  String get reminder => '温馨提示';

  @override
  String get pleaseReadAndAgreeToUserAgreementAndPrivacyPolicyFirst =>
      'Please read and agree to the <User Agreement> and <Privacy Policy> first.';

  @override
  String get welcomeToCampusTopPrivacyPolicy =>
      '欢迎来到CampusTop！\n我们非常重视您的个人信息和隐私保护，为了向您提供更好的服务，我们会收集、使用必要的信息，您有权拒绝。\n在您使用CampusTop服务之前，请您务必审慎阅读《用户协议》《隐私政策》，并充分理解政策内容，我们将严格按照政策内容使用和保护您的个人信息，为您提供更好的服务，感谢您的信任。\n如您继续使用CampusTop的产品或服务，请点击同意按钮。';

  @override
  String get agreeAndContinue => '同意并继续';

  @override
  String get disagree => '不同意';

  @override
  String get completeYourInformation => '完善信息';

  @override
  String get male => '男生';

  @override
  String get female => '女生';

  @override
  String get dateOfBirth => '生日';

  @override
  String get fullName => '姓名';

  @override
  String get englishNickname => '英文昵称';

  @override
  String get recommendedEnglishName => '推荐英文名';

  @override
  String get refresh => '换一换';

  @override
  String get selectBirthday => '选择生日';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get uploadFromAlbum => '从相册上传';

  @override
  String get takePhoto => '拍照';

  @override
  String get scanQRCode => '扫描二维码';

  @override
  String get pleaseAlignQRCodeWithinCenter => '请将二维码对准扫码框中心';

  @override
  String get scanToLogIn => '扫码登录';

  @override
  String get pleaseConfirmItsYouAndEnsureQRCodeSourceIsSafe =>
      '请确认是本人操作并确保二维码来源安全';

  @override
  String get accountIsLoggedInOnAnotherDevice => '账号在其他设备登录';

  @override
  String get confirmLogin => '确认登录';

  @override
  String get cancelLogin => '取消登录';

  @override
  String get followingContentNotProvidedByCampusTop => '以下内容非CampusTop提供，请谨慎使用';

  @override
  String get openInBrowser => '浏览器打开';

  @override
  String get campusTopWebVersion => 'CampusTop 网页端';

  @override
  String get twoPasswordEntriesDoNotMatch => '两次密码输入不一致';

  @override
  String get resetPassword => '重置密码';

  @override
  String get pleaseEnterYourPhoneNumber => '请输入手机号';

  @override
  String get phoneNumberNotRegisteredPleaseReEnter => '手机号未注册，请重新输入';

  @override
  String get pleaseEnterYourEmailAddress => '请输入邮箱地址';

  @override
  String get pleaseEnterValidEmailAddress => '请输入有效的邮箱地址';

  @override
  String get emailNotRegisteredPleaseReEnter => '邮箱未注册，请重新输入';

  @override
  String get thisEmailHasAlreadyBeenRegistered => '该邮箱已被注册，请直接登录';

  @override
  String get tooManyAttemptsPleaseRetryIn5Minutes => '操作过于频繁，请 5 分钟后再试';

  @override
  String get smsCodeRequestLimitReached => '验证码发送已达上限，请明天再试';

  @override
  String get phoneNumberDoesNotMatchSelectedRegion => '手机号与地区不匹配';

  @override
  String get incorrectVerificationCodePleaseRetry => '验证码错误，请重新输入';

  @override
  String get phoneNumberAlreadyLinkedToAnotherWeChat => '该手机号已绑定其他微信，请联系客服';

  @override
  String get accountNotRegisteredPleaseReEnter => '账号未注册，请重新输入';

  @override
  String get incorrectPasswordPleaseRetry => '密码错误，请重新输入';

  @override
  String get tooManyIncorrectAttemptsPleaseRetryIn5Minutes =>
      '密码输错次数过多，请 5 分钟后再试';

  @override
  String get passwordsDoNotMatchPleaseReEnter => '两次密码不一致，请重新输入';

  @override
  String get passwordMustIncludeLettersNumbersSpecialCharacters =>
      '密码需包含字母、数字和特殊字符，长度 8 - 20 位';

  @override
  String get qrCodeHasExpiredPleaseScanAgain => '二维码已失效，请重新扫描';

  @override
  String get serverErrorPleaseRetryLater => '服务器异常，请稍后再试';

  @override
  String get pleaseCheckInternetConnectionOrRetryLater => '请检查网络或稍后重试';

  @override
  String get verificationCodeHasBeenSentPleaseCheckSMS => '验证码已发送，请查收短信';

  @override
  String get verificationCodeHasBeenSentPleaseCheckEmail => '验证码已发送，请查收邮件';

  @override
  String get getFreeTrialClassWithForeignTeacher => '免费领取外教试听课';

  @override
  String get alreadyClaimed => '已领取';

  @override
  String get successfullyClaimed => '领取成功';

  @override
  String get gotIt => '知道啦';

  @override
  String get congratulationsYouveSuccessfullyClaimedYourFreeTrialClass =>
      '恭喜您成功领取免费试听课，稍后您的专属班主任将会电话联系您，请注意接听哦';

  @override
  String get registeredEmailAccount => '已注册的邮箱/账号';

  @override
  String get pleaseEnterYourName => '请输入姓名';

  @override
  String get pleaseEnterYourEnglishName => '请输入英文名字';

  @override
  String get pleaseSelectYourBirthday => '请选择生日';

  @override
  String get pleaseSelectYourGender => '请选择性别';

  @override
  String get weChatID => '微信号';

  @override
  String get unlinked => '未绑定';

  @override
  String get confirmUnlinking => '确认解绑';

  @override
  String get afterUnbindingWeChatAccountYouWillNoLongerBeAbleToUseWeChat =>
      '解绑微信账号后将无法继续使用微信登录该CampusTop账号';

  @override
  String get unlink => '解绑';

  @override
  String get successfullyUnlinked => '解绑成功';

  @override
  String get accountCanceled => '已注销';

  @override
  String get yourAccountHasBeenCanceledPleaseContactCustomerService =>
      '账号已注销，请联系客服';

  @override
  String get operationTimedOutPleaseLogOutAndLogInAgain => '操作超时，请退出后重新登录';
}

/// The translations for Chinese, using the Han script (`zh_Hans`).
class AppLocalizationsZhHans extends AppLocalizationsZh {
  AppLocalizationsZhHans() : super('zh_Hans');

  @override
  String get helloWorld => '你好世界!';

  @override
  String get welcomeMessage => '欢迎使用我们的应用！';

  @override
  String get demoPageTitle => '本地化演示';

  @override
  String get demoSectionTitle => '本地化示例';

  @override
  String get basicUsageTitle => '基本用法';

  @override
  String get languageSwitchTitle => '切换语言';

  @override
  String get serverTranslationTitle => '服务器翻译状态';

  @override
  String get currentLanguage => '当前语言';

  @override
  String get refreshTranslations => '刷新翻译';

  @override
  String get refreshCompleted => '翻译已刷新';

  @override
  String get translationError => '翻译错误';

  @override
  String get serverTranslationsLoaded => '服务器翻译已加载';

  @override
  String get noServerTranslations => '没有可用的服务器翻译';

  @override
  String get translationNotInitialized => '翻译未初始化';

  @override
  String get userProfileTitle => '用户资料';

  @override
  String get nameLabel => '姓名';

  @override
  String get emailLabel => '邮箱';

  @override
  String get roleLabel => '角色';

  @override
  String get updateProfile => '更新资料';

  @override
  String get profileUpdated => '资料更新成功';

  @override
  String welcomeUserTemplate(String userName) {
    return '欢迎，$userName！';
  }

  @override
  String get error_404 => '资源未找到';

  @override
  String get error_500 => '服务器错误，请稍后再试';

  @override
  String get appTitle => '我的应用';

  @override
  String get switchLanguage => '切换语言';

  @override
  String get masterGenderMale => '男';

  @override
  String get masterGenderFemale => '女';

  @override
  String get masterGenderUnspecified => '未指定';

  @override
  String get masterRatingExcellent => '优秀';

  @override
  String get masterRatingGood => '良好';

  @override
  String get masterRatingAverage => '一般';

  @override
  String get masterRatingPoor => '较差';

  @override
  String get masterRatingVeryPoor => '很差';

  @override
  String get masterRatingNoRating => '无评分';

  @override
  String get masterRequestSlowClear => '慢速清晰';

  @override
  String get masterRequestNaturalSpeed => '自然语速';

  @override
  String get masterRequestStrictTeaching => '严格教学';

  @override
  String get masterRequestFreeConversation => '自由对话';

  @override
  String get masterRequestStrictCurriculum => '严格按课程';

  @override
  String get masterCancelByStudent => '学生取消';

  @override
  String get masterCancelByTeacher => '教师取消';

  @override
  String get masterCancelBySystem => '系统取消';

  @override
  String get masterRefundFull => '全额退款';

  @override
  String get masterRefundPartial => '部分退款';

  @override
  String get masterRefundNone => '无退款';

  @override
  String masterRefundPercentage(int percentage) {
    return '$percentage%退款';
  }

  @override
  String get masterPointsFree => '免费课程';

  @override
  String get masterPointsEconomical => '经济实惠';

  @override
  String get masterPointsStandard => '标准价格';

  @override
  String get masterPointsPremium => '高级课程';

  @override
  String get masterLessonShort => '短课程';

  @override
  String get masterLessonStandard => '标准课程';

  @override
  String get masterLessonLong => '长课程';

  @override
  String get masterLessonExtraLong => '超长课程';

  @override
  String get help => '帮助';

  @override
  String get verificationCode => '验证码';

  @override
  String get getVerificationCode => '获取验证码';

  @override
  String get verificationCodeInvalid => '验证码无效';

  @override
  String get verificationCodeExpired => '验证码已过期';

  @override
  String get verificationCodeRequired => '请输入验证码';

  @override
  String get verificationCodeResend => '重新发送验证码';

  @override
  String get verificationCodeResendSuccess => '验证码已发送，请查收短信';

  @override
  String get verificationCodeResendFailed => '验证码发送失败';

  @override
  String get verificationCodeResendLimitExceeded => '验证码发送次数已达上限';

  @override
  String get verificationCodeResendCooldown => '请稍后再试';

  @override
  String verificationCodeResendCooldownMessage(int seconds) {
    return '请 $seconds 秒后再试';
  }

  @override
  String verificationCodeResendCooldownMessage2(int minutes) {
    return '请 $minutes 分钟后再试';
  }

  @override
  String get password => '密码';

  @override
  String get passwordConfirm => '确认密码';

  @override
  String get passwordInvalid => '密码无效';

  @override
  String get passwordRequired => '请输入密码';

  @override
  String get login => '登录';

  @override
  String get logout => '登出';

  @override
  String get register => '注册';

  @override
  String get forgotPassword => '忘记密码?';

  @override
  String get cancel => '取消';

  @override
  String get confirm => '确定';

  @override
  String get agreeAndLogin => '同意并登录';

  @override
  String get verificationCodeLogin => '验证码登录';

  @override
  String get passwordLogin => '密码登录';

  @override
  String get unregisteredPhoneWillBeRegisteredAndLoggedInBackup =>
      '未注册的手机号将被注册并登录';

  @override
  String get iHaveReadAndAgree => '我已阅读并同意';

  @override
  String get userAgreement => '《用户协议》';

  @override
  String get and => '和';

  @override
  String get privacyPolicy => '《隐私政策》';

  @override
  String get pleaseEnterPhoneNumber => '请输入手机号码';

  @override
  String get pleaseEnterValidPhoneNumber => '请输入有效的手机号码';

  @override
  String get pleaseEnterEmailPhoneAccount => '请输入邮箱/手机号/账号';

  @override
  String get select => '选择';

  @override
  String get country => '国家';

  @override
  String get or => '或';

  @override
  String get district => '地区';

  @override
  String get phoneVerification => '手机号验证';

  @override
  String get emailVerification => '邮箱验证';

  @override
  String get phoneNumber => '手机号码';

  @override
  String get email => '邮箱';

  @override
  String get newPassword => '新密码';

  @override
  String get confirmNewPassword => '确认新密码';

  @override
  String get completeAndLogin => '完成并登录';

  @override
  String get bindPhone => '绑定手机号';

  @override
  String get bindAccount => '绑定账号';

  @override
  String get bindAndLogin => '绑定并登录';

  @override
  String get registeredEmailOrAccount => '已注册的邮箱/账号';

  @override
  String get loginSignUp => '登录/注册';

  @override
  String get quickLoginWithLocalNumber => '本机号码一键登录';

  @override
  String get useAnotherNumberAccount => '其他手机号/账号登录';

  @override
  String get unregisteredPhoneWillBeRegisteredAndLoggedIn => '未注册的手机号将自动注册并登录';

  @override
  String get bySMSCode => '验证码登录';

  @override
  String get byPassword => '密码登录';

  @override
  String get getACode => '获取验证码';

  @override
  String get otherLoginMethods => '其他方式登录';

  @override
  String get iAgreeToUserAgreementAndPrivacyPolicy => '我已阅读并同意《用户协议》和《隐私政策》';

  @override
  String get emailPhoneNumberUsername => '邮箱/手机号/账号';

  @override
  String get signUpWithEmail => '邮箱注册';

  @override
  String get logIn => '登录';

  @override
  String get passwordsMustBe8To20Characters => '密码规则为 8-20位，且需要同时包含数字、字母、特殊符号';

  @override
  String get agreeAndLogIn => '同意并登录';

  @override
  String get completeAndLogIn => '完成并登录';

  @override
  String get bindAndLogIn => '绑定并登录';

  @override
  String get smsVerification => '手机号验证';

  @override
  String get emailAddress => '邮箱';

  @override
  String get bindPhoneNumber => '绑定手机号';

  @override
  String get signUp => '注册';

  @override
  String get signUpAndLogIn => '注册并登录';

  @override
  String get selectAnAccountToEnter => '选择需要进入的账号';

  @override
  String isLinkedToMultipleAccounts(Object userAccount) {
    return '$userAccount 已绑定多个账号，您可进入以下任一账号';
  }

  @override
  String get selectAnAccountToResetPassword => '选择需要重置密码的账号';

  @override
  String isAssociatedWithMultipleAccountsResetPassword(Object userAccount) {
    return '$userAccount 已绑定多个账号，可点击任一账号设置新密码。设置成功后，需要使用新密码登录该账号';
  }

  @override
  String get selectAnAccountToLinkWithWeChat => '选择需要微信绑定的账号';

  @override
  String isLinkedToMultipleAccountsWeChat(Object userAccount) {
    return '$userAccount 已绑定多个账号，可点击任一账号绑定微信。设置成功后，可以使用微信登录该账号';
  }

  @override
  String get enter => '进入';

  @override
  String get recentlyUsed => '上次';

  @override
  String get selectYourCountryOrRegion => '选择国家和地区';

  @override
  String get reminder => '温馨提示';

  @override
  String get welcomeToCampusTopPrivacyPolicy =>
      '欢迎来到CampusTop！\n我们非常重视您的个人信息和隐私保护，为了向您提供更好的服务，我们会收集、使用必要的信息，您有权拒绝。\n在您使用CampusTop服务之前，请您务必审慎阅读《用户协议》《隐私政策》，并充分理解政策内容，我们将严格按照政策内容使用和保护您的个人信息，为您提供更好的服务，感谢您的信任。\n如您继续使用CampusTop的产品或服务，请点击同意按钮。';

  @override
  String get agreeAndContinue => '同意并继续';

  @override
  String get disagree => '不同意';

  @override
  String get completeYourInformation => '完善信息';

  @override
  String get male => '男生';

  @override
  String get female => '女生';

  @override
  String get dateOfBirth => '生日';

  @override
  String get fullName => '姓名';

  @override
  String get englishNickname => '英文昵称';

  @override
  String get recommendedEnglishName => '推荐英文名';

  @override
  String get refresh => '换一换';

  @override
  String get selectBirthday => '选择生日';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get uploadFromAlbum => '从相册上传';

  @override
  String get takePhoto => '拍照';

  @override
  String get scanQRCode => '扫描二维码';

  @override
  String get pleaseAlignQRCodeWithinCenter => '请将二维码对准扫码框中心';

  @override
  String get scanToLogIn => '扫码登录';

  @override
  String get pleaseConfirmItsYouAndEnsureQRCodeSourceIsSafe =>
      '请确认是本人操作并确保二维码来源安全';

  @override
  String get accountIsLoggedInOnAnotherDevice => '账号在其他设备登录';

  @override
  String get confirmLogin => '确认登录';

  @override
  String get cancelLogin => '取消登录';

  @override
  String get followingContentNotProvidedByCampusTop => '以下内容非CampusTop提供，请谨慎使用';

  @override
  String get openInBrowser => '浏览器打开';

  @override
  String get campusTopWebVersion => 'CampusTop 网页端';

  @override
  String get twoPasswordEntriesDoNotMatch => '两次密码输入不一致';

  @override
  String get resetPassword => '重置密码';

  @override
  String get pleaseEnterYourPhoneNumber => '请输入手机号';

  @override
  String get phoneNumberNotRegisteredPleaseReEnter => '手机号未注册，请重新输入';

  @override
  String get pleaseEnterYourEmailAddress => '请输入邮箱地址';

  @override
  String get pleaseEnterValidEmailAddress => '请输入有效的邮箱地址';

  @override
  String get emailNotRegisteredPleaseReEnter => '邮箱未注册，请重新输入';

  @override
  String get thisEmailHasAlreadyBeenRegistered => '该邮箱已被注册，请直接登录';

  @override
  String get tooManyAttemptsPleaseRetryIn5Minutes => '操作过于频繁，请 5 分钟后再试';

  @override
  String get smsCodeRequestLimitReached => '验证码发送已达上限，请明天再试';

  @override
  String get phoneNumberDoesNotMatchSelectedRegion => '手机号与地区不匹配';

  @override
  String get incorrectVerificationCodePleaseRetry => '验证码错误，请重新输入';

  @override
  String get phoneNumberAlreadyLinkedToAnotherWeChat => '该手机号已绑定其他微信，请联系客服';

  @override
  String get accountNotRegisteredPleaseReEnter => '账号未注册，请重新输入';

  @override
  String get incorrectPasswordPleaseRetry => '密码错误，请重新输入';

  @override
  String get tooManyIncorrectAttemptsPleaseRetryIn5Minutes =>
      '密码输错次数过多，请 5 分钟后再试';

  @override
  String get passwordsDoNotMatchPleaseReEnter => '两次密码不一致，请重新输入';

  @override
  String get passwordMustIncludeLettersNumbersSpecialCharacters =>
      '密码需包含字母、数字和特殊字符，长度 8 - 20 位';

  @override
  String get qrCodeHasExpiredPleaseScanAgain => '二维码已失效，请重新扫描';

  @override
  String get serverErrorPleaseRetryLater => '服务器异常，请稍后再试';

  @override
  String get pleaseCheckInternetConnectionOrRetryLater => '请检查网络或稍后重试';

  @override
  String get verificationCodeHasBeenSentPleaseCheckSMS => '验证码已发送，请查收短信';

  @override
  String get verificationCodeHasBeenSentPleaseCheckEmail => '验证码已发送，请查收邮件';

  @override
  String get getFreeTrialClassWithForeignTeacher => '免费领取外教试听课';

  @override
  String get alreadyClaimed => '已领取';

  @override
  String get successfullyClaimed => '领取成功';

  @override
  String get gotIt => '知道啦';

  @override
  String get congratulationsYouveSuccessfullyClaimedYourFreeTrialClass =>
      '恭喜您成功领取免费试听课，稍后您的专属班主任将会电话联系您，请注意接听哦';

  @override
  String get registeredEmailAccount => '已注册的邮箱/账号';

  @override
  String get pleaseEnterYourName => '请输入姓名';

  @override
  String get pleaseEnterYourEnglishName => '请输入英文名字';

  @override
  String get pleaseSelectYourBirthday => '请选择生日';

  @override
  String get pleaseSelectYourGender => '请选择性别';

  @override
  String get weChatID => '微信号';

  @override
  String get unlinked => '未绑定';

  @override
  String get confirmUnlinking => '确认解绑';

  @override
  String get afterUnbindingWeChatAccountYouWillNoLongerBeAbleToUseWeChat =>
      '解绑微信账号后将无法继续使用微信登录该CampusTop账号';

  @override
  String get unlink => '解绑';

  @override
  String get successfullyUnlinked => '解绑成功';

  @override
  String get accountCanceled => '已注销';

  @override
  String get yourAccountHasBeenCanceledPleaseContactCustomerService =>
      '账号已注销，请联系客服';

  @override
  String get operationTimedOutPleaseLogOutAndLogInAgain => '操作超时，请退出后重新登录';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get helloWorld => '你好世界!';

  @override
  String get welcomeMessage => '歡迎使用我們的應用！';

  @override
  String get demoPageTitle => '本地化演示';

  @override
  String get demoSectionTitle => '本地化示例';

  @override
  String get basicUsageTitle => '基本用法';

  @override
  String get languageSwitchTitle => '切換語言';

  @override
  String get serverTranslationTitle => '服務器翻譯狀態';

  @override
  String get currentLanguage => '當前語言';

  @override
  String get refreshTranslations => '刷新翻譯';

  @override
  String get refreshCompleted => '翻譯已刷新';

  @override
  String get translationError => '翻譯錯誤';

  @override
  String get serverTranslationsLoaded => '服務器翻譯已加載';

  @override
  String get noServerTranslations => '沒有可用的服務器翻譯';

  @override
  String get translationNotInitialized => '翻譯未初始化';

  @override
  String get userProfileTitle => '用戶資料';

  @override
  String get nameLabel => '姓名';

  @override
  String get emailLabel => '郵箱';

  @override
  String get roleLabel => '角色';

  @override
  String get updateProfile => '更新資料';

  @override
  String get profileUpdated => '資料更新成功';

  @override
  String welcomeUserTemplate(String userName) {
    return '歡迎，$userName！';
  }

  @override
  String get error_404 => '資源未找到';

  @override
  String get error_500 => '服務器錯誤，請稍後再試';

  @override
  String get appTitle => '我的應用';

  @override
  String get switchLanguage => '切換語言';

  @override
  String get masterGenderMale => '男';

  @override
  String get masterGenderFemale => '女';

  @override
  String get masterGenderUnspecified => '未指定';

  @override
  String get masterRatingExcellent => '優秀';

  @override
  String get masterRatingGood => '良好';

  @override
  String get masterRatingAverage => '一般';

  @override
  String get masterRatingPoor => '較差';

  @override
  String get masterRatingVeryPoor => '很差';

  @override
  String get masterRatingNoRating => '無評分';

  @override
  String get masterRequestSlowClear => '慢速清晰';

  @override
  String get masterRequestNaturalSpeed => '自然語速';

  @override
  String get masterRequestStrictTeaching => '嚴格教學';

  @override
  String get masterRequestFreeConversation => '自由對話';

  @override
  String get masterRequestStrictCurriculum => '嚴格按課程';

  @override
  String get masterCancelByStudent => '學生取消';

  @override
  String get masterCancelByTeacher => '教師取消';

  @override
  String get masterCancelBySystem => '系統取消';

  @override
  String get masterRefundFull => '全額退款';

  @override
  String get masterRefundPartial => '部分退款';

  @override
  String get masterRefundNone => '無退款';

  @override
  String masterRefundPercentage(int percentage) {
    return '$percentage%退款';
  }

  @override
  String get masterPointsFree => '免費課程';

  @override
  String get masterPointsEconomical => '經濟實惠';

  @override
  String get masterPointsStandard => '標準價格';

  @override
  String get masterPointsPremium => '高級課程';

  @override
  String get masterLessonShort => '短課程';

  @override
  String get masterLessonStandard => '標準課程';

  @override
  String get masterLessonLong => '長課程';

  @override
  String get masterLessonExtraLong => '超長課程';

  @override
  String get help => '幫助';

  @override
  String get verificationCode => '驗證碼';

  @override
  String get getVerificationCode => '獲取驗證碼';

  @override
  String get verificationCodeInvalid => '驗證碼無效';

  @override
  String get verificationCodeExpired => '驗證碼已過期';

  @override
  String get verificationCodeRequired => '請輸入驗證碼';

  @override
  String get verificationCodeResend => '重新發送驗證碼';

  @override
  String get verificationCodeResendSuccess => '驗證碼已發送，請查收短信';

  @override
  String get verificationCodeResendFailed => '驗證碼發送失敗';

  @override
  String get verificationCodeResendLimitExceeded => '驗證碼發送次數已達上限';

  @override
  String get verificationCodeResendCooldown => '請稍後再試';

  @override
  String verificationCodeResendCooldownMessage(int seconds) {
    return '請 $seconds 秒後再試';
  }

  @override
  String verificationCodeResendCooldownMessage2(int minutes) {
    return '請 $minutes 分鐘後再試';
  }

  @override
  String get password => '密碼';

  @override
  String get passwordConfirm => '確認密碼';

  @override
  String get passwordInvalid => '密碼無效';

  @override
  String get passwordRequired => '請輸入密碼';

  @override
  String get login => '登入';

  @override
  String get logout => '登出';

  @override
  String get register => '注冊';

  @override
  String get forgotPassword => '忘記密碼?';

  @override
  String get cancel => '取消';

  @override
  String get confirm => '確認';

  @override
  String get agreeAndLogin => '同意並登入';

  @override
  String get verificationCodeLogin => '驗證碼登入';

  @override
  String get passwordLogin => '密碼登入';

  @override
  String get unregisteredPhoneWillBeRegisteredAndLoggedInBackup =>
      '未註冊的手機號碼將自動註冊並登入';

  @override
  String get iHaveReadAndAgree => '我已閱讀並同意';

  @override
  String get userAgreement => '<用戶協議>';

  @override
  String get and => '和';

  @override
  String get privacyPolicy => '隱私政策';

  @override
  String get pleaseEnterPhoneNumber => '請輸入手機號碼';

  @override
  String get pleaseEnterValidPhoneNumber => '請輸入有效的手機號碼';

  @override
  String get pleaseEnterEmailPhoneAccount => '請輸入電子信箱/手機號碼/帳號';

  @override
  String get select => '選擇';

  @override
  String get country => '國家';

  @override
  String get or => '或';

  @override
  String get district => '地區';

  @override
  String get phoneVerification => '手機號碼驗證';

  @override
  String get emailVerification => '電子郵件驗證';

  @override
  String get phoneNumber => '手機號碼';

  @override
  String get email => '電子郵件';

  @override
  String get newPassword => '新密碼';

  @override
  String get confirmNewPassword => '確認新密碼';

  @override
  String get completeAndLogin => '完成並登入';

  @override
  String get bindPhone => '綁定手機號碼';

  @override
  String get bindAccount => '綁定帳號';

  @override
  String get bindAndLogin => '綁定並登入';

  @override
  String get registeredEmailOrAccount => '已註冊的郵箱/帳號';

  @override
  String get loginSignUp => '登入/註冊';

  @override
  String get quickLoginWithLocalNumber => '本機號碼快速登入';

  @override
  String get useAnotherNumberAccount => '其他手機號碼/帳號登入';

  @override
  String get unregisteredPhoneWillBeRegisteredAndLoggedIn => '未註冊的手機號碼將自動註冊並登入';

  @override
  String get bySMSCode => '驗證碼登入';

  @override
  String get byPassword => '密碼登入';

  @override
  String get getACode => '獲取驗證碼';

  @override
  String get otherLoginMethods => '其他方式登入';

  @override
  String get iAgreeToUserAgreementAndPrivacyPolicy => '我已閱讀並同意<用戶協議>和<隱私政策>';

  @override
  String get emailPhoneNumberUsername => '電子信箱/手機號碼/帳號';

  @override
  String get signUpWithEmail => '電子信箱註冊';

  @override
  String get logIn => '登入';

  @override
  String get passwordsMustBe8To20Characters => '密碼規則為8-20位，且需要同時包含數字、字母、特殊符號';

  @override
  String get agreeAndLogIn => '同意並登入';

  @override
  String get completeAndLogIn => '完成並登入';

  @override
  String get bindAndLogIn => '綁定並登入';

  @override
  String get smsVerification => '手機號碼驗證';

  @override
  String get emailAddress => '電子郵件';

  @override
  String get bindPhoneNumber => '綁定手機號碼';

  @override
  String get signUp => '註冊';

  @override
  String get signUpAndLogIn => '註冊並登入';

  @override
  String get selectAnAccountToEnter => '選擇需要進入的帳號';

  @override
  String isLinkedToMultipleAccounts(Object userAccount) {
    return '$userAccount 已綁定多個帳號，您可進入以下任一帳號';
  }

  @override
  String get selectAnAccountToResetPassword => '選擇需要重新設定密碼的帳號';

  @override
  String isAssociatedWithMultipleAccountsResetPassword(Object userAccount) {
    return '$userAccount 已綁定多個帳號，可點擊任一帳號設定新密碼。設定成功後，需要使用新密碼登入該帳號。';
  }

  @override
  String get selectAnAccountToLinkWithWeChat => '選擇需要微信綁定的帳號';

  @override
  String isLinkedToMultipleAccountsWeChat(Object userAccount) {
    return '$userAccount 已綁定多個帳號，可點擊任一帳號綁定微信。設定成功後，您可使用微信登入該帳號。';
  }

  @override
  String get enter => '進入';

  @override
  String get recentlyUsed => '上次';

  @override
  String get selectYourCountryOrRegion => '選擇國家和地區';

  @override
  String get reminder => '溫馨提示';

  @override
  String get welcomeToCampusTopPrivacyPolicy =>
      '歡迎來到 CampusTop！\n我們非常重視您的個人資訊與隱私保護。為了向您提供更好的服務，我們會收集、使用必要的資訊，您有權選擇拒絕。\n在您使用 CampusTop 服務之前，請務必審慎閱讀《使用者協議》與《隱私權政策》，並充分理解政策內容。我們將嚴格依照政策內容使用並保護您的個人資訊，致力於為您提供更優質的服務，感謝您的信任。\n若您繼續使用 CampusTop 的產品或服務，請點擊同意按鈕。';

  @override
  String get agreeAndContinue => '同意並繼續';

  @override
  String get disagree => '不同意';

  @override
  String get completeYourInformation => '完善資料';

  @override
  String get male => '男生';

  @override
  String get female => '女生';

  @override
  String get dateOfBirth => '生日';

  @override
  String get fullName => '姓名';

  @override
  String get englishNickname => '英文暱稱';

  @override
  String get recommendedEnglishName => '推薦英文名';

  @override
  String get refresh => '換一換';

  @override
  String get selectBirthday => '選擇生日';

  @override
  String get selectLanguage => '選擇語言';

  @override
  String get uploadFromAlbum => '從相簿上傳';

  @override
  String get takePhoto => '拍照';

  @override
  String get scanQRCode => '掃描QRcode';

  @override
  String get pleaseAlignQRCodeWithinCenter => '請將QRcode對準掃描框中心';

  @override
  String get scanToLogIn => '掃描登入';

  @override
  String get pleaseConfirmItsYouAndEnsureQRCodeSourceIsSafe =>
      '請確認是本人操作並確保QRcode來源安全';

  @override
  String get accountIsLoggedInOnAnotherDevice => '帳號在其他設備登入';

  @override
  String get confirmLogin => '確認登入';

  @override
  String get cancelLogin => '取消登入';

  @override
  String get followingContentNotProvidedByCampusTop => '以下內容非CampusTop提供，請謹慎使用';

  @override
  String get openInBrowser => '瀏覽器打開';

  @override
  String get campusTopWebVersion => 'CampusTop 網頁端';

  @override
  String get twoPasswordEntriesDoNotMatch => '兩次密碼輸入不一致';

  @override
  String get resetPassword => '重設密碼';

  @override
  String get pleaseEnterYourPhoneNumber => '請輸入手機號碼';

  @override
  String get phoneNumberNotRegisteredPleaseReEnter => '手機號碼未註冊，請重新輸入';

  @override
  String get pleaseEnterYourEmailAddress => '請輸入電子信箱';

  @override
  String get pleaseEnterValidEmailAddress => '請輸入有效的電子信箱';

  @override
  String get emailNotRegisteredPleaseReEnter => '電子信箱未註冊，請重新輸入';

  @override
  String get thisEmailHasAlreadyBeenRegistered => '電子信箱已被註冊，請直接登入';

  @override
  String get tooManyAttemptsPleaseRetryIn5Minutes => '操作過於頻繁，請5分鐘後再試';

  @override
  String get smsCodeRequestLimitReached => '驗證碼發送已達上限，請明天再試';

  @override
  String get phoneNumberDoesNotMatchSelectedRegion => '手機號碼與地區不匹配';

  @override
  String get incorrectVerificationCodePleaseRetry => '驗證碼錯誤，請重新輸入';

  @override
  String get phoneNumberAlreadyLinkedToAnotherWeChat => '該手機號碼已綁定其他微信，請聯絡客服';

  @override
  String get accountNotRegisteredPleaseReEnter => '帳號未註冊，請重新輸入';

  @override
  String get incorrectPasswordPleaseRetry => '密碼錯誤，請重新輸入';

  @override
  String get tooManyIncorrectAttemptsPleaseRetryIn5Minutes =>
      '密碼輸錯次數過多，請5分鐘後再試';

  @override
  String get passwordsDoNotMatchPleaseReEnter => '兩次密碼不一致，請重新輸入';

  @override
  String get passwordMustIncludeLettersNumbersSpecialCharacters =>
      '密碼須包含字母、數字和特殊符號，長度8-20位';

  @override
  String get qrCodeHasExpiredPleaseScanAgain => 'QR code已失效，請重新掃描';

  @override
  String get serverErrorPleaseRetryLater => '服務器異常，請稍後再試';

  @override
  String get pleaseCheckInternetConnectionOrRetryLater => '請檢查網路或稍後重試';

  @override
  String get verificationCodeHasBeenSentPleaseCheckSMS => '驗證碼已發送，請查看簡訊';

  @override
  String get verificationCodeHasBeenSentPleaseCheckEmail => '驗證碼已發送，請查看郵件';

  @override
  String get getFreeTrialClassWithForeignTeacher => '免費領取外籍老師試聽課';

  @override
  String get alreadyClaimed => '已領取';

  @override
  String get successfullyClaimed => '領取成功';

  @override
  String get gotIt => '知道了';

  @override
  String get congratulationsYouveSuccessfullyClaimedYourFreeTrialClass =>
      '恭喜您成功領取免費試聽課，稍後客服人員將會聯繫您，請注意接聽喔';

  @override
  String get registeredEmailAccount => '已註冊的郵箱／帳號';

  @override
  String get pleaseEnterYourName => '請輸入姓名';

  @override
  String get pleaseEnterYourEnglishName => '請輸入英文名字';

  @override
  String get pleaseSelectYourBirthday => '請選擇生日';

  @override
  String get pleaseSelectYourGender => '請選擇性別';

  @override
  String get weChatID => '微信號';

  @override
  String get unlinked => '未綁定';

  @override
  String get confirmUnlinking => '確認解除綁定';

  @override
  String get afterUnbindingWeChatAccountYouWillNoLongerBeAbleToUseWeChat =>
      '解除綁定微信帳號後將無法繼續使用微信登入該 CampusTop 帳號';

  @override
  String get unlink => '解除綁定';

  @override
  String get successfullyUnlinked => '解除綁定成功';

  @override
  String get accountCanceled => '已註銷';

  @override
  String get yourAccountHasBeenCanceledPleaseContactCustomerService =>
      '帳號已註銷，請聯繫客服';

  @override
  String get operationTimedOutPleaseLogOutAndLogInAgain => '操作過時，請退出後重新登錄';
}
