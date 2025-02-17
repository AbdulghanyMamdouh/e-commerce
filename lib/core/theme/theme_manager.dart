import 'package:flutter/material.dart';
import 'package:shopping_app/core/theme/color_manager.dart';

class ThemeManager {
  static ThemeData mainTheme = ThemeData(
    primaryColor: ColorManager.primary,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      foregroundColor: ColorManager.primary,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: ColorManager.textColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.primary,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        fixedSize: const Size.fromHeight(48),
      ),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: ColorManager.white,
      ),
    ),
  );
}
