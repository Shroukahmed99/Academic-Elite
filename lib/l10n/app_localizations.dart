import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @skip.
  ///
  /// In ar, this message translates to:
  /// **'تخطي'**
  String get skip;

  /// No description provided for @continueText.
  ///
  /// In ar, this message translates to:
  /// **'متابعة'**
  String get continueText;

  /// No description provided for @academicSupportTitle.
  ///
  /// In ar, this message translates to:
  /// **'دعم أكاديمي عندما تحتاجه'**
  String get academicSupportTitle;

  /// No description provided for @academicSupportDescription.
  ///
  /// In ar, this message translates to:
  /// **'تواصل مع الخبراء واحصل على الإرشاد والمساندة الأكاديمية لاتخاذ قراراتك التعليمية بثقة'**
  String get academicSupportDescription;

  /// No description provided for @organizeStudiesTitle.
  ///
  /// In ar, this message translates to:
  /// **'نظم دراستك وتابع تقدمك'**
  String get organizeStudiesTitle;

  /// No description provided for @organizeStudiesDescription.
  ///
  /// In ar, this message translates to:
  /// **'تابع دروسك ومهامك واختباراتك في مكان واحد وراقب تقدمك بخطوات واضحة وسهلة'**
  String get organizeStudiesDescription;

  /// No description provided for @learnSmarterTitle.
  ///
  /// In ar, this message translates to:
  /// **'تعلم بطريقة أذكى'**
  String get learnSmarterTitle;

  /// No description provided for @learnSmarterDescription.
  ///
  /// In ar, this message translates to:
  /// **'استكشف محتوى أكاديمي منظم ودروسنا واضحة وخدمات تعليمية تساعدك على تحقيق أهدافك بثقة'**
  String get learnSmarterDescription;

  /// No description provided for @choosePreferredLanguage.
  ///
  /// In ar, this message translates to:
  /// **'اختر لغتك المفضلة'**
  String get choosePreferredLanguage;

  /// No description provided for @changeLanguageLater.
  ///
  /// In ar, this message translates to:
  /// **'يمكنك تغيير اللغة لاحقًا من الإعدادات في أي وقت.'**
  String get changeLanguageLater;

  /// No description provided for @arabicLanguage.
  ///
  /// In ar, this message translates to:
  /// **'اللغة العربية'**
  String get arabicLanguage;

  /// No description provided for @englishLanguage.
  ///
  /// In ar, this message translates to:
  /// **'English'**
  String get englishLanguage;

  /// No description provided for @chooseLanguageStart.
  ///
  /// In ar, this message translates to:
  /// **'اختر'**
  String get chooseLanguageStart;

  /// No description provided for @chooseLanguageMiddle.
  ///
  /// In ar, this message translates to:
  /// **'لغتك'**
  String get chooseLanguageMiddle;

  /// No description provided for @chooseLanguageEnd.
  ///
  /// In ar, this message translates to:
  /// **'المفضلة'**
  String get chooseLanguageEnd;

  /// No description provided for @onboardingLearnSmarterTitle.
  ///
  /// In ar, this message translates to:
  /// **'تعلم بطريقة أذكى'**
  String get onboardingLearnSmarterTitle;

  /// No description provided for @onboardingLearnSmarterHighlight.
  ///
  /// In ar, this message translates to:
  /// **'أذكى'**
  String get onboardingLearnSmarterHighlight;

  /// No description provided for @onboardingLearnSmarterDescription.
  ///
  /// In ar, this message translates to:
  /// **'استكشف محتوى أكاديمي منظم ودروسنا واضحة وخدمات تعليمية تساعدك على تحقيق أهدافك بثقة'**
  String get onboardingLearnSmarterDescription;

  /// No description provided for @onboardingOrganizeStudyTitle.
  ///
  /// In ar, this message translates to:
  /// **'نظم دراستك وتابع تقدمك'**
  String get onboardingOrganizeStudyTitle;

  /// No description provided for @onboardingOrganizeStudyHighlight.
  ///
  /// In ar, this message translates to:
  /// **'دراستك'**
  String get onboardingOrganizeStudyHighlight;

  /// No description provided for @onboardingOrganizeStudyDescription.
  ///
  /// In ar, this message translates to:
  /// **'تابع دروسك ومهامك واختباراتك في مكان واحد وراقب تقدمك بخطوات واضحة وسهلة'**
  String get onboardingOrganizeStudyDescription;

  /// No description provided for @onboardingAcademicSupportTitle.
  ///
  /// In ar, this message translates to:
  /// **'دعم أكاديمي عندما تحتاجه'**
  String get onboardingAcademicSupportTitle;

  /// No description provided for @onboardingAcademicSupportHighlight.
  ///
  /// In ar, this message translates to:
  /// **'أكاديمي'**
  String get onboardingAcademicSupportHighlight;

  /// No description provided for @onboardingAcademicSupportDescription.
  ///
  /// In ar, this message translates to:
  /// **'تواصل مع الخبراء واحصل على الإرشاد والمساعدة الأكاديمية لاتخاذ قراراتك التعليمية بثقة'**
  String get onboardingAcademicSupportDescription;

  /// No description provided for @login.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login;

  /// No description provided for @welcomeBack.
  ///
  /// In ar, this message translates to:
  /// **'مرحبًا بعودتك'**
  String get welcomeBack;

  /// No description provided for @loginDescription.
  ///
  /// In ar, this message translates to:
  /// **'سجّل دخولك لمتابعة تعلمك وخدماتك الأكاديمية.'**
  String get loginDescription;

  /// No description provided for @emailHint.
  ///
  /// In ar, this message translates to:
  /// **'example@example.com'**
  String get emailHint;

  /// No description provided for @passwordHint.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get passwordHint;

  /// No description provided for @rememberMe.
  ///
  /// In ar, this message translates to:
  /// **'تذكرني'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In ar, this message translates to:
  /// **'نسيت كلمة المرور؟'**
  String get forgotPassword;

  /// No description provided for @createAccount.
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب'**
  String get createAccount;

  /// No description provided for @continueAsGuest.
  ///
  /// In ar, this message translates to:
  /// **'الدخول كزائر'**
  String get continueAsGuest;

  /// No description provided for @somethingWentWrong.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ، حاول مرة أخرى.'**
  String get somethingWentWrong;

  /// No description provided for @resetPassword.
  ///
  /// In ar, this message translates to:
  /// **'استعادة كلمة المرور'**
  String get resetPassword;

  /// No description provided for @resetPasswordDescription.
  ///
  /// In ar, this message translates to:
  /// **'أدخل بريدك الإلكتروني المسجل وسنرسل إليك رمزاً لإعادة تعيين كلمة المرور.'**
  String get resetPasswordDescription;

  /// No description provided for @sendVerificationCode.
  ///
  /// In ar, this message translates to:
  /// **'إرسال رمز التحقق'**
  String get sendVerificationCode;

  /// No description provided for @verifyEmail.
  ///
  /// In ar, this message translates to:
  /// **'التحقق من بريدك الإلكتروني'**
  String get verifyEmail;

  /// No description provided for @verificationCodeSent.
  ///
  /// In ar, this message translates to:
  /// **'لقد أرسلنا إليك رمزاً مكوناً من 6 أرقام عبر بريدك الإلكتروني:'**
  String get verificationCodeSent;

  /// No description provided for @enterCode.
  ///
  /// In ar, this message translates to:
  /// **'أدخل الرمز'**
  String get enterCode;

  /// No description provided for @didntReceiveCode.
  ///
  /// In ar, this message translates to:
  /// **'لم تستلم الكود بعد؟'**
  String get didntReceiveCode;

  /// No description provided for @resendCode.
  ///
  /// In ar, this message translates to:
  /// **'إعادة الإرسال'**
  String get resendCode;

  /// No description provided for @newPassword.
  ///
  /// In ar, this message translates to:
  /// **'كلمة مرور جديدة'**
  String get newPassword;

  /// No description provided for @createNewPassword.
  ///
  /// In ar, this message translates to:
  /// **'إنشاء كلمة مرور جديدة'**
  String get createNewPassword;

  /// No description provided for @newPasswordDescription.
  ///
  /// In ar, this message translates to:
  /// **'اختر كلمة مرور جديدة وقوية لحماية حسابك.'**
  String get newPasswordDescription;

  /// No description provided for @newPasswordHint.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور الجديدة'**
  String get newPasswordHint;

  /// No description provided for @confirmNewPassword.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة المرور الجديدة'**
  String get confirmNewPassword;

  /// No description provided for @saveAndLogin.
  ///
  /// In ar, this message translates to:
  /// **'حفظ وتسجيل الدخول'**
  String get saveAndLogin;

  /// No description provided for @register.
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب جديد'**
  String get register;

  /// No description provided for @registerDescription.
  ///
  /// In ar, this message translates to:
  /// **'أنشئ حسابك للوصول إلى الدورات والخدمات الأكاديمية.'**
  String get registerDescription;

  /// No description provided for @fullNameHint.
  ///
  /// In ar, this message translates to:
  /// **'أدخل اسمك كاملاً'**
  String get fullNameHint;

  /// No description provided for @phoneHint.
  ///
  /// In ar, this message translates to:
  /// **'أدخل رقم الهاتف'**
  String get phoneHint;

  /// No description provided for @confirmPassword.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة المرور'**
  String get confirmPassword;

  /// No description provided for @agreeToTerms.
  ///
  /// In ar, this message translates to:
  /// **'أوافق على'**
  String get agreeToTerms;

  /// No description provided for @termsAndConditions.
  ///
  /// In ar, this message translates to:
  /// **'الشروط والأحكام'**
  String get termsAndConditions;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In ar, this message translates to:
  /// **'لديك حساب بالفعل؟'**
  String get alreadyHaveAccount;

  /// No description provided for @loginNow.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get loginNow;

  /// No description provided for @emailValidation.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال بريد إلكتروني صحيح'**
  String get emailValidation;

  /// No description provided for @passwordValidation.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال كلمة المرور'**
  String get passwordValidation;

  /// No description provided for @passwordMismatch.
  ///
  /// In ar, this message translates to:
  /// **'كلمتا المرور غير متطابقتين'**
  String get passwordMismatch;

  /// No description provided for @invalidCredentials.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني أو كلمة المرور غير صحيحة'**
  String get invalidCredentials;

  /// No description provided for @emailNotFound.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني غير موجود'**
  String get emailNotFound;

  /// No description provided for @emailRequired.
  ///
  /// In ar, this message translates to:
  /// **'من فضلك أدخل البريد الإلكتروني'**
  String get emailRequired;

  /// No description provided for @passwordChangedSuccessfully.
  ///
  /// In ar, this message translates to:
  /// **'تم تغيير كلمة المرور بنجاح'**
  String get passwordChangedSuccessfully;
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
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
