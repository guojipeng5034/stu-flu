// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get welcomeMessage => 'Welcome to our app!';

  @override
  String get demoPageTitle => 'Localization Demo';

  @override
  String get demoSectionTitle => 'Localization Examples';

  @override
  String get basicUsageTitle => 'Basic Usage';

  @override
  String get languageSwitchTitle => 'Switch Language';

  @override
  String get serverTranslationTitle => 'Server Translation Status';

  @override
  String get currentLanguage => 'Current Language';

  @override
  String get refreshTranslations => 'Refresh Translations';

  @override
  String get refreshCompleted => 'Translations refreshed';

  @override
  String get translationError => 'Translation Error';

  @override
  String get serverTranslationsLoaded => 'Server translations loaded';

  @override
  String get noServerTranslations => 'No server translations available';

  @override
  String get translationNotInitialized => 'Translations not initialized';

  @override
  String get userProfileTitle => 'User Profile';

  @override
  String get nameLabel => 'Name';

  @override
  String get emailLabel => 'Email';

  @override
  String get roleLabel => 'Role';

  @override
  String get updateProfile => 'Update Profile';

  @override
  String get profileUpdated => 'Profile updated successfully';

  @override
  String welcomeUserTemplate(String userName) {
    return 'Welcome, $userName!';
  }

  @override
  String get error_404 => 'Resource not found';

  @override
  String get error_500 => 'Server error, please try again later';

  @override
  String get appTitle => 'My App';

  @override
  String get switchLanguage => 'Switch Language';

  @override
  String get masterGenderMale => 'Male';

  @override
  String get masterGenderFemale => 'Female';

  @override
  String get masterGenderUnspecified => 'Unspecified';

  @override
  String get masterRatingExcellent => 'Excellent';

  @override
  String get masterRatingGood => 'Good';

  @override
  String get masterRatingAverage => 'Average';

  @override
  String get masterRatingPoor => 'Poor';

  @override
  String get masterRatingVeryPoor => 'Very Poor';

  @override
  String get masterRatingNoRating => 'No Rating';

  @override
  String get masterRequestSlowClear => 'Slow & Clear';

  @override
  String get masterRequestNaturalSpeed => 'Natural Speed';

  @override
  String get masterRequestStrictTeaching => 'Strict Teaching';

  @override
  String get masterRequestFreeConversation => 'Free Conversation';

  @override
  String get masterRequestStrictCurriculum => 'Strict Curriculum';

  @override
  String get masterCancelByStudent => 'Student Cancellation';

  @override
  String get masterCancelByTeacher => 'Teacher Cancellation';

  @override
  String get masterCancelBySystem => 'System Cancellation';

  @override
  String get masterRefundFull => 'Full Refund';

  @override
  String get masterRefundPartial => 'Partial Refund';

  @override
  String get masterRefundNone => 'No Refund';

  @override
  String masterRefundPercentage(int percentage) {
    return '$percentage% Refund';
  }

  @override
  String get masterPointsFree => 'Free Course';

  @override
  String get masterPointsEconomical => 'Economical';

  @override
  String get masterPointsStandard => 'Standard Price';

  @override
  String get masterPointsPremium => 'Premium Course';

  @override
  String get masterLessonShort => 'Short Lesson';

  @override
  String get masterLessonStandard => 'Standard Lesson';

  @override
  String get masterLessonLong => 'Long Lesson';

  @override
  String get masterLessonExtraLong => 'Extra Long Lesson';

  @override
  String get help => 'Help';

  @override
  String get verificationCode => 'Code';

  @override
  String get getVerificationCode => 'Get a Code';

  @override
  String get verificationCodeInvalid => 'Verification Code Invalid';

  @override
  String get verificationCodeExpired => 'Verification Code Expired';

  @override
  String get verificationCodeRequired => 'Please enter the code';

  @override
  String get verificationCodeResend => 'Resend verification code';

  @override
  String get verificationCodeResendSuccess =>
      'Verification code sent successfully';

  @override
  String get verificationCodeResendFailed => 'Verification code send failed';

  @override
  String get verificationCodeResendLimitExceeded =>
      'Verification code send limit exceeded';

  @override
  String get verificationCodeResendCooldown => 'Please try again later';

  @override
  String verificationCodeResendCooldownMessage(int seconds) {
    return 'Please try again in $seconds seconds.';
  }

  @override
  String verificationCodeResendCooldownMessage2(int minutes) {
    return 'Please try again in $minutes minutes.';
  }

  @override
  String get password => 'Password';

  @override
  String get passwordConfirm => 'Confirm Password';

  @override
  String get passwordInvalid => 'Password is invalid';

  @override
  String get passwordRequired => 'Please enter password';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get register => 'Sign Up';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get agreeAndLogin => 'Agree and Login';

  @override
  String get verificationCodeLogin => 'By SMS Code';

  @override
  String get passwordLogin => 'By Password';

  @override
  String get unregisteredPhoneWillBeRegisteredAndLoggedInBackup =>
      'Unregistered phone numbers will be automatically registered and logged in.';

  @override
  String get iHaveReadAndAgree => 'I agree to the  ';

  @override
  String get userAgreement => 'User Agreement';

  @override
  String get and => ' and ';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get pleaseEnterPhoneNumber => 'Please enter your phone number';

  @override
  String get pleaseEnterValidPhoneNumber =>
      'Please enter a valid phone number.';

  @override
  String get pleaseEnterEmailPhoneAccount => 'Please enter email/phone/account';

  @override
  String get select => 'Select';

  @override
  String get country => 'Country';

  @override
  String get or => 'Or';

  @override
  String get district => 'District';

  @override
  String get phoneVerification => 'Phone Verification';

  @override
  String get emailVerification => 'Email Verification';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get email => 'Mail';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmNewPassword => 'Confirm Password';

  @override
  String get completeAndLogin => 'Complete and Login';

  @override
  String get bindPhone => 'Bind Phone';

  @override
  String get bindAccount => 'Bind Account';

  @override
  String get bindAndLogin => 'Bind and Log in';

  @override
  String get registeredEmailOrAccount => 'Registered Email/Account';

  @override
  String get loginSignUp => 'Login / Sign Up';

  @override
  String get quickLoginWithLocalNumber => 'Quick login with local number';

  @override
  String get useAnotherNumberAccount => 'Use another number / account';

  @override
  String get unregisteredPhoneWillBeRegisteredAndLoggedIn =>
      'Unregistered phone numbers will be automatically registered and logged in.';

  @override
  String get bySMSCode => 'By SMS Code';

  @override
  String get byPassword => 'By Password';

  @override
  String get getACode => 'Get a code';

  @override
  String get otherLoginMethods => 'Other login methods';

  @override
  String get iAgreeToUserAgreementAndPrivacyPolicy =>
      'I agree to the User Agreement and Privacy Policy.';

  @override
  String get emailPhoneNumberUsername => 'Email / Phone number / Username';

  @override
  String get signUpWithEmail => 'Sign up with email.';

  @override
  String get logIn => 'Log In';

  @override
  String get passwordsMustBe8To20Characters =>
      'Passwords must be 8-20 characters long and contain at least one number, one letter, and one special character.';

  @override
  String get agreeAndLogIn => 'Agree and log in';

  @override
  String get completeAndLogIn => 'Complete and log in';

  @override
  String get bindAndLogIn => 'Bind and log in';

  @override
  String get smsVerification => 'SMS Verification';

  @override
  String get emailAddress => 'Email address';

  @override
  String get bindPhoneNumber => 'Bind Phone Number';

  @override
  String get signUp => 'Sign Up';

  @override
  String get signUpAndLogIn => 'Sign Up and Log In';

  @override
  String get selectAnAccountToEnter => 'Select an account to enter';

  @override
  String isLinkedToMultipleAccounts(Object userAccount) {
    return '$userAccount is linked to multiple accounts. You may access any of the following accounts:';
  }

  @override
  String get selectAnAccountToResetPassword =>
      'Select an account to reset password';

  @override
  String isAssociatedWithMultipleAccountsResetPassword(Object userAccount) {
    return '$userAccount is associated with multiple accounts. Select one to reset its password. After resetting, log in using the new password.';
  }

  @override
  String get selectAnAccountToLinkWithWeChat =>
      'Select an account to link with WeChat';

  @override
  String isLinkedToMultipleAccountsWeChat(Object userAccount) {
    return '$userAccount is linked to multiple accounts. Select one to connect to WeChat. Once linked, you may log in using WeChat.';
  }

  @override
  String get enter => 'Enter';

  @override
  String get recentlyUsed => 'Recently used';

  @override
  String get selectYourCountryOrRegion => 'Select Your Country or Region';

  @override
  String get reminder => 'Reminder';

  @override
  String get pleaseReadAndAgreeToUserAgreementAndPrivacyPolicyFirst =>
      'Please read and agree to the <User Agreement> and <Privacy Policy> first.';

  @override
  String get welcomeToCampusTopPrivacyPolicy =>
      'Welcome to CampusTop! We recognize the importance of your personal information and value your trust. To protect your rights and comply with applicable regulations, our Privacy Policy explains how we collect, store, secure, use, and disclose your data, along with your legal rights. For complete details, please review the full CampusTop Privacy Policy.';

  @override
  String get agreeAndContinue => 'Agree and Continue';

  @override
  String get disagree => 'Disagree';

  @override
  String get completeYourInformation => 'Complete Your Information';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get dateOfBirth => 'Date of birth';

  @override
  String get fullName => 'Full name';

  @override
  String get englishNickname => 'English nickname';

  @override
  String get recommendedEnglishName => 'Recommended English name';

  @override
  String get refresh => 'Refresh';

  @override
  String get selectBirthday => 'Select Birthday';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get uploadFromAlbum => 'Upload from Album';

  @override
  String get takePhoto => 'Take Photo';

  @override
  String get scanQRCode => 'Scan QR Code';

  @override
  String get pleaseAlignQRCodeWithinCenter =>
      'Please align the QR code within the center of the frame.';

  @override
  String get scanToLogIn => 'Scan to Log In';

  @override
  String get pleaseConfirmItsYouAndEnsureQRCodeSourceIsSafe =>
      'Please confirm it\'s you and ensure the QR code source is safe.';

  @override
  String get accountIsLoggedInOnAnotherDevice =>
      'Account is logged in on another device';

  @override
  String get confirmLogin => 'Confirm Login';

  @override
  String get cancelLogin => 'Cancel Login';

  @override
  String get followingContentNotProvidedByCampusTop =>
      'The following content is not provided by CampusTop, please use with caution.';

  @override
  String get openInBrowser => 'Open in browser';

  @override
  String get campusTopWebVersion => 'CampusTop Web Version';

  @override
  String get twoPasswordEntriesDoNotMatch =>
      'The two password entries do not match.';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get pleaseEnterYourPhoneNumber => 'Please enter your phone number.';

  @override
  String get phoneNumberNotRegisteredPleaseReEnter =>
      'Phone number not registered, please re-enter.';

  @override
  String get pleaseEnterYourEmailAddress => 'Please enter your email address.';

  @override
  String get pleaseEnterValidEmailAddress =>
      'Please enter a valid email address.';

  @override
  String get emailNotRegisteredPleaseReEnter =>
      'Email not registered. Please re-enter.';

  @override
  String get thisEmailHasAlreadyBeenRegistered =>
      'This email has already been registered. Please log in directly.';

  @override
  String get tooManyAttemptsPleaseRetryIn5Minutes =>
      'Too many attempts. Please try again in 5 minutes.';

  @override
  String get smsCodeRequestLimitReached =>
      'SMS code request limit reached. Please try again tomorrow.';

  @override
  String get phoneNumberDoesNotMatchSelectedRegion =>
      'The phone number does not match the selected region.';

  @override
  String get incorrectVerificationCodePleaseRetry =>
      'Incorrect verification code. Please try again.';

  @override
  String get phoneNumberAlreadyLinkedToAnotherWeChat =>
      'This phone number is already linked to another WeChat account. Please contact customer service.';

  @override
  String get accountNotRegisteredPleaseReEnter =>
      'Account not registered. Please re-enter.';

  @override
  String get incorrectPasswordPleaseRetry =>
      'Incorrect password. Please try again.';

  @override
  String get tooManyIncorrectAttemptsPleaseRetryIn5Minutes =>
      'Too many incorrect attempts. Please try again in 5 minutes.';

  @override
  String get passwordsDoNotMatchPleaseReEnter =>
      'Passwords do not match. Please re-enter.';

  @override
  String get passwordMustIncludeLettersNumbersSpecialCharacters =>
      'Password must include letters, numbers, and special characters, and be 8–20 characters long';

  @override
  String get qrCodeHasExpiredPleaseScanAgain =>
      'QR code has expired. Please scan again.';

  @override
  String get serverErrorPleaseRetryLater =>
      'Server error. Please try again later.';

  @override
  String get pleaseCheckInternetConnectionOrRetryLater =>
      'Please check your internet connection or try again later.';

  @override
  String get verificationCodeHasBeenSentPleaseCheckSMS =>
      'Verification code has been sent. Please check your SMS.';

  @override
  String get verificationCodeHasBeenSentPleaseCheckEmail =>
      'Verification code has been sent. Please check your email.';

  @override
  String get getFreeTrialClassWithForeignTeacher =>
      'Get a free trial class with a foreign teacher';

  @override
  String get alreadyClaimed => 'Already claimed';

  @override
  String get successfullyClaimed => 'Successfully claimed';

  @override
  String get gotIt => 'Got it';

  @override
  String get congratulationsYouveSuccessfullyClaimedYourFreeTrialClass =>
      'Congratulations! You\'ve successfully claimed your free trial class. Your dedicated class advisor will contact you by phone shortly—please make sure to answer the call.';

  @override
  String get registeredEmailAccount => 'Registered email/ account';

  @override
  String get pleaseEnterYourName => 'Please enter your name';

  @override
  String get pleaseEnterYourEnglishName => 'Please enter your English name';

  @override
  String get pleaseSelectYourBirthday => 'Please select your birthday';

  @override
  String get pleaseSelectYourGender => 'Please select your gender';

  @override
  String get weChatID => 'WeChat ID';

  @override
  String get unlinked => 'Unlinked';

  @override
  String get confirmUnlinking => 'Confirm unlinking';

  @override
  String get afterUnbindingWeChatAccountYouWillNoLongerBeAbleToUseWeChat =>
      'After unbinding your WeChat account, you will no longer be able to use WeChat to log in to this CampusTop account.';

  @override
  String get unlink => 'Unlink';

  @override
  String get successfullyUnlinked => 'Successfully unlinked';

  @override
  String get accountCanceled => 'Account canceled';

  @override
  String get yourAccountHasBeenCanceledPleaseContactCustomerService =>
      'Your account has been canceled. Please contact customer service.';

  @override
  String get operationTimedOutPleaseLogOutAndLogInAgain =>
      'Operation timed out. Please log out and log in again.';
}
