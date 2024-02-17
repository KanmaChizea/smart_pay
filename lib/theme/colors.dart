import 'package:flutter/material.dart';

abstract class AppColors {
  static const primary = MaterialColor(0xFF0A6375, {
    100: Color(0xFFF0FCFF),
    200: Color(0xFF97EDFF),
    300: Color(0xFF6AE4FD),
    400: Color(0xFF2FA2B9),
  });

  static const grey = MaterialColor(0xFF6B7280, {
    50: Color(0xFFF9FAFB),
    100: Color(0xFFF3F4F6),
    200: Color(0xFFE5E7EB),
    300: Color(0xFFD1D5DB),
    400: Color(0xFF9CA3AF),
    500: Color(0xFF6B7280),
    600: Color(0xFF4B5563),
    700: Color(0xFF374151),
    800: Color(0xFF1F2937),
    900: Color(0xFF111827),
  });
  static const error = Color(0xFFF75555);
}
