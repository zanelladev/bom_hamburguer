import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppColorScheme extends ColorScheme {
  const AppColorScheme({
    super.brightness = Brightness.light,
    super.primary = AppColors.black,
    super.onPrimary = AppColors.white,
    super.secondary = AppColors.black,
    super.onSecondary = AppColors.white,
    super.error = AppColors.white,
    super.onError = AppColors.black,
    super.background = AppColors.neutral050,
    super.onBackground = AppColors.neutral900,
    super.surface = AppColors.neutral050,
    super.onSurface = AppColors.white,
    super.surfaceVariant = AppColors.white,
  });
}
