import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFFB3E0FF);
  static const Color cardBlue = Color(0xFF7DD8FF);
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Colors.black54;
  static const Color textTertiary = Colors.black38;
  static const Color progressGreen = Colors.green;
  static const Color progressYellow = Color(0xFFFFA726);
  static const Color progressRed = Colors.red;
  static const Color borderColor = Colors.black;
  static const Color backgroundWhite = Colors.white;
}

class AppTextStyles {
  static const TextStyle boldTitle = TextStyle(
    fontWeight: FontWeight.bold, 
    fontSize: 16,
    color: AppColors.textPrimary,
  );
  
  static const TextStyle mediumText = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.textSecondary,
  );
  
  static const TextStyle smallText = TextStyle(
    fontSize: 13,
    color: AppColors.textSecondary,
  );
  
  static const TextStyle tinyText = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
  );
  
  static const TextStyle boldSmallText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: AppColors.textPrimary,
  );
  
  static const TextStyle hintText = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 16,
  );
}

class AppSizes {
  static const double defaultPadding = 16.0;
  static const double cardPadding = 12.0;
  static const double smallPadding = 8.0;
  static const double tinyPadding = 4.0;
  static const double borderRadius = 8.0;
  static const double cardBorderRadius = 10.0;
  static const double searchBarHeight = 40.0;
  static const double searchBarWidth = 375.0;
  static const double progressBarHeight = 6.0;
  static const double bulletSize = 8.0;
}