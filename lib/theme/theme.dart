import 'package:flutter/material.dart';
import 'package:smart_pay/theme/colors.dart';

abstract class AppTheme {
  static final light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    splashColor: AppColors.primary,
    highlightColor: AppColors.primary.shade400,
    primaryColor: AppColors.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size.fromHeight(56),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontWeight: FontWeight.w700),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.grey.shade900.withOpacity(0.7);
            }
            return AppColors.grey.shade900;
          },
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    ),
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black),
    //pass empty textstyles so the apply method will work
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
      headlineMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
      bodySmall: TextStyle(),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    ).apply(
        displayColor: AppColors.grey.shade900,
        bodyColor: AppColors.grey.shade900,
        fontFamily: 'SF-Pro'),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.grey.shade50,
      errorMaxLines: 3,
      suffixIconColor: AppColors.primary,
      prefixIconColor: AppColors.primary,
      focusColor: AppColors.grey.shade900,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary.shade400),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary.shade400),
        borderRadius: BorderRadius.circular(16),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.error),
        borderRadius: BorderRadius.circular(16),
      ),
      hintStyle: TextStyle(
        fontSize: 16,
        color: AppColors.grey.shade400,
        fontWeight: FontWeight.w400,
      ),
      errorStyle: const TextStyle(
        fontSize: 13,
        color: AppColors.error,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  static final dark = ThemeData.dark();
}
