import 'package:academic_elite/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension LocalizationExtension on BuildContext {

  AppLocalizations get l10n =>
      AppLocalizations.of(this)!;

  Locale get locale =>
      Localizations.localeOf(this);

  bool get isArabic =>
      locale.languageCode == 'ar';

  bool get isEnglish =>
      locale.languageCode == 'en';

  String get languageCode =>
      locale.languageCode;

}