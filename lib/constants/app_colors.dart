import 'package:flutter/material.dart';

class AppColors {
  // Static const colors
  static const Color primaryGreen = Color(0xFF164445);
  static const Color lightGreen = Color(0xFF4F858A);
  static const Color darkGreen = Color(0xFF0F3A52);
  
  static const Color textPrimary = Color(0xFF164445);
  static const Color textSecondary = Color(0xFF262626);
  static const Color textSubtitle = Colors.black;
  static const Color textLight = Colors.white;
  
  static const Color backgroundLight = Colors.white;
  static const Color backgroundDark = Color(0xFFF4F8F8);
  static const Color backgroundGrey = Color(0xFFF5F5F5);
  
  static const Color buttonBorder = Color(0xFF4F858A);
  static const Color buttonText = Color(0xFF4F858A);
  
  static const Color badgeBackground = Color(0xFF4F858A);
  static const Color badgeIcon = Colors.white;
}

class AppTheme {
  static ThemeData get theme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryGreen,
      primary: AppColors.primaryGreen,
      secondary: AppColors.lightGreen,
    ),
    useMaterial3: true,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColors.textSecondary,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.textSecondary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: AppColors.textLight,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.buttonText,
        side: BorderSide(color: AppColors.buttonBorder),
      ),
    ),
  );
}