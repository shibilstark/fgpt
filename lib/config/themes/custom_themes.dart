import 'package:fgpt_ai/config/constants/constants.dart';
import 'package:fgpt_ai/config/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomThemes {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Palette.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Palette.white,
      actionsIconTheme: IconThemeData(
        size: 20,
        color: Palette.black,
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Palette.primary,
      onPrimary: Palette.white,
      secondary: Palette.textBlack,
      onSecondary: Palette.textWhite,
      error: Colors.red,
      onError: Palette.textWhite,
      background: Palette.textWhite,
      onBackground: Palette.textBlack,
      surface: Palette.textWhite,
      onSurface: Palette.textBlack,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        letterSpacing: 1.1,
        color: Palette.black,
        fontSize: AppFontSize.titleLarge,
      ),
      titleSmall: TextStyle(
        letterSpacing: 1.1,
        color: Palette.primary,
        fontSize: AppFontSize.titleSmall,
      ),
      bodyLarge: TextStyle(
        letterSpacing: 1.1,
        color: Palette.textBlack,
        fontSize: AppFontSize.bodyLarge,
      ),
      bodyMedium: TextStyle(
        letterSpacing: 1.1,
        color: Palette.textBlack,
        fontSize: AppFontSize.bodyMedium,
      ),
      bodySmall: TextStyle(
        letterSpacing: 1.1,
        color: Palette.textBlack,
        fontSize: AppFontSize.bodySmall,
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Palette.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Palette.black,
      elevation: 0,
      actionsIconTheme: IconThemeData(
        size: 20,
        color: Palette.white,
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Palette.primary,
      onPrimary: Palette.white,
      secondary: Palette.textWhite,
      onSecondary: Palette.textBlack,
      error: Colors.red,
      onError: Palette.textBlack,
      background: Palette.textBlack,
      onBackground: Palette.textWhite,
      surface: Palette.textBlack,
      onSurface: Palette.textWhite,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        letterSpacing: 1.1,
        color: Palette.white,
        fontSize: AppFontSize.titleLarge,
      ),
      titleSmall: TextStyle(
        letterSpacing: 1.1,
        color: Palette.primary,
        fontSize: AppFontSize.titleSmall,
      ),
      bodyLarge: TextStyle(
        letterSpacing: 1.1,
        color: Palette.textWhite,
        fontSize: AppFontSize.bodyLarge,
      ),
      bodyMedium: TextStyle(
        letterSpacing: 1.1,
        color: Palette.textWhite,
        fontSize: AppFontSize.bodyMedium,
      ),
      bodySmall: TextStyle(
        letterSpacing: 1.1,
        color: Palette.textWhite,
        fontSize: AppFontSize.bodySmall,
      ),
    ),
  );
}
