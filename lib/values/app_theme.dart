import 'package:flutter/material.dart';
import 'package:flutter_samples/values/app_colors.dart';

class AppTheme {
  static final themeData = ThemeData(
    primaryColor: AppColors.primaryColor,
    accentColor: AppColors.accentColor,
    backgroundColor: AppColors.bgColor,
    scaffoldBackgroundColor: AppColors.bgColor,
    brightness: Brightness.dark,
  );
}
