import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,

    cardColor: AppColors.container,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.background),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: const Color(0xff121212),

    cardColor: const Color(0xff1E1E1E),

    appBarTheme: const AppBarTheme(backgroundColor: Color(0xff121212)),
  );
}
