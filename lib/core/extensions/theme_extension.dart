import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {


  ThemeData get theme =>
      Theme.of(this);

  TextTheme get textTheme =>
      theme.textTheme;

  ColorScheme get colorScheme =>
      theme.colorScheme;

  bool get isDark =>
      theme.brightness == Brightness.dark;

  bool get isLight =>
      theme.brightness == Brightness.light;
}