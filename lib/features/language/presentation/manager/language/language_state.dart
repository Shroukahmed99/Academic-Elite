import 'package:flutter/material.dart';

class LanguageState {
  final Locale locale;
  final String? selectedLanguage;

  LanguageState({
    required this.locale,
    this.selectedLanguage,
  });

  LanguageState copyWith({
    Locale? locale,
    String? selectedLanguage,
    bool clearSelectedLanguage = false,
  }) {
    return LanguageState(
      locale: locale ?? this.locale,
      selectedLanguage: clearSelectedLanguage
          ? null
          : selectedLanguage ?? this.selectedLanguage,
    );
  }
}