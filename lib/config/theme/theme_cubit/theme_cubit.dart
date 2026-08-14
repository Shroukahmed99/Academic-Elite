import 'package:academic_elite/config/theme/theme_app.dart';
import 'package:academic_elite/core/cache/shared_pref/pref_keys.dart';
import 'package:academic_elite/core/cache/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          ThemeState(
            themeData: _getSavedTheme(),
          ),
        );

  // ================= GET SAVED THEME =================

  static ThemeData _getSavedTheme() {
    final isDark =
        SharedPref.preferences.getBoolean(
              PrefKeys.themeMode,
            ) ??
            false;

    return isDark
        ? ThemeApp.darkTheme
        : ThemeApp.lightTheme;
  }

  bool get isDark =>
      state.themeData.brightness ==
      Brightness.dark;

  // ================= TOGGLE =================

  void toggleTheme() {
    final newIsDark = !isDark;

    emit(
      ThemeState(
        themeData: newIsDark
            ? ThemeApp.darkTheme
            : ThemeApp.lightTheme,
      ),
    );

    SharedPref.preferences.setBoolean(
      PrefKeys.themeMode,
      newIsDark,
    );
  }


  void setLightTheme() {
    emit(
      ThemeState(
        themeData: ThemeApp.lightTheme,
      ),
    );

    SharedPref.preferences.setBoolean(
      PrefKeys.themeMode,
      false,
    );
  }


  void setDarkTheme() {
    emit(
      ThemeState(
        themeData: ThemeApp.darkTheme,
      ),
    );

    SharedPref.preferences.setBoolean(
      PrefKeys.themeMode,
      true,
    );
  }
}