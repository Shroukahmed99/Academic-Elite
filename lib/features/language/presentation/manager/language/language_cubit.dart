import 'package:academic_elite/core/cache/shared_pref/pref_keys.dart';
import 'package:academic_elite/core/cache/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit()
      : super(
          LanguageState(
            locale: _getSavedLocale(),
            selectedLanguage:
                SharedPref.preferences.containPreference(
                        PrefKeys.language,
                      )
                    ? SharedPref.preferences.getString(
                        PrefKeys.language,
                      )
                    : null,
          ),
        );

  static Locale _getSavedLocale() {
    final savedLanguage =
        SharedPref.preferences.getString(
      PrefKeys.language,
    );

    return Locale(savedLanguage ?? 'ar');
  }

  void selectLanguage(String code) {
    emit(
      state.copyWith(
        selectedLanguage: code,
      ),
    );
  }

  Future<void> saveLanguage() async {
    if (state.selectedLanguage == null) {
      return;
    }

    await SharedPref.preferences.setString(
      PrefKeys.language,
      state.selectedLanguage!,
    );

    emit(
      state.copyWith(
        locale: Locale(
          state.selectedLanguage!,
        ),
      ),
    );
  }
}