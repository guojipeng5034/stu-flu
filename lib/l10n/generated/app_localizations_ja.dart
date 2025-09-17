// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get helloWorld => 'こんにちは世界！';

  @override
  String get welcomeMessage => '私たちのアプリへようこそ！';

  @override
  String get demoPageTitle => 'ローカライゼーションデモ';

  @override
  String get demoSectionTitle => 'ローカライゼーション例';

  @override
  String get basicUsageTitle => '基本的な使用法';

  @override
  String get languageSwitchTitle => '言語切り替え';

  @override
  String get serverTranslationTitle => 'サーバー翻訳状態';

  @override
  String get currentLanguage => '現在の言語';

  @override
  String get refreshTranslations => '翻訳を更新';

  @override
  String get refreshCompleted => '翻訳が更新されました';

  @override
  String get translationError => '翻訳エラー';

  @override
  String get serverTranslationsLoaded => 'サーバー翻訳が読み込まれました';

  @override
  String get noServerTranslations => '利用可能なサーバー翻訳がありません';

  @override
  String get translationNotInitialized => '翻訳が初期化されていません';

  @override
  String get userProfileTitle => 'ユーザープロフィール';

  @override
  String get nameLabel => '名前';

  @override
  String get emailLabel => 'メールアドレス';

  @override
  String get roleLabel => '役割';

  @override
  String get updateProfile => 'プロフィールを更新';

  @override
  String get profileUpdated => 'プロフィールが正常に更新されました';

  @override
  String welcomeUserTemplate(String userName) {
    return 'ようこそ、$userNameさん！';
  }

  @override
  String get error_404 => 'リソースが見つかりません';

  @override
  String get error_500 => 'サーバーエラー、後でもう一度お試しください';

  @override
  String get appTitle => '私のアプリ';

  @override
  String get switchLanguage => '言語を切り替える';

  @override
  String get masterGenderMale => '男性';

  @override
  String get masterGenderFemale => '女性';

  @override
  String get masterGenderUnspecified => '指定なし';

  @override
  String get masterRatingExcellent => '優秀';

  @override
  String get masterRatingGood => '良い';

  @override
  String get masterRatingAverage => '普通';

  @override
  String get masterRatingPoor => '悪い';

  @override
  String get masterRatingVeryPoor => 'とても悪い';

  @override
  String get masterRatingNoRating => '評価なし';

  @override
  String get masterRequestSlowClear => 'ゆっくりはっきり';

  @override
  String get masterRequestNaturalSpeed => '自然なスピード';

  @override
  String get masterRequestStrictTeaching => '厳格な指導';

  @override
  String get masterRequestFreeConversation => '自由な会話';

  @override
  String get masterRequestStrictCurriculum => '厳格なカリキュラム';

  @override
  String get masterCancelByStudent => '生徒によるキャンセル';

  @override
  String get masterCancelByTeacher => '講師によるキャンセル';

  @override
  String get masterCancelBySystem => 'システムによるキャンセル';

  @override
  String get masterRefundFull => '全額返金';

  @override
  String get masterRefundPartial => '部分返金';

  @override
  String get masterRefundNone => '返金なし';

  @override
  String masterRefundPercentage(int percentage) {
    return '$percentage%返金';
  }

  @override
  String get masterPointsFree => '無料レッスン';

  @override
  String get masterPointsEconomical => 'お得';

  @override
  String get masterPointsStandard => '標準価格';

  @override
  String get masterPointsPremium => 'プレミアムレッスン';

  @override
  String get masterLessonShort => '短時間レッスン';

  @override
  String get masterLessonStandard => '標準レッスン';

  @override
  String get masterLessonLong => '長時間レッスン';

  @override
  String get masterLessonExtraLong => '超長時間レッスン';

  @override
  String get help => 'ヘルプ';

  @override
  String get verificationCode => '認証コード';

  @override
  String get getVerificationCode => '認証コードを取得';

  @override
  String get verificationCodeInvalid => '認証コードが無効です';

  @override
  String get verificationCodeExpired => '認証コードの有効期限が切れています';

  @override
  String get verificationCodeRequired => '認証コードを入力してください';

  @override
  String get verificationCodeResend => '認証コードを再送信';

  @override
  String get verificationCodeResendSuccess => '認証コードが送信されました、SMSをご確認ください';

  @override
  String get verificationCodeResendFailed => '認証コードの送信に失敗しました';

  @override
  String get verificationCodeResendLimitExceeded => '認証コードの送信回数制限に達しました';

  @override
  String get verificationCodeResendCooldown => 'しばらくしてから再試行してください';

  @override
  String verificationCodeResendCooldownMessage(int seconds) {
    return '$seconds秒後に再試行してください';
  }

  @override
  String verificationCodeResendCooldownMessage2(int minutes) {
    return '$minutes分後に再試行してください';
  }

  @override
  String get password => 'パスワード';

  @override
  String get passwordConfirm => 'パスワード確認';

  @override
  String get passwordInvalid => 'パスワードが無効です';

  @override
  String get passwordRequired => 'パスワードを入力してください';

  @override
  String get login => 'ログイン';

  @override
  String get logout => 'ログアウト';

  @override
  String get register => '登録';

  @override
  String get forgotPassword => 'パスワードをお忘れですか？';

  @override
  String get cancel => 'キャンセル';

  @override
  String get confirm => '確認';

  @override
  String get agreeAndLogin => '同意してログイン';

  @override
  String get verificationCodeLogin => '認証コードでログイン';

  @override
  String get passwordLogin => 'パスワードでログイン';

  @override
  String get unregisteredPhoneWillBeRegisteredAndLoggedInBackup =>
      '未登録の電話番号は自動的に登録およびログインされます。';

  @override
  String get iHaveReadAndAgree => '利用規約とプライバシーポリシーに同意します。';

  @override
  String get userAgreement => '利用規約';

  @override
  String get and => 'と';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get pleaseEnterPhoneNumber => '電話番号を入力してください';

  @override
  String get pleaseEnterValidPhoneNumber => '有効な電話番号を入力してください。';

  @override
  String get pleaseEnterEmailPhoneAccount => 'メールアドレス / 電話番号 / ユーザー名';

  @override
  String get select => '選択';

  @override
  String get country => '国または地域';

  @override
  String get or => 'または';

  @override
  String get district => '地域';

  @override
  String get phoneVerification => 'SMS認証';

  @override
  String get emailVerification => 'メール認証';

  @override
  String get phoneNumber => '電話番号';

  @override
  String get email => 'メールアドレス';

  @override
  String get newPassword => '新しいパスワード';

  @override
  String get confirmNewPassword => 'パスワードを確認';

  @override
  String get completeAndLogin => '完了してログイン';

  @override
  String get bindPhone => '電話番号を連携';

  @override
  String get bindAccount => 'アカウントを連携';

  @override
  String get bindAndLogin => '連携してログイン';

  @override
  String get registeredEmailOrAccount => '登録済みのメールアドレス／アカウント';

  @override
  String get loginSignUp => 'ログイン / 登録';

  @override
  String get quickLoginWithLocalNumber => '電話番号でログイン';

  @override
  String get useAnotherNumberAccount => '別の電話番号 / アカウントでログイン';

  @override
  String get unregisteredPhoneWillBeRegisteredAndLoggedIn =>
      '未登録の電話番号は自動的に登録およびログインされます。';

  @override
  String get bySMSCode => '認証コードでログイン';

  @override
  String get byPassword => 'パスワードでログイン';

  @override
  String get getACode => 'コードを取得';

  @override
  String get otherLoginMethods => '他の方法でログイン';

  @override
  String get iAgreeToUserAgreementAndPrivacyPolicy => '利用規約とプライバシーポリシーに同意します。';

  @override
  String get emailPhoneNumberUsername => 'メールアドレス / 電話番号 / ユーザー名';

  @override
  String get signUpWithEmail => 'メールアドレスで登録';

  @override
  String get logIn => 'ログイン';

  @override
  String get passwordsMustBe8To20Characters =>
      'パスワードは8～20文字で、数字・英字・記号をすべて含めてください。';

  @override
  String get agreeAndLogIn => '同意してログイン';

  @override
  String get completeAndLogIn => '完了してログイン';

  @override
  String get bindAndLogIn => '連携してログイン';

  @override
  String get smsVerification => 'SMS認証';

  @override
  String get emailAddress => 'メールアドレス';

  @override
  String get bindPhoneNumber => '電話番号を連携';

  @override
  String get signUp => '新規登録';

  @override
  String get signUpAndLogIn => '登録してログイン';

  @override
  String get selectAnAccountToEnter => 'アカウントを選択してください';

  @override
  String isLinkedToMultipleAccounts(Object userAccount) {
    return '$userAccount は複数のアカウントに連携されています。以下のいずれかのアカウントにアクセスできます：';
  }

  @override
  String get selectAnAccountToResetPassword => 'パスワードをリセットするアカウントを選択';

  @override
  String isAssociatedWithMultipleAccountsResetPassword(Object userAccount) {
    return '$userAccount は複数のアカウントに連携されています。いずれかを選んでパスワードをリセットしてください。リセット後は新しいパスワードでログインしてください。';
  }

  @override
  String get selectAnAccountToLinkWithWeChat => 'WeChatと連携するアカウントを選択';

  @override
  String isLinkedToMultipleAccountsWeChat(Object userAccount) {
    return '$userAccount は複数のアカウントに連携されています。いずれかを選んでWeChatと連携してください。連携後、WeChatでログインできます。';
  }

  @override
  String get enter => '進む';

  @override
  String get recentlyUsed => '前回使用';

  @override
  String get selectYourCountryOrRegion => '国または地域を選択';

  @override
  String get reminder => 'お知らせ';

  @override
  String get pleaseReadAndAgreeToUserAgreementAndPrivacyPolicyFirst =>
      'Please read and agree to the <User Agreement> and <Privacy Policy> first.';

  @override
  String get welcomeToCampusTopPrivacyPolicy =>
      'ようこそ、CampusTopへ！\n当社はお客様の個人情報の重要性を認識し、その保護に努めています。\nプライバシーポリシーでは、情報の収集、保存、安全性、利用、開示の方法およびお客様の法的権利について説明しています。\n詳細はCampusTopのプライバシーポリシー全文をご確認ください。';

  @override
  String get agreeAndContinue => '同意して続ける';

  @override
  String get disagree => '同意しない';

  @override
  String get completeYourInformation => '情報を入力する';

  @override
  String get male => '男性';

  @override
  String get female => '女性';

  @override
  String get dateOfBirth => '生年月日';

  @override
  String get fullName => '氏名';

  @override
  String get englishNickname => 'ニックネーム';

  @override
  String get recommendedEnglishName => 'おすすめのニックネーム';

  @override
  String get refresh => '更新';

  @override
  String get selectBirthday => '誕生日を選択';

  @override
  String get selectLanguage => '言語を選択';

  @override
  String get uploadFromAlbum => 'アルバムからアップロード';

  @override
  String get takePhoto => '写真を撮る';

  @override
  String get scanQRCode => 'QRコードをスキャン';

  @override
  String get pleaseAlignQRCodeWithinCenter => 'QRコードを枠の中央に合わせてください。';

  @override
  String get scanToLogIn => 'スキャンしてログイン';

  @override
  String get pleaseConfirmItsYouAndEnsureQRCodeSourceIsSafe =>
      'ご本人確認のうえ、安全なQRコードであることをご確認ください。';

  @override
  String get accountIsLoggedInOnAnotherDevice => 'アカウント は別の端末でログイン中';

  @override
  String get confirmLogin => 'ログインを確認';

  @override
  String get cancelLogin => 'ログインをキャンセル';

  @override
  String get followingContentNotProvidedByCampusTop =>
      '以下のコンテンツはCampusTopが提供するものではありません。ご注意のうえご利用ください。';

  @override
  String get openInBrowser => 'ブラウザで開く';

  @override
  String get campusTopWebVersion => 'CampusTop Web版';

  @override
  String get twoPasswordEntriesDoNotMatch => 'パスワードが一致しません。';

  @override
  String get resetPassword => 'パスワードをリセット';

  @override
  String get pleaseEnterYourPhoneNumber => '電話番号を入力してください。';

  @override
  String get phoneNumberNotRegisteredPleaseReEnter =>
      '電話番号が登録されていません。再入力してください。';

  @override
  String get pleaseEnterYourEmailAddress => 'メールアドレスを入力してください。';

  @override
  String get pleaseEnterValidEmailAddress => '有効なメールアドレスを入力してください。';

  @override
  String get emailNotRegisteredPleaseReEnter => 'メールアドレスが登録されていません。再入力してください。';

  @override
  String get thisEmailHasAlreadyBeenRegistered =>
      'このメールアドレスはすでに登録されています。ログインしてください。';

  @override
  String get tooManyAttemptsPleaseRetryIn5Minutes => '5分後に再試行してください。';

  @override
  String get smsCodeRequestLimitReached => 'SMSコードのリクエスト上限に達しました。明日再試行してください。';

  @override
  String get phoneNumberDoesNotMatchSelectedRegion => '選択した地域と電話番号が一致しません。';

  @override
  String get incorrectVerificationCodePleaseRetry =>
      '認証コードが正しくありません。再入力してください。';

  @override
  String get phoneNumberAlreadyLinkedToAnotherWeChat =>
      'この電話番号はすでに別のWeChatアカウントに連携されています。カスタマーサポートにお問い合わせください。';

  @override
  String get accountNotRegisteredPleaseReEnter => 'アカウントが登録されていません。再入力してください。';

  @override
  String get incorrectPasswordPleaseRetry => 'パスワードが間違っています。再入力してください。';

  @override
  String get tooManyIncorrectAttemptsPleaseRetryIn5Minutes => '5分後に再試行してください。';

  @override
  String get passwordsDoNotMatchPleaseReEnter => 'パスワードが一致しません。再入力してください。';

  @override
  String get passwordMustIncludeLettersNumbersSpecialCharacters =>
      'パスワードは8～20文字で、英字・数字・記号を含める必要があります。';

  @override
  String get qrCodeHasExpiredPleaseScanAgain =>
      'QRコードの有効期限が切れています。再度スキャンしてください。';

  @override
  String get serverErrorPleaseRetryLater => 'サーバーエラーです。しばらくしてから再試行してください。';

  @override
  String get pleaseCheckInternetConnectionOrRetryLater =>
      'インターネット接続を確認するか、後でもう一度お試しください。';

  @override
  String get verificationCodeHasBeenSentPleaseCheckSMS =>
      '認証コードを送信しました。SMSをご確認ください。';

  @override
  String get verificationCodeHasBeenSentPleaseCheckEmail =>
      '認証コードを送信しました。メールをご確認ください。';

  @override
  String get getFreeTrialClassWithForeignTeacher => '無料体験レッスンを受け取りましょう。';

  @override
  String get alreadyClaimed => '受け取り済み';

  @override
  String get successfullyClaimed => '受け取り成功';

  @override
  String get gotIt => '確認しました';

  @override
  String get congratulationsYouveSuccessfullyClaimedYourFreeTrialClass =>
      'おめでとうございます！無料体験レッスンの受け取りが完了しました。\nまもなく専任スタッフよりお電話いたしますので、ご対応をお願いいたします。';

  @override
  String get registeredEmailAccount => '登録済みのメールアドレス／アカウント';

  @override
  String get pleaseEnterYourName => '名前を入力してください';

  @override
  String get pleaseEnterYourEnglishName => '英語の名前を入力してください';

  @override
  String get pleaseSelectYourBirthday => '誕生日を選択してください';

  @override
  String get pleaseSelectYourGender => '性別を選択してください';

  @override
  String get weChatID => 'WeChat ID';

  @override
  String get unlinked => '未連携';

  @override
  String get confirmUnlinking => '連携を解除してもよろしいですか？';

  @override
  String get afterUnbindingWeChatAccountYouWillNoLongerBeAbleToUseWeChat =>
      'WeChatアカウントの連携を解除すると、このCampusTopアカウントにはWeChatでログインできなくなります。';

  @override
  String get unlink => '連携解除';

  @override
  String get successfullyUnlinked => '連携解除に成功しました';

  @override
  String get accountCanceled => 'アカウントは削除されています';

  @override
  String get yourAccountHasBeenCanceledPleaseContactCustomerService =>
      'このアカウントはすでに削除されています。カスタマーサポートまでお問い合わせください。';

  @override
  String get operationTimedOutPleaseLogOutAndLogInAgain =>
      '操作がタイムアウトしました。一度ログアウトしてから再度ログインしてください。';
}
