import 'package:flutter/material.dart';
import 'package:tender_app_test/themes/color_pallete.dart';

class AppTheme {
  static ThemeData theme = ThemeData.light().copyWith(
    highlightColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColorPallete.darkBlue,
    ),
    scaffoldBackgroundColor: AppColorPallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorPallete.amberColor,
      elevation: 0,
    ),
    cardTheme: const CardTheme(
      surfaceTintColor: AppColorPallete.whiteColor,
      // color: AppColorPallete.whiteColor,
    ),
 
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColorPallete.amberColor,
    ),
  );
}
