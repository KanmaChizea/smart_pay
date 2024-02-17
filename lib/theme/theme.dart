import 'package:flutter/material.dart';
import 'package:smart_pay/theme/colors.dart';

abstract class AppTheme {
  static const _textTheme = TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
    headlineMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
    bodySmall: TextStyle(),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  );
  static _getButtonStyle(
          {required Color foreground, required Color background}) =>
      ElevatedButtonThemeData(
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
          foregroundColor: MaterialStateProperty.all(foreground),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return background.withOpacity(0.7);
              }
              return background;
            },
          ),
        ),
      );
  static _getAppbarTheme(Color foreground) => AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: foreground);
  static final _outlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
    ),
  );

  static _getTextButtonTheme(Color color) => TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: color,
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      );

  static _getInputTheme(Color fillColor) => InputDecorationTheme(
        filled: true,
        fillColor: fillColor,
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
      );
  static final light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    splashColor: AppColors.primary,
    highlightColor: AppColors.primary.shade400,
    primaryColor: AppColors.primary,
    brightness: Brightness.light,
    elevatedButtonTheme: _getButtonStyle(
        foreground: Colors.white, background: AppColors.grey.shade900),
    textButtonTheme: _getTextButtonTheme(AppColors.primary.shade400),
    outlinedButtonTheme: _outlineButtonTheme,
    appBarTheme: _getAppbarTheme(Colors.black),
    textTheme: _textTheme.apply(
        displayColor: AppColors.grey.shade900,
        bodyColor: AppColors.grey.shade900,
        fontFamily: 'SF-Pro'),
    inputDecorationTheme: _getInputTheme(AppColors.grey.shade50),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.grey.shade900,
    splashColor: AppColors.primary,
    highlightColor: AppColors.primary.shade400,
    primaryColor: AppColors.primary,
    elevatedButtonTheme: _getButtonStyle(
        background: Colors.white, foreground: AppColors.grey.shade900),
    textTheme: _textTheme.apply(
        displayColor: Colors.white,
        bodyColor: Colors.white,
        fontFamily: 'SF-Pro'),
    appBarTheme: _getAppbarTheme(Colors.white),
    outlinedButtonTheme: _outlineButtonTheme,
    inputDecorationTheme: _getInputTheme(AppColors.grey.shade700),
    textButtonTheme: _getTextButtonTheme(AppColors.primary.shade100),
  );
}
