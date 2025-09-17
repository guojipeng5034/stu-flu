// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get helloWorld => 'Привет мир!';

  @override
  String get welcomeMessage => 'Добро пожаловать в наше приложение!';

  @override
  String get demoPageTitle => 'Демонстрация локализации';

  @override
  String get demoSectionTitle => 'Пример локализации';

  @override
  String get basicUsageTitle => 'Основное использование';

  @override
  String get languageSwitchTitle => 'Переключение языка';

  @override
  String get serverTranslationTitle => 'Статус перевода сервера';

  @override
  String get currentLanguage => 'Текущий язык';

  @override
  String get refreshTranslations => 'Обновить переводы';

  @override
  String get refreshCompleted => 'Переводы обновлены';

  @override
  String get translationError => 'Ошибка перевода';

  @override
  String get serverTranslationsLoaded => 'Переводы сервера загружены';

  @override
  String get noServerTranslations => 'Нет доступных переводов сервера';

  @override
  String get translationNotInitialized => 'Перевод не инициализирован';

  @override
  String get userProfileTitle => 'Профиль пользователя';

  @override
  String get nameLabel => 'Имя';

  @override
  String get emailLabel => 'Электронная почта';

  @override
  String get roleLabel => 'Роль';

  @override
  String get updateProfile => 'Обновить профиль';

  @override
  String get profileUpdated => 'Профиль успешно обновлен';

  @override
  String welcomeUserTemplate(String userName) {
    return 'Добро пожаловать, $userName!';
  }

  @override
  String get error_404 => 'Ресурс не найден';

  @override
  String get error_500 => 'Ошибка сервера, попробуйте позже';

  @override
  String get appTitle => 'Мое приложение';

  @override
  String get switchLanguage => 'Переключить язык';

  @override
  String get masterGenderMale => 'Мужской';

  @override
  String get masterGenderFemale => 'Женский';

  @override
  String get masterGenderUnspecified => 'Не указано';

  @override
  String get masterRatingExcellent => 'Отлично';

  @override
  String get masterRatingGood => 'Хорошо';

  @override
  String get masterRatingAverage => 'Средне';

  @override
  String get masterRatingPoor => 'Плохо';

  @override
  String get masterRatingVeryPoor => 'Очень плохо';

  @override
  String get masterRatingNoRating => 'Без оценки';

  @override
  String get masterRequestSlowClear => 'Медленно и четко';

  @override
  String get masterRequestNaturalSpeed => 'Естественная скорость';

  @override
  String get masterRequestStrictTeaching => 'Строгое обучение';

  @override
  String get masterRequestFreeConversation => 'Свободная беседа';

  @override
  String get masterRequestStrictCurriculum => 'Строго по программе';

  @override
  String get masterCancelByStudent => 'Отменено студентом';

  @override
  String get masterCancelByTeacher => 'Отменено преподавателем';

  @override
  String get masterCancelBySystem => 'Отменено системой';

  @override
  String get masterRefundFull => 'Полный возврат';

  @override
  String get masterRefundPartial => 'Частичный возврат';

  @override
  String get masterRefundNone => 'Без возврата';

  @override
  String masterRefundPercentage(int percentage) {
    return '$percentage% возврат';
  }

  @override
  String get masterPointsFree => 'Бесплатный урок';

  @override
  String get masterPointsEconomical => 'Экономичный';

  @override
  String get masterPointsStandard => 'Стандартная цена';

  @override
  String get masterPointsPremium => 'Премиум урок';

  @override
  String get masterLessonShort => 'Короткий урок';

  @override
  String get masterLessonStandard => 'Стандартный урок';

  @override
  String get masterLessonLong => 'Длинный урок';

  @override
  String get masterLessonExtraLong => 'Очень длинный урок';

  @override
  String get help => 'Помощь';

  @override
  String get verificationCode => 'Код подтверждения';

  @override
  String get getVerificationCode => 'Получить код подтверждения';

  @override
  String get verificationCodeInvalid => 'Неверный код подтверждения';

  @override
  String get verificationCodeExpired => 'Код подтверждения истек';

  @override
  String get verificationCodeRequired => 'Введите код подтверждения';

  @override
  String get verificationCodeResend => 'Отправить код повторно';

  @override
  String get verificationCodeResendSuccess =>
      'Код подтверждения отправлен, проверьте SMS';

  @override
  String get verificationCodeResendFailed =>
      'Не удалось отправить код подтверждения';

  @override
  String get verificationCodeResendLimitExceeded =>
      'Превышен лимит отправки кода подтверждения';

  @override
  String get verificationCodeResendCooldown => 'Попробуйте позже';

  @override
  String verificationCodeResendCooldownMessage(int seconds) {
    return 'Попробуйте через $seconds секунд';
  }

  @override
  String verificationCodeResendCooldownMessage2(int minutes) {
    return 'Попробуйте через $minutes минут';
  }

  @override
  String get password => 'Пароль';

  @override
  String get passwordConfirm => 'Подтвердите пароль';

  @override
  String get passwordInvalid => 'Неверный пароль';

  @override
  String get passwordRequired => 'Введите пароль';

  @override
  String get login => 'Войти';

  @override
  String get logout => 'Выйти';

  @override
  String get register => 'Регистрация';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get cancel => 'Отмена';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get agreeAndLogin => 'Согласиться и войти';

  @override
  String get verificationCodeLogin => 'Вход по коду';

  @override
  String get passwordLogin => 'Вход по паролю';

  @override
  String get unregisteredPhoneWillBeRegisteredAndLoggedInBackup =>
      'Незарегистрированные номера будут автоматически зарегистрированы и авторизованы';

  @override
  String get iHaveReadAndAgree => 'Я прочитал и согласен с';

  @override
  String get userAgreement => 'Пользовательским соглашением';

  @override
  String get and => 'и';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get pleaseEnterPhoneNumber => 'Введите номер телефона';

  @override
  String get pleaseEnterValidPhoneNumber =>
      'Введите действительный номер телефона.';

  @override
  String get pleaseEnterEmailPhoneAccount =>
      'Введите электронную почту/номер телефона/аккаунт';

  @override
  String get select => 'Выбрать';

  @override
  String get country => 'Страна';

  @override
  String get or => 'или';

  @override
  String get district => 'Регион';

  @override
  String get phoneVerification => 'Подтверждение по телефону';

  @override
  String get emailVerification => 'Подтверждение по электронной почте';

  @override
  String get phoneNumber => 'Номер телефона';

  @override
  String get email => 'Электронная почта';

  @override
  String get newPassword => 'Новый пароль';

  @override
  String get confirmNewPassword => 'Подтвердите новый пароль';

  @override
  String get completeAndLogin => 'Завершить и войти';

  @override
  String get bindPhone => 'Привязать телефон';

  @override
  String get bindAccount => 'Привязать аккаунт';

  @override
  String get bindAndLogin => 'Привязать и войти';

  @override
  String get registeredEmailOrAccount => 'Зарегистрированная почта/аккаунт';

  @override
  String get loginSignUp => 'Войти / Зарегистрироваться';

  @override
  String get quickLoginWithLocalNumber => 'Вход с местным номером';

  @override
  String get useAnotherNumberAccount => 'Использовать другой номер/аккаунт';

  @override
  String get unregisteredPhoneWillBeRegisteredAndLoggedIn =>
      'Незарегистрированные номера будут автоматически зарегистрированы и авторизованы.';

  @override
  String get bySMSCode => 'С помощью SMS-кода';

  @override
  String get byPassword => 'С помощью пароля';

  @override
  String get getACode => 'Получить код';

  @override
  String get otherLoginMethods => 'Другие способы входа';

  @override
  String get iAgreeToUserAgreementAndPrivacyPolicy =>
      'Принимаю Пользовательское соглашение и Политику конфиденциальности.';

  @override
  String get emailPhoneNumberUsername =>
      'Электронная почта / Номер телефона / Имя пользователя';

  @override
  String get signUpWithEmail => 'Регистрация по электронной почте.';

  @override
  String get logIn => 'Войти';

  @override
  String get passwordsMustBe8To20Characters =>
      'Пароль должен быть длиной от 8 до 20 символов и содержать как минимум одну цифру, одну букву и один специальный символ.';

  @override
  String get agreeAndLogIn => 'Подтвердить и войти';

  @override
  String get completeAndLogIn => 'Заполнить и войти';

  @override
  String get bindAndLogIn => 'Привязать и войти';

  @override
  String get smsVerification => 'Подтверждение по SMS';

  @override
  String get emailAddress => 'Адрес электронной почты';

  @override
  String get bindPhoneNumber => 'Привязать номер телефона';

  @override
  String get signUp => 'Регистрация';

  @override
  String get signUpAndLogIn => 'Регистрация и вход';

  @override
  String get selectAnAccountToEnter => 'Выберите аккаунт для входа';

  @override
  String isLinkedToMultipleAccounts(Object userAccount) {
    return '$userAccount привязан к нескольким аккаунтам. Вы можете войти в любой из них.';
  }

  @override
  String get selectAnAccountToResetPassword =>
      'Выберите учётную запись для сброса пароля';

  @override
  String isAssociatedWithMultipleAccountsResetPassword(Object userAccount) {
    return '$userAccount привязан к нескольким аккаунтам. Выберите один для сброса пароля. Затем войдите с новым паролем.';
  }

  @override
  String get selectAnAccountToLinkWithWeChat =>
      'Выберите аккаунт, для которого требуется привязка к WeChat';

  @override
  String isLinkedToMultipleAccountsWeChat(Object userAccount) {
    return '$userAccount привязан к нескольким аккаунтам. Нажмите на любой, чтобы привязать WeChat. После этого сможете входить через WeChat.';
  }

  @override
  String get enter => 'Войти';

  @override
  String get recentlyUsed => 'Недавно использовано';

  @override
  String get selectYourCountryOrRegion => 'Выберите страну или регион';

  @override
  String get reminder => 'Напоминание';

  @override
  String get pleaseReadAndAgreeToUserAgreementAndPrivacyPolicyFirst =>
      'Сначала прочтите и примите <Пользовательское соглашение> и <Политику конфиденциальности>.';

  @override
  String get welcomeToCampusTopPrivacyPolicy =>
      'Добро пожаловать в CampusTop!\n\nМы высоко ценим вашу личную информацию и конфиденциальность. Для предоставления вам более качественного обслуживания мы можем собирать и использовать необходимую информацию — вы имеете право отказаться от этого.\n\nПрежде чем пользоваться услугами CampusTop, пожалуйста, внимательно ознакомьтесь с Пользовательским соглашением и Политикой конфиденциальности и полностью изучите их содержание. Мы будем строго соблюдать эти правила использования и защиты ваших персональных данных и стремимся предоставлять вам наилучший сервис. Благодарим вас за доверие.\n\nЕсли вы согласны продолжить использование продуктов или услуг CampusTop, нажмите кнопку «Согласен».';

  @override
  String get agreeAndContinue => 'Принять и продолжить';

  @override
  String get disagree => 'Не согласиться';

  @override
  String get completeYourInformation => 'Заполните информацию';

  @override
  String get male => 'Мужской';

  @override
  String get female => 'Женский';

  @override
  String get dateOfBirth => 'Дата рождения';

  @override
  String get fullName => 'Полное имя';

  @override
  String get englishNickname => 'Псевдоним на английском';

  @override
  String get recommendedEnglishName => 'Рекомендуемое английское имя';

  @override
  String get refresh => 'Обновить';

  @override
  String get selectBirthday => 'Выберите дату рождения';

  @override
  String get selectLanguage => 'Выберите язык';

  @override
  String get uploadFromAlbum => 'Загрузить из альбома';

  @override
  String get takePhoto => 'Сделать фото';

  @override
  String get scanQRCode => 'Сканировать QR-код';

  @override
  String get pleaseAlignQRCodeWithinCenter =>
      'Пожалуйста, выровняйте QR-код по центру рамки.';

  @override
  String get scanToLogIn => 'Сканируйте для входа';

  @override
  String get pleaseConfirmItsYouAndEnsureQRCodeSourceIsSafe =>
      'Подтвердите, что это вы, и убедитесь, что источник QR-кода безопасен.';

  @override
  String get accountIsLoggedInOnAnotherDevice =>
      'Учётная запись выполнена на другом устройстве';

  @override
  String get confirmLogin => 'Подтвердить вход';

  @override
  String get cancelLogin => 'Отменить вход';

  @override
  String get followingContentNotProvidedByCampusTop =>
      'Следующий контент не предоставлен CampusTop, используйте его с осторожностью.';

  @override
  String get openInBrowser => 'Открыть в браузере';

  @override
  String get campusTopWebVersion => 'Веб-версия CampusTop';

  @override
  String get twoPasswordEntriesDoNotMatch =>
      'Два введенных пароля не совпадают.';

  @override
  String get resetPassword => 'Сбросить пароль';

  @override
  String get pleaseEnterYourPhoneNumber => 'Введите свой номер телефона.';

  @override
  String get phoneNumberNotRegisteredPleaseReEnter =>
      'Номер телефона не зарегистрирован, пожалуйста, введите другой.';

  @override
  String get pleaseEnterYourEmailAddress =>
      'Введите свой адрес электронной почты.';

  @override
  String get pleaseEnterValidEmailAddress =>
      'Введите действительный адрес электронной почты.';

  @override
  String get emailNotRegisteredPleaseReEnter =>
      'Электронная почта не найдена. Введите другую.';

  @override
  String get thisEmailHasAlreadyBeenRegistered =>
      'Эта почта уже зарегистрирована. Войдите в аккаунт.';

  @override
  String get tooManyAttemptsPleaseRetryIn5Minutes =>
      'Слишком много попыток. Попробуйте снова через 5 минут.';

  @override
  String get smsCodeRequestLimitReached =>
      'Достигнут лимит запросов SMS-кода. Повторите попытку завтра.';

  @override
  String get phoneNumberDoesNotMatchSelectedRegion =>
      'Номер телефона не соответствует выбранному региону.';

  @override
  String get incorrectVerificationCodePleaseRetry =>
      'Неверный код подтверждения. Повторите попытку.';

  @override
  String get phoneNumberAlreadyLinkedToAnotherWeChat =>
      'Номер уже привязан к другому аккаунту WeChat. Обратитесь в поддержку.';

  @override
  String get accountNotRegisteredPleaseReEnter =>
      'Аккаунт не зарегистрирован. Попробуйте снова.';

  @override
  String get incorrectPasswordPleaseRetry =>
      'Неверный пароль. Повторите попытку.';

  @override
  String get tooManyIncorrectAttemptsPleaseRetryIn5Minutes =>
      'Слишком много неверных попыток. Повторите попытку через 5 минут.';

  @override
  String get passwordsDoNotMatchPleaseReEnter =>
      'Пароли не совпадают. Повторите попытку.';

  @override
  String get passwordMustIncludeLettersNumbersSpecialCharacters =>
      'Пароль должен содержать буквы, цифры, спецсимволы и быть от 8 до 20 символов.';

  @override
  String get qrCodeHasExpiredPleaseScanAgain =>
      'QR-код истёк. Отсканируйте снова.';

  @override
  String get serverErrorPleaseRetryLater =>
      'Ошибка сервера. Повторите попытку позже.';

  @override
  String get pleaseCheckInternetConnectionOrRetryLater =>
      'Проверьте подключение к Интернету или повторите попытку позже.';

  @override
  String get verificationCodeHasBeenSentPleaseCheckSMS =>
      'Код отправлен. Проверьте SMS';

  @override
  String get verificationCodeHasBeenSentPleaseCheckEmail =>
      'Код отправлен. Проверьте почту';

  @override
  String get getFreeTrialClassWithForeignTeacher =>
      'Получите пробный урок с иностранным преподавателем';

  @override
  String get alreadyClaimed => 'Уже использовано';

  @override
  String get successfullyClaimed => 'Успешно получено';

  @override
  String get gotIt => 'Понял(а)';

  @override
  String get congratulationsYouveSuccessfullyClaimedYourFreeTrialClass =>
      'Поздравляем! Вы записались на пробный урок. Скоро с вами свяжется менеджер, пожалуйста, ответьте на звонок';

  @override
  String get registeredEmailAccount => 'Зарегистрированный email / аккаунт';

  @override
  String get pleaseEnterYourName => 'Введите ваше имя';

  @override
  String get pleaseEnterYourEnglishName => 'Введите ваше имя на английском';

  @override
  String get pleaseSelectYourBirthday => 'Выберите дату рождения';

  @override
  String get pleaseSelectYourGender => 'Выберите пол';

  @override
  String get weChatID => 'WeChat ID';

  @override
  String get unlinked => 'Не привязан';

  @override
  String get confirmUnlinking => 'Подтвердите отвязку';

  @override
  String get afterUnbindingWeChatAccountYouWillNoLongerBeAbleToUseWeChat =>
      'После отвязки WeChat вы не сможете использовать его для входа в аккаунт CampusTop.';

  @override
  String get unlink => 'Отвязать';

  @override
  String get successfullyUnlinked => 'Успешно отвязано';

  @override
  String get accountCanceled => 'Аккаунт удален';

  @override
  String get yourAccountHasBeenCanceledPleaseContactCustomerService =>
      'Ваша учётная запись была удалена. Обратитесь в службу поддержки клиентов.';

  @override
  String get operationTimedOutPleaseLogOutAndLogInAgain =>
      'Время ожидания операции истекло. Пожалуйста, выйдите из системы и войдите снова.';
}
