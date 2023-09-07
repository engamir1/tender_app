import 'package:flutter/material.dart';
import 'package:tender_app_test/themes/color_pallete.dart';

class AppTheme {
  static ThemeData theme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColorPallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorPallete.amberColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColorPallete.amberColor,
    ),
  );
}
 