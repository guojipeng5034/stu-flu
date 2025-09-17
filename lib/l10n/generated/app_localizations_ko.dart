// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get helloWorld => '안녕하세요 세계!';

  @override
  String get welcomeMessage => '저희 앱에 오신 것을 환영합니다!';

  @override
  String get demoPageTitle => '현지화 데모';

  @override
  String get demoSectionTitle => '현지화 예제';

  @override
  String get basicUsageTitle => '기본 사용법';

  @override
  String get languageSwitchTitle => '언어 전환';

  @override
  String get serverTranslationTitle => '서버 번역 상태';

  @override
  String get currentLanguage => '현재 언어';

  @override
  String get refreshTranslations => '번역 새로고침';

  @override
  String get refreshCompleted => '번역이 새로고침되었습니다';

  @override
  String get translationError => '번역 오류';

  @override
  String get serverTranslationsLoaded => '서버 번역이 로드되었습니다';

  @override
  String get noServerTranslations => '사용 가능한 서버 번역이 없습니다';

  @override
  String get translationNotInitialized => '번역이 초기화되지 않았습니다';

  @override
  String get userProfileTitle => '사용자 프로필';

  @override
  String get nameLabel => '이름';

  @override
  String get emailLabel => '이메일';

  @override
  String get roleLabel => '역할';

  @override
  String get updateProfile => '프로필 업데이트';

  @override
  String get profileUpdated => '프로필이 성공적으로 업데이트되었습니다';

  @override
  String welcomeUserTemplate(String userName) {
    return '환영합니다, $userName님!';
  }

  @override
  String get error_404 => '리소스를 찾을 수 없습니다';

  @override
  String get error_500 => '서버 오류, 나중에 다시 시도해주세요';

  @override
  String get appTitle => '내 앱';

  @override
  String get switchLanguage => '언어 전환';

  @override
  String get masterGenderMale => '남성';

  @override
  String get masterGenderFemale => '여성';

  @override
  String get masterGenderUnspecified => '지정 안함';

  @override
  String get masterRatingExcellent => '우수';

  @override
  String get masterRatingGood => '좋음';

  @override
  String get masterRatingAverage => '보통';

  @override
  String get masterRatingPoor => '나쁨';

  @override
  String get masterRatingVeryPoor => '매우 나쁨';

  @override
  String get masterRatingNoRating => '평가 없음';

  @override
  String get masterRequestSlowClear => '천천히 명확하게';

  @override
  String get masterRequestNaturalSpeed => '자연스러운 속도';

  @override
  String get masterRequestStrictTeaching => '엄격한 교육';

  @override
  String get masterRequestFreeConversation => '자유 대화';

  @override
  String get masterRequestStrictCurriculum => '엄격한 커리큘럼';

  @override
  String get masterCancelByStudent => '학생 취소';

  @override
  String get masterCancelByTeacher => '교사 취소';

  @override
  String get masterCancelBySystem => '시스템 취소';

  @override
  String get masterRefundFull => '전액 환불';

  @override
  String get masterRefundPartial => '부분 환불';

  @override
  String get masterRefundNone => '환불 없음';

  @override
  String masterRefundPercentage(int percentage) {
    return '$percentage% 환불';
  }

  @override
  String get masterPointsFree => '무료 수업';

  @override
  String get masterPointsEconomical => '경제적';

  @override
  String get masterPointsStandard => '표준 가격';

  @override
  String get masterPointsPremium => '프리미엄 수업';

  @override
  String get masterLessonShort => '짧은 수업';

  @override
  String get masterLessonStandard => '표준 수업';

  @override
  String get masterLessonLong => '긴 수업';

  @override
  String get masterLessonExtraLong => '매우 긴 수업';

  @override
  String get help => '도움말';

  @override
  String get verificationCode => '인증 코드';

  @override
  String get getVerificationCode => '인증 코드를 받아보세요';

  @override
  String get verificationCodeInvalid => '인증 코드가 유효하지 않습니다';

  @override
  String get verificationCodeExpired => '인증 코드가 만료되었습니다';

  @override
  String get verificationCodeRequired => '인증 코드를 입력하세요';

  @override
  String get verificationCodeResend => '인증 코드 재전송';

  @override
  String get verificationCodeResendSuccess => '인증 코드가 전송되었습니다';

  @override
  String get verificationCodeResendFailed => '인증 코드 전송에 실패했습니다';

  @override
  String get verificationCodeResendLimitExceeded => '인증 코드 전송 한도를 초과했습니다';

  @override
  String get verificationCodeResendCooldown => '잠시 후 다시 시도하세요';

  @override
  String verificationCodeResendCooldownMessage(int seconds) {
    return '$seconds초 후에 다시 시도하세요';
  }

  @override
  String verificationCodeResendCooldownMessage2(int minutes) {
    return '$minutes분 후에 다시 시도하세요';
  }

  @override
  String get password => '비밀번호';

  @override
  String get passwordConfirm => '비밀번호 확인';

  @override
  String get passwordInvalid => '비밀번호가 유효하지 않습니다';

  @override
  String get passwordRequired => '비밀번호를 입력하세요';

  @override
  String get login => '로그인';

  @override
  String get logout => '로그아웃';

  @override
  String get register => '회원가입';

  @override
  String get forgotPassword => '비밀번호 찾기';

  @override
  String get cancel => '취소';

  @override
  String get confirm => '확인';

  @override
  String get agreeAndLogin => '동의하고 로그인';

  @override
  String get verificationCodeLogin => '인증 코드 로그인';

  @override
  String get passwordLogin => '비밀번호 로그인';

  @override
  String get unregisteredPhoneWillBeRegisteredAndLoggedInBackup =>
      '등록되지 않은 전화번호는 등록되고 로그인됩니다';

  @override
  String get iHaveReadAndAgree => '나는 읽고 동의합니다';

  @override
  String get userAgreement => '《用户协议》';

  @override
  String get and => '和';

  @override
  String get privacyPolicy => '《隐私政策》';

  @override
  String get pleaseEnterPhoneNumber => '전화번호를 입력하세요';

  @override
  String get pleaseEnterValidPhoneNumber => '유효한 전화번호를 입력해주세요.';

  @override
  String get pleaseEnterEmailPhoneAccount => '이메일/계정을 입력하세요';

  @override
  String get select => '선택';

  @override
  String get country => '국가';

  @override
  String get or => '또는';

  @override
  String get district => '구';

  @override
  String get phoneVerification => '전화번호 인증';

  @override
  String get emailVerification => '이메일 인증';

  @override
  String get phoneNumber => '전화번호';

  @override
  String get email => '이메일';

  @override
  String get newPassword => '새 비밀번호';

  @override
  String get confirmNewPassword => '새 비밀번호 확인';

  @override
  String get completeAndLogin => '완료하고 로그인';

  @override
  String get bindPhone => '전화번호 바인딩';

  @override
  String get bindAccount => '계정 바인딩';

  @override
  String get bindAndLogin => '바인딩하고 로그인';

  @override
  String get registeredEmailOrAccount => '등록된 이메일/계정';

  @override
  String get loginSignUp => '로그인 / 회원가입';

  @override
  String get quickLoginWithLocalNumber => '현지 번호로 빠른 로그인';

  @override
  String get useAnotherNumberAccount => '다른 번호 / 계정 사용';

  @override
  String get unregisteredPhoneWillBeRegisteredAndLoggedIn =>
      '등록되지 않은 전화번호는 자동으로 등록되고 로그인됩니다.';

  @override
  String get bySMSCode => 'SMS 코드로';

  @override
  String get byPassword => '비밀번호로';

  @override
  String get getACode => '코드 받기';

  @override
  String get otherLoginMethods => '다른 로그인 방법';

  @override
  String get iAgreeToUserAgreementAndPrivacyPolicy =>
      '사용자 약관 및 개인정보 보호정책에 동의합니다.';

  @override
  String get emailPhoneNumberUsername => '이메일 / 전화번호 / 사용자명';

  @override
  String get signUpWithEmail => '이메일로 회원가입.';

  @override
  String get logIn => '로그인';

  @override
  String get passwordsMustBe8To20Characters =>
      '비밀번호는 8-20자이며 숫자, 문자, 특수문자를 모두 포함해야 합니다.';

  @override
  String get agreeAndLogIn => '동의하고 로그인';

  @override
  String get completeAndLogIn => '완료하고 로그인';

  @override
  String get bindAndLogIn => '연결하고 로그인';

  @override
  String get smsVerification => 'SMS 인증';

  @override
  String get emailAddress => '이메일 주소';

  @override
  String get bindPhoneNumber => '전화번호 연결';

  @override
  String get signUp => '회원가입';

  @override
  String get signUpAndLogIn => '회원가입하고 로그인';

  @override
  String get selectAnAccountToEnter => '입장할 계정을 선택하세요';

  @override
  String isLinkedToMultipleAccounts(Object userAccount) {
    return '이(가) 여러 계정에 연결되어 있습니다. 다음 계정 중 하나에 액세스할 수 있습니다:';
  }

  @override
  String get selectAnAccountToResetPassword => '비밀번호를 재설정할 계정을 선택하세요';

  @override
  String isAssociatedWithMultipleAccountsResetPassword(Object userAccount) {
    return '이(가) 여러 계정과 연결되어 있습니다. 비밀번호를 재설정할 계정을 선택하세요. 재설정 후 새 비밀번호로 로그인하세요.';
  }

  @override
  String get selectAnAccountToLinkWithWeChat => 'WeChat과 연결할 계정을 선택하세요';

  @override
  String isLinkedToMultipleAccountsWeChat(Object userAccount) {
    return '이(가) 여러 계정에 연결되어 있습니다. WeChat과 연결할 계정을 선택하세요. 연결 후 WeChat으로 로그인할 수 있습니다.';
  }

  @override
  String get enter => '입장';

  @override
  String get recentlyUsed => '최근 사용';

  @override
  String get selectYourCountryOrRegion => '국가 또는 지역을 선택하세요';

  @override
  String get reminder => '알림';

  @override
  String get pleaseReadAndAgreeToUserAgreementAndPrivacyPolicyFirst =>
      '먼저 <사용자 약관>과 <개인정보 보호정책>을 읽고 동의해주세요.';

  @override
  String get welcomeToCampusTopPrivacyPolicy =>
      'CampusTop에 오신 것을 환영합니다! 저희는 귀하의 개인정보의 중요성을 인식하고 귀하의 신뢰를 소중히 여깁니다. 귀하의 권리를 보호하고 관련 규정을 준수하기 위해, 저희 개인정보 보호정책은 저희가 귀하의 데이터를 수집, 저장, 보안, 사용 및 공개하는 방법과 귀하의 법적 권리에 대해 설명합니다. 자세한 내용은 CampusTop 개인정보 보호정책 전문을 검토해주세요.';

  @override
  String get agreeAndContinue => '동의하고 계속';

  @override
  String get disagree => '동의하지 않음';

  @override
  String get completeYourInformation => '정보를 완성하세요';

  @override
  String get male => '남성';

  @override
  String get female => '여성';

  @override
  String get dateOfBirth => '생년월일';

  @override
  String get fullName => '전체 이름';

  @override
  String get englishNickname => '영어 닉네임';

  @override
  String get recommendedEnglishName => '추천 영어 이름';

  @override
  String get refresh => '새로고침';

  @override
  String get selectBirthday => '생일 선택';

  @override
  String get selectLanguage => '언어 선택';

  @override
  String get uploadFromAlbum => '앨범에서 업로드';

  @override
  String get takePhoto => '사진 촬영';

  @override
  String get scanQRCode => 'QR 코드 스캔';

  @override
  String get pleaseAlignQRCodeWithinCenter => 'QR 코드를 프레임 중앙에 맞춰주세요.';

  @override
  String get scanToLogIn => '스캔하여 로그인';

  @override
  String get pleaseConfirmItsYouAndEnsureQRCodeSourceIsSafe =>
      '본인임을 확인하고 QR 코드 소스가 안전한지 확인해주세요.';

  @override
  String get accountIsLoggedInOnAnotherDevice => '계정이 다른 기기에서 로그인되어 있습니다';

  @override
  String get confirmLogin => '로그인 확인';

  @override
  String get cancelLogin => '로그인 취소';

  @override
  String get followingContentNotProvidedByCampusTop =>
      '다음 콘텐츠는 CampusTop에서 제공하지 않으므로 주의해서 사용하세요.';

  @override
  String get openInBrowser => '브라우저에서 열기';

  @override
  String get campusTopWebVersion => 'CampusTop 웹 버전';

  @override
  String get twoPasswordEntriesDoNotMatch => '두 비밀번호 입력이 일치하지 않습니다.';

  @override
  String get resetPassword => '비밀번호 재설정';

  @override
  String get pleaseEnterYourPhoneNumber => '전화번호를 입력해주세요.';

  @override
  String get phoneNumberNotRegisteredPleaseReEnter =>
      '전화번호가 등록되지 않았습니다. 다시 입력해주세요.';

  @override
  String get pleaseEnterYourEmailAddress => '이메일 주소를 입력해주세요.';

  @override
  String get pleaseEnterValidEmailAddress => '유효한 이메일 주소를 입력해주세요.';

  @override
  String get emailNotRegisteredPleaseReEnter => '이메일이 등록되지 않았습니다. 다시 입력해주세요.';

  @override
  String get thisEmailHasAlreadyBeenRegistered =>
      '이 이메일은 이미 등록되었습니다. 직접 로그인해주세요.';

  @override
  String get tooManyAttemptsPleaseRetryIn5Minutes =>
      '너무 많은 시도입니다. 5분 후에 다시 시도해주세요.';

  @override
  String get smsCodeRequestLimitReached =>
      'SMS 코드 요청 한도에 도달했습니다. 내일 다시 시도해주세요.';

  @override
  String get phoneNumberDoesNotMatchSelectedRegion =>
      '전화번호가 선택한 지역과 일치하지 않습니다.';

  @override
  String get incorrectVerificationCodePleaseRetry => '잘못된 인증 코드입니다. 다시 시도해주세요.';

  @override
  String get phoneNumberAlreadyLinkedToAnotherWeChat =>
      '이 전화번호는 이미 다른 WeChat 계정에 연결되어 있습니다. 고객 서비스에 문의해주세요.';

  @override
  String get accountNotRegisteredPleaseReEnter => '계정이 등록되지 않았습니다. 다시 입력해주세요.';

  @override
  String get incorrectPasswordPleaseRetry => '잘못된 비밀번호입니다. 다시 시도해주세요.';

  @override
  String get tooManyIncorrectAttemptsPleaseRetryIn5Minutes =>
      '너무 많은 잘못된 시도입니다. 5분 후에 다시 시도해주세요.';

  @override
  String get passwordsDoNotMatchPleaseReEnter => '비밀번호가 일치하지 않습니다. 다시 입력해주세요.';

  @override
  String get passwordMustIncludeLettersNumbersSpecialCharacters =>
      '비밀번호는 문자, 숫자, 특수문자를 포함하고 8-20자여야 합니다.';

  @override
  String get qrCodeHasExpiredPleaseScanAgain => 'QR 코드가 만료되었습니다. 다시 스캔해주세요.';

  @override
  String get serverErrorPleaseRetryLater => '서버 오류입니다. 나중에 다시 시도해주세요.';

  @override
  String get pleaseCheckInternetConnectionOrRetryLater =>
      '인터넷 연결을 확인하거나 나중에 다시 시도해주세요.';

  @override
  String get verificationCodeHasBeenSentPleaseCheckSMS =>
      '인증 코드가 전송되었습니다. SMS를 확인해주세요.';

  @override
  String get verificationCodeHasBeenSentPleaseCheckEmail =>
      '인증 코드가 전송되었습니다. 이메일을 확인해주세요.';

  @override
  String get getFreeTrialClassWithForeignTeacher => '외국인 교사와 무료 체험 수업 받기';

  @override
  String get alreadyClaimed => '이미 신청함';

  @override
  String get successfullyClaimed => '성공적으로 신청됨';

  @override
  String get gotIt => '알겠습니다';

  @override
  String get congratulationsYouveSuccessfullyClaimedYourFreeTrialClass =>
      '축하합니다! 무료 체험 수업을 성공적으로 신청하셨습니다. 전담 수업 상담사가 곧 전화로 연락드릴 예정이니 전화를 받아주세요.';

  @override
  String get registeredEmailAccount => '등록된 이메일 / 계정';

  @override
  String get pleaseEnterYourName => '이름을 입력해주세요';

  @override
  String get pleaseEnterYourEnglishName => '영어 이름을 입력해주세요';

  @override
  String get pleaseSelectYourBirthday => '생일을 선택해주세요';

  @override
  String get pleaseSelectYourGender => '성별을 선택해주세요';

  @override
  String get weChatID => 'WeChat ID';

  @override
  String get unlinked => '연결되지 않음';

  @override
  String get confirmUnlinking => '연결 해제 확인';

  @override
  String get afterUnbindingWeChatAccountYouWillNoLongerBeAbleToUseWeChat =>
      'WeChat 계정 연결을 해제하면 더 이상 WeChat으로 이 CampusTop 계정에 로그인할 수 없습니다.';

  @override
  String get unlink => '연결 해제';

  @override
  String get successfullyUnlinked => '성공적으로 연결 해제됨';

  @override
  String get accountCanceled => '계정이 취소됨';

  @override
  String get yourAccountHasBeenCanceledPleaseContactCustomerService =>
      '귀하의 계정이 취소되었습니다. 고객 서비스에 문의해주세요.';

  @override
  String get operationTimedOutPleaseLogOutAndLogInAgain =>
      '작업 시간이 초과되었습니다. 로그아웃 후 다시 로그인해주세요.';
}
