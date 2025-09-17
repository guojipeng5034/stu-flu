import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja'),
    Locale('ko'),
    Locale('ru'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')
  ];

  /// A simple greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// Welcome message for users
  ///
  /// In en, this message translates to:
  /// **'Welcome to our app!'**
  String get welcomeMessage;

  /// Title for the localization demo page
  ///
  /// In en, this message translates to:
  /// **'Localization Demo'**
  String get demoPageTitle;

  /// Title for the localization examples section
  ///
  /// In en, this message translates to:
  /// **'Localization Examples'**
  String get demoSectionTitle;

  /// Title for basic usage section
  ///
  /// In en, this message translates to:
  /// **'Basic Usage'**
  String get basicUsageTitle;

  /// Title for language switch section
  ///
  /// In en, this message translates to:
  /// **'Switch Language'**
  String get languageSwitchTitle;

  /// Title for server translation status section
  ///
  /// In en, this message translates to:
  /// **'Server Translation Status'**
  String get serverTranslationTitle;

  /// Label for current language
  ///
  /// In en, this message translates to:
  /// **'Current Language'**
  String get currentLanguage;

  /// Button text for refreshing translations
  ///
  /// In en, this message translates to:
  /// **'Refresh Translations'**
  String get refreshTranslations;

  /// Message shown when translations are refreshed
  ///
  /// In en, this message translates to:
  /// **'Translations refreshed'**
  String get refreshCompleted;

  /// Error message for translation errors
  ///
  /// In en, this message translates to:
  /// **'Translation Error'**
  String get translationError;

  /// Message shown when server translations are loaded
  ///
  /// In en, this message translates to:
  /// **'Server translations loaded'**
  String get serverTranslationsLoaded;

  /// Message shown when no server translations are available
  ///
  /// In en, this message translates to:
  /// **'No server translations available'**
  String get noServerTranslations;

  /// Message shown when translations are not initialized
  ///
  /// In en, this message translates to:
  /// **'Translations not initialized'**
  String get translationNotInitialized;

  /// Title for user profile page
  ///
  /// In en, this message translates to:
  /// **'User Profile'**
  String get userProfileTitle;

  /// Label for name field
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// Label for email field
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// Label for role field
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get roleLabel;

  /// Button text for updating profile
  ///
  /// In en, this message translates to:
  /// **'Update Profile'**
  String get updateProfile;

  /// Message shown when profile is updated
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profileUpdated;

  /// Welcome message with user name placeholder
  ///
  /// In en, this message translates to:
  /// **'Welcome, {userName}!'**
  String welcomeUserTemplate(String userName);

  /// Error message for 404 error
  ///
  /// In en, this message translates to:
  /// **'Resource not found'**
  String get error_404;

  /// Error message for 500 error
  ///
  /// In en, this message translates to:
  /// **'Server error, please try again later'**
  String get error_500;

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'My App'**
  String get appTitle;

  /// Button text for switching language
  ///
  /// In en, this message translates to:
  /// **'Switch Language'**
  String get switchLanguage;

  /// Male gender option
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get masterGenderMale;

  /// Female gender option
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get masterGenderFemale;

  /// Unspecified gender option
  ///
  /// In en, this message translates to:
  /// **'Unspecified'**
  String get masterGenderUnspecified;

  /// Excellent rating level
  ///
  /// In en, this message translates to:
  /// **'Excellent'**
  String get masterRatingExcellent;

  /// Good rating level
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get masterRatingGood;

  /// Average rating level
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get masterRatingAverage;

  /// Poor rating level
  ///
  /// In en, this message translates to:
  /// **'Poor'**
  String get masterRatingPoor;

  /// Very poor rating level
  ///
  /// In en, this message translates to:
  /// **'Very Poor'**
  String get masterRatingVeryPoor;

  /// No rating available
  ///
  /// In en, this message translates to:
  /// **'No Rating'**
  String get masterRatingNoRating;

  /// Slow and clear teaching request
  ///
  /// In en, this message translates to:
  /// **'Slow & Clear'**
  String get masterRequestSlowClear;

  /// Natural speed teaching request
  ///
  /// In en, this message translates to:
  /// **'Natural Speed'**
  String get masterRequestNaturalSpeed;

  /// Strict teaching request
  ///
  /// In en, this message translates to:
  /// **'Strict Teaching'**
  String get masterRequestStrictTeaching;

  /// Free conversation request
  ///
  /// In en, this message translates to:
  /// **'Free Conversation'**
  String get masterRequestFreeConversation;

  /// Strict curriculum request
  ///
  /// In en, this message translates to:
  /// **'Strict Curriculum'**
  String get masterRequestStrictCurriculum;

  /// Cancellation by student
  ///
  /// In en, this message translates to:
  /// **'Student Cancellation'**
  String get masterCancelByStudent;

  /// Cancellation by teacher
  ///
  /// In en, this message translates to:
  /// **'Teacher Cancellation'**
  String get masterCancelByTeacher;

  /// Cancellation by system
  ///
  /// In en, this message translates to:
  /// **'System Cancellation'**
  String get masterCancelBySystem;

  /// Full refund description
  ///
  /// In en, this message translates to:
  /// **'Full Refund'**
  String get masterRefundFull;

  /// Partial refund description
  ///
  /// In en, this message translates to:
  /// **'Partial Refund'**
  String get masterRefundPartial;

  /// No refund description
  ///
  /// In en, this message translates to:
  /// **'No Refund'**
  String get masterRefundNone;

  /// Percentage refund description
  ///
  /// In en, this message translates to:
  /// **'{percentage}% Refund'**
  String masterRefundPercentage(int percentage);

  /// Free course description
  ///
  /// In en, this message translates to:
  /// **'Free Course'**
  String get masterPointsFree;

  /// Low points course description
  ///
  /// In en, this message translates to:
  /// **'Economical'**
  String get masterPointsEconomical;

  /// Medium points course description
  ///
  /// In en, this message translates to:
  /// **'Standard Price'**
  String get masterPointsStandard;

  /// High points course description
  ///
  /// In en, this message translates to:
  /// **'Premium Course'**
  String get masterPointsPremium;

  /// Short lesson type
  ///
  /// In en, this message translates to:
  /// **'Short Lesson'**
  String get masterLessonShort;

  /// Standard lesson type
  ///
  /// In en, this message translates to:
  /// **'Standard Lesson'**
  String get masterLessonStandard;

  /// Long lesson type
  ///
  /// In en, this message translates to:
  /// **'Long Lesson'**
  String get masterLessonLong;

  /// Extra long lesson type
  ///
  /// In en, this message translates to:
  /// **'Extra Long Lesson'**
  String get masterLessonExtraLong;

  /// Help button text
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// Verification code field label
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get verificationCode;

  /// Get verification code button text
  ///
  /// In en, this message translates to:
  /// **'Get a Code'**
  String get getVerificationCode;

  /// Invalid verification code error message
  ///
  /// In en, this message translates to:
  /// **'Verification Code Invalid'**
  String get verificationCodeInvalid;

  /// Expired verification code error message
  ///
  /// In en, this message translates to:
  /// **'Verification Code Expired'**
  String get verificationCodeExpired;

  /// Required verification code message
  ///
  /// In en, this message translates to:
  /// **'Please enter the code'**
  String get verificationCodeRequired;

  /// Resend verification code button text
  ///
  /// In en, this message translates to:
  /// **'Resend verification code'**
  String get verificationCodeResend;

  /// Success message for verification code resend, check your phone
  ///
  /// In en, this message translates to:
  /// **'Verification code sent successfully'**
  String get verificationCodeResendSuccess;

  /// Failed message for verification code resend
  ///
  /// In en, this message translates to:
  /// **'Verification code send failed'**
  String get verificationCodeResendFailed;

  /// Limit exceeded message for verification code resend
  ///
  /// In en, this message translates to:
  /// **'Verification code send limit exceeded'**
  String get verificationCodeResendLimitExceeded;

  /// Cooldown message for verification code resend
  ///
  /// In en, this message translates to:
  /// **'Please try again later'**
  String get verificationCodeResendCooldown;

  /// Cooldown message with seconds placeholder
  ///
  /// In en, this message translates to:
  /// **'Please try again in {seconds} seconds.'**
  String verificationCodeResendCooldownMessage(int seconds);

  /// Cooldown message with minutes placeholder
  ///
  /// In en, this message translates to:
  /// **'Please try again in {minutes} minutes.'**
  String verificationCodeResendCooldownMessage2(int minutes);

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Confirm password field label
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get passwordConfirm;

  /// Invalid password error message
  ///
  /// In en, this message translates to:
  /// **'Password is invalid'**
  String get passwordInvalid;

  /// Required password message
  ///
  /// In en, this message translates to:
  /// **'Please enter password'**
  String get passwordRequired;

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Logout button text
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Register button text
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get register;

  /// Forgot password link text
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// Cancel button text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Confirm button text
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @agreeAndLogin.
  ///
  /// In en, this message translates to:
  /// **'Agree and Login'**
  String get agreeAndLogin;

  /// Verification code login tab text
  ///
  /// In en, this message translates to:
  /// **'By SMS Code'**
  String get verificationCodeLogin;

  /// Password login tab text
  ///
  /// In en, this message translates to:
  /// **'By Password'**
  String get passwordLogin;

  /// Message for unregistered phone registration
  ///
  /// In en, this message translates to:
  /// **'Unregistered phone numbers will be automatically registered and logged in.'**
  String get unregisteredPhoneWillBeRegisteredAndLoggedInBackup;

  /// Agreement checkbox text
  ///
  /// In en, this message translates to:
  /// **'I agree to the  '**
  String get iHaveReadAndAgree;

  /// 《User Agreement》
  ///
  /// In en, this message translates to:
  /// **'User Agreement'**
  String get userAgreement;

  /// and
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get and;

  /// Privacy policy
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @pleaseEnterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get pleaseEnterPhoneNumber;

  /// Phone number input hint text
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number.'**
  String get pleaseEnterValidPhoneNumber;

  /// Email/phone/account input hint text
  ///
  /// In en, this message translates to:
  /// **'Please enter email/phone/account'**
  String get pleaseEnterEmailPhoneAccount;

  /// Select text
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// Country text
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// Or text
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// District text
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get district;

  /// Phone verification text
  ///
  /// In en, this message translates to:
  /// **'Phone Verification'**
  String get phoneVerification;

  /// Email verification text
  ///
  /// In en, this message translates to:
  /// **'Email Verification'**
  String get emailVerification;

  /// Phone number text
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// Email text
  ///
  /// In en, this message translates to:
  /// **'Mail'**
  String get email;

  /// New password text
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// Confirm new password text
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmNewPassword;

  /// Complete and login text
  ///
  /// In en, this message translates to:
  /// **'Complete and Login'**
  String get completeAndLogin;

  /// Bind phone text
  ///
  /// In en, this message translates to:
  /// **'Bind Phone'**
  String get bindPhone;

  /// Bind account text
  ///
  /// In en, this message translates to:
  /// **'Bind Account'**
  String get bindAccount;

  /// Bind and login text
  ///
  /// In en, this message translates to:
  /// **'Bind and Log in'**
  String get bindAndLogin;

  /// Registered email/account text
  ///
  /// In en, this message translates to:
  /// **'Registered Email/Account'**
  String get registeredEmailOrAccount;

  /// No description provided for @loginSignUp.
  ///
  /// In en, this message translates to:
  /// **'Login / Sign Up'**
  String get loginSignUp;

  /// No description provided for @quickLoginWithLocalNumber.
  ///
  /// In en, this message translates to:
  /// **'Quick login with local number'**
  String get quickLoginWithLocalNumber;

  /// No description provided for @useAnotherNumberAccount.
  ///
  /// In en, this message translates to:
  /// **'Use another number / account'**
  String get useAnotherNumberAccount;

  /// No description provided for @unregisteredPhoneWillBeRegisteredAndLoggedIn.
  ///
  /// In en, this message translates to:
  /// **'Unregistered phone numbers will be automatically registered and logged in.'**
  String get unregisteredPhoneWillBeRegisteredAndLoggedIn;

  /// No description provided for @bySMSCode.
  ///
  /// In en, this message translates to:
  /// **'By SMS Code'**
  String get bySMSCode;

  /// No description provided for @byPassword.
  ///
  /// In en, this message translates to:
  /// **'By Password'**
  String get byPassword;

  /// No description provided for @getACode.
  ///
  /// In en, this message translates to:
  /// **'Get a code'**
  String get getACode;

  /// No description provided for @otherLoginMethods.
  ///
  /// In en, this message translates to:
  /// **'Other login methods'**
  String get otherLoginMethods;

  /// No description provided for @iAgreeToUserAgreementAndPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'I agree to the User Agreement and Privacy Policy.'**
  String get iAgreeToUserAgreementAndPrivacyPolicy;

  /// No description provided for @emailPhoneNumberUsername.
  ///
  /// In en, this message translates to:
  /// **'Email / Phone number / Username'**
  String get emailPhoneNumberUsername;

  /// No description provided for @signUpWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Sign up with email.'**
  String get signUpWithEmail;

  /// No description provided for @logIn.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get logIn;

  /// No description provided for @passwordsMustBe8To20Characters.
  ///
  /// In en, this message translates to:
  /// **'Passwords must be 8-20 characters long and contain at least one number, one letter, and one special character.'**
  String get passwordsMustBe8To20Characters;

  /// No description provided for @agreeAndLogIn.
  ///
  /// In en, this message translates to:
  /// **'Agree and log in'**
  String get agreeAndLogIn;

  /// No description provided for @completeAndLogIn.
  ///
  /// In en, this message translates to:
  /// **'Complete and log in'**
  String get completeAndLogIn;

  /// No description provided for @bindAndLogIn.
  ///
  /// In en, this message translates to:
  /// **'Bind and log in'**
  String get bindAndLogIn;

  /// No description provided for @smsVerification.
  ///
  /// In en, this message translates to:
  /// **'SMS Verification'**
  String get smsVerification;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get emailAddress;

  /// No description provided for @bindPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Bind Phone Number'**
  String get bindPhoneNumber;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @signUpAndLogIn.
  ///
  /// In en, this message translates to:
  /// **'Sign Up and Log In'**
  String get signUpAndLogIn;

  /// No description provided for @selectAnAccountToEnter.
  ///
  /// In en, this message translates to:
  /// **'Select an account to enter'**
  String get selectAnAccountToEnter;

  /// No description provided for @isLinkedToMultipleAccounts.
  ///
  /// In en, this message translates to:
  /// **'{userAccount} is linked to multiple accounts. You may access any of the following accounts:'**
  String isLinkedToMultipleAccounts(Object userAccount);

  /// No description provided for @selectAnAccountToResetPassword.
  ///
  /// In en, this message translates to:
  /// **'Select an account to reset password'**
  String get selectAnAccountToResetPassword;

  /// No description provided for @isAssociatedWithMultipleAccountsResetPassword.
  ///
  /// In en, this message translates to:
  /// **'{userAccount} is associated with multiple accounts. Select one to reset its password. After resetting, log in using the new password.'**
  String isAssociatedWithMultipleAccountsResetPassword(Object userAccount);

  /// No description provided for @selectAnAccountToLinkWithWeChat.
  ///
  /// In en, this message translates to:
  /// **'Select an account to link with WeChat'**
  String get selectAnAccountToLinkWithWeChat;

  /// No description provided for @isLinkedToMultipleAccountsWeChat.
  ///
  /// In en, this message translates to:
  /// **'{userAccount} is linked to multiple accounts. Select one to connect to WeChat. Once linked, you may log in using WeChat.'**
  String isLinkedToMultipleAccountsWeChat(Object userAccount);

  /// No description provided for @enter.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get enter;

  /// No description provided for @recentlyUsed.
  ///
  /// In en, this message translates to:
  /// **'Recently used'**
  String get recentlyUsed;

  /// No description provided for @selectYourCountryOrRegion.
  ///
  /// In en, this message translates to:
  /// **'Select Your Country or Region'**
  String get selectYourCountryOrRegion;

  /// No description provided for @reminder.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get reminder;

  /// No description provided for @pleaseReadAndAgreeToUserAgreementAndPrivacyPolicyFirst.
  ///
  /// In en, this message translates to:
  /// **'Please read and agree to the <User Agreement> and <Privacy Policy> first.'**
  String get pleaseReadAndAgreeToUserAgreementAndPrivacyPolicyFirst;

  /// No description provided for @welcomeToCampusTopPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Welcome to CampusTop! We recognize the importance of your personal information and value your trust. To protect your rights and comply with applicable regulations, our Privacy Policy explains how we collect, store, secure, use, and disclose your data, along with your legal rights. For complete details, please review the full CampusTop Privacy Policy.'**
  String get welcomeToCampusTopPrivacyPolicy;

  /// No description provided for @agreeAndContinue.
  ///
  /// In en, this message translates to:
  /// **'Agree and Continue'**
  String get agreeAndContinue;

  /// No description provided for @disagree.
  ///
  /// In en, this message translates to:
  /// **'Disagree'**
  String get disagree;

  /// No description provided for @completeYourInformation.
  ///
  /// In en, this message translates to:
  /// **'Complete Your Information'**
  String get completeYourInformation;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get dateOfBirth;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @englishNickname.
  ///
  /// In en, this message translates to:
  /// **'English nickname'**
  String get englishNickname;

  /// No description provided for @recommendedEnglishName.
  ///
  /// In en, this message translates to:
  /// **'Recommended English name'**
  String get recommendedEnglishName;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @selectBirthday.
  ///
  /// In en, this message translates to:
  /// **'Select Birthday'**
  String get selectBirthday;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @uploadFromAlbum.
  ///
  /// In en, this message translates to:
  /// **'Upload from Album'**
  String get uploadFromAlbum;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// No description provided for @scanQRCode.
  ///
  /// In en, this message translates to:
  /// **'Scan QR Code'**
  String get scanQRCode;

  /// No description provided for @pleaseAlignQRCodeWithinCenter.
  ///
  /// In en, this message translates to:
  /// **'Please align the QR code within the center of the frame.'**
  String get pleaseAlignQRCodeWithinCenter;

  /// No description provided for @scanToLogIn.
  ///
  /// In en, this message translates to:
  /// **'Scan to Log In'**
  String get scanToLogIn;

  /// No description provided for @pleaseConfirmItsYouAndEnsureQRCodeSourceIsSafe.
  ///
  /// In en, this message translates to:
  /// **'Please confirm it\'s you and ensure the QR code source is safe.'**
  String get pleaseConfirmItsYouAndEnsureQRCodeSourceIsSafe;

  /// No description provided for @accountIsLoggedInOnAnotherDevice.
  ///
  /// In en, this message translates to:
  /// **'Account is logged in on another device'**
  String get accountIsLoggedInOnAnotherDevice;

  /// No description provided for @confirmLogin.
  ///
  /// In en, this message translates to:
  /// **'Confirm Login'**
  String get confirmLogin;

  /// No description provided for @cancelLogin.
  ///
  /// In en, this message translates to:
  /// **'Cancel Login'**
  String get cancelLogin;

  /// No description provided for @followingContentNotProvidedByCampusTop.
  ///
  /// In en, this message translates to:
  /// **'The following content is not provided by CampusTop, please use with caution.'**
  String get followingContentNotProvidedByCampusTop;

  /// No description provided for @openInBrowser.
  ///
  /// In en, this message translates to:
  /// **'Open in browser'**
  String get openInBrowser;

  /// No description provided for @campusTopWebVersion.
  ///
  /// In en, this message translates to:
  /// **'CampusTop Web Version'**
  String get campusTopWebVersion;

  /// No description provided for @twoPasswordEntriesDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'The two password entries do not match.'**
  String get twoPasswordEntriesDoNotMatch;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// Phone number input hint text
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number.'**
  String get pleaseEnterYourPhoneNumber;

  /// No description provided for @phoneNumberNotRegisteredPleaseReEnter.
  ///
  /// In en, this message translates to:
  /// **'Phone number not registered, please re-enter.'**
  String get phoneNumberNotRegisteredPleaseReEnter;

  /// No description provided for @pleaseEnterYourEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address.'**
  String get pleaseEnterYourEmailAddress;

  /// No description provided for @pleaseEnterValidEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get pleaseEnterValidEmailAddress;

  /// No description provided for @emailNotRegisteredPleaseReEnter.
  ///
  /// In en, this message translates to:
  /// **'Email not registered. Please re-enter.'**
  String get emailNotRegisteredPleaseReEnter;

  /// No description provided for @thisEmailHasAlreadyBeenRegistered.
  ///
  /// In en, this message translates to:
  /// **'This email has already been registered. Please log in directly.'**
  String get thisEmailHasAlreadyBeenRegistered;

  /// No description provided for @tooManyAttemptsPleaseRetryIn5Minutes.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Please try again in 5 minutes.'**
  String get tooManyAttemptsPleaseRetryIn5Minutes;

  /// No description provided for @smsCodeRequestLimitReached.
  ///
  /// In en, this message translates to:
  /// **'SMS code request limit reached. Please try again tomorrow.'**
  String get smsCodeRequestLimitReached;

  /// No description provided for @phoneNumberDoesNotMatchSelectedRegion.
  ///
  /// In en, this message translates to:
  /// **'The phone number does not match the selected region.'**
  String get phoneNumberDoesNotMatchSelectedRegion;

  /// No description provided for @incorrectVerificationCodePleaseRetry.
  ///
  /// In en, this message translates to:
  /// **'Incorrect verification code. Please try again.'**
  String get incorrectVerificationCodePleaseRetry;

  /// No description provided for @phoneNumberAlreadyLinkedToAnotherWeChat.
  ///
  /// In en, this message translates to:
  /// **'This phone number is already linked to another WeChat account. Please contact customer service.'**
  String get phoneNumberAlreadyLinkedToAnotherWeChat;

  /// No description provided for @accountNotRegisteredPleaseReEnter.
  ///
  /// In en, this message translates to:
  /// **'Account not registered. Please re-enter.'**
  String get accountNotRegisteredPleaseReEnter;

  /// No description provided for @incorrectPasswordPleaseRetry.
  ///
  /// In en, this message translates to:
  /// **'Incorrect password. Please try again.'**
  String get incorrectPasswordPleaseRetry;

  /// No description provided for @tooManyIncorrectAttemptsPleaseRetryIn5Minutes.
  ///
  /// In en, this message translates to:
  /// **'Too many incorrect attempts. Please try again in 5 minutes.'**
  String get tooManyIncorrectAttemptsPleaseRetryIn5Minutes;

  /// No description provided for @passwordsDoNotMatchPleaseReEnter.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match. Please re-enter.'**
  String get passwordsDoNotMatchPleaseReEnter;

  /// No description provided for @passwordMustIncludeLettersNumbersSpecialCharacters.
  ///
  /// In en, this message translates to:
  /// **'Password must include letters, numbers, and special characters, and be 8–20 characters long'**
  String get passwordMustIncludeLettersNumbersSpecialCharacters;

  /// No description provided for @qrCodeHasExpiredPleaseScanAgain.
  ///
  /// In en, this message translates to:
  /// **'QR code has expired. Please scan again.'**
  String get qrCodeHasExpiredPleaseScanAgain;

  /// No description provided for @serverErrorPleaseRetryLater.
  ///
  /// In en, this message translates to:
  /// **'Server error. Please try again later.'**
  String get serverErrorPleaseRetryLater;

  /// No description provided for @pleaseCheckInternetConnectionOrRetryLater.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection or try again later.'**
  String get pleaseCheckInternetConnectionOrRetryLater;

  /// No description provided for @verificationCodeHasBeenSentPleaseCheckSMS.
  ///
  /// In en, this message translates to:
  /// **'Verification code has been sent. Please check your SMS.'**
  String get verificationCodeHasBeenSentPleaseCheckSMS;

  /// No description provided for @verificationCodeHasBeenSentPleaseCheckEmail.
  ///
  /// In en, this message translates to:
  /// **'Verification code has been sent. Please check your email.'**
  String get verificationCodeHasBeenSentPleaseCheckEmail;

  /// No description provided for @getFreeTrialClassWithForeignTeacher.
  ///
  /// In en, this message translates to:
  /// **'Get a free trial class with a foreign teacher'**
  String get getFreeTrialClassWithForeignTeacher;

  /// No description provided for @alreadyClaimed.
  ///
  /// In en, this message translates to:
  /// **'Already claimed'**
  String get alreadyClaimed;

  /// No description provided for @successfullyClaimed.
  ///
  /// In en, this message translates to:
  /// **'Successfully claimed'**
  String get successfullyClaimed;

  /// No description provided for @gotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get gotIt;

  /// No description provided for @congratulationsYouveSuccessfullyClaimedYourFreeTrialClass.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You\'ve successfully claimed your free trial class. Your dedicated class advisor will contact you by phone shortly—please make sure to answer the call.'**
  String get congratulationsYouveSuccessfullyClaimedYourFreeTrialClass;

  /// No description provided for @registeredEmailAccount.
  ///
  /// In en, this message translates to:
  /// **'Registered email/ account'**
  String get registeredEmailAccount;

  /// No description provided for @pleaseEnterYourName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get pleaseEnterYourName;

  /// No description provided for @pleaseEnterYourEnglishName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your English name'**
  String get pleaseEnterYourEnglishName;

  /// No description provided for @pleaseSelectYourBirthday.
  ///
  /// In en, this message translates to:
  /// **'Please select your birthday'**
  String get pleaseSelectYourBirthday;

  /// No description provided for @pleaseSelectYourGender.
  ///
  /// In en, this message translates to:
  /// **'Please select your gender'**
  String get pleaseSelectYourGender;

  /// No description provided for @weChatID.
  ///
  /// In en, this message translates to:
  /// **'WeChat ID'**
  String get weChatID;

  /// No description provided for @unlinked.
  ///
  /// In en, this message translates to:
  /// **'Unlinked'**
  String get unlinked;

  /// No description provided for @confirmUnlinking.
  ///
  /// In en, this message translates to:
  /// **'Confirm unlinking'**
  String get confirmUnlinking;

  /// No description provided for @afterUnbindingWeChatAccountYouWillNoLongerBeAbleToUseWeChat.
  ///
  /// In en, this message translates to:
  /// **'After unbinding your WeChat account, you will no longer be able to use WeChat to log in to this CampusTop account.'**
  String get afterUnbindingWeChatAccountYouWillNoLongerBeAbleToUseWeChat;

  /// No description provided for @unlink.
  ///
  /// In en, this message translates to:
  /// **'Unlink'**
  String get unlink;

  /// No description provided for @successfullyUnlinked.
  ///
  /// In en, this message translates to:
  /// **'Successfully unlinked'**
  String get successfullyUnlinked;

  /// No description provided for @accountCanceled.
  ///
  /// In en, this message translates to:
  /// **'Account canceled'**
  String get accountCanceled;

  /// No description provided for @yourAccountHasBeenCanceledPleaseContactCustomerService.
  ///
  /// In en, this message translates to:
  /// **'Your account has been canceled. Please contact customer service.'**
  String get yourAccountHasBeenCanceledPleaseContactCustomerService;

  /// No description provided for @operationTimedOutPleaseLogOutAndLogInAgain.
  ///
  /// In en, this message translates to:
  /// **'Operation timed out. Please log out and log in again.'**
  String get operationTimedOutPleaseLogOutAndLogInAgain;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ja', 'ko', 'ru', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hans':
            return AppLocalizationsZhHans();
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
