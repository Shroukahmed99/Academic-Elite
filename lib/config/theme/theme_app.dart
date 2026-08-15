import 'package:academic_elite/core/utils/colors_manager.dart';
import 'package:academic_elite/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  ThemeApp._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: StylesManager.fontFamily,
      scaffoldBackgroundColor: ColorsManager.background,
      canvasColor: ColorsManager.background,

      colorScheme: const ColorScheme.light(
        primary: ColorsManager.primary,
        onPrimary: ColorsManager.white,
        secondary: ColorsManager.secondary,
        onSecondary: ColorsManager.white,
        surface: ColorsManager.background,
        onSurface: ColorsManager.font1,
        error: ColorsManager.red,
        onError: ColorsManager.white,
      ),

      textTheme: TextTheme(
        // displayLarge: StylesManager.font1Medium60,
        // displayMedium: StylesManager.font1Regular36,
        // displaySmall: StylesManager.font1Regular32,

        // headlineLarge: StylesManager.font1Regular28,
        // headlineMedium: StylesManager.font1Regular24,

        // Almarai Medium - 20px
        headlineSmall: StylesManager.font1Medium20,

        // titleLarge: StylesManager.font1Bold20,
        // titleMedium: StylesManager.font1Bold16,
        titleSmall: StylesManager.font1Bold14,

        // bodyLarge: StylesManager.font1Regular16,

        // Almarai Regular - 14px + Font 3 color
        bodyMedium: StylesManager.font3Regular14,

        // bodySmall: StylesManager.font1Regular12,
        labelLarge: StylesManager.whiteBold14,
        labelMedium: StylesManager.primaryBold14,
        labelSmall: StylesManager.font2Regular14,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.background,
        foregroundColor: ColorsManager.font1,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: StylesManager.font1Bold16,
        iconTheme: const IconThemeData(color: ColorsManager.font1, size: 24),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.primary,
          foregroundColor: ColorsManager.white,
          disabledBackgroundColor: ColorsManager.primary20,
          disabledForegroundColor: ColorsManager.font3,
          elevation: 0,
          minimumSize: const Size(double.infinity, 48),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: StylesManager.whiteBold14,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorsManager.primary,
          backgroundColor: ColorsManager.white,
          elevation: 0,
          minimumSize: const Size(double.infinity, 48),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          side: const BorderSide(color: ColorsManager.primary, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: StylesManager.primaryBold14,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorsManager.primary,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          textStyle: StylesManager.primaryMedium14,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorsManager.cardColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        hintStyle: StylesManager.font3Regular14,
        labelStyle: StylesManager.font2Regular14,
        floatingLabelStyle: StylesManager.primaryMedium14,
        helperStyle: StylesManager.font3Regular12,
        errorStyle: StylesManager.redRegular12,
        prefixIconColor: ColorsManager.font3,
        suffixIconColor: ColorsManager.font3,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorsManager.font5),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorsManager.font5),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: ColorsManager.primary,
            width: 1.5,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorsManager.red),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorsManager.red, width: 1.5),
        ),

        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ColorsManager.font5),
        ),
      ),

      cardTheme: CardThemeData(
        color: ColorsManager.white,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      dividerTheme: const DividerThemeData(
        color: ColorsManager.font5,
        thickness: 1,
        space: 1,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsManager.white,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorsManager.primary,
        unselectedItemColor: ColorsManager.font3,
        selectedLabelStyle: StylesManager.primaryRegular10,
        unselectedLabelStyle: StylesManager.font3Regular10,
        selectedIconTheme: const IconThemeData(
          color: ColorsManager.primary,
          size: 24,
        ),
        unselectedIconTheme: const IconThemeData(
          color: ColorsManager.font3,
          size: 24,
        ),
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: ColorsManager.white,
        elevation: 8,
        height: 72,
        indicatorColor: ColorsManager.primary10,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

        iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: ColorsManager.primary, size: 24);
          }

          return const IconThemeData(color: ColorsManager.font3, size: 24);
        }),

        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((states) {
          if (states.contains(WidgetState.selected)) {
            return StylesManager.primaryRegular10;
          }

          return StylesManager.font3Regular10;
        }),
      ),

      checkboxTheme: CheckboxThemeData(
        side: const BorderSide(color: ColorsManager.font4, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorsManager.primary;
          }

          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(ColorsManager.white),
      ),

      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorsManager.primary;
          }

          return ColorsManager.font4;
        }),
      ),

      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorsManager.white;
          }

          return ColorsManager.font3;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorsManager.primary;
          }

          return ColorsManager.font5;
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: ColorsManager.cardColor,
        selectedColor: ColorsManager.primary10,
        disabledColor: ColorsManager.font6,
        labelStyle: StylesManager.font1Regular12,
        secondaryLabelStyle: StylesManager.primaryMedium12,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        side: const BorderSide(color: ColorsManager.font5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: ColorsManager.white,
        elevation: 0,
        titleTextStyle: StylesManager.font1Bold16,
        contentTextStyle: StylesManager.font2Regular14,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: ColorsManager.primary,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        contentTextStyle: StylesManager.whiteRegular14,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: ColorsManager.font1,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: StylesManager.whiteRegular12,
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ColorsManager.primary,
        linearTrackColor: ColorsManager.primary10,
        circularTrackColor: ColorsManager.primary10,
      ),

      sliderTheme: SliderThemeData(
        activeTrackColor: ColorsManager.primary,
        inactiveTrackColor: ColorsManager.primary20,
        thumbColor: ColorsManager.primary,
        overlayColor: ColorsManager.primary10,
      ),

      iconTheme: const IconThemeData(color: ColorsManager.font1, size: 24),

      listTileTheme: ListTileThemeData(
        textColor: ColorsManager.font1,
        iconColor: ColorsManager.font2,
        titleTextStyle: StylesManager.font1Medium14,
        subtitleTextStyle: StylesManager.font3Regular12,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),

      popupMenuTheme: PopupMenuThemeData(
        color: ColorsManager.white,
        elevation: 4,
        textStyle: StylesManager.font1Regular14,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: ColorsManager.white,
        modalBackgroundColor: ColorsManager.white,
        elevation: 8,
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.primary,
        foregroundColor: ColorsManager.white,
        elevation: 2,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: StylesManager.fontFamily,
      scaffoldBackgroundColor: ColorsManager.background,
      canvasColor: ColorsManager.background,

      colorScheme: const ColorScheme.dark(),
    );
  }
}
